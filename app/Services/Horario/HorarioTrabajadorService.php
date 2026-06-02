<?php

namespace App\Services\Horario;

use App\Models\AltasTrabajadores;
use App\Models\Conasis\ConasisCargaHoraria;
use App\Models\Conasis\ConasisDetalleHorarios;
use App\Models\Conasis\ConasisHorariosTrabajador;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\DB;

class HorarioTrabajadorService
{
    /**
     * Listar horarios del trabajador por año.
     *
     * @return Collection<int, ConasisHorariosTrabajador>
     */
    public function listarPorTrabajador(int $trabajadorId, int $anio)
    {
        return ConasisHorariosTrabajador::query()
            ->with(['institucionEduc', 'altaTrabajador'])
            ->where('trabajador_id', $trabajadorId)
            ->where('anio', $anio)
            ->where('activo', true)
            ->get();
    }

    /**
     * Obtener horario con todos sus detalles precargados.
     */
    public function obtenerConDetalles(ConasisHorariosTrabajador $horarioTrabajador): ConasisHorariosTrabajador
    {
        return $horarioTrabajador->load([
            'detalles.turno',
            'detalles.horarioCursoIni.curso',
            'detalles.horarioCursoIni.seccion.grado',
            'institucionEduc',
            'trabajador.persona',
            'altaTrabajador',
        ]);
    }

    /**
     * Regenerar el horario del docente y sus detalles basándose en su carga horaria.
     */
    public function regenerarDesdeCargas(int $trabajadorId, int $anio, int $ieId): ?ConasisHorariosTrabajador
    {
        return DB::transaction(function () use ($trabajadorId, $anio, $ieId) {
            // 1. Obtener todas las cargas horarias activas para el trabajador, año e IE
            $cargas = ConasisCargaHoraria::query()
                ->where('trabajador_id', $trabajadorId)
                ->whereHas('horarioCurso', function ($query) use ($anio, $ieId) {
                    $query->where('anio', $anio)
                        ->whereHas('seccion.grado', function ($q) use ($ieId) {
                            $q->where('institucionEduc_id', $ieId);
                        });
                })
                ->with(['horarioCurso'])
                ->get();

            // 2. Si no hay cargas horarias, desactivar el horario actual y salir
            if ($cargas->isEmpty()) {
                $horarioExistente = ConasisHorariosTrabajador::query()
                    ->where('trabajador_id', $trabajadorId)
                    ->where('anio', $anio)
                    ->where('institucionEduc_id', $ieId)
                    ->first();

                if ($horarioExistente) {
                    $horarioExistente->update(['activo' => false]);
                    ConasisDetalleHorarios::where('horarioTrabajador_id', $horarioExistente->id)->delete();
                }

                return null;
            }

            // Buscar la alta del trabajador activa en esta IE
            $alta = AltasTrabajadores::query()
                ->where('trabajador_id', $trabajadorId)
                ->where('institucionEducativa_id', $ieId)
                ->whereNull('fechaBaja')
                ->first();

            // 3. Crear o actualizar el HorarioTrabajador
            $horarioTrabajador = ConasisHorariosTrabajador::updateOrCreate(
                [
                    'anio' => $anio,
                    'institucionEduc_id' => $ieId,
                    'trabajador_id' => $trabajadorId,
                ],
                [
                    'altaTrabajador_id' => $alta?->id ?? $cargas->first()->altaTrabajador_id,
                    'nombre' => 'Horario del Docente '.$anio,
                    'tipoHorario' => '1', // Horario Regular
                    'archivado' => false,
                    'activo' => true,
                    'created_by' => auth()->id() ?? 1,
                ]
            );

            // 4. Limpiar los detalles de horario previos
            ConasisDetalleHorarios::where('horarioTrabajador_id', $horarioTrabajador->id)->delete();

            // 5. Agrupar las cargas por día (nroDia)
            $cargasPorDia = $cargas->groupBy(function ($carga) {
                return $carga->horarioCurso->nroDia;
            });

            // 6. Para cada día, generar un DetalleHorario consolidado
            foreach ($cargasPorDia as $nroDia => $cargasDia) {
                $cursosDia = $cargasDia->map(fn ($c) => $c->horarioCurso);

                // Encontrar el curso que inicia más temprano
                $cursoIni = $cursosDia->sortBy('horaInicio')->first();
                // Encontrar el curso que finaliza más tarde
                $cursoFin = $cursosDia->sortByDesc('horaFin')->first();

                $minHoraInicio = $cursoIni->horaInicio;
                $maxHoraFin = $cursoFin->horaFin;

                // Calcular horas acumuladas en minutos, luego en decimal de horas
                $totalMinutos = $cursosDia->sum('minAcum');
                $horasAcumuladas = $totalMinutos / 60.0;

                // Determinar el turno según la hora de inicio del primer curso
                $inicioParse = Carbon::parse($minHoraInicio);
                if ($inicioParse->hour < 13) {
                    $turnoId = 1; // MAÑANA
                    $nombreTurno = 'MAÑANA';
                } elseif ($inicioParse->hour < 18) {
                    $turnoId = 2; // TARDE
                    $nombreTurno = 'TARDE';
                } else {
                    $turnoId = 3; // NOCHE
                    $nombreTurno = 'NOCHE';
                }

                ConasisDetalleHorarios::create([
                    'horarioTrabajador_id' => $horarioTrabajador->id,
                    'turno_id' => $turnoId,
                    'nombreTurno' => $nombreTurno,
                    'nroTurno' => $turnoId,
                    'diaSemana' => $cursoIni->diaSemana,
                    'nroDia' => $nroDia,
                    'horarioCursoIni_id' => $cursoIni->id,
                    'entDiaInicio' => 0,
                    'entDiaFin' => 0,
                    'entHoraInicio' => $minHoraInicio,
                    'entHoraFin' => $minHoraInicio,
                    'entTolerancia' => 10, // 10 minutos de tolerancia por defecto
                    'horarioCursoFin_id' => $cursoFin->id,
                    'salDiaInicio' => 0,
                    'salDiaFin' => 0,
                    'salHoraInicio' => $maxHoraFin,
                    'salHoraFin' => $maxHoraFin,
                    'salTolerancia' => 0,
                    'horaAcumula' => $horasAcumuladas,
                    'aplicar' => true,
                    'created_by' => auth()->id() ?? 1,
                ]);
            }

            return $horarioTrabajador;
        });
    }
}
