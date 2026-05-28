<?php

namespace App\Services\Trabajador;

use App\DTOs\Trabajador\CreateAltaTrabajadorDTO;
use App\Models\AltasTrabajadores;
use App\Models\Trabajador;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

class AltaTrabajadorService
{
    /**
     * Lista todas las altas de un trabajador específico con relaciones.
     *
     * @return Collection<int, AltasTrabajadores>
     */
    public function listarPorTrabajador(Trabajador $trabajador): Collection
    {
        return AltasTrabajadores::query()
            ->with([
                'institucionEducativa',
                'condicionLaboral',
                'tipoContrato',
                'rolTrabajador',
                'situacionLaboral',
                'area',
                'cargo',
                'motivoBaja',
            ])
            ->where('trabajador_id', $trabajador->id)
            ->orderByDesc('fechaInicio')
            ->get();
    }

    /**
     * Lista todas las altas del sistema con paginación y filtros.
     * Optimizado para manejar más de 1 000 IEs.
     *
     * @return LengthAwarePaginator<AltasTrabajadores>
     */
    public function listarPaginado(Request $request): LengthAwarePaginator
    {
        return AltasTrabajadores::query()
            ->with([
                'trabajador.persona',
                'institucionEducativa',
                'condicionLaboral',
                'rolTrabajador',
                'situacionLaboral',
                'motivoBaja',
            ])
            ->when($request->search, function ($query, string $search) {
                $query->whereHas('trabajador.persona', function ($q) use ($search) {
                    $q->where('paterno', 'ilike', "%{$search}%")
                        ->orWhere('materno', 'ilike', "%{$search}%")
                        ->orWhere('nombre', 'ilike', "%{$search}%")
                        ->orWhere('docIdentidad', 'like', "%{$search}%");
                })->orWhereHas('trabajador', function ($q) use ($search) {
                    $q->where('codigo', 'like', "%{$search}%");
                });
            })
            ->when($request->integer('institucion_id'), function ($query, int $ieId) {
                $query->where('institucionEducativa_id', $ieId);
            })
            ->when($request->integer('trabajador_id'), function ($query, int $tId) {
                $query->where('trabajador_id', $tId);
            })
            ->when($request->anio, function ($query, string $anio) {
                $query->where(function ($q) use ($anio) {
                    $q->whereYear('fechaInicio', $anio)
                        ->orWhereYear('fechaFin', $anio)
                        ->orWhere(function ($q2) use ($anio) {
                            $q2->where('fechaInicio', '<=', "{$anio}-12-31")
                                ->where(function ($q3) use ($anio) {
                                    $q3->whereNull('fechaFin')
                                        ->orWhere('fechaFin', '>=', "{$anio}-01-01");
                                });
                        });
                });
            })
            ->when($request->boolean('solo_activas'), function ($query) {
                $query->whereNull('fechaBaja');
            })
            ->orderByDesc('fechaInicio')
            ->paginate(20)
            ->withQueryString();
    }

    public function crear(CreateAltaTrabajadorDTO $dto): AltasTrabajadores
    {
        return DB::transaction(fn () => AltasTrabajadores::create($dto->toArray()));
    }

    /**
     * @param  array<string, mixed>  $datos
     */
    public function actualizar(AltasTrabajadores $alta, array $datos): bool
    {
        return DB::transaction(fn () => $alta->update($datos));
    }

    /**
     * Registra la baja de un alta, cerrando el período laboral.
     */
    public function darBaja(AltasTrabajadores $alta, string $fechaBaja, int $motivoBaja_id): bool
    {
        return DB::transaction(fn () => $alta->update([
            'fechaBaja' => $fechaBaja,
            'motivoBaja_id' => $motivoBaja_id,
        ]));
    }

    /**
     * Elimina un alta si aún no tiene baja registrada.
     */
    public function eliminar(AltasTrabajadores $alta): bool
    {
        return DB::transaction(fn () => $alta->delete());
    }
}
