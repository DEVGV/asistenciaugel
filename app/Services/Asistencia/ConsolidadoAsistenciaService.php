<?php

namespace App\Services\Asistencia;

use App\Models\AltasTrabajadores;
use App\Models\Conasis\ConasisAsistencia;
use App\Models\Conasis\ConasisAsistenciaMesTrabajador;
use App\Models\Conasis\ConasisConsolAsistMesTrab;
use App\Models\InstitucionesEduc;
use Illuminate\Support\Facades\DB;

class ConsolidadoAsistenciaService
{
    /**
     * Procesa la asistencia mensual de TODOS los trabajadores activos de una IE.
     * Llama a la función PostgreSQL f_procesa_asismes_v1 por cada trabajador.
     *
     * @return array{procesados: int, errores: array<int, array{trabajador_id: int, nombre: string, error: string}>, sin_horario: array<int, array{trabajador_id: int, nombre: string}>}
     */
    public function procesarMes(
        InstitucionesEduc $institucion,
        int $anio,
        int $mes,
        string $fechaDesde,
        string $fechaHasta,
        int $userId,
    ): array {
        // Obtener todos los trabajadores activos (sin baja) de la IE
        $altas = AltasTrabajadores::query()
            ->with('trabajador.persona')
            ->where('institucionEducativa_id', $institucion->id)
            ->whereNull('fechaBaja')
            ->where('fechaInicio', '<=', $fechaHasta)
            ->where(function ($q) use ($fechaDesde) {
                $q->whereNull('fechaFin')
                    ->orWhere('fechaFin', '>=', $fechaDesde);
            })
            ->get();

        $procesados = 0;
        $errores = [];
        $sinHorario = [];

        foreach ($altas as $alta) {
            $nombreCompleto = trim(
                ($alta->trabajador?->persona?->paterno ?? '') . ' ' .
                ($alta->trabajador?->persona?->materno ?? '') . ', ' .
                ($alta->trabajador?->persona?->nombre ?? '')
            );

            try {
                $resultado = DB::selectOne(
                    'SELECT conasis.f_procesa_asismes_v1(?, ?, ?::smallint, ?::smallint, ?::date, ?::date, ?) AS resultado',
                    [
                        $institucion->id,
                        $alta->trabajador_id,
                        $anio,
                        $mes,
                        $fechaDesde,
                        $fechaHasta,
                        $userId,
                    ]
                );

                if ($resultado->resultado === 'OK') {
                    $procesados++;
                } elseif ($resultado->resultado === 'NO_HOR') {
                    $sinHorario[] = [
                        'trabajador_id' => $alta->trabajador_id,
                        'nombre' => $nombreCompleto,
                    ];
                } else {
                    $errores[] = [
                        'trabajador_id' => $alta->trabajador_id,
                        'nombre' => $nombreCompleto,
                        'error' => $resultado->resultado ?? 'Resultado desconocido',
                    ];
                }
            } catch (\Throwable $e) {
                $errores[] = [
                    'trabajador_id' => $alta->trabajador_id,
                    'nombre' => $nombreCompleto,
                    'error' => $e->getMessage(),
                ];
            }
        }

        return [
            'procesados' => $procesados,
            'errores' => $errores,
            'sin_horario' => $sinHorario,
            'total' => $altas->count(),
        ];
    }

    /**
     * Obtiene el consolidado de asistencia de una IE para un mes/año.
     *
     * @return \Illuminate\Support\Collection<int, ConasisAsistencia>
     */
    public function obtenerConsolidado(int $ieId, int $anio, int $mes)
    {
        return ConasisAsistencia::query()
            ->with([
                'trabajador.persona',
                'altaTrabajador.condicionLaboral',
                'altaTrabajador.rolTrabajador',
            ])
            ->where('institucionEduc_id', $ieId)
            ->where('anio', $anio)
            ->where('mes', $mes)
            ->orderBy('trabajador_id')
            ->get();
    }

    /**
     * Obtiene el detalle de asistencia diaria (la grilla mensual) por asistencia_id.
     *
     * @return \Illuminate\Support\Collection<int, ConasisAsistenciaMesTrabajador>
     */
    public function obtenerDetalleMensual(int $asistenciaId)
    {
        return ConasisAsistenciaMesTrabajador::query()
            ->with('turno')
            ->where('asistencia_id', $asistenciaId)
            ->orderBy('nroTurno')
            ->get();
    }

    /**
     * Obtiene el resumen consolidado (siglas y días) por asistencia_id.
     *
     * @return \Illuminate\Support\Collection<int, ConasisConsolAsistMesTrab>
     */
    public function obtenerResumenConsolidado(int $asistenciaId)
    {
        return ConasisConsolAsistMesTrab::query()
            ->with('motivoSuspLab')
            ->where('asistencia_id', $asistenciaId)
            ->where('ndias', '>', 0)
            ->orderBy('sigla')
            ->get();
    }
}
