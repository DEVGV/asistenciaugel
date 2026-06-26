<?php

namespace App\Services\Horario;

use App\Models\AltasTrabajadores;
use App\Models\Conasis\ConasisCargaHoraria;
use App\Models\Conasis\ConasisDetalleHorarios;
use App\Models\Conasis\ConasisHorariosTrabajador;
use App\Models\InstitucionesEduc;
use App\Services\Auth\ContextoService;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\DB;

class HorarioTrabajadorService
{
    public function __construct(
        private ContextoService $contextoService,
    ) {}

    /**
     * Listar horarios del trabajador por año con todas las relaciones para la vista JSON.
     *
     * @return Collection<int, ConasisHorariosTrabajador>
     */
    public function listarPorTrabajador(int $trabajadorId, int $anio): Collection
    {
        $horarios = ConasisHorariosTrabajador::query()
            ->with([
                'detalles.horarioCursoIni.curso',
                'detalles.horarioCursoIni.seccion.grado',
                'institucionEduc',
                'altaTrabajador.cargo',
            ])
            ->where('trabajador_id', $trabajadorId)
            ->where('anio', $anio)
            ->where('activo', true)
            ->get();

        // Cargar las cargas horarias (cursos individuales) para cada horario
        foreach ($horarios as $horario) {
            $cargas = ConasisCargaHoraria::query()
                ->where('trabajador_id', $horario->trabajador_id)
                ->whereHas('horarioCurso', function ($query) use ($horario) {
                    $query->where('anio', $horario->anio)
                        ->whereHas('seccion.grado', function ($q) use ($horario) {
                            $q->where('institucionEduc_id', $horario->institucionEduc_id);
                        });
                })
                ->with([
                    'horarioCurso.curso',
                    'horarioCurso.seccion.grado',
                ])
                ->get();

            $horario->setAttribute('cargas_horarias', $cargas);
        }

        return $horarios;
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
     * Lista las instituciones educativas activas para el selector del índice de horarios.
     *
     * @return Collection<int, InstitucionesEduc>
     */
    public function listarInstitucionesActivas(): Collection
    {
        return $this->contextoService->filtrarInstituciones(InstitucionesEduc::query())
            ->where(function ($q) {
                $q->whereNull('fechaFin')
                    ->orWhere('fechaFin', '>=', now()->toDateString());
            })
            ->orderBy('nombreLegal')
            ->get();
    }

    /**
     * Resuelve un HorarioTrabajador por su ID o, en su defecto, por trabajador_id + año.
     * Devuelve null si no se encuentra.
     */
    public function resolverHorario(int $id, int $anio): ?ConasisHorariosTrabajador
    {
        $horario = ConasisHorariosTrabajador::find($id);

        if (! $horario) {
            $horario = ConasisHorariosTrabajador::where('trabajador_id', $id)
                ->where('anio', $anio)
                ->first();
        }

        return $horario;
    }

    /**
     * Carga las cargas horarias del trabajador/año/IE para la vista Show.
     *
     * @return Collection<int, ConasisCargaHoraria>
     */
    public function listarCargasParaShow(ConasisHorariosTrabajador $horario): Collection
    {
        return ConasisCargaHoraria::query()
            ->where('trabajador_id', $horario->trabajador_id)
            ->whereHas('horarioCurso', function ($query) use ($horario) {
                $query->where('anio', $horario->anio)
                    ->whereHas('seccion.grado', function ($q) use ($horario) {
                        $q->where('institucionEduc_id', $horario->institucionEduc_id);
                    });
            })
            ->with([
                'horarioCurso.curso',
                'horarioCurso.seccion.grado',
            ])
            ->get();
    }

    /**
     * Regenerar el horario del docente y sus detalles basándose en su carga horaria.
     *
     * @param  array<int, int>  $turnosPorDia  nroDia → turno_id seleccionado por el usuario (opcional)
     */
    public function regenerarDesdeCargas(int $trabajadorId, int $anio, int $ieId, array $turnosPorDia = []): ?ConasisHorariosTrabajador
    {
        return DB::transaction(function () use ($trabajadorId, $anio, $ieId, $turnosPorDia) {
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

                // Usar el turno seleccionado por el usuario si fue enviado.
                // Fallback: calcular por hora de inicio.
                $turnoSeleccionado = $turnosPorDia[$nroDia] ?? null;

                if ($turnoSeleccionado) {
                    $turnoId = $turnoSeleccionado;
                    $nombreTurno = match ($turnoId) {
                        1 => 'MAÑANA',
                        2 => 'TARDE',
                        3 => 'NOCHE',
                        default => 'MAÑANA',
                    };
                } else {
                    $inicioParse = Carbon::parse($minHoraInicio);
                    if ($inicioParse->hour < 13) {
                        $turnoId = 1;
                        $nombreTurno = 'MAÑANA';
                    } elseif ($inicioParse->hour < 18) {
                        $turnoId = 2;
                        $nombreTurno = 'TARDE';
                    } else {
                        $turnoId = 3;
                        $nombreTurno = 'NOCHE';
                    }
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
