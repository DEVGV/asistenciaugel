<?php

namespace App\Models;

use App\Models\Param\ParamRolTrabajador;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Areas extends Model
{
    use HasFactory;

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

    protected $casts = [
        'activo' => 'boolean',
    ];

    public function rolTrabajador(): BelongsTo
    {
        return $this->belongsTo(ParamRolTrabajador::class, 'rolTrabajador_id');
    }
}
