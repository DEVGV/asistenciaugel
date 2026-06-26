<script setup lang="ts">
import { Link } from '@inertiajs/vue3';
import {
    Calendar,
    School,
    ArrowRight,
    BookOpen,
    AlertCircle,
    RefreshCw,
    LogIn,
    LogOut,
    Timer,
    Clock,
    GraduationCap,
} from 'lucide-vue-next';
import { ref, onMounted, watch } from 'vue';
import { Button } from '@/components/ui/button';
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';

const props = defineProps<{
    trabajadorId: number;
}>();

const CURRENT_YEAR = new Date().getFullYear();
const YEARS = [CURRENT_YEAR, CURRENT_YEAR - 1, CURRENT_YEAR - 2];

const selectedAnio = ref<string>(String(CURRENT_YEAR));
const horarios = ref<any[]>([]);
const loading = ref(false);
const error = ref(false);


const DAYS_OF_WEEK: Record<number, string> = {
    1: 'Lunes',
    2: 'Martes',
    3: 'Miércoles',
    4: 'Jueves',
    5: 'Viernes',
    6: 'Sábado',
    7: 'Domingo',
};

const TURNO_CONFIG: Record<
    number,
    { label: string; class: string; dot: string }
> = {
    1: {
        label: 'MAÑANA',
        class: 'bg-amber-100 text-amber-700 ring-1 ring-amber-200 dark:bg-amber-950/30 dark:text-amber-300 dark:ring-amber-900/50',
        dot: 'bg-amber-400',
    },
    2: {
        label: 'TARDE',
        class: 'bg-blue-100 text-blue-700 ring-1 ring-blue-200 dark:bg-blue-950/30 dark:text-blue-300 dark:ring-blue-900/50',
        dot: 'bg-blue-400',
    },
    3: {
        label: 'NOCHE',
        class: 'bg-violet-100 text-violet-700 ring-1 ring-violet-200 dark:bg-violet-950/30 dark:text-violet-300 dark:ring-violet-900/50',
        dot: 'bg-violet-400',
    },
};

const COURSE_COLORS = [
    'bg-blue-50 border-blue-200 text-blue-700 dark:bg-blue-950/30 dark:border-blue-900/50 dark:text-blue-300',
    'bg-emerald-50 border-emerald-200 text-emerald-700 dark:bg-emerald-950/30 dark:border-emerald-900/50 dark:text-emerald-300',
    'bg-violet-50 border-violet-200 text-violet-700 dark:bg-violet-950/30 dark:border-violet-900/50 dark:text-violet-300',
    'bg-amber-50 border-amber-200 text-amber-700 dark:bg-amber-950/30 dark:border-amber-900/50 dark:text-amber-300',
    'bg-rose-50 border-rose-200 text-rose-700 dark:bg-rose-950/30 dark:border-rose-900/50 dark:text-rose-300',
    'bg-cyan-50 border-cyan-200 text-cyan-700 dark:bg-cyan-950/30 dark:border-cyan-900/50 dark:text-cyan-300',
    'bg-indigo-50 border-indigo-200 text-indigo-700 dark:bg-indigo-950/30 dark:border-indigo-900/50 dark:text-indigo-300',
];

function getTurno(turnoId: number | null) {
    return TURNO_CONFIG[turnoId ?? 1] ?? TURNO_CONFIG[1];
}

function formatTime(timeStr: string | null): string {
    if (!timeStr) {
        return '—';
    }

    const parts = timeStr.split(':');

    return `${parts[0]}:${parts[1]}`;
}

function totalHoras(detalles: any[]): string {
    if (!detalles) {
        return '0.00';
    }

    return detalles
        .filter((d) => d.aplicar)
        .reduce((sum: number, d: any) => sum + Number(d.horaAcumula || 0), 0)
        .toFixed(2);
}

function getCourseColor(cursoId: number): string {
    return COURSE_COLORS[cursoId % COURSE_COLORS.length];
}

/**
 * Obtener los cursos de un día específico para un horario.
 * Filtra las cargas horarias por nroDia y las ordena por hora de inicio.
 */
function getCursosDia(horario: any, nroDia: number): any[] {
    if (!horario.cargas_horarias) return [];

    return horario.cargas_horarias
        .filter((c: any) => c.horario_curso?.nroDia === nroDia)
        .sort((a: any, b: any) => {
            const ha = a.horario_curso?.horaInicio ?? '';
            const hb = b.horario_curso?.horaInicio ?? '';
            return ha.localeCompare(hb);
        });
}


function calcMinutes(horaInicio: string, horaFin: string): number {
    const [h1, m1] = horaInicio.split(':').map(Number);
    const [h2, m2] = horaFin.split(':').map(Number);

    return (h2 * 60 + m2) - (h1 * 60 + m1);
}

function getGridColsClass(daysCount: number): string {
    if (daysCount === 5) return 'lg:grid-cols-5';
    if (daysCount === 6) return 'lg:grid-cols-6';
    if (daysCount === 7) return 'lg:grid-cols-7';
    return 'lg:grid-cols-5';
}

async function loadHorarios() {
    loading.value = true;
    error.value = false;

    try {
        const res = await fetch(
            `/trabajadores/${props.trabajadorId}/horarios?anio=${selectedAnio.value}`,
            { headers: { Accept: 'application/json' } },
        );

        if (!res.ok) {
            throw new Error();
        }

        const result = await res.json();
        horarios.value = (result.data || []).map((horario: any) => {
            const defaultDays = [1, 2, 3, 4, 5];
            const detalles = horario.detalles || [];
            const maxDay = Math.max(5, ...detalles.map((d: any) => d.nroDia));
            const daysToRender = [];
            for (let i = 1; i <= maxDay; i++) {
                daysToRender.push(i);
            }
            const detallesMap = detalles.reduce((acc: any, d: any) => {
                acc[d.nroDia] = d;
                return acc;
            }, {});
            return {
                ...horario,
                daysToRender,
                detallesMap,
            };
        });
    } catch {
        error.value = true;
    } finally {
        loading.value = false;
    }
}

onMounted(() => loadHorarios());
watch(selectedAnio, () => loadHorarios());
</script>

<template>
    <div class="flex flex-col gap-5">
        <!-- Cabecera -->
        <div class="flex flex-wrap items-center justify-between gap-3">
            <div class="flex items-center gap-2">
                <Calendar class="h-5 w-5 text-primary" />
                <h2 class="text-base font-bold">Horarios Consolidados</h2>
            </div>

            <div class="flex items-center gap-2">
                <Select v-model="selectedAnio">
                    <SelectTrigger class="h-8 w-32 text-xs">
                        <SelectValue placeholder="Año" />
                    </SelectTrigger>
                    <SelectContent>
                        <SelectItem
                            v-for="y in YEARS"
                            :key="y"
                            :value="String(y)"
                        >
                            {{ y }}
                        </SelectItem>
                    </SelectContent>
                </Select>

                <Button
                    variant="ghost"
                    size="icon"
                    class="h-8 w-8"
                    title="Recargar"
                    :disabled="loading"
                    @click="loadHorarios"
                >
                    <RefreshCw
                        class="h-4 w-4"
                        :class="{ 'animate-spin': loading }"
                    />
                </Button>
            </div>
        </div>

        <!-- Error -->
        <div
            v-if="error"
            class="flex items-center gap-2 rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700 dark:border-red-900 dark:bg-red-950/20 dark:text-red-300"
        >
            <AlertCircle class="h-4 w-4 shrink-0" />
            Error al cargar los horarios. Intente nuevamente.
        </div>

        <!-- Skeleton -->
        <div v-else-if="loading" class="space-y-4">
            <div
                v-for="i in 2"
                :key="i"
                class="h-40 animate-pulse rounded-xl border bg-muted/30"
            />
        </div>

        <!-- Sin horarios -->
        <div
            v-else-if="horarios.length === 0"
            class="flex flex-col items-center justify-center rounded-xl border-2 border-dashed py-14 text-center"
        >
            <Calendar class="mb-3 h-10 w-10 text-muted-foreground/40" />
            <p class="text-sm font-medium text-muted-foreground">
                Sin horarios registrados para {{ selectedAnio }}.
            </p>
            <p class="mt-1 text-xs text-muted-foreground/70">
                Los horarios se generan al asignar docentes a cursos en
                Planificación.
            </p>
        </div>

        <!-- Lista de horarios -->
        <div v-else class="space-y-6">
            <div
                v-for="horario in horarios"
                :key="horario.id"
                class="overflow-hidden rounded-xl border bg-card shadow-sm"
            >
                <!-- Header IE -->
                <div
                    class="flex flex-wrap items-start justify-between gap-3 border-b bg-muted/20 px-5 py-4"
                >
                    <div class="space-y-1">
                        <div class="flex items-center gap-2">
                            <School class="h-4 w-4 text-emerald-500" />
                            <span class="font-bold text-foreground">
                                {{
                                    horario.institucion_educ?.nombreLegal ??
                                    'Institución'
                                }}
                            </span>
                        </div>
                        <div
                            class="flex flex-wrap items-center gap-x-3 gap-y-0.5 text-xs text-muted-foreground"
                        >
                            <span
                                >Código:
                                {{
                                    horario.institucion_educ
                                        ?.codigoInstitucion ?? '—'
                                }}</span
                            >
                            <span v-if="horario.alta_trabajador?.cargo">
                                · Cargo:
                                {{ horario.alta_trabajador.cargo.nombre }}
                            </span>
                            <span>· {{ horario.anio }}</span>
                        </div>
                    </div>

                    <div class="flex items-center gap-3">
                        <div
                            class="rounded-lg border bg-blue-50 px-3 py-1.5 text-center dark:bg-blue-950/20"
                        >
                            <p
                                class="text-[10px] font-semibold tracking-wider text-blue-500 uppercase dark:text-blue-400"
                            >
                                Hrs / semana
                            </p>
                            <p
                                class="text-xl font-extrabold text-blue-700 dark:text-blue-200"
                            >
                                {{ totalHoras(horario.detalles) }}
                            </p>
                        </div>

                        <Button
                            variant="outline"
                            size="sm"
                            class="h-8 text-xs"
                            as-child
                        >
                            <Link :href="`/horarios-trabajador/${horario.id}`">
                                Ver detalle
                                <ArrowRight class="ml-1 h-3.5 w-3.5" />
                            </Link>
                        </Button>
                    </div>
                </div>

                <!-- Sin detalles -->
                <div
                    v-if="!horario.detalles || horario.detalles.length === 0"
                    class="flex items-center justify-center gap-2 px-5 py-6 text-sm text-muted-foreground"
                >
                    <AlertCircle class="h-4 w-4" />
                    Sin días configurados.
                </div>

                <!-- Horario Semanal en Columnas -->
                <div v-else class="p-5 border-t">
                    <div
                        class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4"
                        :class="getGridColsClass(horario.daysToRender.length)"
                    >
                        <div
                            v-for="nroDia in horario.daysToRender"
                            :key="nroDia"
                            class="flex flex-col h-full rounded-xl border bg-card shadow-sm overflow-hidden"
                            :class="[
                                horario.detallesMap[nroDia]
                                    ? (horario.detallesMap[nroDia].aplicar ? 'border-muted/60 dark:border-muted-foreground/10 bg-card' : 'opacity-50 bg-muted/5')
                                    : 'border-dashed border-muted/60 bg-muted/5 opacity-60'
                            ]"
                        >
                            <!-- Cabecera del Día -->
                            <div class="border-b bg-muted/20 px-4 py-3 text-center">
                                <span class="text-sm font-bold text-foreground block">
                                    {{ DAYS_OF_WEEK[nroDia] }}
                                </span>
                            </div>

                            <!-- Si tiene jornada configurada para este día -->
                            <div
                                v-if="horario.detallesMap[nroDia]"
                                class="flex flex-col flex-1"
                            >
                                <!-- Información del Turno e Intervalos de Jornada -->
                                <div class="p-3 flex flex-col gap-2 border-b bg-muted/5">
                                    <div class="flex items-center justify-between gap-1.5">
                                        <!-- Turno -->
                                        <span
                                            class="inline-flex items-center gap-1 rounded-full px-2 py-0.5 text-[10px] font-semibold"
                                            :class="getTurno(horario.detallesMap[nroDia].turno_id).class"
                                        >
                                            <span
                                                class="h-1.5 w-1.5 rounded-full"
                                                :class="getTurno(horario.detallesMap[nroDia].turno_id).dot"
                                            />
                                            {{
                                                horario.detallesMap[nroDia].nombreTurno ??
                                                getTurno(horario.detallesMap[nroDia].turno_id).label
                                            }}
                                        </span>
                                        <!-- Horas acumuladas -->
                                        <div class="flex items-center gap-1 text-[11px] font-medium text-muted-foreground">
                                            <Timer class="h-3.5 w-3.5 opacity-60" />
                                            <span class="font-semibold tabular-nums">
                                                {{ Number(horario.detallesMap[nroDia].horaAcumula ?? 0).toFixed(2) }} hrs
                                            </span>
                                        </div>
                                    </div>

                                    <!-- Entrada y Salida -->
                                    <div class="grid grid-cols-2 gap-1.5 mt-1">
                                        <!-- Entrada -->
                                        <div class="rounded-lg border border-emerald-100 bg-emerald-50/50 p-2 text-center dark:border-emerald-950/20 dark:bg-emerald-950/10">
                                            <span class="block text-[9px] font-semibold uppercase tracking-wider text-emerald-600/70 dark:text-emerald-400/60">Entrada</span>
                                            <span class="font-mono text-xs font-bold text-emerald-700 dark:text-emerald-300">
                                                {{ formatTime(horario.detallesMap[nroDia].entHoraInicio) }}
                                                <span class="text-[9px] font-normal text-emerald-600/50">±{{ horario.detallesMap[nroDia].entTolerancia ?? 0 }}'</span>
                                            </span>
                                        </div>
                                        <!-- Salida -->
                                        <div class="rounded-lg border border-red-100 bg-red-50/50 p-2 text-center dark:border-red-950/20 dark:bg-red-950/10">
                                            <span class="block text-[9px] font-semibold uppercase tracking-wider text-red-500/70 dark:text-red-400/60">Salida</span>
                                            <span class="font-mono text-xs font-bold text-red-600 dark:text-red-300">
                                                {{ formatTime(horario.detallesMap[nroDia].salHoraInicio) }}
                                                <span class="text-[9px] font-normal text-red-500/50">±{{ horario.detallesMap[nroDia].salTolerancia ?? 0 }}'</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <!-- Clases del Día -->
                                <div class="p-3 flex-1 flex flex-col gap-2 bg-card">
                                    <!-- Etiqueta de Clases -->
                                    <div class="flex items-center gap-1.5 mb-0.5">
                                        <BookOpen class="h-3.5 w-3.5 text-muted-foreground/60" />
                                        <span class="text-[10px] font-bold uppercase tracking-wider text-muted-foreground/70">
                                            {{ getCursosDia(horario, nroDia).length === 1 ? '1 clase' : `${getCursosDia(horario, nroDia).length} clases` }}
                                        </span>
                                    </div>

                                    <!-- Bloques de Cursos -->
                                    <div v-if="getCursosDia(horario, nroDia).length > 0" class="space-y-2">
                                        <div
                                            v-for="(carga, idx) in getCursosDia(horario, nroDia)"
                                            :key="carga.id"
                                            class="flex flex-col gap-1.5 rounded-lg border p-2.5 text-xs transition-all hover:shadow-md hover:scale-[1.02] duration-200"
                                            :class="getCourseColor(carga.horario_curso?.curso_id ?? idx)"
                                        >
                                            <!-- Hora de clase -->
                                            <div class="flex items-center justify-between gap-1 font-mono">
                                                <div class="flex items-center gap-1 font-bold">
                                                    <Clock class="h-3 w-3 opacity-60" />
                                                    <span>{{ formatTime(carga.horario_curso?.horaInicio) }}</span>
                                                    <span class="opacity-40">→</span>
                                                    <span>{{ formatTime(carga.horario_curso?.horaFin) }}</span>
                                                </div>
                                                <span
                                                    v-if="carga.horario_curso?.horaInicio && carga.horario_curso?.horaFin"
                                                    class="rounded bg-current/10 px-1 py-0.5 text-[9px] font-semibold"
                                                >
                                                    {{ calcMinutes(carga.horario_curso.horaInicio, carga.horario_curso.horaFin) }} min
                                                </span>
                                            </div>

                                            <!-- Nombre del curso -->
                                            <div class="flex items-start gap-1 font-bold leading-tight">
                                                <BookOpen class="h-3.5 w-3.5 shrink-0 opacity-70 mt-0.5" />
                                                <span class="break-words text-left">{{ carga.horario_curso?.curso?.nombre ?? 'Curso' }}</span>
                                            </div>

                                            <!-- Grado y sección -->
                                            <div
                                                v-if="carga.horario_curso?.seccion"
                                                class="flex items-center gap-1 text-[11px] opacity-75 mt-0.5"
                                            >
                                                <GraduationCap class="h-3.5 w-3.5 shrink-0" />
                                                <span class="truncate">
                                                    {{ carga.horario_curso.seccion.grado?.nombre ?? '' }}
                                                    {{ carga.horario_curso.seccion.nombre ? ` · ${carga.horario_curso.seccion.nombre}` : '' }}
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Sin cursos -->
                                    <div
                                        v-else
                                        class="flex-1 flex flex-col items-center justify-center text-center text-muted-foreground/50 py-6"
                                    >
                                        <BookOpen class="h-5 w-5 stroke-1 mb-1 opacity-60" />
                                        <span class="text-[11px] font-medium">Sin clases asignadas</span>
                                    </div>
                                </div>
                            </div>

                            <!-- Si no tiene jornada configurada para este día -->
                            <div v-else class="flex-1 flex flex-col items-center justify-center text-center p-4 min-h-[160px]">
                                <Calendar class="h-6 w-6 text-muted-foreground/30 stroke-1 mb-1" />
                                <span class="text-xs font-semibold text-muted-foreground/50">Día libre</span>
                                <span class="text-[10px] text-muted-foreground/40 mt-0.5">Sin jornada configurada</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
