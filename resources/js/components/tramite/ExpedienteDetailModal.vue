<script setup lang="ts">
import { Download, ExternalLink, FileText, Loader2, X } from 'lucide-vue-next';
import { ref, watch } from 'vue';
import { Button } from '@/components/ui/button';
import { TIPO_EXPEDIENTE_LABELS, type Expediente } from '@/types/models/tramite';

const props = defineProps<{
    show: boolean;
    expedienteId: number | null;
}>();

const emit = defineEmits<{
    (e: 'update:show', val: boolean): void;
}>();

const expediente = ref<Expediente | null>(null);
const loading = ref(false);
const error = ref(false);

const ESTADO_CLASES: Record<string, string> = {
    '1': 'bg-amber-100 text-amber-700 ring-1 ring-amber-200',
    '2': 'bg-emerald-100 text-emerald-700 ring-1 ring-emerald-200',
    '3': 'bg-red-100 text-red-700 ring-1 ring-red-200',
    '4': 'bg-blue-100 text-blue-700 ring-1 ring-blue-200',
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

async function cargar(id: number) {
    loading.value = true;
    error.value = false;
    expediente.value = null;

    try {
        const res = await fetch(`/api/expedientes/${id}/detalle`, {
            headers: { Accept: 'application/json' },
        });
        if (!res.ok) throw new Error();
        expediente.value = await res.json();
    } catch {
        error.value = true;
    } finally {
        loading.value = false;
    }
}

watch(
    () => props.expedienteId,
    (id) => {
        if (props.show && id) cargar(id);
    },
);

watch(
    () => props.show,
    (val) => {
        if (val && props.expedienteId) cargar(props.expedienteId);
        if (!val) expediente.value = null;
    },
);

function close() {
    emit('update:show', false);
}
</script>

<template>
    <Teleport to="body">
        <Transition
            enter-active-class="transition duration-150 ease-out"
            enter-from-class="opacity-0"
            enter-to-class="opacity-100"
            leave-active-class="transition duration-100 ease-in"
            leave-from-class="opacity-100"
            leave-to-class="opacity-0"
        >
            <div
                v-if="props.show"
                class="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4"
                @click.self="close"
            >
                <Transition
                    enter-active-class="transition duration-150 ease-out"
                    enter-from-class="opacity-0 scale-95"
                    enter-to-class="opacity-100 scale-100"
                    leave-active-class="transition duration-100 ease-in"
                    leave-from-class="opacity-100 scale-100"
                    leave-to-class="opacity-0 scale-95"
                    appear
                >
                    <div
                        v-if="props.show"
                        class="relative w-full max-w-2xl rounded-xl border bg-background shadow-xl"
                    >
                        <!-- Header del modal -->
                        <div class="flex items-center justify-between border-b px-6 py-4">
                            <div class="flex items-center gap-2">
                                <FileText class="h-5 w-5 text-primary" />
                                <span class="font-mono text-base font-bold text-primary">
                                    {{ expediente?.codigo ?? (loading ? '…' : 'Expediente') }}
                                </span>
                                <span
                                    v-if="expediente"
                                    class="inline-flex items-center rounded-full px-2.5 py-0.5 text-[11px] font-semibold"
                                    :class="estadoClase(expediente)"
                                >
                                    {{ expediente.estado?.nombre ?? 'Registrado' }}
                                </span>
                            </div>
                            <div class="flex items-center gap-2">
                                <!-- Abrir en página completa -->
                                <Button
                                    v-if="expediente"
                                    as="a"
                                    :href="`/expedientes/${expediente.id}`"
                                    target="_blank"
                                    variant="ghost"
                                    size="sm"
                                    title="Abrir en página completa"
                                >
                                    <ExternalLink class="h-4 w-4" />
                                </Button>
                                <Button variant="ghost" size="icon" class="h-8 w-8" @click="close">
                                    <X class="h-4 w-4" />
                                </Button>
                            </div>
                        </div>

                        <!-- Cuerpo -->
                        <div class="max-h-[75vh] overflow-y-auto p-6">
                            <!-- Loading -->
                            <div v-if="loading" class="flex items-center justify-center py-12">
                                <Loader2 class="h-6 w-6 animate-spin text-muted-foreground" />
                            </div>

                            <!-- Error -->
                            <div
                                v-else-if="error"
                                class="rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700"
                            >
                                No se pudo cargar el expediente. Intente nuevamente.
                            </div>

                            <!-- Contenido -->
                            <div v-else-if="expediente" class="space-y-5">
                                <!-- Subtítulo -->
                                <p class="text-sm text-muted-foreground">
                                    {{ expediente.tipoExpediente
                                        ? TIPO_EXPEDIENTE_LABELS[expediente.tipoExpediente]
                                        : '—' }}
                                    · {{ expediente.fecha }}
                                    · Año {{ expediente.anio }}
                                </p>

                                <!-- Datos principales -->
                                <div class="rounded-xl border bg-card p-5 space-y-4">
                                    <div class="grid grid-cols-2 gap-4 text-sm">
                                        <div>
                                            <p class="text-xs uppercase tracking-wide text-muted-foreground">Trabajador</p>
                                            <p class="font-medium">{{ nombreTrabajador(expediente) }}</p>
                                            <p
                                                v-if="expediente.trabajador?.persona?.docIdentidad"
                                                class="text-xs text-muted-foreground"
                                            >
                                                DNI {{ expediente.trabajador.persona.docIdentidad }}
                                            </p>
                                        </div>
                                        <div>
                                            <p class="text-xs uppercase tracking-wide text-muted-foreground">Asunto</p>
                                            <p class="font-medium">{{ expediente.asunto }}</p>
                                        </div>
                                        <div v-if="expediente.observacion" class="col-span-2">
                                            <p class="text-xs uppercase tracking-wide text-muted-foreground">Observación</p>
                                            <p class="text-sm">{{ expediente.observacion }}</p>
                                        </div>
                                    </div>
                                </div>

                                <!-- Documentos -->
                                <div class="rounded-xl border bg-card p-5 space-y-3">
                                    <h3 class="text-sm font-semibold">Documentos</h3>

                                    <p v-if="!expediente.documentos?.length" class="text-sm text-muted-foreground">
                                        Sin documentos registrados.
                                    </p>

                                    <div
                                        v-for="doc in expediente.documentos"
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
                        </div>
                    </div>
                </Transition>
            </div>
        </Transition>
    </Teleport>
</template>
