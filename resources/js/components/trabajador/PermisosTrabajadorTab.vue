<script setup lang="ts">
import { AlertCircle, ClipboardCheck, ExternalLink, Plus, RefreshCw } from 'lucide-vue-next';
import { onMounted, ref } from 'vue';
import ExpedienteFormModal from '@/components/tramite/ExpedienteFormModal.vue';
import { Button } from '@/components/ui/button';
import { TIPO_EXPEDIENTE_LABELS, type Expediente } from '@/types/models/tramite';
import type { Trabajador } from '@/types/models/trabajador';

const props = defineProps<{
    trabajador: Trabajador;
}>();

const expedientes = ref<Expediente[]>([]);
const loading = ref(false);
const error = ref(false);
const showModal = ref(false);

const ESTADO_CLASES: Record<string, string> = {
    '1': 'bg-amber-100 text-amber-700 ring-1 ring-amber-200',
    '2': 'bg-emerald-100 text-emerald-700 ring-1 ring-emerald-200',
    '3': 'bg-red-100 text-red-700 ring-1 ring-red-200',
    '4': 'bg-blue-100 text-blue-700 ring-1 ring-blue-200',
    '5': 'bg-muted text-muted-foreground ring-1 ring-border',
};

async function loadExpedientes() {
    loading.value = true;
    error.value = false;

    try {
        const res = await fetch(
            `/api/trabajadores/${props.trabajador.id}/expedientes`,
            { headers: { Accept: 'application/json' } },
        );

        if (!res.ok) throw new Error();

        const result = await res.json();
        expedientes.value = result.data ?? [];
    } catch {
        error.value = true;
    } finally {
        loading.value = false;
    }
}

onMounted(() => loadExpedientes());
</script>

<template>
    <div class="flex flex-col gap-5">
        <!-- Cabecera -->
        <div class="flex flex-wrap items-center justify-between gap-3">
            <div class="flex items-center gap-2">
                <ClipboardCheck class="h-5 w-5 text-primary" />
                <h2 class="text-base font-bold">Expedientes</h2>
            </div>

            <div class="flex items-center gap-2">
                <Button
                    variant="ghost"
                    size="icon"
                    class="h-8 w-8"
                    title="Recargar"
                    :disabled="loading"
                    @click="loadExpedientes"
                >
                    <RefreshCw class="h-4 w-4" :class="{ 'animate-spin': loading }" />
                </Button>
                <Button size="sm" class="h-8 text-xs" @click="showModal = true">
                    <Plus class="mr-1 h-3.5 w-3.5" />
                    Nuevo expediente
                </Button>
            </div>
        </div>

        <!-- Error -->
        <div
            v-if="error"
            class="flex items-center gap-2 rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700"
        >
            <AlertCircle class="h-4 w-4 shrink-0" />
            Error al cargar los expedientes. Intente nuevamente.
        </div>

        <!-- Skeleton -->
        <div v-else-if="loading" class="space-y-3">
            <div v-for="i in 2" :key="i" class="h-16 animate-pulse rounded-xl border bg-muted/30" />
        </div>

        <!-- Vacío -->
        <div
            v-else-if="expedientes.length === 0"
            class="flex flex-col items-center justify-center rounded-xl border-2 border-dashed py-14 text-center"
        >
            <ClipboardCheck class="mb-3 h-10 w-10 text-muted-foreground/40" />
            <p class="text-sm font-medium text-muted-foreground">Sin expedientes registrados.</p>
            <Button size="sm" variant="outline" class="mt-4" @click="showModal = true">
                <Plus class="mr-1.5 h-3.5 w-3.5" />
                Nuevo expediente
            </Button>
        </div>

        <!-- Lista -->
        <div v-else class="space-y-2">
            <div
                v-for="exp in expedientes"
                :key="exp.id"
                class="flex items-center justify-between rounded-xl border bg-card px-4 py-3 shadow-xs"
            >
                <div class="space-y-0.5">
                    <div class="flex items-center gap-2 text-sm">
                        <span class="font-mono text-xs font-semibold text-primary">
                            {{ exp.codigo ?? `EXP-${exp.id}` }}
                        </span>
                        <span
                            class="inline-flex items-center rounded-full px-2 py-0.5 text-[10px] font-semibold"
                            :class="ESTADO_CLASES[exp.estado?.codigo ?? ''] ?? ESTADO_CLASES['1']"
                        >
                            {{ exp.estado?.nombre ?? 'Registrado' }}
                        </span>
                    </div>
                    <p class="text-sm font-medium">{{ exp.asunto }}</p>
                    <p class="text-xs text-muted-foreground">
                        {{ exp.tipoExpediente ? TIPO_EXPEDIENTE_LABELS[exp.tipoExpediente] : '' }}
                        · {{ exp.fecha }}
                    </p>
                </div>
                <Button as="a" :href="`/expedientes/${exp.id}`" variant="ghost" size="sm">
                    <ExternalLink class="h-4 w-4" />
                </Button>
            </div>
        </div>
    </div>

    <!-- Modal crear expediente -->
    <ExpedienteFormModal
        v-model:show="showModal"
        :trabajador-id="props.trabajador.id"
        @success="loadExpedientes"
    />
</template>
