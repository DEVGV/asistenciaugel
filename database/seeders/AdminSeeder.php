<?php

namespace Database\Seeders;

use App\Models\Personas;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // 1. Obtener IDs de parámetros necesarios
        $sexoM = DB::table('param.t00_sexos')->where('codigo', 'M')->orWhere('nombre', 'ILIKE', '%masculino%')->value('id') ?? 1;
        $dniId = DB::table('param.t3_tipoDocIdentidad')->where('abreviatura', 'ILIKE', '%DNI%')->value('id') ?? 1;
        $paisPE = DB::table('param.t26_pais')->where('codigo', 'PE')->orWhere('nombre', 'ILIKE', '%perú%')->value('id') ?? 1;

        // 2. Crear o actualizar la persona
        $persona = Personas::updateOrCreate(
            ['docIdentidad' => '76955033'],
            [
                'pais_id' => $paisPE,
                'tipoDocIdentidad_id' => $dniId,
                'paterno' => 'ROJAS',
                'materno' => 'SOLIS',
                'nombre' => 'JOHAN ALEXANDER',
                'sexo_id' => $sexoM,
                'activo' => true,
                'created_by' => 1,
                'created_at' => now(),
            ]
        );

        // 3. Crear o actualizar el email asociado
        DB::table('t_emails')->updateOrInsert(
            ['persona_id' => $persona->id],
            [
                'email' => 'johan.rojas@gmail.com',
                'personalInst' => 'P',
                'fechaInicio' => '2026-01-01',
                'created_by' => 1,
                'created_at' => now(),
            ]
        );

        // 4. Crear o actualizar el trabajador asociado
        DB::table('t_trabajador')->updateOrInsert(
            ['persona_id' => $persona->id],
            [
                'codigo' => 'TRAB-76955033',
                'activo' => true,
                'created_at' => now(),
            ]
        );
        $trabajadorId = DB::table('t_trabajador')->where('persona_id', $persona->id)->value('id');

        // 5. Crear o actualizar el usuario
        User::updateOrCreate(
            ['login' => '76955033'],
            [
                'trabajador_id' => $trabajadorId,
                'password' => '76955033', // Se encripta automáticamente por el cast del modelo User
                'activo' => true,
            ]
        );
    }
}
