<?php

namespace App\Models\Auth;

use App\Models\InstitucionesEduc;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UsuarioPerfilIe extends Model
{
    protected $table = 'auth.usuario_perfil_ie';

    public $timestamps = false;

    protected $fillable = [
        'user_id',
        'perfil_id',
        'institucionEducativa_id',
        'activo',
        'created_by',
    ];

    protected $casts = [
        'activo' => 'boolean',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function perfil(): BelongsTo
    {
        return $this->belongsTo(Perfil::class, 'perfil_id');
    }

    public function institucionEducativa(): BelongsTo
    {
        return $this->belongsTo(InstitucionesEduc::class, 'institucionEducativa_id');
    }
}
