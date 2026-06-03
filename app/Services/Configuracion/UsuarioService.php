<?php

namespace App\Services\Configuracion;

use App\Models\AltasTrabajadores;
use App\Models\Auth\UsuarioPermisoIe;
use App\Models\InstitucionesEduc;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Hash;

class UsuarioService
{
    /**
     * @return LengthAwarePaginator<User>
     */
    public function listarPaginado(Request $request): LengthAwarePaginator
    {
        return User::query()
            ->with(['trabajador.persona', 'permisosIe'])
            ->when($request->search, function ($query, $search) {
                $query->where('login', 'ilike', "%{$search}%")
                    ->orWhereHas('trabajador.persona', function ($q) use ($search) {
                        $q->where('nombre', 'ilike', "%{$search}%")
                            ->orWhere('paterno', 'ilike', "%{$search}%")
                            ->orWhere('materno', 'ilike', "%{$search}%");
                    });
            })
            ->orderBy('login')
            ->paginate(15);
    }

    public function cambiarPassword(User $user, string $newPassword): void
    {
        $user->update(['password' => Hash::make($newPassword)]);
    }

    public function toggleActivo(User $user): void
    {
        $user->update(['activo' => !$user->activo]);
    }

    /**
     * Devuelve las IEs donde el trabajador tiene alta activa + opción Global.
     * Solo estas IEs estarán disponibles para asignar permisos.
     */
    public function ieDisponiblesParaUsuario(User $user): array
    {
        if (!$user->trabajador_id) {
            return [['id' => null, 'label' => 'Global (UGEL)', 'codModular' => null]];
        }

        $ies = AltasTrabajadores::where('trabajador_id', $user->trabajador_id)
            ->whereNull('fechaBaja')
            ->whereNull('fechaFin')
            ->with('institucionEducativa')
            ->get()
            ->map(fn ($a) => [
                'id'         => $a->institucionEducativa_id,
                'label'      => $a->institucionEducativa?->nombreLegal ?? "IE #{$a->institucionEducativa_id}",
                'codModular' => $a->institucionEducativa?->codigoModular,
            ])
            ->unique('id')
            ->values()
            ->toArray();

        // Siempre incluir opción Global (UGEL)
        array_unshift($ies, ['id' => null, 'label' => 'Global (UGEL)', 'codModular' => null]);

        return $ies;
    }

    /**
     * Devuelve los IDs de permisos que el usuario tiene para una IE concreta.
     * ieId = null → permisos globales.
     */
    public function permisosDeUsuarioPorIe(User $user, ?int $ieId): array
    {
        return UsuarioPermisoIe::where('user_id', $user->id)
            ->where(function ($q) use ($ieId) {
                if ($ieId === null) {
                    $q->whereNull('institucionEducativa_id');
                } else {
                    $q->where('institucionEducativa_id', $ieId);
                }
            })
            ->pluck('permiso_id')
            ->toArray();
    }

    /**
     * Sincroniza los permisos directos del usuario para una IE concreta.
     * Reemplaza completamente los permisos de esa IE.
     */
    public function syncPermisosIe(User $user, ?int $ieId, array $permisoIds): void
    {
        // Eliminar los permisos actuales para esta IE
        UsuarioPermisoIe::where('user_id', $user->id)
            ->where(function ($q) use ($ieId) {
                if ($ieId === null) {
                    $q->whereNull('institucionEducativa_id');
                } else {
                    $q->where('institucionEducativa_id', $ieId);
                }
            })
            ->delete();

        // Insertar los nuevos
        if (!empty($permisoIds)) {
            $rows = array_map(fn ($pid) => [
                'user_id'                => $user->id,
                'permiso_id'             => $pid,
                'institucionEducativa_id' => $ieId,
                'created_by'             => auth()->id(),
                'created_at'             => now(),
            ], $permisoIds);

            UsuarioPermisoIe::insert($rows);
        }
    }
}
