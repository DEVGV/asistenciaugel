<?php

namespace App\Http\Requests\Tramite;

use App\Enums\ResolvedBy;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Enum;

class UpdateMotivoSuspLabRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    /**
     * @return array<string, mixed>
     */
    public function rules(): array
    {
        return [
            'resolvedBy' => ['required', new Enum(ResolvedBy::class)],
        ];
    }
}
