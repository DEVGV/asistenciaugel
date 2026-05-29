<?php

use App\Http\Controllers\Api\ParamController;
use App\Http\Controllers\Api\SunatController;
use App\Http\Controllers\Configuracion\ZonaController;
use App\Http\Controllers\Entidad\EntidadController;
use App\Http\Controllers\InstitucionEducativa\InstitucionEducativaController;
use App\Http\Controllers\Persona\PersonaController;
use App\Http\Controllers\Trabajador\TrabajadorController;
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
    Route::get('params/ubigeo/{ubigeo}', [ParamController::class, 'reverseUbigeo'])->name('api.params.ubigeo');
    Route::get('params/{type}', [ParamController::class, 'index'])->name('api.params.index');

    // Consultas SUNAT via apiperu.dev
    Route::post('sunat/ruc', [SunatController::class, 'ruc'])->name('api.sunat.ruc');
    Route::post('sunat/dni', [SunatController::class, 'dni'])->name('api.sunat.dni');

    // Búsqueda de Personas
    Route::get('personas/search', [PersonaController::class, 'search'])->name('api.personas.search');

    // Búsqueda de Trabajadores
    Route::get('trabajadores/search', [TrabajadorController::class, 'search'])->name('api.trabajadores.search');

    // Búsqueda de Zonas
    Route::get('zonas/search', [ZonaController::class, 'search'])->name('api.zonas.search');

    // Búsqueda de Entidades
    Route::get('entidades/search', [EntidadController::class, 'search'])->name('api.entidades.search');

    // Búsqueda de Instituciones Educativas (typeahead en formularios)
    Route::get('instituciones/search', [InstitucionEducativaController::class, 'search'])->name('api.instituciones.search');
    Route::get('instituciones/{institucione}/detalles', [InstitucionEducativaController::class, 'detallesJson'])->name('api.instituciones.detalles');
});
