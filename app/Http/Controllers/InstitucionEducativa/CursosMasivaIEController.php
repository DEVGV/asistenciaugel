<?php

namespace App\Http\Controllers\InstitucionEducativa;

use App\Http\Controllers\Controller;
use App\Models\InstitucionesEduc;
use App\Services\InstitucionEducativa\CursoIEService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CursosMasivaIEController extends Controller
{
    public function __construct(
        private CursoIEService $cursoService,
    ) {}

    /**
     * Crea cursos de forma masiva para una IE.
     *
     * POST /instituciones/{institucione}/cursos-masivos
     *
     * Body:
     * {
     *   "filas": [
     *     { "nombre": "Matemática", "sigla": "MAT" },
     *     ...
     *   ]
     * }
     */
    public function store(Request $request, InstitucionesEduc $institucione): JsonResponse
    {
        $request->validate([
            'filas'           => ['required', 'array', 'min:1', 'max:500'],
            'filas.*.nombre'  => ['required', 'string', 'max:200'],
            'filas.*.sigla'   => ['nullable', 'string', 'max:20'],
        ]);

        $filas     = $request->input('filas');
        $creados   = 0;
        $errores   = [];

        DB::beginTransaction();
        try {
            foreach ($filas as $idx => $fila) {
                $nombre = trim($fila['nombre'] ?? '');
                if ($nombre === '') {
                    $errores[$idx + 1] = 'El nombre del curso es obligatorio.';
                    continue;
                }

                try {
                    $this->cursoService->crear($institucione, [
                        'nombre' => $nombre,
                        'sigla'  => trim($fila['sigla'] ?? '') ?: null,
                        'activo' => true,
                    ]);
                    $creados++;
                } catch (\Throwable $e) {
                    $errores[$idx + 1] = "\"{$nombre}\": " . $e->getMessage();
                }
            }

            DB::commit();
        } catch (\Throwable $e) {
            DB::rollBack();

            return response()->json([
                'message' => 'Error inesperado: ' . $e->getMessage(),
            ], 500);
        }

        if ($creados === 0) {
            return response()->json([
                'message'  => 'No se pudo crear ningún curso.',
                'creados'  => 0,
                'errores'  => $errores,
            ], 422);
        }

        return response()->json([
            'message' => "Se crearon {$creados} curso(s) correctamente.",
            'creados' => $creados,
            'errores' => $errores,
        ]);
    }
}
