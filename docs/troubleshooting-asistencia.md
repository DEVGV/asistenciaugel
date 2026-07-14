# Troubleshooting — Procesamiento de Asistencia

Bitácora de casos reales, causas raíz y soluciones aplicadas al SP
`conasis.f_procesa_asismes_v1` (procesamiento del consolidado mensual).

Cada caso sigue este formato:

- **Síntoma** — qué ve el usuario.
- **Causa raíz** — qué está mal en datos o lógica.
- **Verificación** — SQL / comando para confirmar.
- **Solución** — pasos concretos.

Al final está la sección **"Limitaciones conocidas del SP"** con las cosas
que la UI trata de compensar sin tocar el procedimiento almacenado.

---

## Caso #1 — "Todos los días marcados como FALTA aunque hay marcaciones cargadas"

### Síntoma
El consolidado de un trabajador muestra `FALTA: N` para casi todos los días
laborales del mes, aunque el Excel de marcaciones sí se cargó y aparece en
`conasis.t_marcaciones`.

### Causa raíz #1a — `localMarcacion_id` incorrecto
`CargaMarcacionesService` guardaba el mismo `localMarcacion_id` (el "primer"
`t_localesMarcacion` del `localInstEduc` del reloj) a las marcas de TODOS los
trabajadores. El SP exige `ma.localMarcacion_id = lm.id AND lm.trabajador_id = trabajador`,
así que las marcas se descartan por completo.

### Verificación
```bash
docker exec -it asistencia_app php artisan diagnostico:marcaciones {IE_ID} \
    --dni={DNI} --fecha-desde=YYYY-MM-01 --fecha-hasta=YYYY-MM-31
```
Si aparece `✗ CAUSA PROBABLE: las marcaciones apuntan a lm.id=X que NO está en
t_localesMarcacion del trabajador`, este es el caso.

### Solución
1. `CargaMarcacionesService` corregido: ahora resuelve `localMarcacion_id`
   por trabajador y auto-crea la fila en `t_localesMarcacion` si no existe.
2. Para la data ya cargada, ejecutar el UPDATE de reparación:
   ```sql
   BEGIN;
   UPDATE conasis.t_marcaciones ma
   SET "localMarcacion_id" = lm_ok.id
   FROM conasis."t_localesMarcacion" lm_mal,
        conasis."t_localesMarcacion" lm_ok
   WHERE lm_mal.id = ma."localMarcacion_id"
     AND lm_ok.trabajador_id = ma.trabajador_id
     AND lm_ok."localInstEduc_id" = lm_mal."localInstEduc_id"
     AND lm_mal.trabajador_id <> ma.trabajador_id;
   COMMIT;
   ```

---

## Caso #2 — "Configuré la tolerancia pero los días siguen en FALTA/E"

### Síntoma
Se abrió el modal "Configurar tolerancias" en `/horarios-trabajador/{id}`,
se puso p.ej. `entTolerancia=10`, se guardó, y al reprocesar la mayoría de
los días siguen como FALTA (F) o EVASIÓN (E).

### Causa raíz — Malentendido sobre "tolerancia" vs "rango"
El SP tiene DOS conceptos distintos:

| Campo | Se usa en | Efecto |
|-------|-----------|--------|
| `entHoraInicio` | **Filtro WHERE** | Marcas antes de esta hora → ignoradas |
| `salHoraFin`    | **Filtro WHERE** | Marcas después de esta hora → ignoradas |
| `entTolerancia` | **Clasificación** | Distinguir 'A' (puntual) vs 'T' (tardanza) |
| `salTolerancia` | **NO se usa**   | Guardado pero ignorado por el SP |

Poner `entTolerancia=10` **no** amplía la ventana de marcas aceptadas.
Si `entHoraInicio = entHoraFin = 11:45`, cualquier marca antes de 11:45
sigue siendo descartada.

Adicionalmente, si `salHoraInicio = salHoraFin = 13:30`, la clasificación
de salida `time > salHoraInicio AND time <= salHoraFin` es matemáticamente
imposible → ningún día puede quedar como 'A'.

### Verificación
```sql
SELECT dh."nroDia", dh."entHoraInicio", dh."entHoraFin",
       dh."salHoraInicio", dh."salHoraFin"
FROM conasis."t_detalleHorarios" dh
JOIN conasis."t_horariosTrabajador" ht ON ht.id = dh."horarioTrabajador_id"
WHERE ht.trabajador_id = {ID};
```
Si `entHoraInicio = entHoraFin` o `salHoraInicio = salHoraFin` → rango colapsado.

### Solución
Ampliar manualmente los rangos "Desde/Hasta" en el modal, o dejar que el
backend lo haga automáticamente:

- **Auto-ampliación (implementada en `DetalleHorarioService::actualizarTolerancias`):**
  si al guardar los rangos vienen colapsados y hay tolerancia > 0, se resta
  la tolerancia a `entHoraInicio` y se suma a `salHoraFin`. Para el caso de
  salida, si `salTolerancia=0` pero `entTolerancia>0`, se usa `entTolerancia`
  como fallback (asumiendo simetría razonable).

- **Configuración recomendada docente** (rango 11:45–13:30, ±15 min):
  | Campo | Valor |
  |-------|-------|
  | Entrada Desde | 11:30 |
  | Entrada Hasta | 11:45 |
  | Tol. entrada  | 10 |
  | Salida Desde  | 13:30 |
  | Salida Hasta  | 13:45 |
  | Tol. salida   | 0 |

### Datos observados en producción — caso MOISES (junio 2026)
- 37 marcaciones, todas `localMarcacion_id=9` (correcto).
- Horario configurado: 11:45–13:30 (rango colapsado).
- Solo 23 marcas pasaban el filtro WHERE.
- Aún esas 23 marcas nunca daban salida 'A' → todos los días F o E.
- **Post-fix (auto-ampliación):** 34 marcas pasan, la mayoría de días 'A'.

---

## Caso #3 — "1 trabajador(es) sin horario asignado"

### Síntoma
El procesamiento devuelve `NO_HOR` para un trabajador ("Trabajadores sin
horario (no procesados): FERNÁNDEZ VÁSQUEZ, KLEIVER").

### Causa raíz
El SP consulta `conasis.t_horariosTrabajador` JOIN `conasis.t_detalleHorarios`
con `fechaInicio <= fechaHasta` y `(fechaFin IS NULL OR fechaFin >= fechaDesde)`.
Si no hay filas que cumplan (o el horario no tiene detalle), el SP retorna
`NO_HOR` inmediatamente.

### Verificación
```bash
docker exec -it asistencia_app php artisan diagnostico:horarios {IE_ID} \
    --trabajadores={ID} --fecha-desde=YYYY-MM-01 --fecha-hasta=YYYY-MM-31
```

### Solución
- Asignar carga horaria al trabajador (los detalles se generan
  automáticamente por `HorarioTrabajadorService::regenerarDesdeCargas`).
- Verificar que la IE del horario coincida con la IE que se está procesando.

---

## Caso #5 — "Marca justo en el borde del rango no cuenta"

### Síntoma
Un día muestra `SinMarca (F)` para entrada o salida a pesar de que el
trabajador SÍ marcó, y la hora aparente coincide exactamente con
`entHoraInicio` o `salHoraFin`.

### Ejemplo real — MOISES día 20 mayo 2026
- Horario configurado: `salHoraFin = 13:40:00`.
- Marca de salida: `13:40:XX` (los segundos > 00).
- Filtro del SP: `time(fechaMarcacion) <= salHoraFin` → `13:40:15 <= 13:40:00` es FALSE.
- Resultado: la marca se descarta, el día queda como F.

### Causa raíz
Postgres compara `time` con **precisión de segundos**. Si `salHoraFin`
está guardado como `HH:MM:00` y la marca ocurre a `HH:MM:15`, la comparación
`<=` falla. Lo mismo aplica del lado inferior con `entHoraInicio`.

### Verificación
```sql
SELECT "fechaMarcacion",
       to_char("fechaMarcacion",'HH24:MI:SS.MS') AS hora_completa
FROM conasis.t_marcaciones
WHERE trabajador_id = {ID}
  AND date("fechaMarcacion") = 'YYYY-MM-DD'
ORDER BY "fechaMarcacion";
```
Compara los segundos con `salHoraFin` / `entHoraInicio` en `t_detalleHorarios`.

### Solución
- **Rápida:** en el modal de tolerancias, sumar al menos 1 minuto a
  `salHoraFin` (p.ej. 13:41 en vez de 13:40) para cubrir los 60 segundos
  del minuto final. Equivalentemente, restar 1 minuto a `entHoraInicio`.
- **Sistémica (pendiente):** en `DetalleHorarioService::actualizarTolerancias`,
  al hacer auto-ampliación, redondear `salHoraFin` hacia arriba al siguiente
  minuto y `entHoraInicio` hacia abajo (agregar 59 segundos al primero,
  restar 59 al segundo). Pendiente implementar si el caso reincide.

---

## Caso #6 — "T + E → F: día trabajado parcialmente cuenta como falta"

### Síntoma
Un docente llegó tarde Y se salió temprano el mismo día. En el consolidado
aparece como Falta (F), no como Tardanza+Evasión.

### Ejemplo real — MOISES día 15 mayo 2026
- Marca entrada 12:19 → c_entrada='T' (llegó tarde)
- Marca salida 13:26 → c_salida='E' (salió temprano)
- Clasificación final: F (porque el SP sólo mapea A+A→A, T+A→T, A+E→E, resto→F).

### Causa raíz
El SP en su bloque de clasificación (líneas 119-127 del archivo original)
no considera la combinación T+E. Cualquier día que no encaje en las tres
combinaciones "buenas" cae automáticamente a F.

### Verificación
Buscar días con entrada 'T' y salida 'E' en el detalle:
```sql
SELECT amt.*
FROM conasis."t_asistenciaMesTrabajador" amt
JOIN conasis.t_asistencia a ON a.id = amt.asistencia_id
WHERE a.trabajador_id = {ID} AND a.anio = YYYY AND a.mes = MM;
-- Revisar columnas eN y sN buscando marcas (T) y (E) el mismo día
```

### Solución
Este es comportamiento **intencional** del SP según la regla actual de
negocio (llegar tarde y salir temprano = jornada no cumplida = falta).
Si el negocio cambia de opinión, sería una modificación del SP (que hoy
está fuera de alcance).

Documentar en las capacitaciones para que los usuarios sepan que aparte
de las 3 evasiones acumuladas (3E), un día T+E también cuesta una falta
completa.

---

## Caso #4 — "El consolidado se procesa en la IE equivocada"

### Síntoma
El artisan `diagnostico:marcaciones 1 --dni=…` devuelve "0 horarios vigentes"
pero el trabajador SÍ tiene horario en otra IE.

### Causa raíz
El trabajador tiene alta en múltiples IE y el usuario está procesando el
consolidado de la IE incorrecta.

### Verificación
```sql
SELECT ats.trabajador_id, ats."institucionEducativa_id",
       ht.id AS horario_id, ht."institucionEduc_id" AS ie_horario
FROM public."t_altasTrabajadores" ats
LEFT JOIN conasis."t_horariosTrabajador" ht
       ON ht.trabajador_id = ats.trabajador_id
      AND ht."institucionEduc_id" = ats."institucionEducativa_id"
WHERE ats.trabajador_id = {ID};
```

### Solución
Procesar el consolidado desde la IE donde el trabajador tiene horario.

---

## Herramientas de diagnóstico disponibles

| Herramienta | Ubicación | Uso |
|-------------|-----------|-----|
| `diagnostico:marcaciones` | `app/Console/Commands/DiagnosticoMarcaciones.php` | Verifica qué marcas pasan el filtro del SP |
| `diagnostico:horarios` | `app/Console/Commands/DiagnosticoHorarios.php` | Verifica por qué el SP devuelve NO_HOR |
| `database/sql/diagnostico_marcaciones.sql` | SQL parametrizado | 7 bloques con `ok_local`, `ok_tipo`, `ok_aplicar`, `ok_no_nocturno`, `ok_dia`, `ok_hora` |
| `database/sql/diagnostico_paso2.sql` | SQL | Inspección de lm/horario/alta cuando no hay 0 marcas |
| `database/sql/fix_marcaciones_localMarcacion.sql` | SQL | Reparación masiva del bug histórico de `localMarcacion_id` |

---

## Limitaciones conocidas del SP `f_procesa_asismes_v1`

El SP **no se modifica** (decisión de producto). La UI/servicios compensan
estas limitaciones:

1. **`salTolerancia` es ignorado por el SP.** El filtro WHERE usa
   `interval '0 MINUTE'` en vez de `dh."salTolerancia"`. Se guarda pero
   solo sirve como referencia; para que las marcas de salida tardías
   pasen, hay que ampliar `salHoraFin`.

2. **`entTolerancia` solo se usa en clasificación, no en filtro.** Marcas
   antes de `entHoraInicio` se ignoran incluso si están dentro de la
   tolerancia. Se compensa ampliando `entHoraInicio`.

3. **Turnos nocturnos/partidos no se procesan.** El WHERE exige
   `dh.entDiaInicio = dh.salDiaFin`. Turnos que cruzan medianoche son
   descartados.

4. **Regla "3T = falta" y "3E = falta" es acumulativa dentro del mes.**
   Cada tercera tardanza o evasión se convierte en falta. Es intencional.

5. **`dh.aplicar` debe ser `TRUE`.** Filas con `aplicar=NULL` o `FALSE`
   nunca matchean marcas.

6. **`ma.tipo` debe ser `'A'`.** Otros tipos se ignoran.

7. **Precisión de segundos en el borde del rango.** El filtro
   `time <= salHoraFin` falla si la marca tiene segundos > 00 y `salHoraFin`
   está en `HH:MM:00`. Solución: extender el rango 1 minuto adicional. Ver
   Caso #5.

8. **Combinación T+E cuenta como Falta.** El SP sólo reconoce como día
   trabajado válido las combinaciones A+A, T+A y A+E. Cualquier otro par
   (incluido T+E, "llegó tarde y salió temprano") queda como F. Ver Caso #6.

## Resultado esperado tras aplicar todos los fixes

Ejemplo real MOISES — mayo 2026 (32 marcas, 21 días laborales, 10 DL,
tras aplicar fixes de casos #1, #2, #5):

| Categoría | Cant. | Detalle |
|-----------|-------|---------|
| A (Asistencia Presencial) | 7 | Días 4, 6, 11, 12, 19, 20, 27 |
| T (Ingreso Tarde) | 2 | Días 13, 28 |
| E (Evasión Laboral) | 2 | Días 5, 8 |
| 3E (Tercera Evasión = Falta) | 1 | Día 21 (tras 3 evasiones) |
| F (Falta) legítima | 3 | Días 7, 25, 26 (no marcó nada) |
| F por marca incompleta | 2 | Días 14, 18 (solo entró, no salió) |
| F por T+E | 3 | Días 15, 22, 29 (tarde + salida temprana) |
| J (Feriado) | 1 | Día 1 (Día del Trabajo) |
| DL | 10 | Fines de semana |
| **Total** | **31** | |

Diff con la versión pre-fix del caso #5 (segundos de borde):

- Día 20: F → A (marca 13:40:13 ahora dentro del rango 13:40:59)
- A pasó de 6 → 7
- F pasó de 9 → 8

---

## Flujo recomendado para reproducir un caso

1. **Cargar Excel de marcaciones** (versión corregida de `CargaMarcacionesService`).
2. **Ejecutar diagnóstico:**
   ```bash
   docker exec -it asistencia_app php artisan diagnostico:marcaciones \
       {IE_ID} --dni={DNI} --fecha-desde=YYYY-MM-01 --fecha-hasta=YYYY-MM-31
   ```
3. **Si "0 marcaciones pasan":** revisar los puntos 2 y 3 del output.
4. **Configurar tolerancias/rangos** en la UI en `/horarios-trabajador/{id}`.
5. **Reprocesar solo ese trabajador** desde el botón "Reprocesar" en el
   Consolidado (o el SP directo).
6. **Verificar resultado:**
   ```sql
   SELECT sigla, ndias
   FROM conasis."t_consolAsistMesTrab" camt
   JOIN conasis.t_asistencia a ON a.id = camt.asistencia_id
   WHERE a.trabajador_id = {ID} AND a."institucionEduc_id" = {IE}
     AND a.anio = YYYY AND a.mes = MM AND ndias > 0
   ORDER BY sigla;
   ```
