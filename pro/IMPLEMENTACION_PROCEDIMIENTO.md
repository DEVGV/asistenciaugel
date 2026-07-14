# Implementación del Procedimiento Almacenado: f_procesa_asismes_v1

## Qué es un procedimiento almacenado (función en PostgreSQL)

Un procedimiento almacenado es una función que vive dentro de la base de datos. En PostgreSQL se llaman **funciones** (no "stored procedures" como en SQL Server o MySQL). La ventaja es que toda la lógica de cálculo de asistencia se ejecuta directamente en el servidor de base de datos, lo que es mucho más rápido que hacer múltiples consultas desde Laravel.

## Paso a paso para implementar la función

### 1. Conectarse a la base de datos

Puedes usar cualquiera de estos métodos:

**Opción A — pgAdmin (interfaz gráfica):**
- Abrir pgAdmin
- Conectarse a tu servidor PostgreSQL
- Navegar a tu base de datos → Schemas → `conasis` → Functions
- Click derecho → "Query Tool" para abrir el editor SQL

**Opción B — Terminal con psql:**
```bash
psql -h localhost -U tu_usuario -d tu_base_de_datos
```

**Opción C — DBeaver u otro cliente SQL:**
- Conectarse a la base de datos
- Abrir un nuevo editor SQL

### 2. Verificar que el schema existe

Antes de crear la función, asegúrate de que el schema `conasis` existe:

```sql
-- Verificar schemas existentes
SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'conasis';
```

Si no existe (poco probable porque ya tienes tablas en él):
```sql
CREATE SCHEMA IF NOT EXISTS conasis;
```

### 3. Crear la función

Copia todo el contenido del archivo `pro/f_procesa_asismes_v1.txt` y ejecútalo en tu editor SQL. El archivo ya contiene la sentencia `CREATE OR REPLACE FUNCTION`, así que simplemente:

1. Abre el archivo `pro/f_procesa_asismes_v1.txt`
2. Copia TODO el contenido (desde `CREATE OR REPLACE FUNCTION` hasta `COST 100`)
3. Pégalo en tu editor SQL
4. Ejecuta (F5 en pgAdmin, Ctrl+Enter en DBeaver)

Deberías ver un mensaje como:
```
CREATE FUNCTION
Query returned successfully in X ms.
```

### 4. Verificar que la función se creó correctamente

```sql
-- Verificar que existe
SELECT routine_name, routine_type
FROM information_schema.routines
WHERE routine_schema = 'conasis'
  AND routine_name = 'f_procesa_asismes_v1';

-- Ver la definición
SELECT pg_get_functiondef(oid)
FROM pg_proc
WHERE proname = 'f_procesa_asismes_v1';
```

### 5. Probar la función manualmente (opcional)

Puedes probar con un trabajador específico:

```sql
-- Ejemplo: Procesar asistencia de mayo 2026 para el trabajador 1 en la IE 1
SELECT conasis.f_procesa_asismes_v1(
    1,              -- ID de la Institución Educativa
    1,              -- ID del trabajador
    2026::smallint, -- Año
    5::smallint,    -- Mes
    '2026-05-01',   -- Fecha desde
    '2026-05-31',   -- Fecha hasta
    1               -- ID del usuario que ejecuta
);
```

**Resultados posibles:**
- `'OK'` → El procesamiento fue exitoso
- `'NO_HOR'` → El trabajador no tiene horario asignado o no tiene contrato vigente

### 6. Si necesitas actualizar la función

Si en el futuro necesitas modificar la función, simplemente ejecuta de nuevo el script completo. La cláusula `CREATE OR REPLACE FUNCTION` hace que se sobrescriba la versión anterior sin necesidad de borrarla primero.

Para borrarla (si fuera necesario):
```sql
DROP FUNCTION IF EXISTS conasis.f_procesa_asismes_v1(int8, int8, int2, int2, date, date, int8);
```

## Qué hace la función internamente

En resumen, para cada trabajador la función:

1. **Busca los horarios vigentes** del trabajador en el rango de fechas
2. **Verifica marcaciones** (entradas y salidas) contra los horarios definidos
3. **Clasifica cada día** como:
   - **A** = Asistencia (llegó a tiempo)
   - **T** = Tardanza (llegó tarde)
   - **F** = Falta (no marcó)
   - **E** = Salida temprana
   - **DL** = Día libre (no le corresponde trabajar)
4. **Aplica suspensiones/justificaciones**: feriados, licencias, CITT, justificaciones, exoneraciones, onomástico
5. **Genera el consolidado**: cuenta días por cada tipo (A, T, F, etc.) y acumula tardanzas (3T) y salidas tempranas (3E)
6. **Guarda resultados** en las tablas:
   - `conasis.t_asistencia` — cabecera
   - `conasis.t_asistenciaMesTrabajador` — grilla diaria (e1..e31, s1..s31, c1..c31)
   - `conasis.t_consolAsistMesTrab` — resumen por sigla
   - `conasis.t_estadosAsistencia` — historial de estados

## Tablas involucradas (lectura)

| Tabla | Qué lee |
|---|---|
| `conasis.t_horariosTrabajador` | Horarios asignados al trabajador |
| `conasis.t_detalleHorarios` | Detalle de cada turno (horas entrada/salida) |
| `conasis.t_localesMarcacion` | Local donde marca el trabajador |
| `conasis.t_marcaciones` | Marcaciones biométricas |
| `conasis.t_suspLabTrabajador` | Suspensiones laborales |
| `conasis.t_incapsTempTrab` | Incapacidades temporales (CITT) |
| `conasis.t_justificaciones` | Justificaciones |
| `conasis.t_exoneracionesMarcacion` | Exoneraciones de marcación |
| `conasis.t_diasNoLaborables` | Feriados/días no laborables |
| `conasis.t_feriadoLabTrabajador` | Trabajadores que laboran en feriados |
| `param.t00_motivosSuspLab` | Catálogo de motivos de suspensión |
| `param.t00_estadosAsis` | Catálogo de estados de asistencia |

## Cómo lo llama Laravel

Desde el backend, la función se invoca así:

```php
$resultado = DB::selectOne(
    'SELECT conasis.f_procesa_asismes_v1(?, ?, ?::smallint, ?::smallint, ?::date, ?::date, ?) AS resultado',
    [$ieId, $trabajadorId, $anio, $mes, $fechaDesde, $fechaHasta, $userId]
);

// $resultado->resultado será 'OK' o 'NO_HOR'
```

El sistema procesa automáticamente TODOS los trabajadores activos de la IE cuando presionas el botón "Procesar Asistencia" en la pestaña "Consolidado Asistencia" de la vista de Institución Educativa.
