<?php

namespace App\Models;

use App\Models\Param\ParamRolTrabajador;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Areas extends Model
{
    protected $table = 't_areas';

    public $timestamps = false;

    protected $fillable = [
        'codigo',
        'nombre',
        'sigla',
        'descripcion',
        'rolTrabajador_id',
        'activo',
    ];

    public function rolTrabajador(): BelongsTo
    {
        return $this->belongsTo(ParamRolTrabajador::class, 'rolTrabajador_id');
    }
}
