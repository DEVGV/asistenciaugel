<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\Param\ParamService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ParamController extends Controller
{
    public function __construct(
        private ParamService $paramService,
    ) {}

    /**
     * Retorna los datos de un tipo de parámetro.
     *
     * GET /api/params/{type}
     * GET /api/params/{type}?parent_id=5  (para ubigeo jerárquico)
     */
    public function index(Request $request, string $type): JsonResponse
    {
        if (! $this->paramService->existeTipo($type)) {
            return response()->json([
                'message' => "Tipo de parámetro '{$type}' no encontrado.",
                'tipos_disponibles' => $this->paramService->obtenerTiposDisponibles(),
            ], 404);
        }

        $parentId = $request->integer('parent_id') ?: null;
        $data = $this->paramService->obtenerPorTipo($type, $parentId);

        return response()->json(['data' => $data]);
    }

    /**
     * Retorna todos los tipos de parámetros disponibles.
     *
     * GET /api/params
     */
    public function types(): JsonResponse
    {
        return response()->json([
            'data' => $this->paramService->obtenerTiposDisponibles(),
        ]);
    }
}
