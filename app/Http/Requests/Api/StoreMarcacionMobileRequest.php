<?php

namespace App\Http\Requests\Api;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreMarcacionMobileRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    /** @return array<string, array<mixed>|string> */
    public function rules(): array
    {
        return [
            'alta_trabajador_id'  => ['nullable', 'integer'],
            'biometric_method'    => ['required', Rule::in(['face', 'local_device'])],
            'biometric_passed'    => ['nullable', 'boolean'],
            'face_image_base64'   => ['nullable', 'string'],
            'face_embedding'      => ['nullable', 'array', 'min:64', 'max:512'],
            'face_embedding.*'    => ['required_with:face_embedding', 'numeric'],
            'utm_huso'            => ['nullable', 'numeric'],
            'utm_base'            => ['nullable', 'string', 'max:10'],
            'utm_x_este'          => ['nullable', 'numeric'],
            'utm_y_norte'         => ['nullable', 'numeric'],
        ];
    }

    /** @return array<string, mixed> */
    public function toDTO(): array
    {
        return $this->validated();
    }
}
