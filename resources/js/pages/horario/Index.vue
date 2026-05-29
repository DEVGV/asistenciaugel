<script setup lang="ts">
import { Head, Link } from '@inertiajs/vue3';
import {
    Plus,
    User,
    Trash2,
    Clock,
    UserCheck,
    ArrowRight,
    Sparkles,
    CalendarDays,
    ChevronRight,
    BookOpen,
} from 'lucide-vue-next';
import { ref, computed, watch, onMounted } from 'vue';
import { toast } from 'vue-sonner';
import DetalleHorarioGrid from '@/components/horario/DetalleHorarioGrid.vue';
import HorarioForm from '@/components/horario/HorarioForm.vue';
import ConfirmModal from '@/components/shared/ConfirmModal.vue';
import FormModal from '@/components/shared/FormModal.vue';
import SearchSelect from '@/components/shared/SearchSelect.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table';

const props = defineProps<{
    instituciones: any[];
    anioActual: number;
}>();

defineOptions({
    layout: {
        breadcrumbs: [{ title: 'Gestión de Horarios', href: '#' }],
    },
});

// ── Filtros ──────────────────────────────────────────────────────────────────
const selectedAnio = ref<string>(String(props.anioActual));
const selectedIE = ref<string>('');
const selectedGrado = ref<string>('');
const selectedSeccion = ref<string>('');

const ieDetails = ref<any>(null);
const loadingIE = ref(false);

const grados = computed(() => ieDetails.value?.grados || []);
const cursos = computed(() => ieDetails.value?.cursos || []);

const secciones = computed(() => {
    if (!selectedGrado.value) {
return [];
}

    const g = grados.value.find(
        (x: any) => x.id === Number(selectedGrado.value),
    );

    return g?.secciones || [];
});

// Etiquetas informativas
const selectedIELabel = computed(
    () =>
        props.instituciones.find((ie) => String(ie.id) === selectedIE.value)
            ?.nombreLegal ?? '—',
);
const selectedGradoLabel = computed(
    () =>
        grados.value.find((g: any) => String(g.id) === selectedGrado.value)
            ?.nombre ?? '—',
);
const selectedSeccionLabel = computed(
    () =>
        secciones.value.find((s: any) => String(s.id) === selectedSeccion.value)
            ?.nombre ?? '—',
);

// SearchSelect items para IE, Grado, Sección
const ieItems = computed(() =>
    props.instituciones.map((ie) => ({
        id: String(ie.id),
        label: ie.nombreLegal,
    })),
);
const gradoItems = computed(() =>
    grados.value.map((g: any) => ({ id: String(g.id), label: g.nombre })),
);
const seccionItems = computed(() =>
    secciones.value.map((s: any) => ({ id: String(s.id), label: s.nombre })),
);

// ── Horarios de curso ─────────────────────────────────────────────────────────
const horarios = ref<any[]>([]);
const loadingHorarios = ref(false);

// ── Modal Crear / Editar HorarioCurso ─────────────────────────────────────────
const showHorarioModal = ref(false);
const editingHorario = ref<any>(null);

// ── Modal Asignar Docente ─────────────────────────────────────────────────────
const showAssignModal = ref(false);
const targetHorario = ref<any>(null);
const selectedWorker = ref<any>(null);
const workersList = ref<any[]>([]);
const searchingWorkers = ref(false);
const selectedAltaId = ref<string>('');
const fechaInicio = ref('');
const fechaFin = ref('');
const titularSuplencia = ref('T');
const submittingAssign = ref(false);

// Items para el SearchSelect de docente (se llenan al buscar)
const workerItems = computed(() =>
    workersList.value.map((w) => ({
        id: String(w.id),
        label: `${w.persona?.paterno ?? ''} ${w.persona?.materno ?? ''}, ${w.persona?.nombre ?? ''}`.trim(),
        sublabel: `DNI: ${w.persona?.docIdentidad ?? '—'} | Cód: ${w.codigo ?? '—'}`,
        _raw: w,
    })),
);

// ── Modal Confirmación Eliminar ───────────────────────────────────────────────
const showDeleteConfirm = ref(false);
const deletingHorario = ref<any>(null);
const submittingDelete = ref(false);

const DAYS_LABEL: Record<number, string> = {
    1: 'Lunes',
    2: 'Martes',
    3: 'Miércoles',
    4: 'Jueves',
    5: 'Viernes',
    6: 'Sábado',
    7: 'Domingo',
};

// ── Watchers ──────────────────────────────────────────────────────────────────
let isInitializing = false;

watch(selectedIE, () => {
    if (!isInitializing) {
loadIEDetails(false);
}
});

watch([selectedSeccion, selectedAnio], () => loadHorarios());

// ── Lifecycle ─────────────────────────────────────────────────────────────────
onMounted(async () => {
    const params = new URLSearchParams(window.location.search);
    const ieId = params.get('ie_id');
    const gradoId = params.get('grado_id');
    const seccionId = params.get('seccion_id');
    const anio = params.get('anio');

    if (anio) {
selectedAnio.value = anio;
}

    // Determinar IE: desde query param, o auto-seleccionar si hay solo una
    const resolvedIeId =
        ieId ??
        (props.instituciones.length === 1
            ? String(props.instituciones[0].id)
            : null);

    if (resolvedIeId) {
        isInitializing = true;
        selectedIE.value = resolvedIeId;
        await loadIEDetails(true);

        if (gradoId) {
            selectedGrado.value = gradoId;

            if (seccionId) {
selectedSeccion.value = seccionId;
}
        }

        isInitializing = false;
    }
});

// ── API helpers ───────────────────────────────────────────────────────────────
function csrfToken(): string {
    return (
        (document.querySelector('meta[name="csrf-token"]') as HTMLMetaElement)
            ?.content ?? ''
    );
}

async function loadIEDetails(keepSelections = false) {
    if (!selectedIE.value) {
        ieDetails.value = null;
        selectedGrado.value = '';
        selectedSeccion.value = '';
        horarios.value = [];

        return;
    }

    loadingIE.value = true;

    try {
        const res = await fetch(
            `/api/instituciones/${selectedIE.value}/detalles`,
        );
        const result = await res.json();
        ieDetails.value = result.data;

        if (!keepSelections) {
            selectedGrado.value = '';
            selectedSeccion.value = '';
            horarios.value = [];
        }
    } catch (e) {
        console.error(e);
        toast.error('Error al cargar la Institución Educativa.');
    } finally {
        loadingIE.value = false;
    }
}

async function loadHorarios() {
    if (!selectedSeccion.value || !selectedAnio.value) {
        horarios.value = [];

        return;
    }

    loadingHorarios.value = true;

    try {
        const res = await fetch(
            `/horarios-cursos?seccion_id=${selectedSeccion.value}&anio=${selectedAnio.value}`,
        );
        const result = await res.json();
        horarios.value = result.data;
    } catch (e) {
        console.error(e);
        toast.error('Error al cargar la grilla de horarios.');
    } finally {
        loadingHorarios.value = false;
    }
}

// ── HorarioCurso ──────────────────────────────────────────────────────────────
function openCreateHorario() {
    editingHorario.value = null;
    showHorarioModal.value = true;
}

function openEditHorario(horario: any) {
    editingHorario.value = horario;
    showHorarioModal.value = true;
}

async function handleHorarioSubmit(data: any) {
    const isEdit = !!data.id;
    const url = isEdit ? `/horarios-cursos/${data.id}` : '/horarios-cursos';
    const method = isEdit ? 'PUT' : 'POST';

    try {
        const res = await fetch(url, {
            method,
            headers: {
                'Content-Type': 'application/json',
                Accept: 'application/json',
                'X-CSRF-TOKEN': csrfToken(),
            },
            body: JSON.stringify(data),
        });
        const result = await res.json();

        if (res.ok) {
            toast.success(
                isEdit ? 'Horario actualizado.' : 'Horario registrado.',
            );
            showHorarioModal.value = false;
            loadHorarios();
        } else {
            toast.error(result.message || 'Error al procesar el formulario.');
        }
    } catch (e) {
        console.error(e);
        toast.error('Error de conexión.');
    }
}

function confirmDeleteHorario(horario: any) {
    deletingHorario.value = horario;
    showDeleteConfirm.value = true;
}

async function executeDeleteHorario() {
    if (!deletingHorario.value) {
return;
}

    submittingDelete.value = true;

    try {
        const res = await fetch(
            `/horarios-cursos/${deletingHorario.value.id}`,
            {
                method: 'DELETE',
                headers: {
                    Accept: 'application/json',
                    'X-CSRF-TOKEN': csrfToken(),
                },
            },
        );

        if (res.ok) {
            toast.success('Horario eliminado.');
            showDeleteConfirm.value = false;
            deletingHorario.value = null;
            loadHorarios();
        } else {
            const err = await res.json();
            toast.error(err.message || 'Error al eliminar.');
        }
    } catch (e) {
        console.error(e);
        toast.error('Error de conexión.');
    } finally {
        submittingDelete.value = false;
    }
}

// ── Asignación Docente ────────────────────────────────────────────────────────
function openAssignTeacher(horario: any) {
    targetHorario.value = horario;
    showAssignModal.value = true;

    const cargaExistente = horario.cargas?.[0];

    if (cargaExistente?.trabajador) {
        // Pre-poblar con el docente ya asignado
        const w = cargaExistente.trabajador;
        workersList.value = [w];
        selectedWorkerId.value = String(w.id);
        selectedWorker.value = w;
        selectedAltaId.value = cargaExistente.altaTrabajador_id
            ? String(cargaExistente.altaTrabajador_id)
            : '';
        fechaInicio.value = cargaExistente.fechaInicio ?? '';
        fechaFin.value = cargaExistente.fechaFin ?? '';
        titularSuplencia.value = cargaExistente.titularSuplencia ?? 'T';
    } else {
        // Sin asignación previa — limpiar y buscar docentes
        selectedWorkerId.value = null;
        workersList.value = [];
        selectedWorker.value = null;
        selectedAltaId.value = '';
        fechaInicio.value = '';
        fechaFin.value = '';
        titularSuplencia.value = 'T';
        triggerSearchWorkers('');
    }
}

async function triggerSearchWorkers(query = '') {
    searchingWorkers.value = true;

    try {
        const params = new URLSearchParams();

        if (query.trim()) {
            params.set('search', query);
        }

        // Filtrar por IE seleccionada para mostrar solo docentes dados de alta ahí
        if (selectedIE.value) {
params.set('ie_id', selectedIE.value);
}

        const res = await fetch(
            `/api/trabajadores/search?${params.toString()}`,
        );

        if (res.ok) {
workersList.value = await res.json();
}
    } catch (e) {
        console.error(e);
    } finally {
        searchingWorkers.value = false;
    }
}

let workerSearchTimeout: any = null;
function handleWorkerSearch(query: string) {
    if (workerSearchTimeout) {
        clearTimeout(workerSearchTimeout);
    }

    workerSearchTimeout = setTimeout(() => {
        triggerSearchWorkers(query);
    }, 300);
}

function onWorkerSelected(workerId: string | number | null) {
    if (!workerId) {
        selectedWorker.value = null;
        selectedAltaId.value = '';

        return;
    }

    const w = workersList.value.find((x) => String(x.id) === String(workerId));

    if (w) {
        selectedWorker.value = w;
        selectedAltaId.value =
            w.altas?.length === 1 ? String(w.altas[0].id) : '';
    }
}

async function handleAssignSubmit() {
    if (!selectedWorker.value || !targetHorario.value) {
return;
}

    submittingAssign.value = true;

    const cargaExistente = targetHorario.value.cargas?.[0];
    const isEdit = !!cargaExistente;
    const url = isEdit
        ? `/cargas/${cargaExistente.id}`
        : `/horarios-cursos/${targetHorario.value.id}/cargas`;
    const method = isEdit ? 'PUT' : 'POST';

    try {
        const res = await fetch(url, {
            method,
            headers: {
                'Content-Type': 'application/json',
                Accept: 'application/json',
                'X-CSRF-TOKEN': csrfToken(),
            },
            body: JSON.stringify({
                horarioCurso_id: targetHorario.value.id,
                trabajador_id: selectedWorker.value.id,
                altaTrabajador_id: selectedAltaId.value
                    ? Number(selectedAltaId.value)
                    : null,
                fechaInicio: fechaInicio.value || null,
                fechaFin: fechaFin.value || null,
                titularSuplencia: titularSuplencia.value,
            }),
        });
        const result = await res.json();

        if (res.ok) {
            toast.success(
                isEdit
                    ? 'Asignación actualizada y horario recalculado.'
                    : 'Docente asignado y horario consolidado exitosamente.',
            );
            showAssignModal.value = false;
            loadHorarios();
        } else {
            toast.error(result.message || 'Error al procesar la asignación.');
        }
    } catch (e) {
        console.error(e);
        toast.error('Error en el servidor.');
    } finally {
        submittingAssign.value = false;
    }
}

async function removeAssign(cargaId: number) {
    if (
        !confirm(
            '¿Desasignar al docente de este curso? Se recalculará su horario.',
        )
    ) {
return;
}

    try {
        const res = await fetch(`/horarios-cursos/cargas/${cargaId}`, {
            method: 'DELETE',
            headers: {
                Accept: 'application/json',
                'X-CSRF-TOKEN': csrfToken(),
            },
        });

        if (res.ok) {
            toast.success('Docente desasignado y horario recalculado.');
            loadHorarios();
        } else {
            const err = await res.json();
            toast.error(err.message || 'Error al desasignar.');
        }
    } catch (e) {
        console.error(e);
        toast.error('Error de conexión.');
    }
}

function formatWorkerName(worker: any) {
    if (!worker?.persona) {
return '';
}

    return `${worker.persona.paterno} ${worker.persona.materno}, ${worker.persona.nombre}`;
}

// Reactivo de workerId para el SearchSelect de docente
const selectedWorkerId = ref<string | null>(null);
watch(selectedWorkerId, (val) => onWorkerSelected(val));
</script>

<template>
    <Head title="Gestión de Horarios" />

    <div class="flex flex-col gap-6 p-4">
        <!-- ── Encabezado ──────────────────────────────────────────────────── -->
        <div class="flex items-center justify-between">
            <div>
                <h1 class="text-xl font-bold tracking-tight text-foreground">
                    Planificación de Horarios
                </h1>
                <p class="mt-0.5 text-sm text-muted-foreground">
                    Gestione los horarios escolares por sección y asigne
                    docentes a cada curso.
                </p>
            </div>

            <Button v-if="selectedSeccion" @click="openCreateHorario">
                <Plus class="mr-2 h-4 w-4" /> Agregar Horario
            </Button>
        </div>

        <!-- ── Panel de filtros ───────────────────────────────────────────── -->
        <div class="flex flex-col gap-3 border-b border-border pb-5">
            <div
                class="flex flex-col gap-4 sm:flex-row sm:flex-wrap sm:items-end"
            >
                <!-- Año -->
                <div class="w-full space-y-1.5 sm:w-28">
                    <Label
                        class="text-xs font-semibold tracking-wider text-muted-foreground uppercase"
                    >
                        Año Lectivo
                    </Label>
                    <Select v-model="selectedAnio">
                        <SelectTrigger class="h-9">
                            <SelectValue placeholder="Año" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectItem value="2026">2026</SelectItem>
                            <SelectItem value="2025">2025</SelectItem>
                            <SelectItem value="2024">2024</SelectItem>
                        </SelectContent>
                    </Select>
                </div>

                <!-- IE — solo lectura, muestra la IE del contexto -->
                <div class="w-full space-y-1.5 sm:min-w-[300px] sm:flex-1">
                    <Label
                        class="text-xs font-semibold tracking-wider text-muted-foreground uppercase"
                    >
                        Institución Educativa
                    </Label>
                    <div
                        class="flex h-9 items-center text-sm font-semibold text-foreground"
                    >
                        {{
                            selectedIELabel !== '—'
                                ? selectedIELabel
                                : 'Sin IE seleccionada'
                        }}
                    </div>
                </div>

                <!-- Grado -->
                <div class="w-full space-y-1.5 sm:w-52">
                    <Label
                        class="text-xs font-semibold tracking-wider text-muted-foreground uppercase"
                    >
                        Grado
                    </Label>
                    <SearchSelect
                        v-model="selectedGrado"
                        :items="gradoItems"
                        placeholder="Seleccione Grado..."
                        :disabled="!selectedIE || loadingIE"
                        :loading="loadingIE"
                        clearable
                    />
                </div>

                <!-- Sección -->
                <div class="w-full space-y-1.5 sm:w-44">
                    <Label
                        class="text-xs font-semibold tracking-wider text-muted-foreground uppercase"
                    >
                        Sección
                    </Label>
                    <SearchSelect
                        v-model="selectedSeccion"
                        :items="seccionItems"
                        placeholder="Seleccione Sección..."
                        :disabled="!selectedGrado"
                        clearable
                    />
                </div>
            </div>

            <!-- Breadcrumb informativo -->
            <div
                v-if="selectedSeccion"
                class="mt-1 flex items-center gap-1.5 text-xs text-muted-foreground"
            >
                <span class="font-medium text-foreground">{{
                    selectedIELabel
                }}</span>
                <ChevronRight class="h-3 w-3" />
                <span>{{ selectedGradoLabel }}</span>
                <ChevronRight class="h-3 w-3" />
                <span class="font-semibold text-primary"
                    >Sección {{ selectedSeccionLabel }}</span
                >
                <span
                    class="ml-1 rounded-full bg-muted px-2 py-0.5 font-medium"
                    >{{ selectedAnio }}</span
                >
            </div>
        </div>

        <!-- ── Cuerpo ──────────────────────────────────────────────────────── -->
        <template v-if="selectedSeccion">
            <!-- Grilla horaria -->
            <div class="relative">
                <div
                    v-if="loadingHorarios"
                    class="absolute inset-0 z-10 flex items-center justify-center rounded-xl bg-background/60 backdrop-blur-xs"
                >
                    <div class="flex flex-col items-center gap-2">
                        <div
                            class="h-8 w-8 animate-spin rounded-full border-b-2 border-primary"
                        />
                        <span class="text-sm font-medium text-muted-foreground"
                            >Cargando grilla...</span
                        >
                    </div>
                </div>

                <DetalleHorarioGrid
                    :horarios="horarios"
                    @edit="openEditHorario"
                    @delete="confirmDeleteHorario"
                    @assign="openAssignTeacher"
                    @select="openAssignTeacher"
                />
            </div>

            <!-- Tabla de docentes asignados -->
            <div class="overflow-hidden rounded-xl border bg-card shadow-sm">
                <div
                    class="flex items-center gap-2 border-b bg-muted/20 px-5 py-3.5"
                >
                    <UserCheck class="h-4 w-4 text-primary" />
                    <h3 class="text-sm font-semibold">
                        Carga Horaria y Docentes Asignados
                    </h3>
                </div>

                <div
                    v-if="horarios.length === 0"
                    class="py-10 text-center text-sm text-muted-foreground"
                >
                    No hay horarios de cursos registrados en esta sección.
                </div>

                <Table v-else>
                    <TableHeader>
                        <TableRow>
                            <TableHead>
                                <span class="flex items-center gap-1.5">
                                    <BookOpen class="h-3.5 w-3.5" /> Curso
                                </span>
                            </TableHead>
                            <TableHead>Día</TableHead>
                            <TableHead>Horario</TableHead>
                            <TableHead>
                                <span class="flex items-center gap-1.5">
                                    <User class="h-3.5 w-3.5" /> Docente
                                    Asignado
                                </span>
                            </TableHead>
                            <TableHead class="w-[160px] text-right"
                                >Acciones</TableHead
                            >
                        </TableRow>
                    </TableHeader>
                    <TableBody>
                        <TableRow v-for="horario in horarios" :key="horario.id">
                            <TableCell class="font-medium">
                                {{ horario.curso?.nombre ?? '—' }}
                            </TableCell>
                            <TableCell class="text-sm text-muted-foreground">
                                {{ DAYS_LABEL[horario.nroDia] ?? '—' }}
                            </TableCell>
                            <TableCell>
                                <span
                                    class="flex items-center gap-1 font-mono text-xs"
                                >
                                    <Clock
                                        class="h-3 w-3 text-muted-foreground"
                                    />
                                    {{ horario.horaInicio?.substring(0, 5) }} –
                                    {{ horario.horaFin?.substring(0, 5) }}
                                </span>
                            </TableCell>
                            <TableCell>
                                <template
                                    v-if="
                                        horario.cargas &&
                                        horario.cargas.length > 0
                                    "
                                >
                                    <span class="text-sm font-medium">
                                        {{
                                            formatWorkerName(
                                                horario.cargas[0].trabajador,
                                            )
                                        }}
                                    </span>
                                </template>
                                <span
                                    v-else
                                    class="text-xs text-muted-foreground italic"
                                    >Sin asignar</span
                                >
                            </TableCell>
                            <TableCell class="text-right">
                                <div
                                    class="flex items-center justify-end gap-1"
                                >
                                    <template
                                        v-if="
                                            horario.cargas &&
                                            horario.cargas.length > 0
                                        "
                                    >
                                        <Button
                                            variant="ghost"
                                            size="sm"
                                            class="h-7 text-xs"
                                            as-child
                                        >
                                            <Link
                                                :href="`/horarios-trabajador/${horario.cargas[0].trabajador_id}?anio=${selectedAnio}`"
                                            >
                                                Ver horario
                                                <ArrowRight
                                                    class="ml-1 h-3 w-3"
                                                />
                                            </Link>
                                        </Button>
                                        <Button
                                            variant="ghost"
                                            size="icon"
                                            class="h-7 w-7 text-red-500 hover:bg-red-50 hover:text-red-700"
                                            title="Quitar asignación"
                                            @click="
                                                removeAssign(
                                                    horario.cargas[0].id,
                                                )
                                            "
                                        >
                                            <Trash2 class="h-3.5 w-3.5" />
                                        </Button>
                                    </template>
                                    <Button
                                        v-else
                                        variant="outline"
                                        size="sm"
                                        class="h-7 text-xs"
                                        @click="openAssignTeacher(horario)"
                                    >
                                        Asignar
                                    </Button>
                                </div>
                            </TableCell>
                        </TableRow>
                    </TableBody>
                </Table>
            </div>
        </template>

        <!-- Estado vacío -->
        <div
            v-else
            class="flex flex-col items-center justify-center space-y-4 rounded-2xl border-2 border-dashed bg-muted/10 p-12 text-center"
        >
            <div class="rounded-full bg-primary/5 p-4 text-primary">
                <Sparkles class="h-10 w-10 animate-pulse" />
            </div>
            <div class="space-y-1">
                <h3 class="text-lg font-bold text-foreground">
                    Seleccione una Sección
                </h3>
                <p class="mx-auto max-w-sm text-sm text-muted-foreground">
                    Elija el año lectivo, la Institución Educativa, el Grado y
                    la Sección para visualizar y programar los horarios.
                </p>
            </div>
        </div>
    </div>

    <!-- ── Modal: Crear / Editar HorarioCurso ─────────────────────────────── -->
    <FormModal
        v-model:show="showHorarioModal"
        :title="
            editingHorario
                ? 'Editar Horario de Curso'
                : 'Agregar Horario de Curso'
        "
        :description="
            editingHorario
                ? 'Modifique los datos del horario seleccionado.'
                : `Nuevo horario — Sección ${selectedSeccionLabel} · ${selectedGradoLabel} · ${selectedAnio}`
        "
        maxWidth="2xl"
        @close="showHorarioModal = false"
    >
        <HorarioForm
            :seccionId="Number(selectedSeccion)"
            :anio="Number(selectedAnio)"
            :cursos="cursos"
            :horarioCurso="editingHorario"
            @submit="handleHorarioSubmit"
            @cancel="showHorarioModal = false"
        />
    </FormModal>

    <!-- ── Modal: Confirmar Eliminación ───────────────────────────────────── -->
    <ConfirmModal
        v-model:show="showDeleteConfirm"
        title="Eliminar Horario de Curso"
        description="¿Está seguro? Se eliminará la asignación docente y se recalculará el horario consolidado del trabajador."
        confirm-text="Sí, eliminar"
        destructive
        :processing="submittingDelete"
        @confirm="executeDeleteHorario"
        @cancel="showDeleteConfirm = false"
    />

    <!-- ── Modal: Asignar Docente ──────────────────────────────────────────── -->
    <FormModal
        v-model:show="showAssignModal"
        :title="targetHorario?.cargas?.length ? 'Editar Docente Asignado' : 'Asignar Docente al Curso'"
        :description="`${targetHorario?.curso?.nombre ?? ''} — ${DAYS_LABEL[targetHorario?.nroDia] ?? ''} ${targetHorario?.horaInicio?.substring(0, 5) ?? ''} - ${targetHorario?.horaFin?.substring(0, 5) ?? ''}`"
        maxWidth="xl"
        :submitText="selectedWorker ? (targetHorario?.cargas?.length ? 'Guardar Cambios' : 'Asignar Docente') : ''"
        :processing="submittingAssign"
        @submit="handleAssignSubmit"
        @close="showAssignModal = false"
    >
        <div class="min-h-[350px] space-y-5">
            <!-- Buscador de docentes con SearchSelect -->
            <div class="space-y-1.5">
                <Label class="text-sm font-semibold"
                    >Docente / Trabajador</Label
                >
                <SearchSelect
                    v-model="selectedWorkerId"
                    :items="workerItems"
                    placeholder="Buscar y seleccionar docente..."
                    :loading="searchingWorkers"
                    clearable
                    @search="handleWorkerSearch"
                />
            </div>

            <!-- Datos del docente seleccionado + formulario de asignación -->
            <template v-if="selectedWorker">
                <!-- Card docente -->
                <div
                    class="flex items-start gap-3 rounded-xl border bg-muted/20 p-4"
                >
                    <div
                        class="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-blue-100 text-blue-600 dark:bg-blue-950/40 dark:text-blue-300"
                    >
                        <User class="h-5 w-5" />
                    </div>
                    <div class="min-w-0">
                        <p class="text-sm font-bold">
                            {{ formatWorkerName(selectedWorker) }}
                        </p>
                        <p class="text-xs text-muted-foreground">
                            DNI: {{ selectedWorker.persona?.docIdentidad }} |
                            Cód: {{ selectedWorker.codigo }}
                        </p>
                    </div>
                </div>

                <!-- Alta / Contrato -->
                <div class="space-y-1.5">
                    <Label class="text-sm font-semibold"
                        >Contrato / Alta *</Label
                    >
                    <SearchSelect
                        v-model="selectedAltaId"
                        :items="
                            (selectedWorker.altas ?? []).map((a: any) => ({
                                id: String(a.id),
                                label: `${a.codigoAirsp ? 'AIRSP: ' + a.codigoAirsp : 'Contrato activo'} — ${a.cargo?.nombre ?? 'Cargo general'}`,
                                sublabel: `IE: ${a.institucion_educativa?.nombreLegal ?? '—'}`,
                            }))
                        "
                        placeholder="Seleccione un contrato activo..."
                    />
                    <p
                        v-if="!selectedWorker.altas?.length"
                        class="text-xs font-medium text-red-500"
                    >
                        Este trabajador no tiene contratos activos.
                    </p>
                </div>

                <!-- Condición -->
                <div class="space-y-1.5">
                    <Label class="text-sm font-semibold"
                        >Condición del Cargo</Label
                    >
                    <div class="flex gap-6">
                        <label
                            class="flex cursor-pointer items-center gap-2 text-sm font-medium"
                        >
                            <input
                                type="radio"
                                v-model="titularSuplencia"
                                value="T"
                                class="h-4 w-4"
                            />
                            Titular
                        </label>
                        <label
                            class="flex cursor-pointer items-center gap-2 text-sm font-medium"
                        >
                            <input
                                type="radio"
                                v-model="titularSuplencia"
                                value="S"
                                class="h-4 w-4"
                            />
                            Suplente
                        </label>
                    </div>
                </div>

                <!-- Fechas -->
                <div class="grid grid-cols-2 gap-4">
                    <div class="space-y-1.5">
                        <Label class="text-xs font-semibold">
                            Fecha Inicio
                            <span class="font-normal text-muted-foreground"
                                >(Opcional)</span
                            >
                        </Label>
                        <Input type="date" v-model="fechaInicio" />
                    </div>
                    <div class="space-y-1.5">
                        <Label class="text-xs font-semibold">
                            Fecha Fin
                            <span class="font-normal text-muted-foreground"
                                >(Opcional)</span
                            >
                        </Label>
                        <Input type="date" v-model="fechaFin" />
                    </div>
                </div>

                <!-- Nota -->
                <div
                    class="flex items-center gap-2 rounded-lg border border-dashed bg-muted/10 px-3 py-2 text-xs text-muted-foreground"
                >
                    <CalendarDays class="h-3.5 w-3.5 shrink-0" />
                    El horario del docente se recalculará automáticamente al
                    guardar.
                </div>
            </template>
        </div>
    </FormModal>
</template>
