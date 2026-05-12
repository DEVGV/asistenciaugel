<?php

namespace App\Models\Conasis;

use App\Models\Entidades;
use App\Models\InstitucionesEduc;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ConasisLocalesInstEduc extends Model
{
    protected $table = 'conasis.t_localesInstEduc';

    public $timestamps = false;

    protected $fillable = [
        'local_id',
        'entidad_id',
        'institucionEduc_id',
        'fechaInicio',
        'fechaFin',
        'created_by',
    ];

    public function entidad(): BelongsTo
    {
        return $this->belongsTo(Entidades::class, 'entidad_id');
    }

    public function institucionEduc(): BelongsTo
    {
        return $this->belongsTo(InstitucionesEduc::class, 'institucionEduc_id');
    }

    public function local(): BelongsTo
    {
        return $this->belongsTo(ConasisLocales::class, 'local_id');
    }
}
