<?php

use App\Models\Personas;
use App\Models\User;

test('guests cannot access personas', function () {
    $this->get(route('personas.index'))
        ->assertRedirect(route('login'));
});

test('authenticated users can visit the personas index', function () {
    $user = User::factory()->create();
    $this->actingAs($user);

    $response = $this->get(route('personas.index'));
    $response->assertSuccessful();
});

test('authenticated users can create a persona', function () {
    $user = User::factory()->create();
    $this->actingAs($user);

    $doc = fake()->numerify('########');
    $data = [
        'tipoDocIdentidad_id' => 1,
        'docIdentidad' => $doc,
        'paterno' => 'GARCIA',
        'materno' => 'LOPEZ',
        'nombre' => 'JUAN',
        'sexo_id' => 1,
        'pais_id' => 1,
        'activo' => true,
    ];

    $response = $this->post(route('personas.store'), $data);

    $response->assertRedirect(route('personas.index'));
    $this->assertDatabaseHas('t_personas', [
        'docIdentidad' => $doc,
        'paterno' => 'GARCIA',
    ]);
});

test('authenticated users can update a persona', function () {
    $user = User::factory()->create();
    $this->actingAs($user);

    $doc = fake()->numerify('########');
    $persona = Personas::create([
        'tipoDocIdentidad_id' => 1,
        'docIdentidad' => $doc,
        'paterno' => 'OLD',
        'materno' => 'OLD',
        'nombre' => 'OLD',
        'sexo_id' => 1,
        'pais_id' => 1,
        'created_by' => $user->id,
        'activo' => true,
    ]);

    $data = [
        'tipoDocIdentidad_id' => 1,
        'docIdentidad' => $doc,
        'paterno' => 'NEW',
        'materno' => 'NEW',
        'nombre' => 'NEW',
        'sexo_id' => 1,
        'pais_id' => 1,
        'activo' => true,
    ];

    $response = $this->put(route('personas.update', $persona), $data);

    $response->assertRedirect(route('personas.index'));
    $this->assertDatabaseHas('t_personas', [
        'id' => $persona->id,
        'paterno' => 'NEW',
    ]);
});

test('authenticated users can soft delete a persona', function () {
    $user = User::factory()->create();
    $this->actingAs($user);

    $persona = Personas::create([
        'tipoDocIdentidad_id' => 1,
        'docIdentidad' => fake()->numerify('########'),
        'paterno' => 'DELETE',
        'materno' => 'TEST',
        'nombre' => 'ME',
        'sexo_id' => 1,
        'pais_id' => 1,
        'created_by' => $user->id,
        'activo' => true,
    ]);

    $response = $this->delete(route('personas.destroy', $persona));

    $response->assertRedirect(route('personas.index'));
    $this->assertDatabaseHas('t_personas', [
        'id' => $persona->id,
        'activo' => false,
    ]);
});

test('authenticated users can view persona detail', function () {
    $user = User::factory()->create();
    $this->actingAs($user);

    $persona = Personas::create([
        'tipoDocIdentidad_id' => 1,
        'docIdentidad' => fake()->numerify('########'),
        'paterno' => 'SHOW',
        'materno' => 'TEST',
        'nombre' => 'DETAIL',
        'sexo_id' => 1,
        'pais_id' => 1,
        'created_by' => $user->id,
        'activo' => true,
    ]);

    $response = $this->get(route('personas.show', $persona));
    $response->assertSuccessful();
});
