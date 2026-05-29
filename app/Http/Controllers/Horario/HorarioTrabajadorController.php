<?php

namespace App\Http\Controllers\Horario;

use App\Http\Controllers\Controller;
use App\Models\Conasis\ConasisCargaHoraria;
use App\Models\Conasis\ConasisHorariosTrabajador;
use App\Models\InstitucionesEduc;
use App\Models\Trabajador;
use App\Services\Horario\HorarioTrabajadorService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class HorarioTrabajadorController extends Controller
{
    public function __construct(
        protected HorarioTrabajadorService $horarioTrabajadorService
    ) {}

    public function index(Request $request): Response
    {
        $instituciones = InstitucionesEduc::query()
            ->where(function ($q) {
                $q->whereNull('fechaFin')
                    ->orWhere('fechaFin', '>=', now()->toDateString());
            })
            ->orderBy('nombreLegal')
            ->get();

        return Inertia::render('horario/Index', [
            'instituciones' => $instituciones,
            'anioActual' => (int) date('Y'),
        ]);
    }

    /**
     * Devolver todos los horarios activos de un trabajador (JSON).
     * Un trabajador puede tener múltiples altas y, por tanto, múltiples horarios.
     */
    public function porTrabajador(Request $request, Trabajador $trabajador): JsonResponse
    {
        $anio = $request->integer('anio') ?: (int) date('Y');

        $horarios = $this->horarioTrabajadorService
            ->listarPorTrabajador($trabajador->id, $anio)
            ->load([
                'detalles.horarioCursoIni.curso',
                'detalles.horarioCursoIni.seccion.grado',
                'institucionEduc',
                'altaTrabajador.cargo',
            ]);

        return response()->json([
            'data' => $horarios,
        ]);
    }

    public function show(Request $request, $id): Response
    {
        $horario = ConasisHorariosTrabajador::find($id);

        if (! $horario) {
            $anio = $request->integer('anio') ?: (int) date('Y');
            $horario = ConasisHorariosTrabajador::where('trabajador_id', $id)
                ->where('anio', $anio)
                ->first();
        }

        if (! $horario) {
            abort(404, 'Horario de trabajador no encontrado.');
        }

        $horarioCompleto = $this->horarioTrabajadorService->obtenerConDetalles($horario);

        $cargas = ConasisCargaHoraria::query()
            ->where('trabajador_id', $horario->trabajador_id)
            ->whereHas('horarioCurso', function ($query) use ($horario) {
                $query->where('anio', $horario->anio)
                    ->whereHas('seccion.grado', function ($q) use ($horario) {
                        $q->where('institucionEduc_id', $horario->institucionEduc_id);
                    });
            })
            ->with([
                'horarioCurso.curso',
                'horarioCurso.seccion.grado',
            ])
            ->get();

        return Inertia::render('horario/Show', [
            'horario' => $horarioCompleto,
            'cargas' => $cargas,
        ]);
    }
}
