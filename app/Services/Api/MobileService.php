<?php

namespace App\Services\Api;

use App\Models\AltasTrabajadores;
use App\Models\Conasis\ConasisDetalleHorarios;
use App\Models\Conasis\ConasisHorariosTrabajador;
use App\Models\Conasis\ConasisLocalesMarcacion;
use App\Models\Conasis\ConasisMarcaciones;
use App\Models\Conasis\MobileBiometricCredential;
use App\Models\Trabajador;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class MobileService
{
    /**
     * Autentica al trabajador por DNI y contraseña.
     * Retorna el User si las credenciales son válidas, o null si no.
     */
    public function autenticar(string $dni, string $password): ?User
    {
        $trabajador = Trabajador::query()
            ->where('activo', true)
            ->whereHas('persona', fn ($query) => $query->where('docIdentidad', $dni))
            ->first();

        if (! $trabajador) {
            return null;
        }

        $user = User::query()->where('trabajador_id', (string) $trabajador->id)->first();

        if (! $user || ! Hash::check($password, $user->password)) {
            return null;
        }

        return $user;
    }

    /**
     * Obtiene el trabajador activo asociado al usuario, con la relación persona cargada.
     */
    public function trabajadorDeUsuario(User $user): ?Trabajador
    {
        if (! $user->trabajador_id) {
            return null;
        }

        return Trabajador::query()
            ->with('persona')
            ->where('activo', true)
            ->find($user->trabajador_id);
    }

    /**
     * Obtiene (o crea) la credencial biométrica del trabajador.
     */
    public function credencial(Trabajador $trabajador): MobileBiometricCredential
    {
        return MobileBiometricCredential::query()->firstOrCreate(
            ['trabajador_id' => $trabajador->id],
            ['face_status' => MobileBiometricCredential::STATUS_PENDING]
        );
    }

    /**
     * Altas activas del trabajador en la fecha indicada.
     *
     * @return \Illuminate\Database\Eloquent\Builder<AltasTrabajadores>
     */
    public function altasActivasQuery(Trabajador $trabajador, mixed $date)
    {
        return AltasTrabajadores::query()
            ->with('institucionEducativa')
            ->where('trabajador_id', $trabajador->id)
            ->whereDate('fechaInicio', '<=', $date)
            ->where(fn ($query) => $query->whereNull('fechaFin')->orWhereDate('fechaFin', '>=', $date))
            ->whereNull('fechaBaja')
            ->orderBy('fechaInicio');
    }

    /**
     * Local de marcación activo para el trabajador y alta indicados.
     */
    public function localMarcacionActivo(Trabajador $trabajador, AltasTrabajadores $alta, mixed $date): ?ConasisLocalesMarcacion
    {
        return ConasisLocalesMarcacion::query()
            ->with('localInstEduc.local')
            ->where('trabajador_id', $trabajador->id)
            ->where('altaTrabajador_id', $alta->id)
            ->whereDate('fechaInicio', '<=', $date)
            ->where(fn ($query) => $query->whereNull('fechaFin')->orWhereDate('fechaFin', '>=', $date))
            ->orderByDesc('fechaInicio')
            ->first();
    }

    /**
     * Construye el contexto de marcación y las verificaciones de seguridad.
     *
     * @return array<string, mixed>
     */
    public function contextoMarcacion(Trabajador $trabajador, ?int $altaTrabajadorId): array
    {
        $today = today();
        $altaQuery = $this->altasActivasQuery($trabajador, $today);

        if ($altaTrabajadorId) {
            $altaQuery->whereKey($altaTrabajadorId);
        }

        $alta = $altaQuery->first();
        $localMarcacion = $alta ? $this->localMarcacionActivo($trabajador, $alta, $today) : null;
        $credential = $this->credencial($trabajador);
        $schedule = $this->scheduleSnapshot($trabajador, $alta);

        $checks = [
            'trabajador_activo'            => true,
            'alta_vigente'                 => filled($alta),
            'asignado_marcacion_movil'     => filled($localMarcacion),
            'biometria_facial_aprobada'    => $this->credencialFacialLista($credential),
            'metodo_biometrico_habilitado' => $this->credencialFacialLista($credential) || $credential->local_biometric_enabled,
            'biometria_no_bloqueada'       => ! ($credential->blocked_until && $credential->blocked_until->isFuture()),
        ];

        return [
            'allowed' => $checks['trabajador_activo']
                && $checks['alta_vigente']
                && $checks['asignado_marcacion_movil']
                && $checks['metodo_biometrico_habilitado']
                && $checks['biometria_no_bloqueada'],
            'checks'          => $checks,
            'alta'            => $alta,
            'localMarcacion'  => $localMarcacion,
            'schedule'        => $schedule,
        ];
    }

    /**
     * Registra el enrolamiento facial del trabajador.
     */
    public function enrolarFace(Trabajador $trabajador, array $data, int $userId): MobileBiometricCredential
    {
        $template  = $this->buildFaceTemplate($data['face_image_base64']);
        $embedding = $this->normalizeEmbedding($data['face_embedding']);

        return MobileBiometricCredential::query()->updateOrCreate(
            ['trabajador_id' => $trabajador->id],
            [
                'face_status'               => MobileBiometricCredential::STATUS_APPROVED,
                'face_template'             => $template,
                'face_threshold'            => 4,
                'face_embedding'            => $embedding,
                'face_similarity_threshold' => 0.6,
                'face_enrolled_at'          => now(),
                'face_approved_at'          => now(),
                'failed_attempts'           => 0,
                'last_face_distance'        => null,
                'last_face_similarity'      => null,
                'blocked_until'             => null,
                'created_by'                => $userId,
                'updated_by'                => $userId,
            ]
        );
    }

    /**
     * Habilita la biometría local en el dispositivo del trabajador.
     */
    public function habilitarBiometriaLocal(Trabajador $trabajador, int $userId): MobileBiometricCredential
    {
        $credential = $this->credencial($trabajador);

        $credential->forceFill([
            'local_biometric_enabled'    => true,
            'local_biometric_enabled_at' => now(),
            'updated_by'                 => $userId,
        ])->save();

        return $credential;
    }

    /**
     * Intenta registrar una marcación móvil con validación biométrica.
     * Retorna la marcación creada o lanza abort() si la validación falla.
     *
     * @param  array<string, mixed>  $data
     * @return array{mark: ConasisMarcaciones, credential: MobileBiometricCredential}
     */
    public function registrarMarcacion(Trabajador $trabajador, array $data, int $userId): array
    {
        $credential = $this->credencial($trabajador);
        $context    = $this->contextoMarcacion($trabajador, $data['alta_trabajador_id'] ?? null);

        if (! $context['allowed']) {
            abort(422, 'La marcacion movil no esta habilitada para este trabajador.');
        }

        if ($credential->blocked_until && $credential->blocked_until->isFuture()) {
            abort(423, 'La validacion biometrica se encuentra bloqueada temporalmente.');
        }

        if ($data['biometric_method'] === 'local_device' && ! $credential->local_biometric_enabled) {
            abort(422, 'La biometria local del dispositivo no esta habilitada.');
        }

        [$isBiometricValid, $lastDistance, $lastSimilarity] = $this->validarBiometria($credential, $data);

        if (! $isBiometricValid) {
            $this->registrarIntentoFallido($credential, $userId, $lastDistance, $lastSimilarity);
            abort(422, 'La validacion biometrica no fue superada.');
        }

        $credential->forceFill([
            'failed_attempts'     => 0,
            'blocked_until'       => null,
            'last_verified_at'    => now(),
            'last_face_distance'  => $lastDistance,
            'last_face_similarity' => $lastSimilarity,
            'updated_by'          => $userId,
        ])->save();

        $mark = DB::transaction(function () use ($context, $trabajador, $data, $userId): ConasisMarcaciones {
            return ConasisMarcaciones::query()->create([
                'trabajador_id'      => $trabajador->id,
                'altaTrabajador_id'  => $context['alta']->id,
                'localMarcacion_id'  => $context['localMarcacion']?->id,
                'codigo'             => $this->codigoMarcacionMovil($trabajador),
                'fechaMarcacion'     => now(),
                'fechaRegistro'      => now(),
                'tipo'               => 'A',
                'medioMarcacion'     => 'M',
                'procesado'          => false,
                'utm_huso'           => $data['utm_huso'] ?? null,
                'utm_base'           => $data['utm_base'] ?? null,
                'utm_x_este'         => $data['utm_x_este'] ?? null,
                'utm_y_norte'        => $data['utm_y_norte'] ?? null,
                'created_by'         => $userId,
            ]);
        });

        return ['mark' => $mark, 'credential' => $credential->refresh()];
    }

    /**
     * Lista las marcaciones móviles recientes del trabajador (últimos 7 días).
     *
     * @return \Illuminate\Database\Eloquent\Collection<int, ConasisMarcaciones>
     */
    public function marcacionesRecientes(Trabajador $trabajador)
    {
        return ConasisMarcaciones::query()
            ->where('trabajador_id', $trabajador->id)
            ->where('medioMarcacion', 'M')
            ->where('fechaMarcacion', '>=', now()->subDays(7))
            ->latest('fechaMarcacion')
            ->limit(20)
            ->get();
    }

    /**
     * Obtiene los horarios y detalles activos del trabajador para hoy.
     *
     * @return array<string, mixed>
     */
    public function horarioActual(Trabajador $trabajador): array
    {
        $today = today();

        $horarios = ConasisHorariosTrabajador::query()
            ->where('trabajador_id', $trabajador->id)
            ->where('activo', true)
            ->whereDate('fechaInicio', '<=', $today)
            ->where(fn ($query) => $query->whereNull('fechaFin')->orWhereDate('fechaFin', '>=', $today))
            ->orderBy('fechaInicio')
            ->get();

        $detalles = ConasisDetalleHorarios::query()
            ->whereIn('horarioTrabajador_id', $horarios->pluck('id'))
            ->where('aplicar', true)
            ->orderBy('nroDia')
            ->orderBy('entHoraInicio')
            ->get();

        return compact('horarios', 'detalles');
    }

    // -------------------------------------------------------------------------
    // Helpers públicos de formateo
    // -------------------------------------------------------------------------

    /** @return array<string, mixed> */
    public function formatCredencial(MobileBiometricCredential $credential): array
    {
        $faceStatus = $credential->face_status;
        if ($faceStatus === MobileBiometricCredential::STATUS_APPROVED && ! $this->credencialFacialLista($credential)) {
            $faceStatus = MobileBiometricCredential::STATUS_PENDING;
        }

        return [
            'face_status'               => $faceStatus,
            'face_enrolled_at'          => $credential->face_enrolled_at,
            'face_approved_at'          => $credential->face_approved_at,
            'local_biometric_enabled'   => $credential->local_biometric_enabled,
            'local_biometric_enabled_at' => $credential->local_biometric_enabled_at,
            'failed_attempts'           => $credential->failed_attempts,
            'face_threshold'            => $credential->face_threshold,
            'face_similarity_threshold' => $credential->face_similarity_threshold,
            'last_face_distance'        => $credential->last_face_distance,
            'last_face_similarity'      => $credential->last_face_similarity,
            'blocked_until'             => $credential->blocked_until,
            'last_verified_at'          => $credential->last_verified_at,
        ];
    }

    /** @return array<string, mixed>|null */
    public function formatLocalMarcacion(?ConasisLocalesMarcacion $localMarcacion): ?array
    {
        if (! $localMarcacion) {
            return null;
        }

        return [
            'id'                   => $localMarcacion->id,
            'local_inst_educ_id'   => $localMarcacion->localInstEduc_id,
            'fecha_inicio'         => $localMarcacion->fechaInicio,
            'fecha_fin'            => $localMarcacion->fechaFin,
            'local'                => $localMarcacion->localInstEduc?->local ? [
                'id'         => $localMarcacion->localInstEduc->local->id,
                'nombre'     => $localMarcacion->localInstEduc->local->nombre,
                'utm_huso'   => $localMarcacion->localInstEduc->local->utm_huso,
                'utm_base'   => $localMarcacion->localInstEduc->local->utm_banda,
                'utm_x_este' => $localMarcacion->localInstEduc->local->utm_x_este,
                'utm_y_norte' => $localMarcacion->localInstEduc->local->utm_y_norte,
            ] : null,
        ];
    }

    /** @return array<string, mixed> */
    public function formatMarcacion(ConasisMarcaciones $mark): array
    {
        return [
            'id'                  => $mark->id,
            'fecha_marcacion'     => $mark->fechaMarcacion,
            'tipo'                => $mark->tipo,
            'medio_marcacion'     => $mark->medioMarcacion,
            'procesado'           => (bool) $mark->procesado,
            'alta_trabajador_id'  => $mark->altaTrabajador_id,
            'local_marcacion_id'  => $mark->localMarcacion_id,
        ];
    }

    // -------------------------------------------------------------------------
    // Helpers privados
    // -------------------------------------------------------------------------

    private function credencialFacialLista(MobileBiometricCredential $credential): bool
    {
        return $credential->face_status === MobileBiometricCredential::STATUS_APPROVED
            && filled($credential->face_embedding);
    }

    /**
     * Valida la biometría según el método indicado.
     *
     * @param  array<string, mixed>  $data
     * @return array{bool, int|null, float|null}
     */
    private function validarBiometria(MobileBiometricCredential $credential, array $data): array
    {
        $lastDistance  = null;
        $lastSimilarity = null;

        if ($data['biometric_method'] === 'face') {
            if (! $credential->face_embedding) {
                abort(422, 'No existe plantilla facial enrolada para este docente.');
            }
            if (! filled($data['face_image_base64'] ?? null)) {
                abort(422, 'Debe capturar un rostro para validar la marcacion.');
            }
            if (! filled($data['face_embedding'] ?? null)) {
                abort(422, 'Debe enviar la plantilla facial para comparar la marcacion.');
            }

            $probeTemplate  = $this->buildFaceTemplate($data['face_image_base64']);
            $lastDistance   = $credential->face_template
                ? $this->hammingDistance($credential->face_template, $probeTemplate)
                : null;
            $probeEmbedding = $this->normalizeEmbedding($data['face_embedding']);
            $lastSimilarity = $this->cosineSimilarity($credential->face_embedding, $probeEmbedding);
            $valid          = $lastSimilarity >= ($credential->face_similarity_threshold ?? 0.6);
        } else {
            $valid = (bool) ($data['biometric_passed'] ?? false);
        }

        return [$valid, $lastDistance, $lastSimilarity];
    }

    private function registrarIntentoFallido(
        MobileBiometricCredential $credential,
        int $userId,
        ?int $distance,
        ?float $similarity
    ): void {
        $attempts = $credential->failed_attempts + 1;

        $credential->forceFill([
            'failed_attempts'     => $attempts,
            'face_status'         => $attempts >= 3 ? MobileBiometricCredential::STATUS_BLOCKED : $credential->face_status,
            'blocked_until'       => $attempts >= 3 ? now()->addMinutes(15) : null,
            'last_face_distance'  => $distance,
            'last_face_similarity' => $similarity,
            'updated_by'          => $userId,
        ])->save();
    }

    /** @return array<string, mixed> */
    private function scheduleSnapshot(Trabajador $trabajador, ?AltasTrabajadores $alta): array
    {
        if (! $alta) {
            return ['has_active_schedule' => false, 'today_windows' => []];
        }

        $today      = today();
        $currentDay = (int) $today->dayOfWeekIso;

        $horarios = ConasisHorariosTrabajador::query()
            ->where('trabajador_id', $trabajador->id)
            ->where('altaTrabajador_id', $alta->id)
            ->where('activo', true)
            ->whereDate('fechaInicio', '<=', $today)
            ->where(fn ($query) => $query->whereNull('fechaFin')->orWhereDate('fechaFin', '>=', $today))
            ->pluck('id');

        $windows = ConasisDetalleHorarios::query()
            ->whereIn('horarioTrabajador_id', $horarios)
            ->where('aplicar', true)
            ->where('nroDia', $currentDay)
            ->get()
            ->map(fn (ConasisDetalleHorarios $detalle): array => [
                'entrada_inicio' => $detalle->entHoraInicio,
                'entrada_fin'    => $detalle->entHoraFin,
                'salida_inicio'  => $detalle->salHoraInicio,
                'salida_fin'     => $detalle->salHoraFin,
            ])
            ->values();

        return [
            'has_active_schedule' => $horarios->isNotEmpty(),
            'today_windows'       => $windows,
        ];
    }

    private function buildFaceTemplate(string $imageBase64): string
    {
        $binary   = $this->decodeImageBase64($imageBase64);
        $resource = @imagecreatefromstring($binary);

        if (! $resource) {
            abort(422, 'No se pudo procesar la imagen facial enviada.');
        }

        $width  = imagesx($resource);
        $height = imagesy($resource);
        $thumb  = imagecreatetruecolor(8, 8);
        imagecopyresampled($thumb, $resource, 0, 0, 0, 0, 8, 8, $width, $height);

        $grayValues = [];
        for ($y = 0; $y < 8; $y++) {
            for ($x = 0; $x < 8; $x++) {
                $rgb          = imagecolorat($thumb, $x, $y);
                $r            = ($rgb >> 16) & 0xFF;
                $g            = ($rgb >> 8) & 0xFF;
                $b            = $rgb & 0xFF;
                $grayValues[] = (int) round(($r + $g + $b) / 3);
            }
        }

        imagedestroy($thumb);
        imagedestroy($resource);

        $avg  = array_sum($grayValues) / count($grayValues);
        $bits = '';
        foreach ($grayValues as $gray) {
            $bits .= $gray >= $avg ? '1' : '0';
        }

        return $bits;
    }

    private function decodeImageBase64(string $payload): string
    {
        $normalized = trim($payload);
        if (str_starts_with($normalized, 'data:')) {
            $parts      = explode(',', $normalized, 2);
            $normalized = $parts[1] ?? '';
        }

        $binary = base64_decode($normalized, true);
        if ($binary === false || Str::length($binary) < 256) {
            abort(422, 'La imagen facial enviada no es valida.');
        }

        return $binary;
    }

    private function hammingDistance(string $templateA, string $templateB): int
    {
        $len      = min(strlen($templateA), strlen($templateB));
        $distance = 0;

        for ($i = 0; $i < $len; $i++) {
            if ($templateA[$i] !== $templateB[$i]) {
                $distance++;
            }
        }

        return $distance + abs(strlen($templateA) - strlen($templateB));
    }

    /** @param array<int, float> $embedding */
    private function normalizeEmbedding(array $embedding): array
    {
        $values = array_map(static fn (mixed $value): float => (float) $value, array_values($embedding));
        $norm   = sqrt(array_sum(array_map(static fn (float $value): float => $value * $value, $values)));

        if (count($values) < 64 || $norm <= 0) {
            abort(422, 'La plantilla facial enviada no es valida.');
        }

        return array_map(static fn (float $value): float => round($value / $norm, 8), $values);
    }

    /**
     * @param  array<int, float>  $storedEmbedding
     * @param  array<int, float>  $probeEmbedding
     */
    private function cosineSimilarity(array $storedEmbedding, array $probeEmbedding): float
    {
        if (count($storedEmbedding) !== count($probeEmbedding)) {
            abort(422, 'La plantilla facial no coincide con la dimension enrolada.');
        }

        $dot   = 0.0;
        $normA = 0.0;
        $normB = 0.0;

        foreach ($storedEmbedding as $index => $storedValue) {
            $a      = (float) $storedValue;
            $b      = (float) $probeEmbedding[$index];
            $dot   += $a * $b;
            $normA += $a * $a;
            $normB += $b * $b;
        }

        $denominator = sqrt($normA) * sqrt($normB);

        return $denominator > 0 ? round($dot / $denominator, 6) : 0.0;
    }

    private function codigoMarcacionMovil(Trabajador $trabajador): string
    {
        $workerSuffix = str_pad((string) ($trabajador->id % 1000), 3, '0', STR_PAD_LEFT);

        return 'MOB'.now()->format('YmdHis').$workerSuffix;
    }
}
