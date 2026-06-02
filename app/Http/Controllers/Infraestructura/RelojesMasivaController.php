<?php

namespace App\Http\Controllers\Infraestructura;

use App\Http\Controllers\Controller;
use App\DTOs\Infraestructura\CreateRelojDTO;
use App\Models\Conasis\ConasisLocalesInstEduc;
use App\Services\Infraestructura\RelojService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RelojesMasivaController extends Controller
{
    public function __construct(
        private RelojService $relojService,
    ) {}

    /**
     * Crea relojes de forma masiva para un local de IE.
     *
     * POST /locales-ie/{localesIe}/relojes-masivos
     *
     * Body:
     * {
     *   "filas": [
     *     {
     *       "nombre": "Reloj Principal",
     *       "dreccionIP": "192.168.1.10",
     *       "direccionMac": "AA:BB:CC:DD:EE:FF",
     *       "puerto": 4370,
     *       "serie": "ABC123",
     *       "idBiometrico": 1
     *     },
     *     ...
     *   ]
     * }
     */
    public function store(Request $request, ConasisLocalesInstEduc $localesIe): JsonResponse
    {
        $request->validate([
            'filas'                  => ['required', 'array', 'min:1', 'max:500'],
            'filas.*.nombre'         => ['nullable', 'string', 'max:200'],
            'filas.*.dreccionIP'     => ['nullable', 'string', 'max:30'],
            'filas.*.direccionMac'   => ['nullable', 'string', 'max:50'],
            'filas.*.puerto'         => ['nullable', 'integer', 'min:1', 'max:65535'],
            'filas.*.serie'          => ['nullable', 'string', 'max:100'],
            'filas.*.idBiometrico'   => ['nullable', 'integer'],
        ]);

        $filas   = $request->input('filas');
        $creados = 0;
        $errores = [];

        DB::beginTransaction();
        try {
            foreach ($filas as $idx => $fila) {
                // Necesita al menos nombre o IP para no ser fila vacía
                $nombre = trim($fila['nombre'] ?? '');
                $ip     = trim($fila['dreccionIP'] ?? '');
                if ($nombre === '' && $ip === '') {
                    $errores[$idx + 1] = 'Debe indicar al menos nombre o dirección IP.';
                    continue;
                }

                try {
                    $dto = CreateRelojDTO::from(array_merge($fila, [
                        'localInstEduc_id' => $localesIe->id,
                        'activo'           => true,
                    ]));
                    $this->relojService->crear($dto);
                    $creados++;
                } catch (\Throwable $e) {
                    $etiqueta = $nombre ?: $ip;
                    $errores[$idx + 1] = "\"{$etiqueta}\": " . $e->getMessage();
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
                'message' => 'No se pudo crear ningún reloj.',
                'creados' => 0,
                'errores' => $errores,
            ], 422);
        }

        return response()->json([
            'message' => "Se crearon {$creados} reloj(es) correctamente.",
            'creados' => $creados,
            'errores' => $errores,
        ]);
    }
}
