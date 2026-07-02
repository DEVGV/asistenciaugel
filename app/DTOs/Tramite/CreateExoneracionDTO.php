<?php

namespace App\DTOs\Tramite;

final readonly class CreateExoneracionDTO
{
    public function __construct(
        public string $fechaInicio,
        public string $fechaFin,
        public ?string $observacion,
    ) {}

    /** @param array<string, mixed> $data */
    public static function from(array $data): self
    {
        return new self(
            fechaInicio: $data['fechaInicio'],
            fechaFin:    $data['fechaFin'],
            observacion: $data['observacion'] ?? null,
        );
    }
}
