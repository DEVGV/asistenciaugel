<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class GradosIE extends Model
{
    protected $table = 't_gradosIE';

    public $timestamps = false;

    protected $fillable = [
        'institucionEduc_id',
        'codigo',
        'nombre',
        'sigla',
        'created_by',
        'activo',
    ];

    public function institucionEduc(): BelongsTo
    {
        return $this->belongsTo(InstitucionesEduc::class, 'institucionEduc_id');
    }
}
