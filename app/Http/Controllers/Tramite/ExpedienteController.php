<?php

namespace App\Http\Controllers\Tramite;

use App\Http\Controllers\Controller;
use App\Http\Requests\Tramite\StoreExpedienteRequest;
use App\Models\Conasis\ConasisDocumentosTram;
use App\Models\Conasis\ConasisExpediente;
use App\Models\InstitucionesEduc;
use App\Models\Trabajador;
use App\Services\Tramite\ExpedienteService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;
use Symfony\Component\HttpFoundation\StreamedResponse;

class ExpedienteController extends Controller
{
    public function __construct(
        private ExpedienteService $expedienteService,
    ) {}

    public function index(Request $request): Response
    {
        return Inertia::render('tramite/expedientes/Index', [
            'expedientes' => $this->expedienteService->listarPaginado($request),
            'filters'     => $request->only(['search', 'tipo', 'anio']),
        ]);
    }

    public function create(): Response
    {
        return Inertia::render('tramite/expedientes/Create');
    }

    public function store(StoreExpedienteRequest $request): RedirectResponse
    {
        $this->expedienteService->crear(
            $request->toDTO(),
            $request->getArchivos(),
        );

        return redirect()->route('expedientes.index')
            ->with('success', 'Expediente registrado correctamente.');
    }

    public function anular(ConasisExpediente $expediente): RedirectResponse
    {
        $this->expedienteService->anular($expediente);

        return redirect()->back()
            ->with('success', 'Expediente anulado.');
    }

    public function descargarDocumento(ConasisDocumentosTram $documentoTram): StreamedResponse
    {
        return $this->expedienteService->descargarDocumento($documentoTram);
    }

    // ── API JSON (para tabs embebidos) ───────────────────────────────────────

    public function detalleJson(ConasisExpediente $expediente): JsonResponse
    {
        return response()->json($this->expedienteService->obtener($expediente));
    }

    public function porTrabajador(Trabajador $trabajador): JsonResponse
    {
        return response()->json([
            'data' => $this->expedienteService->listarPorTrabajador($trabajador),
        ]);
    }

    public function porInstitucion(Request $request, InstitucionesEduc $institucione): JsonResponse
    {
        return response()->json(
            $this->expedienteService->listarPorInstitucion($institucione, $request),
        );
    }

    public function personalActivo(InstitucionesEduc $institucione): JsonResponse
    {
        return response()->json([
            'data' => $this->expedienteService->personalActivoPorInstitucion($institucione),
        ]);
    }

    public function altasActivas(Trabajador $trabajador): JsonResponse
    {
        return response()->json([
            'data' => $this->expedienteService->altasActivasPorTrabajador($trabajador),
        ]);
    }
}
