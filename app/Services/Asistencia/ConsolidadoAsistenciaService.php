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
                    'SELECT conasis.f_procesa_asismes_v1(?::bigint, ?::bigint, ?::smallint, ?::smallint, ?::date, ?::date, ?::bigint) AS resultado',
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
     * Reprocesa la asistencia de UN solo trabajador.
     * Devuelve 'OK', 'NO_HOR' o un mensaje de error.
     */
    public function reprocesarTrabajador(
        InstitucionesEduc $institucion,
        int $trabajadorId,
        int $anio,
        int $mes,
        string $fechaDesde,
        string $fechaHasta,
        int $userId,
    ): array {
        try {
            $resultado = DB::selectOne(
                'SELECT conasis.f_procesa_asismes_v1(?::bigint, ?::bigint, ?::smallint, ?::smallint, ?::date, ?::date, ?::bigint) AS resultado',
                [$institucion->id, $trabajadorId, $anio, $mes, $fechaDesde, $fechaHasta, $userId]
            );

            $codigo = $resultado->resultado ?? 'ERROR';

            return [
                'ok'      => $codigo === 'OK',
                'codigo'  => $codigo,
                'mensaje' => match ($codigo) {
                    'OK'     => 'Asistencia reprocesada correctamente.',
                    'NO_HOR' => 'El trabajador no tiene horario asignado en el periodo.',
                    default  => "Resultado inesperado: {$codigo}",
                },
            ];
        } catch (\Throwable $e) {
            return [
                'ok'      => false,
                'codigo'  => 'ERROR',
                'mensaje' => $e->getMessage(),
            ];
        }
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
        return DB::table('conasis.t_consolAsistMesTrab as c')
            ->leftJoin('param.t00_motivosSuspLab as m', 'c.motivoSuspLab_id', '=', 'm.id')
            ->where('c.asistencia_id', $asistenciaId)
            ->groupBy('c.sigla', 'c.siglaPers', 'c.motivoSuspLab_id', 'c.remunerado', 'm.descripcion', 'm.abreviaturaPers')
            ->havingRaw('SUM(c.ndias) > 0')
            ->orderBy('c.sigla')
            ->select([
                'c.sigla',
                'c.siglaPers',
                'c.motivoSuspLab_id',
                'c.remunerado',
                DB::raw('SUM(c.ndias) as ndias'),
                'm.descripcion as motivo_descripcion',
                'm.abreviaturaPers as motivo_abreviatura_pers',
            ])
            ->get();
    }
}
