<?php

namespace App\Http\Controllers\InstitucionEducativa;

use App\Http\Controllers\Controller;
use App\Models\AltasTrabajadores;
use App\Models\Areas;
use App\Models\Cargos;
use App\Models\CondicionesLaborales;
use App\Models\InstitucionesEduc;
use App\Models\Param\ParamRolTrabajador;
use App\Models\Param\ParamSituacionLaboral;
use App\Models\Param\ParamTipoContrato;
use App\Models\Trabajador;
use App\Services\Trabajador\AltaTrabajadorService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class AltaMasivaIEController extends Controller
{
    public function __construct(
        private AltaTrabajadorService $altaService,
    ) {}

    /**
     * Procesa la carga masiva de altas para una IE desde datos JSON.
     * El frontend envía las filas del Excel ya parseadas.
     *
     * POST /instituciones/{institucione}/altas-masivas
     *
     * Body: { "filas": [ { trabajador_id, condicionLaboral_id, ... }, ... ] }
     */
    public function store(Request $request, InstitucionesEduc $institucione): JsonResponse
    {
        $request->validate([
            'filas' => ['required', 'array', 'min:1', 'max:2000'],
            'filas.*.trabajador_id' => ['required', 'integer'],
            'filas.*.condicionLaboral_id' => ['required', 'integer'],
            'filas.*.tipoContrato_id' => ['required', 'integer'],
            'filas.*.rolTrabajador_id' => ['required', 'integer'],
            'filas.*.situacionLaboral_id' => ['required', 'integer'],
            'filas.*.area_id' => ['required', 'integer'],
            'filas.*.cargo_id' => ['required', 'integer'],
            'filas.*.fechaInicio' => ['required', 'date'],
            'filas.*.fechaFin' => ['nullable', 'date'],
            'filas.*.codigoAirsp' => ['nullable', 'string', 'max:50'],
            'filas.*.observacion' => ['nullable', 'string', 'max:500'],
        ]);

        $filas = $request->input('filas');
        $createdBy = auth()->id() ?? 1;
        $ahora = now()->toDateString();

        // Validar existencia de FKs en un solo query por tipo (evita N+1)
        $trabajadorIds = array_unique(array_column($filas, 'trabajador_id'));
        $condicionIds = array_unique(array_column($filas, 'condicionLaboral_id'));
        $tipoContIds = array_unique(array_column($filas, 'tipoContrato_id'));
        $rolIds = array_unique(array_column($filas, 'rolTrabajador_id'));
        $sitLabIds = array_unique(array_column($filas, 'situacionLaboral_id'));
        $areaIds = array_unique(array_column($filas, 'area_id'));
        $cargoIds = array_unique(array_column($filas, 'cargo_id'));

        $validTrabajadores = Trabajador::whereIn('id', $trabajadorIds)->pluck('id')->flip();
        $validCondiciones = CondicionesLaborales::whereIn('id', $condicionIds)->pluck('id')->flip();
        $validTipoContratos = ParamTipoContrato::whereIn('id', $tipoContIds)->pluck('id')->flip();
        $validRoles = ParamRolTrabajador::whereIn('id', $rolIds)->pluck('id')->flip();
        $validSitLab = ParamSituacionLaboral::whereIn('id', $sitLabIds)->pluck('id')->flip();
        $validAreas = Areas::whereIn('id', $areaIds)->pluck('id')->flip();
        $validCargos = Cargos::whereIn('id', $cargoIds)->pluck('id')->flip();

        $validas = [];
        $errores = [];

        foreach ($filas as $idx => $fila) {
            $fila = array_map(fn ($v) => $v === '' ? null : $v, $fila);
            $fila['institucionEducativa_id'] = $institucione->id;
            $fila['created_by'] = $createdBy;
            $fila['fechaAlta'] = $fila['fechaAlta'] ?? $ahora;

            $rowErrors = [];

            if (! isset($validTrabajadores[$fila['trabajador_id']])) {
                $rowErrors[] = "trabajador_id {$fila['trabajador_id']} no existe";
            }
            if (! isset($validCondiciones[$fila['condicionLaboral_id']])) {
                $rowErrors[] = "condicionLaboral_id {$fila['condicionLaboral_id']} no existe";
            }
            if (! isset($validTipoContratos[$fila['tipoContrato_id']])) {
                $rowErrors[] = "tipoContrato_id {$fila['tipoContrato_id']} no existe";
            }
            if (! isset($validRoles[$fila['rolTrabajador_id']])) {
                $rowErrors[] = "rolTrabajador_id {$fila['rolTrabajador_id']} no existe";
            }
            if (! isset($validSitLab[$fila['situacionLaboral_id']])) {
                $rowErrors[] = "situacionLaboral_id {$fila['situacionLaboral_id']} no existe";
            }
            if (! isset($validAreas[$fila['area_id']])) {
                $rowErrors[] = "area_id {$fila['area_id']} no existe";
            }
            if (! isset($validCargos[$fila['cargo_id']])) {
                $rowErrors[] = "cargo_id {$fila['cargo_id']} no existe";
            }

            if ($rowErrors) {
                $errores[$idx + 1] = implode('; ', $rowErrors);
            } else {
                $validas[] = $fila;
            }
        }

        if (empty($validas)) {
            return response()->json([
                'message' => 'No hay filas válidas para insertar.',
                'errores' => $errores,
            ], 422);
        }

        $resultado = $this->altaService->insertarMasivo($institucione, $validas, $createdBy);

        return response()->json([
            'message' => "Se insertaron {$resultado['insertados']} altas correctamente.",
            'insertados' => $resultado['insertados'],
            'errores_validacion' => $errores,
            'errores_db' => $resultado['errores'],
        ]);
    }
}
