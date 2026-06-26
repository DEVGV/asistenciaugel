<?php

namespace App\Services\Tramite;

use App\DTOs\Tramite\CreateExpedienteDTO;
use App\DTOs\Tramite\UpdateExpedienteDTO;
use App\Enums\EstadoTramite;
use App\Models\AltasTrabajadores;
use App\Models\Conasis\ConasisDocumentosTram;
use App\Models\Conasis\ConasisExpediente;
use App\Models\InstitucionesEduc;
use App\Models\Param\ParamEstadosTram;
use App\Models\Trabajador;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Symfony\Component\HttpFoundation\StreamedResponse;

class ExpedienteService
{
    /** @var array<int, string> */
    private const RELACIONES = [
        'estado',
        'trabajador.persona:id,paterno,materno,nombre,docIdentidad',
        'documentos.documento',
    ];

    /**
     * Lista paginada de expedientes con filtros opcionales.
     *
     * @return LengthAwarePaginator<ConasisExpediente>
     */
    public function listarPaginado(Request $request): LengthAwarePaginator
    {
        return ConasisExpediente::query()
            ->with(self::RELACIONES)
            ->when($request->string('tipo')->toString(), fn ($q, string $tipo) => $q->where('tipoExpediente', $tipo))
            ->when($request->string('search')->toString(), fn ($q, string $search) => $q->whereHas(
                'trabajador.persona',
                fn ($qq) => $qq
                    ->where('paterno', 'ilike', "%{$search}%")
                    ->orWhere('materno', 'ilike', "%{$search}%")
                    ->orWhere('nombre', 'ilike', "%{$search}%")
                    ->orWhere('docIdentidad', 'ilike', "%{$search}%"),
            ))
            ->when($request->string('anio')->toString(), fn ($q, string $anio) => $q->where('anio', (int) $anio))
            ->orderByDesc('fecha')
            ->orderByDesc('id')
            ->paginate(15)
            ->withQueryString();
    }

    /**
     * Lista expedientes de un trabajador (para tab JSON).
     *
     * @return Collection<int, ConasisExpediente>
     */
    public function listarPorTrabajador(Trabajador $trabajador): Collection
    {
        return ConasisExpediente::query()
            ->with(self::RELACIONES)
            ->where('trabajador_id', $trabajador->id)
            ->orderByDesc('fecha')
            ->orderByDesc('id')
            ->get();
    }

    /**
     * Lista paginada de expedientes de una IE (para tab JSON).
     *
     * @return LengthAwarePaginator<ConasisExpediente>
     */
    public function listarPorInstitucion(InstitucionesEduc $institucion, Request $request): LengthAwarePaginator
    {
        return ConasisExpediente::query()
            ->with(self::RELACIONES)
            ->whereHas(
                'trabajador.altas',
                fn (Builder $q) => $q
                    ->where('institucionEducativa_id', $institucion->id)
                    ->whereNull('fechaBaja'),
            )
            ->when($request->string('search')->toString(), fn ($q, string $search) => $q->whereHas(
                'trabajador.persona',
                fn ($qq) => $qq
                    ->where('paterno', 'ilike', "%{$search}%")
                    ->orWhere('materno', 'ilike', "%{$search}%")
                    ->orWhere('nombre', 'ilike', "%{$search}%")
                    ->orWhere('docIdentidad', 'ilike', "%{$search}%"),
            ))
            ->when($request->string('tipo')->toString(), fn ($q, string $tipo) => $q->where('tipoExpediente', $tipo))
            ->orderByDesc('fecha')
            ->orderByDesc('id')
            ->paginate(10)
            ->withQueryString();
    }

    /**
     * Personal activo (altas vigentes) de una IE para el select del formulario.
     * Devuelve una entrada por alta (no por trabajador) incluyendo alta_id.
     *
     * @return \Illuminate\Support\Collection<int, array<string, mixed>>
     */
    public function personalActivoPorInstitucion(InstitucionesEduc $institucion): \Illuminate\Support\Collection
    {
        return AltasTrabajadores::query()
            ->with([
                'trabajador.persona:id,paterno,materno,nombre,docIdentidad',
                'cargo:id,nombre',
            ])
            ->where('institucionEducativa_id', $institucion->id)
            ->whereNull('fechaBaja')
            ->get()
            ->map(function (AltasTrabajadores $alta) {
                $persona = $alta->trabajador?->persona;
                $apellidos = collect([$persona?->paterno, $persona?->materno])
                    ->filter()
                    ->implode(' ');
                $nombre = trim(collect([$apellidos, $persona?->nombre])->filter()->implode(', '));

                return [
                    'alta_id'       => $alta->id,
                    'trabajador_id' => $alta->trabajador_id,
                    'label'         => $nombre ?: "Trabajador #{$alta->trabajador_id}",
                    'docIdentidad'  => $persona?->docIdentidad,
                    'cargo'         => $alta->cargo?->nombre,
                ];
            })
            ->sortBy('label')
            ->values();
    }

    /**
     * Altas vigentes de un trabajador para el select de IE en el formulario.
     *
     * @return \Illuminate\Support\Collection<int, array<string, mixed>>
     */
    public function altasActivasPorTrabajador(Trabajador $trabajador): \Illuminate\Support\Collection
    {
        return AltasTrabajadores::query()
            ->with([
                'institucionEducativa:id,nombreLegal,codigoInstitucion',
                'cargo:id,nombre',
            ])
            ->where('trabajador_id', $trabajador->id)
            ->whereNull('fechaBaja')
            ->get()
            ->map(fn (AltasTrabajadores $alta) => [
                'alta_id'  => $alta->id,
                'label'    => $alta->institucionEducativa?->nombreLegal ?? "IE #{$alta->institucionEducativa_id}",
                'sublabel' => $alta->cargo?->nombre,
            ])
            ->values();
    }

    /**
     * Retorna un expediente con sus relaciones cargadas.
     */
    public function obtener(ConasisExpediente $expediente): ConasisExpediente
    {
        return $expediente->load(self::RELACIONES);
    }

    /**
     * Crea un expediente con sus documentos asociados.
     * El array $archivos es indexado igual que $dto->documentos;
     * cada entrada puede ser un UploadedFile o null.
     *
     * @param  array<int, UploadedFile|null>  $archivos
     */
    public function crear(CreateExpedienteDTO $dto, array $archivos = []): ConasisExpediente
    {
        return DB::transaction(function () use ($dto, $archivos) {
            $expediente = ConasisExpediente::create([
                'tipoExpediente'    => $dto->tipoExpediente,
                'anio'              => now()->year,
                'trabajador_id'     => $dto->trabajador_id,
                'altaTrabajador_id' => $dto->altaTrabajador_id,
                'asunto'            => $dto->asunto,
                'fecha'             => $dto->fecha,
                'observacion'       => $dto->observacion,
                'estado_id'         => $this->estadoId(EstadoTramite::Registrado),
                'created_by'        => auth()->id(),
            ]);

            foreach ($dto->documentos as $index => $docDTO) {
                $rutaDoc = null;

                $archivo = $archivos[$index] ?? null;

                if ($archivo instanceof UploadedFile) {
                    $rutaDoc = $archivo->storeAs(
                        'expedientes/' . now()->year,
                        $expediente->codigo
                            . '_doc' . ($index + 1)
                            . '_' . Str::random(6)
                            . '.' . $archivo->getClientOriginalExtension(),
                    );
                }

                ConasisDocumentosTram::create($docDTO->toArray() + [
                    'expediente_id'    => $expediente->id,
                    'trabajadorDoc_id' => $dto->trabajador_id,
                    'rutaDoc'          => $rutaDoc,
                    'created_by'       => auth()->id(),
                ]);
            }

            return $expediente->load(self::RELACIONES);
        });
    }

    /**
     * Actualiza los campos principales del expediente.
     * Solo se permite modificar mientras esté en estado Registrado.
     */
    public function actualizar(ConasisExpediente $expediente, UpdateExpedienteDTO $dto): ConasisExpediente
    {
        abort_unless(
            (int) $expediente->estado_id === $this->estadoId(EstadoTramite::Registrado),
            422,
            'Solo se pueden editar expedientes en estado Registrado.',
        );

        $expediente->update($dto->toArray());

        return $expediente->fresh(self::RELACIONES);
    }

    /**
     * Anula un expediente (cambia estado a Anulado).
     */
    public function anular(ConasisExpediente $expediente): void
    {
        abort_unless(
            (int) $expediente->estado_id === $this->estadoId(EstadoTramite::Registrado),
            422,
            'Solo se pueden anular expedientes en estado Registrado.',
        );

        $expediente->update(['estado_id' => $this->estadoId(EstadoTramite::Anulado)]);
    }

    /**
     * Descarga un documento de trámite desde el storage.
     */
    public function descargarDocumento(ConasisDocumentosTram $documento): StreamedResponse
    {
        abort_unless(
            $documento->rutaDoc && Storage::exists($documento->rutaDoc),
            404,
            'El documento no se encuentra disponible.',
        );

        return Storage::download($documento->rutaDoc, basename($documento->rutaDoc));
    }

    /**
     * Resuelve (con caché) el id del estado de trámite por su código.
     */
    private function estadoId(EstadoTramite $estado): int
    {
        $key = "param.estados-tramite.{$estado->value}";

        $cached = Cache::get($key);

        if ($cached !== null) {
            return (int) $cached;
        }

        $id = ParamEstadosTram::query()->where('codigo', $estado->value)->value('id');

        abort_unless($id !== null, 500, "Estado '{$estado->value}' no configurado. Ejecute ParamTramiteSeeder.");

        Cache::forever($key, (int) $id);

        return (int) $id;
    }
}
