<?php

namespace App\Services\Tramite;

use App\Enums\ResolvedBy;
use App\Models\Param\ParamMotivosSuspLab;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;

class MotivoSuspLabService
{
    /**
     * @return LengthAwarePaginator<ParamMotivosSuspLab>
     */
    public function listarPaginado(Request $request): LengthAwarePaginator
    {
        return ParamMotivosSuspLab::query()
            ->with('tipoSuspensionLaboral')
            ->when($request->search, function ($query, $search) {
                $query->where('descripcion', 'ilike', "%{$search}%")
                    ->orWhere('codigo', 'ilike', "%{$search}%");
            })
            ->orderBy('descripcion')
            ->paginate(20);
    }

    public function actualizarResolvedBy(ParamMotivosSuspLab $motivo, ResolvedBy $resolvedBy): bool
    {
        return $motivo->update(['resolvedBy' => $resolvedBy->value]);
    }
}
