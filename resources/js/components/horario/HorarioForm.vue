<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue';
import SearchSelect from '@/components/shared/SearchSelect.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import type { HorarioCurso } from '@/types/models/horario';
import type { CursoIE } from '@/types/models/institucion-educativa';

const props = defineProps<{
    seccionId: number;
    anio: number;
    cursos: CursoIE[];
    horarioCurso?: HorarioCurso | null;
}>();

const emit = defineEmits<{
    (e: 'submit', data: any): void;
    (e: 'cancel'): void;
}>();

const cursoId = ref<number | null>(null);
const nroDia = ref<number>(1);
const horaInicio = ref<string>('08:00');
const horaFin = ref<string>('09:30');

const DAYS = [
    { nro: 1, label: 'Lunes', char: 'L' },
    { nro: 2, label: 'Martes', char: 'M' },
    { nro: 3, label: 'Miércoles', char: 'X' },
    { nro: 4, label: 'Jueves', char: 'J' },
    { nro: 5, label: 'Viernes', char: 'V' },
    { nro: 6, label: 'Sábado', char: 'S' },
    { nro: 7, label: 'Domingo', char: 'D' },
];

// Adaptar cursos al formato que espera SearchSelect
const cursosItems = computed(() =>
    props.cursos.map((c) => ({
        id: c.id,
        label: c.nombre,
    })),
);

onMounted(() => resetForm());
watch(() => props.horarioCurso, () => resetForm());

function resetForm() {
    if (props.horarioCurso) {
        cursoId.value = props.horarioCurso.curso_id;
        nroDia.value = props.horarioCurso.nroDia;
        horaInicio.value = props.horarioCurso.horaInicio.substring(0, 5);
        horaFin.value = props.horarioCurso.horaFin.substring(0, 5);
    } else {
        cursoId.value = null;
        nroDia.value = 1;
        horaInicio.value = '08:00';
        horaFin.value = '09:30';
    }
}

function getDiaSemanaChar(dayNum: number): string {
    return DAYS.find((d) => d.nro === dayNum)?.char ?? 'L';
}

function handleSubmit() {
    if (!cursoId.value) {
return;
}

    emit('submit', {
        id: props.horarioCurso?.id,
        anio: props.anio,
        seccion_id: props.seccionId,
        curso_id: cursoId.value,
        nroDia: nroDia.value,
        diaSemana: getDiaSemanaChar(nroDia.value),
        horaInicio: horaInicio.value,
        horaFin: horaFin.value,
    });
}
</script>

<template>
    <div class="space-y-5">
        <!-- Curso -->
        <div class="space-y-1.5">
            <Label class="text-sm font-semibold">Curso</Label>
            <SearchSelect
                v-model="cursoId"
                :items="cursosItems"
                placeholder="Seleccione un curso..."
            />
            <p v-if="cursos.length === 0" class="text-xs font-medium text-amber-500">
                No hay cursos registrados para esta IE. Regístrelos en el módulo de IE primero.
            </p>
        </div>

        <!-- Día de la semana -->
        <div class="space-y-1.5">
            <Label class="text-sm font-semibold">Día de la Semana</Label>
            <div class="grid grid-cols-4 gap-2 sm:grid-cols-7">
                <button
                    v-for="day in DAYS"
                    :key="day.nro"
                    type="button"
                    class="rounded-lg border px-2 py-2 text-sm font-medium transition-all duration-150"
                    :class="[
                        nroDia === day.nro
                            ? 'border-primary bg-primary text-primary-foreground shadow-xs'
                            : 'bg-background text-foreground hover:bg-muted',
                    ]"
                    @click="nroDia = day.nro"
                >
                    {{ day.label }}
                </button>
            </div>
        </div>

        <!-- Horario -->
        <div class="grid grid-cols-2 gap-4">
            <div class="space-y-1.5">
                <Label for="horaInicio" class="text-sm font-semibold">Hora de Inicio</Label>
                <Input id="horaInicio" type="time" v-model="horaInicio" class="w-full" />
            </div>
            <div class="space-y-1.5">
                <Label for="horaFin" class="text-sm font-semibold">Hora de Fin</Label>
                <Input id="horaFin" type="time" v-model="horaFin" class="w-full" />
            </div>
        </div>

        <!-- Footer -->
        <div class="flex justify-end gap-2 border-t border-dashed pt-4">
            <Button type="button" variant="outline" @click="emit('cancel')">Cancelar</Button>
            <Button type="button" :disabled="!cursoId" @click="handleSubmit">
                {{ horarioCurso ? 'Actualizar Horario' : 'Crear Horario' }}
            </Button>
        </div>
    </div>
</template>
