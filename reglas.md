# Reglas de Arquitectura — Sistema Asistencia UGEL

> Estas reglas son **OBLIGATORIAS** para toda IA y desarrollador que trabaje en este proyecto.
> Se aplican a cada archivo creado o modificado sin excepción.

---

## 1. Principio Fundamental

> **El Controller es un puente, no una fábrica.**

Toda la lógica de negocio vive en **Services**. El controller solo:
1. Recibe el request (ya validado por FormRequest)
2. Llama al Service correspondiente
3. Devuelve la response (Inertia::render, redirect, o JSON)

---

## 2. Estructura de Carpetas Backend

```
app/
├── DTOs/                          # Data Transfer Objects
│   ├── Persona/
│   │   ├── CreatePersonaDTO.php
│   │   └── UpdatePersonaDTO.php
│   ├── Trabajador/
│   └── Asistencia/
│
├── Enums/                         # Enums de dominio
│   ├── TipoMarcacion.php          # E=Entrada, S=Salida
│   ├── MedioMarcacion.php         # B=Biometrico, M=Manual, D=Dispositivo
│   └── EstadoTramite.php
│
├── Http/
│   ├── Controllers/
│   │   ├── Controller.php         # Base (ya existe)
│   │   ├── Api/                   # Controllers de API JSON
│   │   │   └── ParamController.php
│   │   ├── Persona/
│   │   │   ├── PersonaController.php
│   │   │   ├── TelefonoController.php
│   │   │   ├── EmailController.php
│   │   │   └── DomicilioController.php
│   │   ├── Trabajador/
│   │   │   ├── TrabajadorController.php
│   │   │   └── AltaTrabajadorController.php
│   │   ├── InstitucionEducativa/
│   │   │   ├── InstitucionEducativaController.php
│   │   │   ├── CursoIEController.php
│   │   │   ├── GradoIEController.php
│   │   │   └── SeccionIEController.php
│   │   ├── Entidad/
│   │   │   └── EntidadController.php
│   │   ├── Configuracion/         # Áreas, Cargos, Cond. Laborales
│   │   │   ├── AreaController.php
│   │   │   ├── CargoController.php
│   │   │   └── CondicionLaboralController.php
│   │   ├── Infraestructura/       # Locales, Relojes, Dispositivos
│   │   │   ├── LocalController.php
│   │   │   ├── LocalInstEducController.php
│   │   │   ├── RelojController.php
│   │   │   └── DispositivoMarcaController.php
│   │   ├── Horario/
│   │   │   ├── HorarioTrabajadorController.php
│   │   │   ├── HorarioCursoController.php
│   │   │   └── CargaHorariaController.php
│   │   ├── Asistencia/
│   │   │   ├── MarcacionController.php
│   │   │   ├── AsistenciaController.php
│   │   │   └── ConsolidacionController.php
│   │   └── Tramite/
│   │       ├── ExpedienteController.php
│   │       ├── JustificacionController.php
│   │       └── SuspensionLaboralController.php
│   │
│   ├── Requests/                  # FormRequests agrupados por dominio
│   │   ├── Persona/
│   │   │   ├── StorePersonaRequest.php
│   │   │   └── UpdatePersonaRequest.php
│   │   ├── Trabajador/
│   │   │   ├── StoreTrabajadorRequest.php
│   │   │   └── StoreAltaTrabajadorRequest.php
│   │   ├── InstitucionEducativa/
│   │   ├── Entidad/
│   │   ├── Configuracion/
│   │   ├── Horario/
│   │   ├── Asistencia/
│   │   └── Tramite/
│   │
│   └── Middleware/
│
├── Models/                        # Ya generados, organizados por schema
│   ├── User.php
│   ├── Personas.php
│   ├── Trabajador.php
│   ├── ... (public schema)
│   ├── Param/                     # Solo lectura
│   │   ├── ParamSexos.php
│   │   └── ...
│   └── Conasis/                   # Asistencia
│       ├── ConasisMarcaciones.php
│       └── ...
│
├── Services/                      # TODA la lógica de negocio
│   ├── Persona/
│   │   └── PersonaService.php
│   ├── Trabajador/
│   │   ├── TrabajadorService.php
│   │   └── AltaTrabajadorService.php
│   ├── InstitucionEducativa/
│   │   └── InstitucionEducativaService.php
│   ├── Entidad/
│   │   └── EntidadService.php
│   ├── Configuracion/
│   │   ├── AreaService.php
│   │   ├── CargoService.php
│   │   └── CondicionLaboralService.php
│   ├── Horario/
│   │   └── HorarioService.php
│   ├── Asistencia/
│   │   ├── MarcacionService.php
│   │   ├── AsistenciaCalculoService.php
│   │   └── ConsolidacionService.php
│   └── Tramite/
│       ├── ExpedienteService.php
│       └── JustificacionService.php
│
└── Providers/
```

---

## 3. Reglas del Backend

### 3.1 Controllers — El Puente

```php
// ✅ CORRECTO — Controller delgado
class PersonaController extends Controller
{
    public function __construct(
        private PersonaService $personaService,
    ) {}

    public function index(): Response
    {
        return Inertia::render('Persona/Index', [
            'personas' => $this->personaService->listarPaginado(request()),
        ]);
    }

    public function store(StorePersonaRequest $request): RedirectResponse
    {
        $this->personaService->crear($request->toDTO());

        return redirect()->route('personas.index')
            ->with('success', 'Persona registrada.');
    }
}

// ❌ PROHIBIDO — Controller gordo
class PersonaController extends Controller
{
    public function store(Request $request): RedirectResponse
    {
        // NO validar aquí
        $request->validate([...]);

        // NO poner lógica de negocio aquí
        $persona = Personas::create([...]);
        $persona->telefonos()->create([...]);
        // etc...
    }
}
```

**Reglas concretas:**
- Máximo **5–8 líneas** por método de controller
- **NUNCA** usar `$request->validate()` en el controller
- **NUNCA** interactuar con modelos directamente en el controller
- **SIEMPRE** inyectar el Service por constructor
- **SIEMPRE** tipar el retorno: `Response`, `RedirectResponse`, `JsonResponse`
- Usar `Inertia::render()` para vistas, `redirect()->route()` para redirects

### 3.2 FormRequests — Las Validaciones

```php
// app/Http/Requests/Persona/StorePersonaRequest.php
class StorePersonaRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true; // o lógica de autorización
    }

    /** @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string> */
    public function rules(): array
    {
        return [
            'tipoDocIdentidad_id' => ['required', 'integer', 'exists:param.t3_tipoDocIdentidad,id'],
            'docIdentidad' => ['required', 'string', 'max:20', 'unique:t_personas,docIdentidad'],
            'paterno' => ['required', 'string', 'max:100'],
            'materno' => ['required', 'string', 'max:100'],
            'nombre' => ['nullable', 'string', 'max:150'],
            'sexo_id' => ['required', 'integer', 'exists:param.t00_sexos,id'],
            'fechaNac' => ['nullable', 'date'],
        ];
    }

    /** Convierte los datos validados a un DTO. */
    public function toDTO(): CreatePersonaDTO
    {
        return CreatePersonaDTO::from($this->validated());
    }
}
```

**Reglas:**
- **TODA** validación va en FormRequest, sin excepción
- Incluir `authorize()` aunque retorne `true`
- Usar `exists:` para validar FKs contra tablas param
- Incluir método `toDTO()` para convertir datos validados a DTO
- Mensajes personalizados en español con `messages()`
- Nombres de atributos legibles con `attributes()`

### 3.3 Services — La Lógica

```php
// app/Services/Persona/PersonaService.php
class PersonaService
{
    /** @return \Illuminate\Pagination\LengthAwarePaginator<Personas> */
    public function listarPaginado(Request $request): LengthAwarePaginator
    {
        return Personas::query()
            ->with(['tipoDocIdentidad', 'sexo'])
            ->when($request->search, fn ($q, $search) =>
                $q->where('docIdentidad', 'ilike', "%{$search}%")
                  ->orWhere('paterno', 'ilike', "%{$search}%")
                  ->orWhere('nombre', 'ilike', "%{$search}%")
            )
            ->where('activo', true)
            ->orderBy('paterno')
            ->paginate(15);
    }

    public function crear(CreatePersonaDTO $dto): Personas
    {
        return DB::transaction(function () use ($dto) {
            $persona = Personas::create($dto->toArray());

            // Lógica adicional de negocio...

            return $persona;
        });
    }
}
```

**Reglas:**
- Un service por entidad principal
- Los services **pueden** llamar a otros services
- Usar `DB::transaction()` cuando hay múltiples writes
- **SIEMPRE** eager load relaciones con `with()` para evitar N+1
- Retornar modelos, paginators, o collections — nunca arrays crudos
- PHPDoc con return types detallados

### 3.4 DTOs — Transferencia de Datos

```php
// app/DTOs/Persona/CreatePersonaDTO.php
final readonly class CreatePersonaDTO
{
    public function __construct(
        public int $tipoDocIdentidad_id,
        public string $docIdentidad,
        public string $paterno,
        public string $materno,
        public ?string $nombre,
        public int $sexo_id,
        public ?string $fechaNac,
        public int $pais_id,
    ) {}

    /** @param array<string, mixed> $data */
    public static function from(array $data): self
    {
        return new self(...$data);
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return get_object_vars($this);
    }
}
```

**Reglas:**
- Usar `readonly class` con constructor promotion
- Método estático `from()` para construir desde array
- Método `toArray()` para pasar a `Model::create()`
- Prefijos: `Create`, `Update`, `Filter`

### 3.5 Enums

```php
// app/Enums/TipoMarcacion.php
enum TipoMarcacion: string
{
    case Entrada = 'E';
    case Salida = 'S';
}
```

Usar enums para todo valor fijo que no esté en tablas param.

### 3.6 Rutas

```php
// routes/web.php
Route::middleware('auth')->group(function () {
    // Configuración
    Route::resource('areas', AreaController::class);
    Route::resource('cargos', CargoController::class);

    // Personas y Trabajadores
    Route::resource('personas', PersonaController::class);
    Route::resource('personas.telefonos', TelefonoController::class)->shallow();
    Route::resource('personas.emails', EmailController::class)->shallow();

    Route::resource('trabajadores', TrabajadorController::class);
    Route::resource('trabajadores.altas', AltaTrabajadorController::class)->shallow();

    // Instituciones Educativas
    Route::resource('instituciones', InstitucionEducativaController::class);
    Route::resource('instituciones.cursos', CursoIEController::class)->shallow();

    // Asistencia
    Route::resource('marcaciones', MarcacionController::class);
    Route::resource('asistencia', AsistenciaController::class)->only(['index', 'show']);
});

// API para selects (param)
Route::prefix('api')->middleware('auth')->group(function () {
    Route::get('params/{type}', [ParamController::class, 'index']);
});
```

**Reglas:**
- Usar `Route::resource()` siempre que aplique
- Recursos anidados con `->shallow()` para sub-CRUDs
- Separar rutas API en `routes/api.php` o prefijo `/api`
- Nombres de ruta en español-kebab cuando sea descriptivo

---

## 4. Estructura de Carpetas Frontend

```
resources/js/
├── actions/                       # Auto-generado por Wayfinder
├── routes/                        # Auto-generado por Wayfinder
├── wayfinder/                     # Auto-generado por Wayfinder
│
├── app.ts                         # Entry point
│
├── types/                         # Tipos TypeScript
│   ├── index.d.ts                 # Tipos globales (User, PageProps, etc.)
│   └── models/                    # Tipos de modelos de la DB
│       ├── persona.ts
│       ├── trabajador.ts
│       ├── institucion-educativa.ts
│       ├── marcacion.ts
│       ├── asistencia.ts
│       └── params.ts              # Tipos de todas las tablas param
│
├── composables/                   # Lógica reutilizable (hooks)
│   ├── useParams.ts               # Fetch de tablas param para selects
│   ├── useDataTable.ts            # Lógica de tabla: búsqueda, paginación, orden
│   ├── useFormModal.ts            # Lógica de modal de formulario
│   ├── useFilters.ts              # Lógica de filtros avanzados
│   └── useUbigeo.ts               # Selects encadenados País > Depto > Prov > Dist
│
├── components/
│   ├── ui/                        # Componentes shadcn-vue (ya existe)
│   │   ├── button/
│   │   ├── dialog/
│   │   ├── input/
│   │   ├── select/
│   │   └── ...
│   │
│   ├── shared/                    # Componentes reutilizables de negocio
│   │   ├── DataTable.vue          # Tabla genérica con paginación y búsqueda
│   │   ├── FormModal.vue          # Modal genérico de formulario
│   │   ├── ConfirmDialog.vue      # Diálogo de confirmación de eliminación
│   │   ├── SearchInput.vue        # Input de búsqueda con debounce
│   │   ├── ParamSelect.vue        # Select genérico que carga desde API param
│   │   ├── UbigeoSelect.vue       # Selects encadenados de ubigeo
│   │   ├── DatePicker.vue         # Datepicker
│   │   ├── StatusBadge.vue        # Badge de estado (activo/inactivo)
│   │   └── EmptyState.vue         # Estado vacío con ilustración
│   │
│   ├── persona/                   # Componentes específicos del dominio
│   │   ├── PersonaForm.vue
│   │   ├── TelefonosList.vue
│   │   ├── EmailsList.vue
│   │   └── DomiciliosList.vue
│   │
│   ├── trabajador/
│   │   ├── TrabajadorForm.vue
│   │   └── AltasList.vue
│   │
│   ├── asistencia/
│   │   ├── MarcacionForm.vue
│   │   ├── AsistenciaGrid.vue     # Grilla mensual de asistencia
│   │   └── ResumenCard.vue
│   │
│   └── ... (otros dominios)
│
├── layouts/
│   ├── AppLayout.vue              # Layout principal (ya existe)
│   ├── AuthLayout.vue             # Layout de auth (ya existe)
│   └── app/
│       └── AppSidebarLayout.vue   # Sidebar con nav (ya existe)
│
└── pages/                         # Páginas Inertia (1 por ruta)
    ├── Dashboard.vue
    ├── auth/                      # Ya existe
    ├── settings/                  # Ya existe
    │
    ├── persona/
    │   ├── Index.vue              # Listado con búsqueda y paginación
    │   ├── Create.vue             # Formulario de creación
    │   ├── Show.vue               # Detalle con tabs (teléfonos, emails, etc.)
    │   └── Edit.vue               # Formulario de edición
    │
    ├── trabajador/
    │   ├── Index.vue
    │   ├── Create.vue
    │   ├── Show.vue               # Vista maestra con tabs de altas y horarios
    │   └── Edit.vue
    │
    ├── institucion-educativa/
    │   ├── Index.vue
    │   ├── Create.vue
    │   ├── Show.vue               # Tabs: cursos, grados, secciones
    │   └── Edit.vue
    │
    ├── entidad/
    │   ├── Index.vue
    │   └── Form.vue               # Create/Edit compartido
    │
    ├── configuracion/
    │   ├── areas/
    │   │   └── Index.vue          # CRUD inline (tabla + modal)
    │   ├── cargos/
    │   │   └── Index.vue
    │   └── condiciones-laborales/
    │       └── Index.vue
    │
    ├── infraestructura/
    │   ├── locales/
    │   ├── relojes/
    │   └── dispositivos/
    │
    ├── asistencia/
    │   ├── marcaciones/
    │   │   ├── Index.vue          # Listado con filtros
    │   │   └── Import.vue         # Importación masiva
    │   ├── mensual/
    │   │   └── Index.vue          # Grilla mensual por IE
    │   └── consolidacion/
    │       └── Index.vue
    │
    └── tramite/
        ├── expedientes/
        ├── justificaciones/
        └── suspensiones/
```

---

## 5. Reglas del Frontend

### 5.1 Pages — Solo Layout

```vue
<!-- ✅ CORRECTO — Page delgada -->
<script setup lang="ts">
import { Head } from '@inertiajs/vue3';
import DataTable from '@/components/shared/DataTable.vue';
import PersonaForm from '@/components/persona/PersonaForm.vue';
import type { Persona, PaginatedResponse } from '@/types/models/persona';
import { personas } from '@/routes';

defineOptions({
    layout: {
        breadcrumbs: [
            { title: 'Personas', href: personas.index() },
        ],
    },
});

const props = defineProps<{
    personas: PaginatedResponse<Persona>;
    filters: { search?: string };
}>();
</script>

<template>
    <Head title="Personas" />
    <DataTable
        :data="props.personas"
        :filters="props.filters"
        :columns="columns"
        create-route="personas.create"
    />
</template>
```

```vue
<!-- ❌ PROHIBIDO — Page con lógica inline -->
<script setup lang="ts">
// NO: lógica de fetch, filtros, transformación de datos en la page
const filteredData = computed(() => { ... });
async function handleDelete(id) { ... }
</script>
```

### 5.2 Composables — La Lógica

```ts
// composables/useParams.ts
import { ref, onMounted } from 'vue';
import { useHttp } from '@inertiajs/vue3';

export function useParams(type: string) {
    const data = ref<Array<{ id: number; nombre: string }>>([]);
    const loading = ref(true);
    const http = useHttp();

    onMounted(async () => {
        const response = await http.get(`/api/params/${type}`);
        data.value = response.data;
        loading.value = false;
    });

    return { data, loading };
}
```

**Reglas:**
- Prefijo `use` siempre
- Retornar refs y funciones, no ejecutar side-effects no controlados
- Un composable por responsabilidad

### 5.3 Componentes Compartidos

- `DataTable.vue`: recibe `data` (paginador), `columns`, `filters`. Integra búsqueda, paginación, y acciones.
- `FormModal.vue`: recibe `show`, `title`, `form`. Emite `submit` y `close`.
- `ParamSelect.vue`: recibe `type` (nombre del param). Carga opciones automáticamente.
- `ConfirmDialog.vue`: recibe `show`, `message`. Emite `confirm` y `cancel`.

### 5.4 Tipos TypeScript

```ts
// types/models/persona.ts
export interface Persona {
    id: number;
    pais_id: number;
    tipoDocIdentidad_id: number;
    docIdentidad: string;
    paterno: string;
    materno: string;
    nombre: string | null;
    sexo_id: number;
    fechaNac: string | null;
    ubigeo: string | null;
    foto: string | null;
    activo: boolean;
    created_at: string | null;
    // Relaciones cargadas
    tipoDocIdentidad?: ParamSimple;
    sexo?: ParamSimple;
}

export interface PaginatedResponse<T> {
    data: T[];
    current_page: number;
    last_page: number;
    per_page: number;
    total: number;
    links: { url: string | null; label: string; active: boolean }[];
}
```

**Reglas:**
- Crear un tipo por cada modelo
- Relaciones opcionales con `?`
- `PaginatedResponse<T>` genérico reutilizable
- Los archivos de tipos van en `types/models/`

### 5.5 Convenciones de Componentes Vue

- `<script setup lang="ts">` obligatorio
- `defineOptions({ layout: { breadcrumbs: [...] } })` para breadcrumbs
- Props tipadas con `defineProps<{ ... }>()`
- Emits tipados con `defineEmits<{ ... }>()`
- Un solo root element por componente
- Importar rutas de `@/routes` (Wayfinder), nunca hardcodear URLs

---

## 6. Reglas Transversales

### 6.1 Nombrado

| Elemento | Convención | Ejemplo |
|---|---|---|
| Controllers | PascalCase + Controller | `PersonaController` |
| Services | PascalCase + Service | `PersonaService` |
| FormRequests | Store/Update + PascalCase + Request | `StorePersonaRequest` |
| DTOs | Create/Update + PascalCase + DTO | `CreatePersonaDTO` |
| Enums | PascalCase, keys en PascalCase | `TipoMarcacion::Entrada` |
| Models | PascalCase (como se generaron) | `Personas`, `Trabajador` |
| Pages Vue | PascalCase.vue | `Index.vue`, `Create.vue` |
| Componentes Vue | PascalCase.vue | `DataTable.vue`, `PersonaForm.vue` |
| Composables | camelCase con prefijo `use` | `useParams.ts` |
| Tipos TS | PascalCase (interfaces) | `Persona`, `Trabajador` |
| Carpetas pages | kebab-case | `institucion-educativa/` |
| Carpetas backend | PascalCase (PSR-4) | `InstitucionEducativa/` |

### 6.2 Soft Delete con Campo `activo`

Este proyecto NO usa `SoftDeletes` de Laravel. Usa campo `activo` (boolean):
- Al "eliminar", se pone `activo = false`
- Los listados filtran `where('activo', true)` por defecto
- Opcionalmente exponer filtro "mostrar inactivos"

### 6.3 Campo `created_by`

Muchas tablas tienen `created_by` (bigint). Siempre setear con el ID del usuario autenticado:
```php
$dto->toArray() + ['created_by' => auth()->id()]
```

### 6.4 No `updated_at`

La mayoría de tablas solo tienen `created_at` (sin `updated_at`). Los modelos generados ya tienen `$timestamps = false`. Si necesitas registrar una actualización, usa `t_historialCambios`.

### 6.5 Tests

- Un test por cada método del controller
- Usar factories para crear datos de prueba
- Testear validaciones del FormRequest (campos requeridos, formatos, FKs)
- Testear lógica de negocio del Service por separado si es compleja

---

## 7. Flujo de un CRUD Completo (Ejemplo)

Para crear el CRUD de **Personas**, se generan estos archivos en este orden:

```
1. app/DTOs/Persona/CreatePersonaDTO.php
2. app/DTOs/Persona/UpdatePersonaDTO.php
3. app/Services/Persona/PersonaService.php
4. app/Http/Requests/Persona/StorePersonaRequest.php
5. app/Http/Requests/Persona/UpdatePersonaRequest.php
6. app/Http/Controllers/Persona/PersonaController.php
7. resources/js/types/models/persona.ts
8. resources/js/components/persona/PersonaForm.vue
9. resources/js/pages/persona/Index.vue
10. resources/js/pages/persona/Create.vue
11. resources/js/pages/persona/Show.vue
12. resources/js/pages/persona/Edit.vue
13. routes/web.php (agregar Route::resource)
14. php artisan wayfinder:generate
15. tests/Feature/Persona/PersonaControllerTest.php
16. vendor/bin/pint --dirty --format agent
```