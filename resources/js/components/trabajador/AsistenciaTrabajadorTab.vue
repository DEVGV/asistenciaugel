<script setup lang="ts">
import {
    AlertCircle,
    CalendarCheck2,
    CheckCircle2,
    ChevronLeft,
    ChevronRight,
    Clock,
    LogIn,
    LogOut,
    RefreshCw,
    Timer,
    XCircle,
} from 'lucide-vue-next';
import { computed, onMounted, ref, watch } from 'vue';
import { Button } from '@/components/ui/button';

// ── Tipos ──────────────────────────────────────────────────────────────────────
interface Marcacion {
    id: number;
    codigo: string;
    fechaMarcacion: string;
    tipo: 'E' | 'S';
    medioMarcacion: string | null;
    procesado: boolean | null;
    altaTrabajador_id: number | null;
}

interface DiaAsistencia {
    fecha: string;
    dia: string;
    diaNombre: string;
    entrada: Marcacion | null;
    salida: Marcacion | null;
    estado: 'puntual' | 'tardanza' | 'salida_temprana' | 'solo_entrada' | 'sin_marcas';
    esDiaLaboral: boolean;
}

interface ConsolidadoTurno {
    id: number;
    nroTurno: number;
    turno: { id: number; nombre: string } | null;
    [key: string]: any; // e1-e31, s1-s31, c1-c31
}

interface ConsolidadoData {
    asistencia_id: number;
    turnos: ConsolidadoTurno[];
}

// ── Props ──────────────────────────────────────────────────────────────────────
const props = defineProps<{
    trabajadorId: number;
}>();

// ── Estado ─────────────────────────────────────────────────────────────────────
const CURRENT_DATE = new Date();
const selectedAnio = ref<number>(CURRENT_DATE.getFullYear());
const selectedMes = ref<number>(CURRENT_DATE.getMonth() + 1);
const marcaciones = ref<Marcacion[]>([]);
const consolidado = ref<ConsolidadoData | null>(null);
const loading = ref(false);
const error = ref(false);

// ── Constantes ─────────────────────────────────────────────────────────────────
const MESES = [
    'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
    'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre',
];

// ── Navegación de mes ──────────────────────────────────────────────────────────
const mesLabel = computed(() => `${MESES[selectedMes.value - 1]} ${selectedAnio.value}`);

function mesAnterior() {
    if (selectedMes.value === 1) {
        selectedMes.value = 12;
        selectedAnio.value--;
    } else {
        selectedMes.value--;
    }
}

function mesSiguiente() {
    if (selectedMes.value === 12) {
        selectedMes.value = 1;
        selectedAnio.value++;
    } else {
        selectedMes.value++;
    }
}

// ── Carga de datos ─────────────────────────────────────────────────────────────
async function cargarDatos() {
    loading.value = true;
    error.value = false;

    try {
        const [resMarcaciones, resConsolidado] = await Promise.all([
            fetch(
                `/trabajadores/${props.trabajadorId}/marcaciones?anio=${selectedAnio.value}&mes=${selectedMes.value}`,
                { headers: { Accept: 'application/json' } },
            ),
            fetch(
                `/trabajadores/${props.trabajadorId}/asistencia-consolidada?anio=${selectedAnio.value}&mes=${selectedMes.value}`,
                { headers: { Accept: 'application/json' } },
            ),
        ]);

        if (!resMarcaciones.ok) throw new Error();

        const dataMarcaciones = await resMarcaciones.json();
        marcaciones.value = dataMarcaciones.data;

        const dataConsolidado = await resConsolidado.json();
        consolidado.value = dataConsolidado.data ?? null;
    } catch {
        error.value = true;
    } finally {
        loading.value = false;
    }
}

onMounted(() => cargarDatos());
watch([selectedAnio, selectedMes], () => cargarDatos());

// ── Consolidado: obtener sigla/entrada/salida del día ──────────────────────────
/**
 * Retorna el primer turno que tenga condición para el día dado (1-31).
 * Prioriza el turno con condición no vacía.
 */
function getConsolidadoDia(dia: number): { sigla: string; entrada: string | null; salida: string | null } | null {
    if (!consolidado.value) return null;
    for (const turno of consolidado.value.turnos) {
        const sigla: string = turno[`c${dia}`] ?? '';
        if (sigla) {
            return {
                sigla,
                entrada: turno[`e${dia}`] ?? null,
                salida: turno[`s${dia}`] ?? null,
            };
        }
    }
    return null;
}

// ── Colores de sigla (igual que ConsolidadoAsistenciaTab) ──────────────────────
function siglaColor(sigla: string): string {
    const map: Record<string, string> = {
        'A':   'bg-emerald-50 text-emerald-700 ring-emerald-700/20 dark:bg-emerald-950/30 dark:text-emerald-400',
        'T':   'bg-amber-50 text-amber-700 ring-amber-700/20 dark:bg-amber-950/30 dark:text-amber-400',
        'F':   'bg-red-50 text-red-700 ring-red-700/20 dark:bg-red-950/30 dark:text-red-400',
        'I':   'bg-red-50 text-red-700 ring-red-700/20 dark:bg-red-950/30 dark:text-red-400',
        'E':   'bg-orange-50 text-orange-700 ring-orange-700/20 dark:bg-orange-950/30 dark:text-orange-400',
        'DL':  'bg-gray-50 text-gray-600 ring-gray-600/10 dark:bg-gray-950/30 dark:text-gray-400',
        '3T':  'bg-red-50 text-red-700 ring-red-700/20 dark:bg-red-950/30 dark:text-red-400',
        '3E':  'bg-red-50 text-red-700 ring-red-700/20 dark:bg-red-950/30 dark:text-red-400',
        'FER': 'bg-purple-50 text-purple-700 ring-purple-700/20 dark:bg-purple-950/30 dark:text-purple-400',
        'O':   'bg-pink-50 text-pink-700 ring-pink-700/20 dark:bg-pink-950/30 dark:text-pink-400',
        'J':   'bg-sky-50 text-sky-700 ring-sky-700/20 dark:bg-sky-950/30 dark:text-sky-400',
        'V':   'bg-teal-50 text-teal-700 ring-teal-700/20 dark:bg-teal-950/30 dark:text-teal-400',
        'L':   'bg-indigo-50 text-indigo-700 ring-indigo-700/20 dark:bg-indigo-950/30 dark:text-indigo-400',
        'P':   'bg-cyan-50 text-cyan-700 ring-cyan-700/20 dark:bg-cyan-950/30 dark:text-cyan-400',
    };
    return map[sigla] ?? 'bg-blue-50 text-blue-700 ring-blue-700/10 dark:bg-blue-950/30 dark:text-blue-400';
}

/** Clase de fondo de celda según sigla consolidada */
function siglaCeldaClass(sigla: string): string {
    const map: Record<string, string> = {
        'A':   'bg-emerald-50/40',
        'T':   'bg-amber-50/40',
        'F':   'bg-red-50/30',
        'I':   'bg-red-50/30',
        'E':   'bg-orange-50/40',
        '3T':  'bg-red-50/30',
        '3E':  'bg-red-50/30',
        'FER': 'bg-purple-50/30',
        'O':   'bg-pink-50/30',
        'J':   'bg-sky-50/30',
        'V':   'bg-teal-50/30',
        'L':   'bg-indigo-50/30',
        'P':   'bg-cyan-50/30',
    };
    return map[sigla] ?? '';
}

// ── Agrupación por día ──────────────────────────────────────────────────────────
const diasDelMes = computed<DiaAsistencia[]>(() => {
    const anio = selectedAnio.value;
    const mes = selectedMes.value;
    const diasEnMes = new Date(anio, mes, 0).getDate();
    const DIAS_LABORABLES = [1, 2, 3, 4, 5];
    const NOMBRES_DIA = ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'];
    const NOMBRES_DIA_LARGO = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];

    const resultado: DiaAsistencia[] = [];

    for (let dia = 1; dia <= diasEnMes; dia++) {
        const fecha = new Date(anio, mes - 1, dia);
        const diaSemana = fecha.getDay();
        const esDiaLaboral = DIAS_LABORABLES.includes(diaSemana);
        const fechaStr = `${anio}-${String(mes).padStart(2, '0')}-${String(dia).padStart(2, '0')}`;

        const marcasDia = marcaciones.value.filter((m) => {
            const f = new Date(m.fechaMarcacion);
            return f.getFullYear() === anio && f.getMonth() + 1 === mes && f.getDate() === dia;
        });

        const entrada = marcasDia.find((m) => m.tipo === 'E') ?? null;
        const salida = marcasDia.find((m) => m.tipo === 'S') ?? null;

        let estado: DiaAsistencia['estado'] = 'sin_marcas';
        if (esDiaLaboral && entrada) {
            const horaEntrada = new Date(entrada.fechaMarcacion);
            const minutosDelta = horaEntrada.getMinutes() + horaEntrada.getHours() * 60;
            const horaEsperadaMin = 8 * 60;

            if (!salida) {
                estado = 'solo_entrada';
            } else {
                const horaSalida = new Date(salida.fechaMarcacion);
                const salidaMin = horaSalida.getMinutes() + horaSalida.getHours() * 60;
                const isLate = (minutosDelta - horaEsperadaMin) > 10;
                const isEarlyOut = salidaMin < (11 * 60 + 20);

                if (isLate) {
                    estado = 'tardanza';
                } else if (isEarlyOut) {
                    estado = 'salida_temprana';
                } else {
                    estado = 'puntual';
                }
            }
        }

        resultado.push({
            fecha: fechaStr,
            dia: String(dia),
            diaNombre: NOMBRES_DIA[diaSemana],
            entrada,
            salida,
            estado,
            esDiaLaboral,
        });
    }

    return resultado;
});

// ── Días para la cuadrícula del calendario ──────────────────────────────────────
const diasCalendario = computed(() => {
    const anio = selectedAnio.value;
    const mes = selectedMes.value;
    const firstDayDate = new Date(anio, mes - 1, 1);
    const firstDayOfWeek = firstDayDate.getDay();
    const diasEnMes = new Date(anio, mes, 0).getDate();

    const DIAS_LABORABLES = [1, 2, 3, 4, 5];
    const NOMBRES_DIA = ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'];

    const totalCells = Math.ceil((firstDayOfWeek + diasEnMes) / 7) * 7;
    const resultado = [];

    for (let i = 0; i < totalCells; i++) {
        const offset = i - firstDayOfWeek;
        const fecha = new Date(anio, mes - 1, 1 + offset);

        const fAnio = fecha.getFullYear();
        const fMes = fecha.getMonth() + 1;
        const fDia = fecha.getDate();
        const diaSemana = fecha.getDay();
        const esDiaLaboral = DIAS_LABORABLES.includes(diaSemana);
        const fechaStr = `${fAnio}-${String(fMes).padStart(2, '0')}-${String(fDia).padStart(2, '0')}`;
        const esMesActual = fAnio === anio && fMes === mes;

        // Marcaciones brutas
        const marcasDia = marcaciones.value.filter((m) => {
            const f = new Date(m.fechaMarcacion);
            return f.getFullYear() === fAnio && f.getMonth() + 1 === fMes && f.getDate() === fDia;
        });

        const entrada = marcasDia.find((m) => m.tipo === 'E') ?? null;
        const salida = marcasDia.find((m) => m.tipo === 'S') ?? null;

        // Consolidado para este día
        const consol = esMesActual ? getConsolidadoDia(fDia) : null;

        let estado: DiaAsistencia['estado'] = 'sin_marcas';
        if (esDiaLaboral && entrada) {
            const horaEntrada = new Date(entrada.fechaMarcacion);
            const minutosDelta = horaEntrada.getMinutes() + horaEntrada.getHours() * 60;
            const horaEsperadaMin = 8 * 60;

            if (!salida) {
                estado = 'solo_entrada';
            } else {
                const horaSalida = new Date(salida.fechaMarcacion);
                const salidaMin = horaSalida.getMinutes() + horaSalida.getHours() * 60;
                const isLate = (minutosDelta - horaEsperadaMin) > 10;
                const isEarlyOut = salidaMin < (11 * 60 + 20);

                if (isLate) {
                    estado = 'tardanza';
                } else if (isEarlyOut) {
                    estado = 'salida_temprana';
                } else {
                    estado = 'puntual';
                }
            }
        }

        const hoy = new Date();
        const esHoy = hoy.getFullYear() === fAnio && hoy.getMonth() + 1 === fMes && hoy.getDate() === fDia;

        resultado.push({
            fecha: fechaStr,
            dia: String(fDia),
            numeroDia: fDia,
            diaNombre: NOMBRES_DIA[diaSemana],
            entrada,
            salida,
            estado,
            esDiaLaboral,
            esMesActual,
            esHoy,
            consol, // datos consolidados (sigla, entrada, salida) o null
        });
    }

    return resultado;
});

function isPast(fechaStr: string): boolean {
    const hoy = new Date();
    const hoyMidnight = new Date(hoy.getFullYear(), hoy.getMonth(), hoy.getDate());
    const [anio, mes, dia] = fechaStr.split('-').map(Number);
    const dateVal = new Date(anio, mes - 1, dia);
    return dateVal <= hoyMidnight;
}

function formatDiaLabel(dia: { dia: string; fecha: string }): string {
    if (dia.dia === '1') {
        const [, mes] = dia.fecha.split('-').map(Number);
        const mesNombreCorto = MESES[mes - 1].substring(0, 3);
        return `1 ${mesNombreCorto}.`;
    }
    return dia.dia;
}

// ── Resumen estadístico ────────────────────────────────────────────────────────
const resumen = computed(() => {
    const diasLab = diasDelMes.value.filter((d) => d.esDiaLaboral);

    const hoy = new Date();
    const isCurrentMonth = selectedAnio.value === hoy.getFullYear() && selectedMes.value === hoy.getMonth() + 1;
    const diasContar = isCurrentMonth
        ? diasLab.filter((d) => new Date(d.fecha) <= hoy)
        : diasLab;

    return {
        total: diasContar.length,
        puntuales: diasContar.filter((d) => d.estado === 'puntual').length,
        tardanzas: diasContar.filter((d) => d.estado === 'tardanza').length,
        salidaTemprana: diasContar.filter((d) => d.estado === 'salida_temprana').length,
        soloEntrada: diasContar.filter((d) => d.estado === 'solo_entrada').length,
        sinMarcas: diasContar.filter((d) => d.estado === 'sin_marcas').length,
    };
});

// ── Helpers ─────────────────────────────────────────────────────────────────────
function formatHora(hora: string | null): string {
    if (!hora) return '';
    // Si ya es HH:MM o HH:MM:SS (de t_asistenciaMesTrabajador)
    if (!hora.includes('T') && !hora.includes(' ')) {
        return hora.substring(0, 5);
    }
    // Si es ISO datetime
    const d = new Date(hora);
    return d.toLocaleTimeString('es-PE', { hour: '2-digit', minute: '2-digit', hour12: false });
}

interface EstadoConfig {
    label: string;
    rowClass: string;
    badge: string;
}

function estadoConfig(dia: DiaAsistencia): EstadoConfig {
    if (!dia.esDiaLaboral) {
        return { label: '', rowClass: 'bg-muted/10', badge: '' };
    }

    const hoy = new Date();
    const fechaDia = new Date(dia.fecha);
    if (fechaDia > hoy) {
        return { label: '', rowClass: '', badge: '' };
    }

    switch (dia.estado) {
        case 'puntual':
            return {
                label: 'Puntual',
                rowClass: 'bg-emerald-50/40 dark:bg-emerald-950/10',
                badge: 'bg-emerald-100 text-emerald-700 dark:bg-emerald-950/40 dark:text-emerald-300',
            };
        case 'tardanza':
            return {
                label: 'Tardanza',
                rowClass: 'bg-amber-50/40 dark:bg-amber-950/10',
                badge: 'bg-amber-100 text-amber-700 dark:bg-amber-950/40 dark:text-amber-300',
            };
        case 'salida_temprana':
            return {
                label: 'Sal. Temprana',
                rowClass: 'bg-blue-50/40 dark:bg-blue-950/10',
                badge: 'bg-blue-100 text-blue-700 dark:bg-blue-950/40 dark:text-blue-300',
            };
        case 'solo_entrada':
            return {
                label: 'Sin salida',
                rowClass: 'bg-orange-50/40 dark:bg-orange-950/10',
                badge: 'bg-orange-100 text-orange-700 dark:bg-orange-950/40 dark:text-orange-300',
            };
        case 'sin_marcas':
            return {
                label: 'No asistió',
                rowClass: 'bg-red-50/30 dark:bg-red-950/10',
                badge: 'bg-red-100 text-red-700 dark:bg-red-950/40 dark:text-red-300',
            };
        default:
            return { label: '', rowClass: '', badge: '' };
    }
}
</script>

<template>
    <div class="flex flex-col gap-5">
        <!-- Cabecera -->
        <div class="flex flex-wrap items-center justify-between gap-3">
            <div class="flex items-center gap-2">
                <CalendarCheck2 class="h-5 w-5 text-primary" />
                <h2 class="text-base font-bold">Registro de Asistencia</h2>
                <!-- Indicador de consolidado -->
                <span
                    v-if="consolidado"
                    class="inline-flex items-center gap-1 rounded-full bg-indigo-100 px-2 py-0.5 text-[10px] font-semibold text-indigo-700 ring-1 ring-indigo-700/20 dark:bg-indigo-950/30 dark:text-indigo-400"
                >
                    Consolidado
                </span>
            </div>

            <div class="flex items-center gap-2">
                <!-- Navegador de mes -->
                <div class="flex items-center gap-1 rounded-lg border bg-background px-1 py-0.5">
                    <button
                        class="flex h-7 w-7 items-center justify-center rounded-md text-muted-foreground transition-colors hover:bg-muted hover:text-foreground"
                        @click="mesAnterior"
                    >
                        <ChevronLeft class="h-4 w-4" />
                    </button>
                    <span class="min-w-36 text-center text-sm font-semibold">{{ mesLabel }}</span>
                    <button
                        class="flex h-7 w-7 items-center justify-center rounded-md text-muted-foreground transition-colors hover:bg-muted hover:text-foreground"
                        @click="mesSiguiente"
                    >
                        <ChevronRight class="h-4 w-4" />
                    </button>
                </div>

                <!-- Recargar -->
                <Button
                    variant="ghost"
                    size="icon"
                    class="h-8 w-8"
                    title="Recargar"
                    :disabled="loading"
                    @click="cargarDatos"
                >
                    <RefreshCw class="h-4 w-4" :class="{ 'animate-spin': loading }" />
                </Button>
            </div>
        </div>

        <!-- Tarjetas resumen -->
        <div class="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-6">
            <div class="flex flex-col items-center gap-1 rounded-xl border bg-card p-3 text-center shadow-xs">
                <span class="text-xs text-muted-foreground">Días laboral.</span>
                <span class="text-2xl font-bold text-foreground">{{ resumen.total }}</span>
            </div>
            <div class="flex flex-col items-center gap-1 rounded-xl border border-emerald-200 bg-emerald-50 p-3 text-center dark:border-emerald-900 dark:bg-emerald-950/20">
                <CheckCircle2 class="h-4 w-4 text-emerald-500" />
                <span class="text-xs text-emerald-600 dark:text-emerald-400">Puntual</span>
                <span class="text-2xl font-bold text-emerald-700 dark:text-emerald-300">{{ resumen.puntuales }}</span>
            </div>
            <div class="flex flex-col items-center gap-1 rounded-xl border border-amber-200 bg-amber-50 p-3 text-center dark:border-amber-900 dark:bg-amber-950/20">
                <Timer class="h-4 w-4 text-amber-500" />
                <span class="text-xs text-amber-600 dark:text-amber-400">Tardanza</span>
                <span class="text-2xl font-bold text-amber-700 dark:text-amber-300">{{ resumen.tardanzas }}</span>
            </div>
            <div class="flex flex-col items-center gap-1 rounded-xl border border-blue-200 bg-blue-50 p-3 text-center dark:border-blue-900 dark:bg-blue-950/20">
                <LogOut class="h-4 w-4 text-blue-500" />
                <span class="text-xs text-blue-600 dark:text-blue-400">Sal. Temprana</span>
                <span class="text-2xl font-bold text-blue-700 dark:text-blue-300">{{ resumen.salidaTemprana }}</span>
            </div>
            <div class="flex flex-col items-center gap-1 rounded-xl border border-orange-200 bg-orange-50 p-3 text-center dark:border-orange-900 dark:bg-orange-950/20">
                <Clock class="h-4 w-4 text-orange-500" />
                <span class="text-xs text-orange-600 dark:text-orange-400">Sin salida</span>
                <span class="text-2xl font-bold text-orange-700 dark:text-orange-300">{{ resumen.soloEntrada }}</span>
            </div>
            <div class="flex flex-col items-center gap-1 rounded-xl border border-red-200 bg-red-50 p-3 text-center dark:border-red-900 dark:bg-red-950/20">
                <XCircle class="h-4 w-4 text-red-500" />
                <span class="text-xs text-red-600 dark:text-red-400">No asistió</span>
                <span class="text-2xl font-bold text-red-700 dark:text-red-300">{{ resumen.sinMarcas }}</span>
            </div>
        </div>

        <!-- Error -->
        <div
            v-if="error"
            class="flex items-center gap-2 rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700 dark:border-red-900 dark:bg-red-950/20 dark:text-red-300"
        >
            <AlertCircle class="h-4 w-4 shrink-0" />
            Error al cargar las marcaciones. Intente nuevamente.
        </div>

        <!-- Skeleton -->
        <div v-else-if="loading" class="space-y-4">
            <div class="grid grid-cols-7 gap-2">
                <div v-for="i in 7" :key="i" class="h-4 animate-pulse rounded bg-muted/40" />
            </div>
            <div class="grid grid-cols-7 border border-muted/50 rounded-lg overflow-hidden bg-background">
                <div
                    v-for="i in 35"
                    :key="i"
                    class="border-b border-r border-muted/50 p-2 min-h-[110px] animate-pulse flex flex-col justify-between"
                >
                    <div class="flex justify-between">
                        <div />
                        <div class="h-4 w-4 rounded-full bg-muted/40" />
                    </div>
                    <div class="space-y-2 grow mt-4">
                        <div class="h-4 w-5/6 rounded bg-muted/40" />
                        <div class="h-4 w-2/3 rounded bg-muted/40" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Calendario Grid -->
        <div v-else class="flex flex-col gap-3">
            <!-- Días de la semana headers -->
            <div class="grid grid-cols-7 text-center border-b border-muted pb-2 bg-muted/10 pt-2 rounded-t-lg">
                <div
                    v-for="dia in ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado']"
                    :key="dia"
                    class="text-xs font-semibold text-muted-foreground uppercase tracking-wider hidden md:block"
                >
                    {{ dia }}
                </div>
                <div
                    v-for="dia in ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb']"
                    :key="dia"
                    class="text-xs font-semibold text-muted-foreground uppercase tracking-wider md:hidden"
                >
                    {{ dia }}
                </div>
            </div>

            <!-- Grid de días -->
            <div class="grid grid-cols-7 border-t border-l border-muted/50 rounded-b-lg overflow-hidden bg-background shadow-xs">
                <div
                    v-for="dia in diasCalendario"
                    :key="dia.fecha"
                    class="border-b border-r border-muted/50 p-2 min-h-[110px] flex flex-col justify-between transition-colors relative group hover:bg-muted/5"
                    :class="[
                        !dia.esMesActual ? 'bg-muted/15 opacity-60' : '',
                        dia.esMesActual && dia.consol
                            ? siglaCeldaClass(dia.consol.sigla)
                            : (dia.esMesActual ? estadoConfig(dia as any).rowClass : ''),
                        !dia.esDiaLaboral && dia.esMesActual ? 'bg-muted/5 text-muted-foreground/60' : '',
                    ]"
                >
                    <!-- Day Header -->
                    <div class="flex items-center justify-between">
                        <div>
                            <span
                                v-if="!dia.esDiaLaboral && dia.esMesActual"
                                class="text-[9px] font-semibold text-muted-foreground/40 uppercase tracking-wider"
                            >
                                Finde
                            </span>
                        </div>
                        <!-- Day Number -->
                        <div
                            :class="[
                                dia.esHoy
                                    ? 'flex items-center justify-center w-6 h-6 rounded-full bg-primary text-primary-foreground text-xs font-bold shadow-xs'
                                    : 'text-xs font-semibold text-muted-foreground',
                                dia.esMesActual && !dia.esHoy ? 'text-foreground font-bold' : '',
                            ]"
                        >
                            {{ formatDiaLabel(dia) }}
                        </div>
                    </div>

                    <!-- Day Body -->
                    <div class="mt-2 flex flex-col gap-1 grow justify-center">
                        <template v-if="dia.esMesActual">

                            <!-- ── MODO CONSOLIDADO ─────────────────────────── -->
                            <template v-if="dia.consol">
                                <!-- Sigla consolidada -->
                                <span
                                    :class="[
                                        'inline-flex items-center justify-center rounded px-1.5 py-0.5 text-[11px] font-bold ring-1 w-full',
                                        siglaColor(dia.consol.sigla),
                                    ]"
                                >
                                    {{ dia.consol.sigla }}
                                </span>

                                <!-- Hora entrada del consolidado -->
                                <div
                                    v-if="dia.consol.entrada"
                                    class="flex items-center gap-1 rounded bg-emerald-50 text-emerald-800 dark:bg-emerald-950/40 dark:text-emerald-300 border border-emerald-100 dark:border-emerald-900/30 px-1.5 py-0.5 text-[10px] font-medium font-mono"
                                    title="Entrada"
                                >
                                    <LogIn class="h-3 w-3 shrink-0 text-emerald-600" />
                                    <span>{{ formatHora(dia.consol.entrada) }}</span>
                                </div>

                                <!-- Hora salida del consolidado -->
                                <div
                                    v-if="dia.consol.salida"
                                    class="flex items-center gap-1 rounded bg-blue-50 text-blue-800 dark:bg-blue-950/40 dark:text-blue-300 border border-blue-100 dark:border-blue-900/30 px-1.5 py-0.5 text-[10px] font-medium font-mono"
                                    title="Salida"
                                >
                                    <LogOut class="h-3 w-3 shrink-0 text-blue-600" />
                                    <span>{{ formatHora(dia.consol.salida) }}</span>
                                </div>
                            </template>

                            <!-- ── MODO MARCACIONES BRUTAS ─────────────────── -->
                            <template v-else>
                                <!-- Entrada -->
                                <div
                                    v-if="dia.entrada"
                                    class="flex items-center gap-1 rounded bg-emerald-50 text-emerald-800 dark:bg-emerald-950/40 dark:text-emerald-300 border border-emerald-100 dark:border-emerald-900/30 px-1.5 py-0.5 text-[10px] sm:text-[11px] font-medium font-mono"
                                    title="Entrada"
                                >
                                    <LogIn class="h-3 w-3 shrink-0 text-emerald-600 dark:text-emerald-400" />
                                    <span>{{ formatHora(dia.entrada.fechaMarcacion) }}</span>
                                </div>

                                <!-- Salida -->
                                <div
                                    v-if="dia.salida"
                                    class="flex items-center gap-1 rounded bg-blue-50 text-blue-800 dark:bg-blue-950/40 dark:text-blue-300 border border-blue-100 dark:border-blue-900/30 px-1.5 py-0.5 text-[10px] sm:text-[11px] font-medium font-mono"
                                    title="Salida"
                                >
                                    <LogOut class="h-3 w-3 shrink-0 text-blue-600 dark:text-blue-400" />
                                    <span>{{ formatHora(dia.salida.fechaMarcacion) }}</span>
                                </div>

                                <!-- Estados sin marcas (días pasados laborables) -->
                                <template v-if="dia.esDiaLaboral && isPast(dia.fecha)">
                                    <div
                                        v-if="dia.estado === 'sin_marcas'"
                                        class="flex items-center gap-1 rounded bg-red-50 text-red-800 dark:bg-red-950/40 dark:text-red-300 border border-red-100 dark:border-red-900/30 px-1.5 py-0.5 text-[10px] sm:text-[11px] font-medium"
                                    >
                                        <XCircle class="h-3 w-3 shrink-0 text-red-600 dark:text-red-400" />
                                        <span>No asistió</span>
                                    </div>
                                    <div
                                        v-else-if="dia.estado === 'solo_entrada'"
                                        class="flex items-center gap-1 rounded bg-orange-50 text-orange-800 dark:bg-orange-950/40 dark:text-orange-300 border border-orange-100 dark:border-orange-900/30 px-1.5 py-0.5 text-[10px] sm:text-[11px] font-medium"
                                    >
                                        <Clock class="h-3 w-3 shrink-0 text-orange-600 dark:text-orange-400" />
                                        <span>Sin salida</span>
                                    </div>
                                </template>
                            </template>

                        </template>
                    </div>

                    <!-- Day Footer: label de estado (solo sin consolidado) -->
                    <div class="mt-1 flex items-center justify-between text-[10px] text-muted-foreground/80">
                        <template v-if="dia.esMesActual">
                            <!-- Sin consolidado: mostrar label calculado -->
                            <span
                                v-if="!dia.consol && dia.esDiaLaboral && isPast(dia.fecha) && dia.estado !== 'sin_marcas' && dia.estado !== 'solo_entrada'"
                                class="font-medium"
                                :class="{
                                    'text-emerald-600 dark:text-emerald-400': dia.estado === 'puntual',
                                    'text-amber-600 dark:text-amber-400': dia.estado === 'tardanza',
                                    'text-blue-600 dark:text-blue-400': dia.estado === 'salida_temprana',
                                }"
                            >
                                {{ estadoConfig(dia as any).label }}
                            </span>
                            <span v-else-if="!dia.esDiaLaboral" class="text-[9px] opacity-60">
                                No laboral
                            </span>
                        </template>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
