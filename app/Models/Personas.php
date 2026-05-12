<?php

namespace App\Models;

use App\Models\Param\ParamSexos;
use App\Models\Param\ParamTipoDocIdentidad;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Personas extends Model
{
    protected $table = 't_personas';

    public $timestamps = false;

    protected $fillable = [
        'pais_id',
        'tipoDocIdentidad_id',
        'docIdentidad',
        'paterno',
        'materno',
        'nombre',
        'sexo_id',
        'fechaNac',
        'ubigeo',
        'foto',
        'created_by',
        'activo',
    ];

    public function sexo(): BelongsTo
    {
        return $this->belongsTo(ParamSexos::class, 'sexo_id');
    }

    public function tipoDocIdentidad(): BelongsTo
    {
        return $this->belongsTo(ParamTipoDocIdentidad::class, 'tipoDocIdentidad_id');
    }
}
