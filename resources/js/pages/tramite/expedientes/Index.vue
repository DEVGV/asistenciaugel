<script setup lang="ts">
import { Head, router } from '@inertiajs/vue3';
import { Eye, FileX, Plus, Search } from 'lucide-vue-next';
import { ref, watch } from 'vue';
import ExpedienteDetailModal from '@/components/tramite/ExpedienteDetailModal.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table';
import { TIPO_EXPEDIENTE_LABELS, estadoLabel, type Expediente, type TipoExpediente } from '@/types/models/tramite';
import type { PaginatedResponse } from '@/types/models/trabajador';

defineOptions({
    layout: {
        breadcrumbs: [{ title: 'Expedientes', href: '/expedientes' }],
    },
});

const props = defineProps<{
    expedientes: PaginatedResponse<Expediente>;
    filters: { search?: string; tipo?: string; anio?: string };
}>();

const search = ref(props.filters.search ?? '');
const tipo   = ref(props.filters.tipo ?? '');
const anio   = ref(props.filters.anio ?? '');

const showDetailModal = ref(false);
const selectedExpedienteId = ref<number | null>(null);

function openDetail(exp: Expediente) {
    selectedExpedienteId.value = exp.id;
    showDetailModal.value = true;
}

const TIPOS: { value: string; label: string }[] = [
    { value: '', label: 'Todos los tipos' },
    ...( Object.keys(TIPO_EXPEDIENTE_LABELS) as TipoExpediente[] ).map((k) => ({
        value: k,
        label: TIPO_EXPEDIENTE_LABELS[k],
    })),
];

let debounce: ReturnType<typeof setTimeout>;
watch([search, tipo, anio], () => {
    clearTimeout(debounce);
    debounce = setTimeout(() => {
        router.get(
            '/expedientes',
            { search: search.value || undefined, tipo: tipo.value || undefined, anio: anio.value || undefined },
            { preserveState: true, replace: true },
        );
    }, 300);
});

const ESTADO_CLASES: Record<string, string> = {
    '1': 'bg-amber-100 text-amber-700 ring-1 ring-amber-200 dark:bg-amber-950/30 dark:text-amber-300',
    '2': 'bg-sky-100 text-sky-700 ring-1 ring-sky-200 dark:bg-sky-950/30 dark:text-sky-300',
    '3': 'bg-red-100 text-red-700 ring-1 ring-red-200 dark:bg-red-950/30 dark:text-red-300',
    '4': 'bg-blue-100 text-blue-700 ring-1 ring-blue-200 dark:bg-blue-950/30 dark:text-blue-300',
    '5': 'bg-muted text-muted-foreground ring-1 ring-border',
};

function estadoClase(exp: Expediente): string {
    return ESTADO_CLASES[exp.estado?.codigo ?? ''] ?? ESTADO_CLASES['1'];
}

function nombreTrabajador(exp: Expediente): string {
    const p = exp.trabajador?.persona;
    if (!p) return `#${exp.trabajador_id}`;
    return [p.paterno, p.materno, p.nombre].filter(Boolean).join(' ');
}
</script>

<template>
    <Head title="Expedientes" />

    <div class="space-y-4 p-6">
        <!-- Encabezado -->
        <div class="flex flex-wrap items-center justify-between gap-3">
            <h1 class="text-xl font-semibold">Expedientes</h1>
            <Button as="a" href="/expedientes/create">
                <Plus class="mr-2 h-4 w-4" />
                Nuevo expediente
            </Button>
        </div>

        <!-- Filtros -->
        <div class="flex flex-wrap gap-3">
            <div class="relative">
                <Search class="absolute top-2.5 left-2.5 h-4 w-4 text-muted-foreground" />
                <Input v-model="search" class="pl-8 w-64" placeholder="Buscar trabajador…" />
            </div>
            <select
                v-model="tipo"
                class="flex h-9 rounded-md border border-input bg-background px-3 py-1 text-sm shadow-xs focus-visible:ring-1 focus-visible:ring-ring focus-visible:outline-none"
            >
                <option v-for="t in TIPOS" :key="t.value" :value="t.value">{{ t.label }}</option>
            </select>
            <Input v-model="anio" type="number" class="w-24" placeholder="Año" />
        </div>

        <!-- Tabla -->
        <div class="rounded-lg border">
            <Table>
                <TableHeader>
                    <TableRow>
                        <TableHead>Código</TableHead>
                        <TableHead>Tipo</TableHead>
                        <TableHead>Trabajador</TableHead>
                        <TableHead>Asunto</TableHead>
                        <TableHead>Fecha</TableHead>
                        <TableHead>Estado</TableHead>
                        <TableHead class="w-16" />
                    </TableRow>
                </TableHeader>
                <TableBody>
                    <TableRow v-if="props.expedientes.data.length === 0">
                        <TableCell colspan="7" class="py-12 text-center text-muted-foreground">
                            <FileX class="mx-auto mb-2 h-8 w-8 opacity-40" />
                            No hay expedientes registrados.
                        </TableCell>
                    </TableRow>
                    <TableRow v-for="exp in props.expedientes.data" :key="exp.id">
                        <TableCell class="font-mono text-xs font-semibold text-primary">
                            {{ exp.codigo ?? `EXP-${exp.id}` }}
                        </TableCell>
                        <TableCell class="text-sm">
                            {{ exp.tipoExpediente ? TIPO_EXPEDIENTE_LABELS[exp.tipoExpediente] : '—' }}
                        </TableCell>
                        <TableCell class="text-sm">{{ nombreTrabajador(exp) }}</TableCell>
                        <TableCell class="max-w-xs truncate text-sm">{{ exp.asunto }}</TableCell>
                        <TableCell class="text-sm">{{ exp.fecha }}</TableCell>
                        <TableCell>
                            <span
                                class="inline-flex items-center rounded-full px-2.5 py-0.5 text-[11px] font-semibold"
                                :class="estadoClase(exp)"
                            >
                                {{ estadoLabel(exp) }}
                            </span>
                        </TableCell>
                        <TableCell>
                            <Button variant="ghost" size="sm" title="Ver detalle" @click="openDetail(exp)">
                                <Eye class="h-4 w-4" />
                            </Button>
                        </TableCell>
                    </TableRow>
                </TableBody>
            </Table>
        </div>

        <!-- Paginación -->
        <div v-if="props.expedientes.last_page > 1" class="flex justify-end gap-1">
            <Button
                v-for="link in props.expedientes.links"
                :key="link.label"
                variant="outline"
                size="sm"
                :disabled="!link.url"
                :class="{ 'bg-primary text-primary-foreground': link.active }"
                @click="link.url && router.get(link.url)"
                v-html="link.label"
            />
        </div>
    </div>

    <!-- Modal detalle expediente -->
    <ExpedienteDetailModal
        v-model:show="showDetailModal"
        :expediente-id="selectedExpedienteId"
        @updated="router.reload({ only: ['expedientes'] })"
    />
</template>
