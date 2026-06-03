<?php

namespace App\Http\Controllers\Configuracion;

use App\Http\Controllers\Controller;
use App\Models\Auth\Permiso;
use App\Models\InstitucionesEduc;
use App\Models\User;
use App\Models\Trabajador;
use App\Services\Configuracion\PerfilService;
use App\Services\Configuracion\UsuarioService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class UsuarioApiController extends Controller
{
    public function __construct(
        private UsuarioService $usuarioService,
        private PerfilService $perfilService,
    ) {}

    /** GET /api/trabajadores/{trabajador}/usuario */
    public function porTrabajador(Trabajador $trabajador): JsonResponse
    {
        $user = User::where('trabajador_id', $trabajador->id)->first();
        return response()->json($this->buildPayload($user));
    }

    /** GET /api/usuarios/{usuario}/datos */
    public function porUsuario(User $usuario): JsonResponse
    {
        return response()->json($this->buildPayload($usuario));
    }

    /**
     * GET /api/usuarios/{usuario}/permisos-ie?ie_id=X
     * Devuelve los permiso_ids activos del usuario para una IE concreta.
     */
    public function permisosIe(User $usuario, Request $request): JsonResponse
    {
        $ieId = $request->input('ie_id') !== null ? (int) $request->input('ie_id') : null;
        if ($request->input('ie_id') === 'null' || $request->input('ie_id') === '') {
            $ieId = null;
        }

        return response()->json([
            'permiso_ids' => $this->usuarioService->permisosDeUsuarioPorIe($usuario, $ieId),
        ]);
    }

    /**
     * POST /api/usuarios/{usuario}/permisos-ie
     * Sincroniza permisos del usuario para una IE.
     * Body: { ie_id: number|null, permiso_ids: number[] }
     */
    public function syncPermisosIe(User $usuario, Request $request): JsonResponse
    {
        $ieId = $request->input('ie_id') !== null ? (int) $request->input('ie_id') : null;
        $permisoIds = $request->input('permiso_ids', []);

        // Validar que la IE es una donde el trabajador tiene alta (si no es global)
        if ($ieId !== null && $usuario->trabajador_id) {
            $tieneAlta = \App\Models\AltasTrabajadores::where('trabajador_id', $usuario->trabajador_id)
                ->where('institucionEducativa_id', $ieId)
                ->whereNull('fechaBaja')
                ->whereNull('fechaFin')
                ->exists();

            if (!$tieneAlta) {
                return response()->json(['error' => 'El trabajador no tiene alta activa en esa institución.'], 422);
            }
        }

        $this->usuarioService->syncPermisosIe($usuario, $ieId, $permisoIds);

        return response()->json(['ok' => true]);
    }

    private function buildPayload(?User $user): array
    {
        return [
            'usuario' => $user ? [
                'id'     => $user->id,
                'login'  => $user->login,
                'activo' => $user->activo,
            ] : null,
            'iesDisponibles'  => $user ? $this->usuarioService->ieDisponiblesParaUsuario($user) : [],
            'permisosPorModulo' => $this->perfilService->permisosPorModulo(),
            'perfiles'          => $this->perfilService->listarTodos(),
        ];
    }
}
