<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Trabajador extends Model
{
    protected $table = 't_trabajador';

    public $timestamps = false;

    protected $fillable = [
        'codigo',
        'persona_id',
        'created_by',
        'activo',
    ];

    public function persona(): BelongsTo
    {
        return $this->belongsTo(Personas::class, 'persona_id');
    }
}
