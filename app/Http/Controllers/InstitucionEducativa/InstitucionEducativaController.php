<?php

namespace App\Http\Controllers\InstitucionEducativa;

use App\Http\Controllers\Controller;
use App\Http\Requests\InstitucionEducativa\StoreInstEducRequest;
use App\Http\Requests\InstitucionEducativa\UpdateInstEducRequest;
use App\Models\InstitucionesEduc;
use App\Services\InstitucionEducativa\InstitucionEducativaService;
use App\Services\Trabajador\AltaTrabajadorService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class InstitucionEducativaController extends Controller
{
    public function __construct(
        private InstitucionEducativaService $ieService,
        private AltaTrabajadorService $altaService,
    ) {}

    public function index(Request $request): Response
    {
        return Inertia::render('institucion-educativa/Index', [
            'instituciones' => $this->ieService->listarPaginado($request),
            'filters' => $request->only(['search']),
        ]);
    }

    /**
     * Búsqueda rápida de IE para selects con typeahead.
     *
     * GET /api/instituciones/search?search=...&per_page=30
     */
    public function search(Request $request): JsonResponse
    {
        $query = InstitucionesEduc::query()
            ->select(['id', 'nombreLegal', 'codigoInstitucion', 'codigoModular']);

        if ($request->filled('search')) {
            $term = '%'.$request->string('search').'%';
            $query->where(function ($q) use ($term) {
                $q->whereRaw('LOWER("nombreLegal") LIKE LOWER(?)', [$term])
                    ->orWhereRaw('LOWER("codigoInstitucion") LIKE LOWER(?)', [$term])
                    ->orWhereRaw('LOWER("codigoModular") LIKE LOWER(?)', [$term]);
            });
        }

        $perPage = min((int) $request->get('per_page', 30), 100);
        $results = $query->orderBy('nombreLegal')->paginate($perPage);

        return response()->json($results);
    }

    public function store(StoreInstEducRequest $request): RedirectResponse
    {
        $this->ieService->crear($request->toDTO());

        return redirect()->route('instituciones.index')
            ->with('success', 'Institución educativa registrada exitosamente.');
    }

    public function show(InstitucionesEduc $institucione): Response
    {
        return Inertia::render('institucion-educativa/Show', [
            'institucion' => $this->ieService->obtenerConRelaciones($institucione),
        ]);
    }

    /**
     * Devuelve altas/docentes paginados de una IE (para el tab Docentes/Personal).
     * Los datos de la IE se pasan separados para no recargar locales/cursos/etc.
     */
    public function docentes(InstitucionesEduc $institucione, Request $request): Response
    {
        return Inertia::render('institucion-educativa/Show', [
            'institucion' => $this->ieService->obtenerConRelaciones($institucione),
            'docentes' => $this->altaService->listarPorInstitucion($institucione, $request),
            'docentesFiltros' => $request->only(['search', 'solo_activas', 'condicion_id']),
            'activeTab' => 'docentes',
        ]);
    }

    public function detallesJson(InstitucionesEduc $institucione): JsonResponse
    {
        return response()->json([
            'data' => $this->ieService->obtenerConRelaciones($institucione),
        ]);
    }

    public function update(UpdateInstEducRequest $request, InstitucionesEduc $institucione): RedirectResponse
    {
        $this->ieService->actualizar($institucione, $request->toDTO());

        return redirect()->route('instituciones.index')
            ->with('success', 'Institución educativa actualizada exitosamente.');
    }

    public function destroy(InstitucionesEduc $institucione): RedirectResponse
    {
        $this->ieService->eliminar($institucione);

        return redirect()->route('instituciones.index')
            ->with('success', 'Institución educativa eliminada exitosamente.');
    }
}
