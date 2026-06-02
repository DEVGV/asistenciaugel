<?php

namespace App\Http\Controllers\Trabajador;

use App\Http\Controllers\Controller;
use App\Http\Requests\Trabajador\StoreTrabajadorRequest;
use App\Http\Requests\Trabajador\UpdateTrabajadorRequest;
use App\Models\Auth\Perfil;
use App\Models\Trabajador;
use App\Services\Persona\PersonaService;
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
        private PersonaService $personaService,
    ) {}

    public function index(Request $request): Response
    {
        return Inertia::render('trabajador/Index', [
            'trabajadores' => $this->trabajadorService->listarPaginado($request),
            'filters' => $request->only(['search']),
            'perfiles' => Perfil::where('activo', true)->orderBy('nombre')->get(['id', 'nombre', 'descripcion']),
        ]);
    }

    /**
     * Búsqueda de trabajadores para asignación en el horario.
     */
    public function search(Request $request): JsonResponse
    {
        $query = Trabajador::query()
            ->with(['persona', 'altas' => function ($q) {
                $q->whereNull('fechaBaja')->with(['cargo', 'institucionEducativa']);
            }])
            ->where('activo', true);

        // Filtrar solo trabajadores con alta activa en la IE indicada
        if ($request->filled('ie_id')) {
            $ieId = $request->integer('ie_id');
            $query->whereHas('altas', function ($q) use ($ieId) {
                $q->where('institucionEducativa_id', $ieId)
                    ->whereNull('fechaBaja');
            });
        }

        if ($request->filled('search')) {
            $term = '%'.$request->string('search').'%';
            $query->where(function ($q) use ($term) {
                $q->where('codigo', 'ilike', $term)
                    ->orWhereHas('persona', function ($qp) use ($term) {
                        $qp->where('docIdentidad', 'like', $term)
                            ->orWhere('paterno', 'ilike', $term)
                            ->orWhere('materno', 'ilike', $term)
                            ->orWhere('nombre', 'ilike', $term);
                    });
            });
        }

        $results = $query->orderBy('id', 'desc')->take(20)->get();

        return response()->json($results);
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
            'trabajador' => $trabajador->load(['persona.tipoDocIdentidad', 'persona.sexo']),
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
