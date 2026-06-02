<?php

namespace App\Http\Controllers\Trabajador;

use App\Http\Controllers\Controller;
use App\Http\Requests\Trabajador\StoreRegistroTrabajadorRequest;
use App\Models\Auth\Perfil;
use App\Services\Trabajador\RegistroTrabajadorService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Inertia\Inertia;
use Inertia\Response;

class RegistroTrabajadorController extends Controller
{
    public function __construct(
        private RegistroTrabajadorService $registroService,
    ) {}

    public function create(): RedirectResponse
    {
        return redirect()->route('trabajadores.index');
    }

    public function store(StoreRegistroTrabajadorRequest $request): RedirectResponse
    {
        $this->registroService->registrar($request->validated());

        return redirect()->route('trabajadores.index')
            ->with('success', 'Trabajador registrado exitosamente. Se creó usuario con documento como login y contraseña por defecto.');
    }

    public function storeMasivo(Request $request): JsonResponse
    {
        $request->validate([
            'filas' => 'required|array|min:1',
        ]);

        $resultado = $this->registroService->registrarMasivo($request->json('filas'));

        return response()->json($resultado);
    }
}
