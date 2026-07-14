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

        // Altas activas (sin baja) con relaciones necesarias para el frontend
        $altas = $trabajador->altas()
            ->whereNull('fechaBaja')
            ->with(['institucionEducativa', 'rolTrabajador', 'cargo'])
            ->get();

        return response()->json([
            'data'  => $this->horarioTrabajadorService->listarPorTrabajador($trabajador->id, $anio),
            'altas' => $altas,
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
     * Crea o actualiza un horario manual (administrativo) para trabajadores
     * sin cursos: directores, auxiliares, administrativos, etc.
     * POST /horarios-trabajador/manual
     */
    public function storeManual(Request $request): JsonResponse
    {
        $request->validate([
            'trabajador_id'      => 'required|integer|exists:t_trabajador,id',
            'anio'               => 'required|integer|min:2020|max:2100',
            'institucionEduc_id' => 'required|integer',
            'nombre'             => 'nullable|string|max:100',
            'fechaInicio'        => 'nullable|date',
            'fechaFin'           => 'nullable|date',
            'detalles'           => 'required|array|min:1',
            'detalles.*.nroDia'        => 'required|integer|min:1|max:7',
            'detalles.*.entHoraInicio' => 'required|date_format:H:i',
            'detalles.*.salHoraInicio' => 'required|date_format:H:i',
            'detalles.*.entTolerancia' => 'nullable|integer|min:0',
            'detalles.*.salTolerancia' => 'nullable|integer|min:0',
            'detalles.*.aplicar'       => 'nullable|boolean',
        ]);

        // Validar que hora de salida sea posterior a hora de entrada
        $detalles = $request->input('detalles', []);
        $errores = [];
        foreach ($detalles as $i => $det) {
            if (! empty($det['entHoraInicio']) && ! empty($det['salHoraInicio']) && $det['salHoraInicio'] <= $det['entHoraInicio']) {
                $errores["detalles.{$i}.salHoraInicio"] = ['La hora de salida debe ser posterior a la hora de entrada.'];
            }
        }
        if ($errores) {
            throw \Illuminate\Validation\ValidationException::withMessages($errores);
        }

        $horario = $this->horarioTrabajadorService->guardarHorarioManual(
            $request->only(['trabajador_id', 'anio', 'institucionEduc_id', 'nombre', 'fechaInicio', 'fechaFin', 'altaTrabajador_id']),
            $request->input('detalles'),
        );

        return response()->json([
            'ok'      => true,
            'data'    => $horario,
            'mensaje' => 'Horario guardado correctamente.',
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
