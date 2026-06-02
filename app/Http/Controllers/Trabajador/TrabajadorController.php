<?php

namespace App\Http\Controllers\Trabajador;

use App\Http\Controllers\Controller;
use App\Http\Requests\Trabajador\StoreTrabajadorRequest;
use App\Http\Requests\Trabajador\UpdateTrabajadorRequest;
use App\Models\Auth\Perfil;
use App\Models\Trabajador;
use App\Services\Trabajador\TrabajadorService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class TrabajadorController extends Controller
{
    public function __construct(
        private TrabajadorService $trabajadorService,
    ) {}

    public function index(Request $request): Response
    {
        return Inertia::render('trabajador/Index', [
            'trabajadores' => $this->trabajadorService->listarPaginado($request),
            'filters'      => $request->only(['search']),
            'perfiles'     => Perfil::where('activo', true)->orderBy('nombre')->get(['id', 'nombre', 'descripcion']),
        ]);
    }

    public function search(Request $request): JsonResponse
    {
        return response()->json(
            $this->trabajadorService->buscarParaAsignacion($request)
        );
    }

    public function store(StoreTrabajadorRequest $request): RedirectResponse
    {
        $this->trabajadorService->crearMasivo($request->toDTOs());

        return redirect()->route('trabajadores.index')
            ->with('success', 'Trabajadores registrados exitosamente.');
    }

    public function show(Trabajador $trabajador): Response
    {
        return Inertia::render('trabajador/Show', [
            'trabajador' => $this->trabajadorService->obtenerConRelaciones($trabajador),
        ]);
    }

    public function edit(Trabajador $trabajador): Response
    {
        return Inertia::render('trabajador/Edit', [
            'trabajador' => $this->trabajadorService->obtenerParaEdicion($trabajador),
        ]);
    }

    public function update(UpdateTrabajadorRequest $request, Trabajador $trabajador): RedirectResponse
    {
        $this->trabajadorService->actualizar($trabajador, $request->toDTO());

        return redirect()->route('trabajadores.index')
            ->with('success', 'Trabajador actualizado exitosamente.');
    }

    public function destroy(Trabajador $trabajador): RedirectResponse
    {
        $this->trabajadorService->eliminar($trabajador);

        return redirect()->route('trabajadores.index')
            ->with('success', 'Trabajador desactivado exitosamente.');
    }
}
