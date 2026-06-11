<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\EnrollFaceRequest;
use App\Http\Requests\Api\LoginMobileRequest;
use App\Http\Requests\Api\PrevalidateMarcacionRequest;
use App\Http\Requests\Api\StoreMarcacionMobileRequest;
use App\Models\Conasis\ConasisDetalleHorarios;
use App\Models\Conasis\ConasisHorariosTrabajador;
use App\Models\Conasis\ConasisMarcaciones;
use App\Models\Trabajador;
use App\Services\Api\MobileService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MobileController extends Controller
{
    public function __construct(
        private MobileService $mobileService,
    ) {}

    public function login(LoginMobileRequest $request): JsonResponse
    {
        $dto  = $request->toDTO();
        $user = $this->mobileService->autenticar($dto['dni'], $dto['password']);

        if (! $user) {
            return response()->json(['message' => 'Credenciales invalidas o trabajador no encontrado.'], 422);
        }

        Auth::login($user);
        $request->session()->regenerate();
        $request->setUserResolver(fn () => $user);

        return $this->me($request);
    }

    public function logout(Request $request): JsonResponse
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return response()->json(['message' => 'Sesion movil cerrada.']);
    }

    public function me(Request $request): JsonResponse
    {
        $trabajador = $this->mobileService->trabajadorDeUsuario($request->user());

        if (! $trabajador) {
            return response()->json(['message' => 'El usuario no tiene trabajador asociado.'], 404);
        }

        $today      = today();
        $altas      = $this->mobileService->altasActivasQuery($trabajador, $today)->get();
        $credential = $this->mobileService->credencial($trabajador);

        return response()->json([
            'data' => [
                'user' => [
                    'id'    => $request->user()->id,
                    'name'  => $request->user()->name,
                    'email' => $request->user()->email,
                ],
                'teacher' => [
                    'id'             => $trabajador->id,
                    'codigo'         => $trabajador->codigo,
                    'documento'      => $trabajador->persona?->docIdentidad,
                    'nombre_completo' => $trabajador->persona?->nombre_completo,
                ],
                'mobile_biometric' => $this->mobileService->formatCredencial($credential),
                'assignments'      => $altas->map(fn ($alta): array => [
                    'alta_trabajador_id'       => $alta->id,
                    'institucion_educativa_id' => $alta->institucionEducativa_id,
                    'institucion_nombre'       => $alta->institucionEducativa?->nombreLegal,
                    'fecha_inicio'             => $alta->fechaInicio,
                    'fecha_fin'                => $alta->fechaFin,
                    'local_marcacion'          => $this->mobileService->formatLocalMarcacion(
                        $this->mobileService->localMarcacionActivo($trabajador, $alta, $today)
                    ),
                ])->values(),
            ],
        ]);
    }

    public function enrollFace(EnrollFaceRequest $request): JsonResponse
    {
        $trabajador = $this->requireTrabajador($request);
        $credential = $this->mobileService->enrolarFace($trabajador, $request->toDTO(), $request->user()->id);

        return response()->json([
            'data' => [
                'biometric'           => $this->mobileService->formatCredencial($credential),
                'face_template_length' => strlen($credential->face_template ?? ''),
            ],
        ], 201);
    }

    public function enableLocalBiometric(Request $request): JsonResponse
    {
        $trabajador = $this->requireTrabajador($request);
        $credential = $this->mobileService->habilitarBiometriaLocal($trabajador, $request->user()->id);

        return response()->json(['data' => $this->mobileService->formatCredencial($credential)]);
    }

    public function prevalidate(PrevalidateMarcacionRequest $request): JsonResponse
    {
        $trabajador = $this->requireTrabajador($request);
        $context    = $this->mobileService->contextoMarcacion($trabajador, $request->toDTO()['alta_trabajador_id'] ?? null);

        return response()->json([
            'data' => [
                'allowed'         => $context['allowed'],
                'checks'          => $context['checks'],
                'assignment'      => $context['alta'] ? [
                    'alta_trabajador_id'       => $context['alta']->id,
                    'institucion_educativa_id' => $context['alta']->institucionEducativa_id,
                ] : null,
                'local_marcacion' => $this->mobileService->formatLocalMarcacion($context['localMarcacion']),
                'schedule'        => $context['schedule'],
            ],
        ]);
    }

    public function storeMark(StoreMarcacionMobileRequest $request): JsonResponse
    {
        $trabajador = $this->requireTrabajador($request);
        $result     = $this->mobileService->registrarMarcacion($trabajador, $request->toDTO(), $request->user()->id);

        return response()->json([
            'data' => [
                'mark'      => $this->mobileService->formatMarcacion($result['mark']),
                'biometric' => $this->mobileService->formatCredencial($result['credential']),
            ],
        ], 201);
    }

    public function marks(Request $request): JsonResponse
    {
        $trabajador = $this->requireTrabajador($request);
        $marks      = $this->mobileService->marcacionesRecientes($trabajador);

        return response()->json([
            'data' => $marks->map(fn (ConasisMarcaciones $mark): array => $this->mobileService->formatMarcacion($mark)),
        ]);
    }

    public function schedule(Request $request): JsonResponse
    {
        $trabajador = $this->requireTrabajador($request);
        $data       = $this->mobileService->horarioActual($trabajador);

        return response()->json([
            'data' => [
                'horarios' => $data['horarios']->map(fn (ConasisHorariosTrabajador $horario): array => [
                    'id'            => $horario->id,
                    'nombre'        => $horario->nombre,
                    'tipo_horario'  => $horario->tipoHorario,
                    'fecha_inicio'  => $horario->fechaInicio,
                    'fecha_fin'     => $horario->fechaFin,
                ])->values(),
                'detalles' => $data['detalles']->map(fn (ConasisDetalleHorarios $detalle): array => [
                    'id'                    => $detalle->id,
                    'horario_trabajador_id' => $detalle->horarioTrabajador_id,
                    'dia_semana'            => $detalle->diaSemana,
                    'nro_dia'               => $detalle->nroDia,
                    'entrada_inicio'        => $detalle->entHoraInicio,
                    'entrada_fin'           => $detalle->entHoraFin,
                    'entrada_tolerancia'    => $detalle->entTolerancia,
                    'salida_inicio'         => $detalle->salHoraInicio,
                    'salida_fin'            => $detalle->salHoraFin,
                    'salida_tolerancia'     => $detalle->salTolerancia,
                ])->values(),
            ],
        ]);
    }

    private function requireTrabajador(Request $request): Trabajador
    {
        $trabajador = $this->mobileService->trabajadorDeUsuario($request->user());

        abort_if(! $trabajador, 404, 'El usuario no tiene trabajador activo asociado.');

        return $trabajador;
    }
}
