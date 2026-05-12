<?php

use App\Http\Controllers\Api\ParamController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Rutas de la API JSON del sistema. Requieren autenticación.
|
*/

Route::middleware(['auth'])->prefix('api')->group(function () {
    // Parámetros (tablas de solo lectura del schema param)
    Route::get('params', [ParamController::class, 'types'])->name('api.params.types');
    Route::get('params/{type}', [ParamController::class, 'index'])->name('api.params.index');
});
