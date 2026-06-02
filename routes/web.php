<?php

use App\Http\Controllers\Configuracion\AreaController;
use App\Http\Controllers\Configuracion\CargoController;
use App\Http\Controllers\Configuracion\CondicionLaboralController;
use App\Http\Controllers\Configuracion\ZonaController;
use App\Http\Controllers\Entidad\EntidadController;
use App\Http\Controllers\Horario\CargaHorariaController;
use App\Http\Controllers\Horario\HorarioCursoController;
use App\Http\Controllers\Horario\HorarioMasivoController;
use App\Http\Controllers\Horario\HorarioTrabajadorController;
use App\Http\Controllers\Infraestructura\DispositivoMarcaController;
use App\Http\Controllers\Infraestructura\LocalController;
use App\Http\Controllers\Infraestructura\LocalInstEducController;
use App\Http\Controllers\Infraestructura\LocalMarcacionController;
use App\Http\Controllers\Infraestructura\RelojController;
use App\Http\Controllers\Infraestructura\RelojesMasivaController;
use App\Http\Controllers\InstitucionEducativa\AltaMasivaIEController;
use App\Http\Controllers\InstitucionEducativa\CursosMasivaIEController;
use App\Http\Controllers\InstitucionEducativa\GradosMasivaIEController;
use App\Http\Controllers\InstitucionEducativa\CursoIEController;
use App\Http\Controllers\InstitucionEducativa\GradoIEController;
use App\Http\Controllers\InstitucionEducativa\InstitucionEducativaController;
use App\Http\Controllers\InstitucionEducativa\SeccionIEController;
use App\Http\Controllers\Persona\DomicilioController;
use App\Http\Controllers\Persona\EmailController;
use App\Http\Controllers\Persona\PersonaController;
use App\Http\Controllers\Persona\TelefonoController;
use App\Http\Controllers\Trabajador\AltaTrabajadorController;
use App\Http\Controllers\Trabajador\RegistroTrabajadorController;
use App\Http\Controllers\Trabajador\TrabajadorController;
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
    Route::post('personas/{persona}/convertir-trabajador', [PersonaController::class, 'convertirTrabajador'])
        ->name('personas.convertir-trabajador');

    Route::resource('personas.telefonos', TelefonoController::class)
        ->only(['store', 'update', 'destroy'])
        ->shallow();

    Route::resource('personas.emails', EmailController::class)
        ->only(['store', 'update', 'destroy'])
        ->shallow();

    Route::resource('personas.domicilios', DomicilioController::class)
        ->only(['store', 'update', 'destroy'])
        ->shallow();

    Route::resource('trabajadores', TrabajadorController::class)
        ->except(['create'])
        ->parameters(['trabajadores' => 'trabajador']);

    // Registro unificado de trabajador (persona + usuario + alta + perfil)
    Route::get('registro-trabajador', [RegistroTrabajadorController::class, 'create'])
        ->name('registro-trabajador.create');
    Route::post('registro-trabajador', [RegistroTrabajadorController::class, 'store'])
        ->name('registro-trabajador.store');
    Route::post('trabajadores-masivos', [RegistroTrabajadorController::class, 'storeMasivo'])
        ->name('trabajadores.masivo.store');

    // Sub-recurso shallow: store/update/destroy por trabajador o por alta directamente
    Route::resource('trabajadores.altas', AltaTrabajadorController::class)
        ->only(['store', 'update', 'destroy'])
        ->shallow()
        ->parameters(['trabajadores' => 'trabajador', 'altas' => 'alta']);

    // Ruta global paginada de todas las altas del sistema
    Route::get('altas', [AltaTrabajadorController::class, 'index'])->name('altas.index');

    // Registrar baja de un alta activa
    Route::post('altas/{alta}/baja', [AltaTrabajadorController::class, 'darBaja'])
        ->name('altas.baja');

    Route::resource('instituciones', InstitucionEducativaController::class)
        ->except(['create', 'edit'])
        ->parameters(['instituciones' => 'institucione']);

    // Tab Docentes/Personal de una IE (altas paginadas)
    Route::get('instituciones/{institucione}/docentes', [InstitucionEducativaController::class, 'docentes'])
        ->name('instituciones.docentes');

    // Carga masiva de altas para una IE
    Route::post('instituciones/{institucione}/altas-masivas', [AltaMasivaIEController::class, 'store'])
        ->name('instituciones.altas-masivas.store');

    // Carga masiva de grados y secciones para una IE
    Route::post('instituciones/{institucione}/grados-masivos', [GradosMasivaIEController::class, 'store'])
        ->name('instituciones.grados-masivos.store');

    // Carga masiva de cursos para una IE
    Route::post('instituciones/{institucione}/cursos-masivos', [CursosMasivaIEController::class, 'store'])
        ->name('instituciones.cursos-masivos.store');

    Route::resource('instituciones.cursos', CursoIEController::class)
        ->only(['store', 'update', 'destroy'])
        ->shallow()
        ->parameters(['instituciones' => 'institucione']);

    Route::resource('instituciones.grados', GradoIEController::class)
        ->only(['store', 'update', 'destroy'])
        ->shallow()
        ->parameters(['instituciones' => 'institucione']);

    Route::resource('grados.secciones', SeccionIEController::class)
        ->only(['store', 'update', 'destroy'])
        ->shallow();

    // Infraestructura — Recursos independientes
    Route::resource('locales', LocalController::class)
        ->only(['index', 'store', 'update', 'destroy'])
        ->parameters(['locales' => 'local']);

    Route::resource('dispositivos-marca', DispositivoMarcaController::class)
        ->only(['index', 'store', 'destroy'])
        ->parameters(['dispositivos-marca' => 'dispositivosMarca']);

    // Infraestructura — Sub-recursos de IE
    Route::resource('instituciones.locales-ie', LocalInstEducController::class)
        ->only(['store', 'destroy'])
        ->shallow()
        ->parameters(['instituciones' => 'institucione', 'locales-ie' => 'localesIe']);

    Route::resource('locales-ie.relojes', RelojController::class)
        ->only(['store', 'update', 'destroy'])
        ->shallow()
        ->parameters(['locales-ie' => 'localesIe', 'relojes' => 'reloje']);

    // Carga masiva de relojes para un local de IE
    Route::post('locales-ie/{localesIe}/relojes-masivos', [RelojesMasivaController::class, 'store'])
        ->name('locales-ie.relojes-masivos.store');

    Route::resource('locales-ie.marcaciones-local', LocalMarcacionController::class)
        ->only(['store', 'destroy'])
        ->shallow()
        ->parameters(['locales-ie' => 'localesIe', 'marcaciones-local' => 'marcacionesLocal']);

    Route::resource('horarios-cursos', HorarioCursoController::class)
        ->only(['index', 'store', 'update', 'destroy'])
        ->parameters(['horarios-cursos' => 'horarioCurso']);

    // Carga masiva de horarios (crear + editar + asignar docente en lote)
    Route::post('horarios-masivos', [HorarioMasivoController::class, 'store'])
        ->name('horarios-masivos.store');

    Route::resource('horarios-cursos.cargas', CargaHorariaController::class)
        ->only(['store', 'update', 'destroy'])
        ->shallow()
        ->parameters(['horarios-cursos' => 'horarioCurso', 'cargas' => 'cargaHoraria']);

    Route::resource('horarios-trabajador', HorarioTrabajadorController::class)
        ->only(['index', 'show'])
        ->parameters(['horarios-trabajador' => 'horarioTrabajador']);

    // API: listar todos los horarios activos de un trabajador (para el tab Horarios en Show)
    Route::get('trabajadores/{trabajador}/horarios', [HorarioTrabajadorController::class, 'porTrabajador'])
        ->name('trabajadores.horarios');
});

require __DIR__.'/settings.php';
require __DIR__.'/api.php';
