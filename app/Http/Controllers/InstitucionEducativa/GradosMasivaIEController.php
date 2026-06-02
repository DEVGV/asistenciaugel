<?php

namespace App\Http\Controllers\InstitucionEducativa;

use App\Http\Controllers\Controller;
use App\Models\GradosIE;
use App\Models\InstitucionesEduc;
use App\Services\InstitucionEducativa\GradoIEService;
use App\Services\InstitucionEducativa\SeccionIEService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class GradosMasivaIEController extends Controller
{
    public function __construct(
        private GradoIEService $gradoService,
        private SeccionIEService $seccionService,
    ) {}

    /**
     * Crea grados y sus secciones de forma masiva para una IE.
     *
     * POST /instituciones/{institucione}/grados-masivos
     *
     * Body:
     * {
     *   "filas": [
     *     {
     *       "grado_nombre": "Primero",
     *       "grado_sigla": "1°",        // opcional
     *       "secciones": ["A", "B", "C"] // array de nombres de sección
     *     },
     *     ...
     *   ]
     * }
     */
    public function store(Request $request, InstitucionesEduc $institucione): JsonResponse
    {
        $request->validate([
            'filas'                    => ['required', 'array', 'min:1', 'max:500'],
            'filas.*.grado_nombre'     => ['required', 'string', 'max:100'],
            'filas.*.grado_sigla'      => ['nullable', 'string', 'max:20'],
            'filas.*.secciones'        => ['nullable', 'array', 'max:50'],
            'filas.*.secciones.*'      => ['string', 'max:100'],
        ]);

        $filas     = $request->input('filas');
        $createdBy = auth()->id() ?? 1;

        $gradosCreados    = 0;
        $seccionesCreadas = 0;
        $errores          = [];

        DB::beginTransaction();
        try {
            foreach ($filas as $idx => $fila) {
                $gradoNombre = trim($fila['grado_nombre'] ?? '');
                if ($gradoNombre === '') {
                    $errores[$idx + 1] = 'El nombre del grado es obligatorio.';
                    continue;
                }

                // Crear el grado
                $grado = $gradoService = null;
                try {
                    $grado = $this->gradoService->crear($institucione, [
                        'nombre' => $gradoNombre,
                        'sigla'  => trim($fila['grado_sigla'] ?? '') ?: null,
                        'activo' => true,
                    ]);
                    $gradosCreados++;
                } catch (\Throwable $e) {
                    $errores[$idx + 1] = "Grado \"{$gradoNombre}\": " . $e->getMessage();
                    continue;
                }

                // Crear secciones de ese grado
                $secciones = $fila['secciones'] ?? [];
                foreach ($secciones as $secNombre) {
                    $secNombre = trim($secNombre);
                    if ($secNombre === '') {
                        continue;
                    }
                    try {
                        $this->seccionService->crear($grado, [
                            'nombre' => $secNombre,
                            'sigla'  => null,
                            'activo' => true,
                        ]);
                        $seccionesCreadas++;
                    } catch (\Throwable $e) {
                        // No abortar por sección fallida; registrar y continuar
                        $errores[$idx + 1] = ($errores[$idx + 1] ?? '')
                            . " Sección \"{$secNombre}\": " . $e->getMessage() . ';';
                    }
                }
            }

            DB::commit();
        } catch (\Throwable $e) {
            DB::rollBack();

            return response()->json([
                'message' => 'Error inesperado: ' . $e->getMessage(),
            ], 500);
        }

        if ($gradosCreados === 0) {
            return response()->json([
                'message'           => 'No se pudo crear ningún grado.',
                'grados_creados'    => 0,
                'secciones_creadas' => 0,
                'errores'           => $errores,
            ], 422);
        }

        return response()->json([
            'message'           => "Se crearon {$gradosCreados} grado(s) y {$seccionesCreadas} sección(es) correctamente.",
            'grados_creados'    => $gradosCreados,
            'secciones_creadas' => $seccionesCreadas,
            'errores'           => $errores,
        ]);
    }
}
