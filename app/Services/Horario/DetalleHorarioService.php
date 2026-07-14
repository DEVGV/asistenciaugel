<?php

namespace App\Services\Horario;

use App\Models\Conasis\ConasisDetalleHorarios;
use App\Models\Conasis\ConasisHorariosTrabajador;
use Illuminate\Support\Facades\DB;

class DetalleHorarioService
{
    /**
     * Actualiza únicamente los rangos horarios y tolerancias de cada detalle
     * de un horario. NO regenera cursos ni turnos, sólo persiste los cambios
     * que el usuario hace desde la UI de tolerancias.
     *
     * Auto-ampliación: si el usuario define tolerancia > 0 y los rangos vienen
     * "colapsados" (entHoraInicio == entHoraFin o salHoraInicio == salHoraFin),
     * este método amplía el rango efectivo restando/sumando los minutos de
     * tolerancia. Esto se debe a que el filtro WHERE del SP compara contra
     * entHoraInicio y salHoraFin, no contra la tolerancia. Ver
     * docs/troubleshooting-asistencia.md, caso #2.
     *
     * @param  array<int, array{id:int, entTolerancia:int, salTolerancia:int, entHoraInicio?:?string, entHoraFin?:?string, salHoraInicio?:?string, salHoraFin?:?string, aplicar?:?bool}>  $detalles
     */
    public function actualizarTolerancias(ConasisHorariosTrabajador $horario, array $detalles): int
    {
        return DB::connection('pgsql')->transaction(function () use ($horario, $detalles) {
            $actualizados = 0;

            foreach ($detalles as $d) {
                $entTol = max(0, (int) $d['entTolerancia']);
                $salTol = max(0, (int) $d['salTolerancia']);

                $entIni = $this->normalizarHora($d['entHoraInicio'] ?? null);
                $entFin = $this->normalizarHora($d['entHoraFin'] ?? null) ?: $entIni;
                $salIni = $this->normalizarHora($d['salHoraInicio'] ?? null);
                $salFin = $this->normalizarHora($d['salHoraFin'] ?? null) ?: $salIni;

                // Rango de entrada colapsado + tolerancia > 0 → ampliar hacia atrás
                if ($entIni && $entFin && $entIni === $entFin && $entTol > 0) {
                    $entIni = $this->restarMinutos($entFin, $entTol);
                }

                // Rango de salida colapsado → ampliar hacia adelante.
                // Se usa salTolerancia si fue configurada; si no, se toma
                // entTolerancia como fallback (asumiendo simetría razonable).
                // Esto evita el caso patológico salHoraInicio==salHoraFin que
                // hace imposible clasificar la salida como 'A' en el SP.
                if ($salIni && $salFin && $salIni === $salFin) {
                    $margen = $salTol > 0 ? $salTol : $entTol;
                    if ($margen > 0) {
                        $salFin = $this->sumarMinutos($salIni, $margen);
                    }
                }

                // Cubrir los 60 segundos del minuto borde. El filtro del SP
                // compara con precisión de segundos; si salHoraFin=13:40:00,
                // una marca a las 13:40:13 queda fuera. Extendemos:
                //   entHoraInicio: HH:MM:00 → HH:MM-1:00 no; se deja como está porque
                //                  restarMinutos ya produce el minuto anterior en :00.
                //   salHoraFin:    HH:MM:00 → HH:MM:59  (cubre el minuto completo).
                // Ver docs/troubleshooting-asistencia.md, caso #5.
                if ($salFin) {
                    $salFin = $this->ajustarSegundos($salFin, 59);
                }

                $update = [
                    'entTolerancia' => $entTol,
                    'salTolerancia' => $salTol,
                ];
                if ($entIni) $update['entHoraInicio'] = $entIni;
                if ($entFin) $update['entHoraFin']    = $entFin;
                if ($salIni) $update['salHoraInicio'] = $salIni;
                if ($salFin) $update['salHoraFin']    = $salFin;

                if (array_key_exists('aplicar', $d) && $d['aplicar'] !== null) {
                    $update['aplicar'] = filter_var($d['aplicar'], FILTER_VALIDATE_BOOLEAN);
                }

                $filas = ConasisDetalleHorarios::query()
                    ->where('id', $d['id'])
                    ->where('horarioTrabajador_id', $horario->id)
                    ->update($update);

                $actualizados += $filas;
            }

            return $actualizados;
        });
    }

    private function normalizarHora(?string $hora): ?string
    {
        if (! $hora) return null;
        return strlen($hora) === 5 ? $hora.':00' : $hora;
    }

    private function restarMinutos(string $hhmmss, int $min): string
    {
        [$h, $m, $s] = array_pad(explode(':', $hhmmss), 3, 0);
        $total = max(0, ((int) $h) * 60 + ((int) $m) - $min);

        return sprintf('%02d:%02d:%02d', intdiv($total, 60), $total % 60, (int) $s);
    }

    private function sumarMinutos(string $hhmmss, int $min): string
    {
        [$h, $m, $s] = array_pad(explode(':', $hhmmss), 3, 0);
        $total = min(((int) $h) * 60 + ((int) $m) + $min, 23 * 60 + 59);

        return sprintf('%02d:%02d:%02d', intdiv($total, 60), $total % 60, (int) $s);
    }

    /**
     * Fuerza los segundos de un HH:MM:SS a un valor concreto (por defecto 59
     * para "empujar" el borde del rango al final del minuto).
     */
    private function ajustarSegundos(string $hhmmss, int $segundos): string
    {
        [$h, $m] = array_pad(explode(':', $hhmmss), 3, 0);
        $segundos = max(0, min(59, $segundos));

        return sprintf('%02d:%02d:%02d', (int) $h, (int) $m, $segundos);
    }

    /**
     * Sincronizar detalles de horario para un horario de trabajador.
     *
     * @param  array<int, array<string, mixed>>  $detalles
     */
    public function sincronizar(ConasisHorariosTrabajador $horarioTrabajador, array $detalles): void
    {
        DB::connection('pgsql')->transaction(function () use ($horarioTrabajador, $detalles) {
            // Obtener IDs de detalles que vienen en el request para borrar los omitidos
            $incomingIds = collect($detalles)->pluck('id')->filter()->toArray();

            // Eliminar detalles omitidos
            ConasisDetalleHorarios::where('horarioTrabajador_id', $horarioTrabajador->id)
                ->whereNotIn('id', $incomingIds)
                ->delete();

            // Crear o actualizar cada detalle
            foreach ($detalles as $detalleData) {
                ConasisDetalleHorarios::updateOrCreate(
                    [
                        'id' => $detalleData['id'] ?? null,
                        'horarioTrabajador_id' => $horarioTrabajador->id,
                    ],
                    [
                        'turno_id' => $detalleData['turno_id'] ?? null,
                        'nombreTurno' => $detalleData['nombreTurno'] ?? null,
                        'nroTurno' => $detalleData['nroTurno'] ?? null,
                        'diaSemana' => $detalleData['diaSemana'] ?? null,
                        'nroDia' => $detalleData['nroDia'] ?? null,
                        'horarioCursoIni_id' => $detalleData['horarioCursoIni_id'] ?? null,
                        'entDiaInicio' => $detalleData['entDiaInicio'] ?? 0,
                        'entDiaFin' => $detalleData['entDiaFin'] ?? 0,
                        'entHoraInicio' => $detalleData['entHoraInicio'] ?? null,
                        'entHoraFin' => $detalleData['entHoraFin'] ?? null,
                        'entTolerancia' => $detalleData['entTolerancia'] ?? 0,
                        'horarioCursoFin_id' => $detalleData['horarioCursoFin_id'] ?? null,
                        'salDiaInicio' => $detalleData['salDiaInicio'] ?? 0,
                        'salDiaFin' => $detalleData['salDiaFin'] ?? 0,
                        'salHoraInicio' => $detalleData['salHoraInicio'] ?? null,
                        'salHoraFin' => $detalleData['salHoraFin'] ?? null,
                        'salTolerancia' => $detalleData['salTolerancia'] ?? 0,
                        'horaAcumula' => $detalleData['horaAcumula'] ?? 0.0,
                        'aplicar' => isset($detalleData['aplicar']) ? filter_var($detalleData['aplicar'], FILTER_VALIDATE_BOOLEAN) : true,
                        'created_by' => auth()->id() ?? 1,
                    ]
                );
            }
        });
    }
}
