<?php

namespace App\Http\Controllers\Asistencia;

use App\Http\Controllers\Controller;
use App\Http\Requests\Asistencia\ProcesarConsolidadoRequest;
use App\Models\InstitucionesEduc;
use App\Services\Asistencia\ConsolidadoAsistenciaService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ConsolidadoAsistenciaController extends Controller
{
    public function __construct(
        private ConsolidadoAsistenciaService $consolidadoService,
    ) {}

    /**
     * Procesa la asistencia mensual de todos los trabajadores de la IE.
     */
    public function procesar(ProcesarConsolidadoRequest $request, InstitucionesEduc $institucione): JsonResponse
    {
        $params = $request->toProcesarParams();

        $resultado = $this->consolidadoService->procesarMes(
            institucion: $institucione,
            anio: $params['anio'],
            mes: $params['mes'],
            fechaDesde: $params['fechaDesde'],
            fechaHasta: $params['fechaHasta'],
            userId: auth()->id(),
        );

        return response()->json([
            'message'     => "Procesamiento completado: {$resultado['procesados']} de {$resultado['total']} trabajadores procesados.",
            'procesados'  => $resultado['procesados'],
            'total'       => $resultado['total'],
            'sin_horario' => $resultado['sin_horario'],
            'errores'     => $resultado['errores'],
        ]);
    }

    /**
     * Obtiene el consolidado ya procesado para mostrar en la vista.
     */
    public function consultar(Request $request, InstitucionesEduc $institucione): JsonResponse
    {
        $anio = $request->integer('anio', (int) date('Y'));
        $mes  = $request->integer('mes', (int) date('m'));

        $consolidado = $this->consolidadoService->obtenerConsolidado(
            $institucione->id,
            $anio,
            $mes,
        );

        // Para cada registro de asistencia, obtener su resumen consolidado
        $resultados = $consolidado->map(function ($asistencia) {
            $resumen = $this->consolidadoService->obtenerResumenConsolidado($asistencia->id);

            return [
                'id'          => $asistencia->id,
                'trabajador'  => [
                    'id'     => $asistencia->trabajador_id,
                    'nombre' => trim(
                        ($asistencia->trabajador?->persona?->paterno ?? '') . ' ' .
                        ($asistencia->trabajador?->persona?->materno ?? '') . ', ' .
                        ($asistencia->trabajador?->persona?->nombre ?? '')
                    ),
                    'dni'    => $asistencia->trabajador?->persona?->docIdentidad ?? '',
                ],
                'condicion'   => $asistencia->altaTrabajador?->condicionLaboral?->abreviatura ?? '-',
                'rol'         => $asistencia->altaTrabajador?->rolTrabajador?->nombre ?? '-',
                'fechaDesde'  => $asistencia->fechaDesde,
                'fechaHasta'  => $asistencia->fechaHasta,
                'resumen'     => $resumen->map(fn ($r) => [
                    'sigla' => $r->sigla,
                    'sigla_pers' => $r->siglaPers,
                    'ndias' => $r->ndias,
                    'remunerado' => $r->remunerado,
                    'motivo' => $r->motivoSuspLab?->nombre ?? $r->sigla,
                ]),
            ];
        });

        return response()->json(['data' => $resultados]);
    }

    /**
     * Obtiene el detalle diario de un registro de asistencia específico.
     */
    public function detalle(int $asistenciaId): JsonResponse
    {
        $detalle = $this->consolidadoService->obtenerDetalleMensual($asistenciaId);

        return response()->json(['data' => $detalle]);
    }
}
