<?php

use App\Models\AltasTrabajadores;
use App\Models\Personas;
use App\Models\Trabajador;
use App\Models\User;
use Illuminate\Foundation\Testing\DatabaseTransactions;

use function Pest\Laravel\actingAs;
use function Pest\Laravel\delete;
use function Pest\Laravel\get;
use function Pest\Laravel\post;
use function Pest\Laravel\put;

uses(DatabaseTransactions::class);

/**
 * IDs de parámetros existentes en la base de datos de desarrollo.
 * Se usan en tests para evitar crear registros en tablas param (solo-lectura).
 */
const ALTA_IE_ID = 18;
const ALTA_COND_ID = 4;
const ALTA_TIPO_CONTRATO_ID = 3;
const ALTA_ROL_ID = 1;
const ALTA_SITUACION_ID = 1;
const ALTA_MOTIVO_BAJA_ID = 1;
const ALTA_AREA_ID = 4;
const ALTA_CARGO_ID = 4;

beforeEach(function () {
    $this->user = User::factory()->create();
    actingAs($this->user);

    // Crear persona y trabajador de apoyo
    $this->persona = Personas::create([
        'tipoDocIdentidad_id' => 1,
        'docIdentidad' => fake()->unique()->numerify('########'),
        'paterno' => 'ALTA',
        'materno' => 'TEST',
        'nombre' => 'WORKER',
        'sexo_id' => 1,
        'pais_id' => 1,
        'created_by' => 1,
        'activo' => true,
    ]);

    $this->trabajador = Trabajador::create([
        'persona_id' => $this->persona->id,
        'created_by' => $this->user->id,
        'activo' => true,
    ]);
});

/** Helper para crear una alta con todos los campos NOT NULL. */
function makeAlta(Trabajador $trabajador, User $user, string $fechaInicio = '2025-01-01'): AltasTrabajadores
{
    return AltasTrabajadores::create([
        'trabajador_id' => $trabajador->id,
        'institucionEducativa_id' => ALTA_IE_ID,
        'condicionLaboral_id' => ALTA_COND_ID,
        'tipoContrato_id' => ALTA_TIPO_CONTRATO_ID,
        'rolTrabajador_id' => ALTA_ROL_ID,
        'situacionLaboral_id' => ALTA_SITUACION_ID,
        'area_id' => ALTA_AREA_ID,
        'cargo_id' => ALTA_CARGO_ID,
        'fechaInicio' => $fechaInicio,
        'fechaAlta' => $fechaInicio,
        'created_by' => $user->id,
    ]);
}

it('can list all altas globally', function () {
    get(route('altas.index'))
        ->assertOk()
        ->assertInertia(fn ($page) => $page->component('trabajador/altas/Index'));
});

it('can store a new alta for a trabajador', function () {
    post(route('trabajadores.altas.store', $this->trabajador), [
        'trabajador_id' => $this->trabajador->id,
        'institucionEducativa_id' => ALTA_IE_ID,
        'condicionLaboral_id' => ALTA_COND_ID,
        'tipoContrato_id' => ALTA_TIPO_CONTRATO_ID,
        'rolTrabajador_id' => ALTA_ROL_ID,
        'situacionLaboral_id' => ALTA_SITUACION_ID,
        'area_id' => ALTA_AREA_ID,
        'cargo_id' => ALTA_CARGO_ID,
        'fechaInicio' => '2025-01-01',
    ])->assertRedirect();

    expect(
        AltasTrabajadores::where('trabajador_id', $this->trabajador->id)->exists()
    )->toBeTrue();
});

it('validates required fields on alta store', function () {
    post(route('trabajadores.altas.store', $this->trabajador), [])
        ->assertSessionHasErrors([
            'trabajador_id',
            'institucionEducativa_id',
            'condicionLaboral_id',
            'tipoContrato_id',
            'rolTrabajador_id',
            'situacionLaboral_id',
            'area_id',
            'cargo_id',
            'fechaInicio',
        ]);
});

it('validates fecha_fin must be after or equal fecha_inicio', function () {
    post(route('trabajadores.altas.store', $this->trabajador), [
        'trabajador_id' => $this->trabajador->id,
        'institucionEducativa_id' => ALTA_IE_ID,
        'condicionLaboral_id' => ALTA_COND_ID,
        'tipoContrato_id' => ALTA_TIPO_CONTRATO_ID,
        'rolTrabajador_id' => ALTA_ROL_ID,
        'situacionLaboral_id' => ALTA_SITUACION_ID,
        'fechaInicio' => '2025-06-01',
        'fechaFin' => '2025-01-01', // before fechaInicio
    ])->assertSessionHasErrors(['fechaFin']);
});

it('can update an existing alta', function () {
    $alta = makeAlta($this->trabajador, $this->user);

    put(route('altas.update', $alta), [
        'trabajador_id' => $this->trabajador->id,
        'institucionEducativa_id' => ALTA_IE_ID,
        'condicionLaboral_id' => ALTA_COND_ID,
        'tipoContrato_id' => ALTA_TIPO_CONTRATO_ID,
        'rolTrabajador_id' => ALTA_ROL_ID,
        'situacionLaboral_id' => ALTA_SITUACION_ID,
        'area_id' => ALTA_AREA_ID,
        'cargo_id' => ALTA_CARGO_ID,
        'fechaInicio' => '2025-03-01',
        'observacion' => 'Actualizado correctamente',
    ])->assertRedirect();

    expect($alta->fresh()->fechaInicio)->toBe('2025-03-01');
    expect($alta->fresh()->observacion)->toBe('Actualizado correctamente');
});

it('can dar baja to an active alta', function () {
    $alta = makeAlta($this->trabajador, $this->user);

    post(route('altas.baja', $alta), [
        'fechaBaja' => '2025-12-31',
        'motivoBaja_id' => ALTA_MOTIVO_BAJA_ID,
    ])->assertRedirect();

    expect($alta->fresh()->fechaBaja)->toBe('2025-12-31');
    expect($alta->fresh()->motivoBaja_id)->toBe(ALTA_MOTIVO_BAJA_ID);
});

it('validates fechaBaja must be after fechaInicio', function () {
    $alta = makeAlta($this->trabajador, $this->user, '2025-06-01');

    post(route('altas.baja', $alta), [
        'fechaBaja' => '2025-01-01', // before fechaInicio
        'motivoBaja_id' => ALTA_MOTIVO_BAJA_ID,
    ])->assertSessionHasErrors(['fechaBaja']);
});

it('can destroy an alta', function () {
    $alta = makeAlta($this->trabajador, $this->user);
    $altaId = $alta->id;

    delete(route('altas.destroy', $alta))->assertRedirect();

    expect(AltasTrabajadores::find($altaId))->toBeNull();
});
