<?php

namespace App\Http\Controllers\Trabajador;

use App\Http\Controllers\Controller;
use App\Http\Requests\Trabajador\BajaTrabajadorRequest;
use App\Http\Requests\Trabajador\StoreAltaTrabajadorRequest;
use App\Models\AltasTrabajadores;
use App\Models\Trabajador;
use App\Services\Trabajador\AltaTrabajadorService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class AltaTrabajadorController extends Controller
{
    public function __construct(
        private AltaTrabajadorService $altaService,
    ) {}

    /**
     * Vista global paginada de todas las altas del sistema.
     * Soporta filtros: search, institucion_id, trabajador_id, anio, solo_activas.
     */
    public function index(Request $request): Response
    {
        return Inertia::render('trabajador/altas/Index', [
            'altas' => $this->altaService->listarPaginado($request),
            'filters' => $request->only(['search', 'institucion_id', 'trabajador_id', 'anio', 'solo_activas']),
        ]);
    }

    /**
     * Crea un alta para el trabajador especificado (ruta anidada).
     */
    public function store(StoreAltaTrabajadorRequest $request, Trabajador $trabajador): RedirectResponse
    {
        $this->altaService->crear($request->toDTO());

        return back()->with('success', 'Alta registrada exitosamente.');
    }

    /**
     * Actualiza los datos de un alta existente (ruta shallow).
     */
    public function update(StoreAltaTrabajadorRequest $request, AltasTrabajadores $alta): RedirectResponse
    {
        $datos = $request->validated();
        unset($datos['trabajador_id']); // No se cambia el trabajador en edición

        $this->altaService->actualizar($alta, $datos);

        return back()->with('success', 'Alta actualizada exitosamente.');
    }

    /**
     * Elimina un alta (solo si no tiene baja registrada).
     */
    public function destroy(AltasTrabajadores $alta): RedirectResponse
    {
        $this->altaService->eliminar($alta);

        return back()->with('success', 'Alta eliminada exitosamente.');
    }

    /**
     * Registra la baja de un alta activa.
     */
    public function darBaja(BajaTrabajadorRequest $request, AltasTrabajadores $alta): RedirectResponse
    {
        $this->altaService->darBaja(
            $alta,
            $request->validated('fechaBaja'),
            (int) $request->validated('motivoBaja_id'),
        );

        return back()->with('success', 'Baja registrada exitosamente.');
    }
}
