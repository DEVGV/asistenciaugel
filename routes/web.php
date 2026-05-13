<?php

use App\Http\Controllers\Configuracion\AreaController;
use App\Http\Controllers\Configuracion\CargoController;
use App\Http\Controllers\Configuracion\CondicionLaboralController;
use App\Http\Controllers\Configuracion\ZonaController;
use App\Http\Controllers\Entidad\EntidadController;
use App\Http\Controllers\Persona\DomicilioController;
use App\Http\Controllers\Persona\EmailController;
use App\Http\Controllers\Persona\PersonaController;
use App\Http\Controllers\Persona\TelefonoController;
use Illuminate\Support\Facades\Route;

Route::inertia('/', 'Welcome')->name('home');

Route::middleware(['auth', 'verified'])->group(function () {
    Route::inertia('dashboard', 'Dashboard')->name('dashboard');

    Route::resource('entidades', EntidadController::class)
        ->only(['index', 'store', 'update', 'destroy'])
        ->parameters(['entidades' => 'entidade']);

    Route::resource('areas', AreaController::class)
        ->only(['index', 'store', 'update', 'destroy'])
        ->parameters(['areas' => 'area']);

    Route::resource('cargos', CargoController::class)
        ->only(['index', 'store', 'update', 'destroy'])
        ->parameters(['cargos' => 'cargo']);

    Route::resource('condiciones-laborales', CondicionLaboralController::class)
        ->only(['index', 'store', 'update', 'destroy'])
        ->parameters(['condiciones-laborales' => 'condicionLaboral']);

    Route::resource('zonas', ZonaController::class)
        ->only(['index', 'store', 'update', 'destroy'])
        ->parameters(['zonas' => 'zona']);

    Route::resource('personas', PersonaController::class)
        ->only(['index', 'show', 'store', 'update', 'destroy']);

    Route::resource('personas.telefonos', TelefonoController::class)
        ->only(['store', 'update', 'destroy'])
        ->shallow();

    Route::resource('personas.emails', EmailController::class)
        ->only(['store', 'update', 'destroy'])
        ->shallow();

    Route::resource('personas.domicilios', DomicilioController::class)
        ->only(['store', 'update', 'destroy'])
        ->shallow();
});

require __DIR__.'/settings.php';
require __DIR__.'/api.php';
