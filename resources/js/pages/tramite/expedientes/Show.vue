<script setup lang="ts">
import { Head, router } from '@inertiajs/vue3';
import { Download, FileText, Pencil } from 'lucide-vue-next';
import { Button } from '@/components/ui/button';
import { TIPO_EXPEDIENTE_LABELS, type Expediente } from '@/types/models/tramite';

defineOptions({
    layout: {
        breadcrumbs: [
            { title: 'Expedientes', href: '/expedientes' },
            { title: 'Detalle', href: '#' },
        ],
    },
});

const props = defineProps<{ expediente: Expediente }>();

const ESTADO_CLASES: Record<string, string> = {
    '1': 'bg-amber-100 text-amber-700 ring-1 ring-amber-200',
    '2': 'bg-emerald-100 text-emerald-700 ring-1 ring-emerald-200',
    '3': 'bg-red-100 text-red-700 ring-1 ring-red-200',
    '4': 'bg-blue-100 text-blue-700 ring-1 ring-blue-200',
    '5': 'bg-muted text-muted-foreground ring-1 ring-border',
};

function estadoClase(): string {
    return ESTADO_CLASES[props.expediente.estado?.codigo ?? ''] ?? ESTADO_CLASES['1'];
}

function nombreTrabajador(): string {
    const p = props.expediente.trabajador?.persona;
    if (!p) return `#${props.expediente.trabajador_id}`;
    return [p.paterno, p.materno, p.nombre].filter(Boolean).join(' ');
}

function esPendiente(): boolean {
    return props.expediente.estado?.codigo === '1';
}

function anular() {
    if (!confirm('¿Seguro que desea anular este expediente?')) return;
    router.post(`/expedientes/${props.expediente.id}/anular`, {}, { preserveScroll: true });
}
</script>

<template>
    <Head :title="`Expediente ${props.expediente.codigo ?? props.expediente.id}`" />

    <div class="mx-auto max-w-3xl space-y-6 p-6">
        <!-- Encabezado -->
        <div class="flex flex-wrap items-start justify-between gap-3">
            <div>
                <div class="flex items-center gap-2">
                    <FileText class="h-5 w-5 text-primary" />
                    <h1 class="font-mono text-lg font-bold text-primary">
                        {{ props.expediente.codigo ?? `EXP-${props.expediente.id}` }}
                    </h1>
                    <span
                        class="inline-flex items-center rounded-full px-2.5 py-0.5 text-[11px] font-semibold"
                        :class="estadoClase()"
                    >
                        {{ props.expediente.estado?.nombre ?? 'Registrado' }}
                    </span>
                </div>
                <p class="mt-1 text-sm text-muted-foreground">
                    {{ props.expediente.tipoExpediente
                        ? TIPO_EXPEDIENTE_LABELS[props.expediente.tipoExpediente]
                        : '—' }}
                    · {{ props.expediente.fecha }} · Año {{ props.expediente.anio }}
                </p>
            </div>

            <div class="flex gap-2">
                <Button
                    v-if="esPendiente()"
                    as="a"
                    :href="`/expedientes/${props.expediente.id}/edit`"
                    variant="outline"
                    size="sm"
                >
                    <Pencil class="mr-1.5 h-3.5 w-3.5" />
                    Editar
                </Button>
                <Button
                    v-if="esPendiente()"
                    variant="destructive"
                    size="sm"
                    @click="anular"
                >
                    Anular
                </Button>
            </div>
        </div>

        <!-- Datos -->
        <div class="rounded-xl border bg-card p-5 shadow-xs space-y-4">
            <div class="grid grid-cols-2 gap-4 text-sm">
                <div>
                    <p class="text-xs text-muted-foreground uppercase tracking-wide">Trabajador</p>
                    <p class="font-medium">{{ nombreTrabajador() }}</p>
                    <p v-if="props.expediente.trabajador?.persona?.docIdentidad" class="text-xs text-muted-foreground">
                        DNI {{ props.expediente.trabajador?.persona?.docIdentidad }}
                    </p>
                </div>
                <div>
                    <p class="text-xs text-muted-foreground uppercase tracking-wide">Asunto</p>
                    <p class="font-medium">{{ props.expediente.asunto }}</p>
                </div>
                <div v-if="props.expediente.observacion">
                    <p class="text-xs text-muted-foreground uppercase tracking-wide">Observación</p>
                    <p>{{ props.expediente.observacion }}</p>
                </div>
            </div>
        </div>

        <!-- Documentos -->
        <div class="rounded-xl border bg-card p-5 shadow-xs space-y-3">
            <h2 class="text-sm font-semibold">Documentos</h2>

            <p v-if="!props.expediente.documentos?.length" class="text-sm text-muted-foreground">
                Sin documentos registrados.
            </p>

            <div
                v-for="doc in props.expediente.documentos"
                :key="doc.id"
                class="flex items-center justify-between rounded-lg border bg-muted/20 px-4 py-2.5"
            >
                <div class="text-sm">
                    <span class="font-medium">{{ doc.documento?.nombre ?? 'Documento' }}</span>
                    <span v-if="doc.nroDoc" class="ml-2 text-muted-foreground">N° {{ doc.nroDoc }}</span>
                    <span v-if="doc.fechaDoc" class="ml-2 text-xs text-muted-foreground">· {{ doc.fechaDoc }}</span>
                    <span v-if="doc.observacion" class="ml-2 text-xs text-muted-foreground">· {{ doc.observacion }}</span>
                </div>
                <Button
                    v-if="doc.rutaDoc"
                    as="a"
                    :href="`/documentos-tram/${doc.id}/descargar`"
                    target="_blank"
                    variant="ghost"
                    size="sm"
                >
                    <Download class="h-4 w-4" />
                </Button>
            </div>
        </div>
    </div>
</template>
