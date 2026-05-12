<?php

use App\Http\Controllers\Configuracion\AreaController;
use App\Http\Controllers\Configuracion\CargoController;
use App\Http\Controllers\Configuracion\CondicionLaboralController;
use App\Http\Controllers\Entidad\EntidadController;
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
});

require __DIR__.'/settings.php';
require __DIR__.'/api.php';
