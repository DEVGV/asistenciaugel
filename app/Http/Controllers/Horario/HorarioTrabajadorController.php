<?php

namespace App\Http\Controllers\Horario;

use App\Http\Controllers\Controller;
use App\Http\Requests\Horario\UpdateToleranciasHorarioRequest;
use App\Models\Conasis\ConasisHorariosTrabajador;
use App\Models\Trabajador;
use App\Services\Horario\DetalleHorarioService;
use App\Services\Horario\HorarioTrabajadorService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class HorarioTrabajadorController extends Controller
{
    public function __construct(
        private HorarioTrabajadorService $horarioTrabajadorService,
        private DetalleHorarioService $detalleHorarioService,
    ) {}

    public function index(): Response
    {
        return Inertia::render('horario/Index', [
            'instituciones' => $this->horarioTrabajadorService->listarInstitucionesActivas(),
            'anioActual'    => (int) date('Y'),
        ]);
    }

    public function porTrabajador(Request $request, Trabajador $trabajador): JsonResponse
    {
        $anio = $request->integer('anio') ?: (int) date('Y');

        return response()->json([
            'data' => $this->horarioTrabajadorService->listarPorTrabajador($trabajador->id, $anio),
        ]);
    }

    public function show(Request $request, int $id): Response
    {
        $anio    = $request->integer('anio') ?: (int) date('Y');
        $horario = $this->horarioTrabajadorService->resolverHorario($id, $anio);

        abort_if(! $horario, 404, 'Horario de trabajador no encontrado.');

        return Inertia::render('horario/Show', [
            'horario' => $this->horarioTrabajadorService->obtenerConDetalles($horario),
            'cargas'  => $this->horarioTrabajadorService->listarCargasParaShow($horario),
        ]);
    }

    /**
     * Actualiza tolerancias y rangos horarios de cada día del horario.
     * PATCH /horarios-trabajador/{id}/tolerancias
     */
    public function updateTolerancias(
        UpdateToleranciasHorarioRequest $request,
        ConasisHorariosTrabajador $horarioTrabajador,
    ): JsonResponse {
        $actualizados = $this->detalleHorarioService->actualizarTolerancias(
            $horarioTrabajador,
            $request->validated('detalles'),
        );

        return response()->json([
            'ok'           => true,
            'actualizados' => $actualizados,
            'mensaje'      => "Se actualizaron {$actualizados} detalle(s) de horario.",
        ]);
    }
}
