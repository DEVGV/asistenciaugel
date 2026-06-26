<script setup lang="ts">
import { Head, useForm } from '@inertiajs/vue3';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { TIPO_EXPEDIENTE_LABELS, type Expediente, type TipoExpediente } from '@/types/models/tramite';

defineOptions({
    layout: {
        breadcrumbs: [
            { title: 'Expedientes', href: '/expedientes' },
            { title: 'Editar', href: '#' },
        ],
    },
});

const props = defineProps<{ expediente: Expediente }>();

const form = useForm({
    tipoExpediente: props.expediente.tipoExpediente ?? '' as TipoExpediente | '',
    asunto:         props.expediente.asunto ?? '',
    fecha:          props.expediente.fecha ?? '',
    observacion:    props.expediente.observacion ?? '',
});

const TIPOS: { value: string; label: string }[] = (
    Object.keys(TIPO_EXPEDIENTE_LABELS) as TipoExpediente[]
).map((k) => ({ value: k, label: TIPO_EXPEDIENTE_LABELS[k] }));

function submit() {
    form.put(`/expedientes/${props.expediente.id}`, {
        preserveScroll: true,
        onError: () => {},
    });
}
</script>

<template>
    <Head :title="`Editar ${props.expediente.codigo ?? 'expediente'}`" />

    <div class="mx-auto max-w-2xl space-y-6 p-6">
        <div class="flex items-center justify-between">
            <h1 class="text-xl font-semibold">Editar expediente</h1>
            <Button as="a" :href="`/expedientes/${props.expediente.id}`" variant="outline" size="sm">
                Cancelar
            </Button>
        </div>

        <div class="rounded-xl border bg-card p-6 shadow-xs space-y-4">
            <!-- Tipo -->
            <div class="grid gap-2">
                <Label>Tipo de expediente *</Label>
                <select
                    v-model="form.tipoExpediente"
                    class="flex h-9 w-full rounded-md border border-input bg-background px-3 py-1 text-sm shadow-xs focus-visible:ring-1 focus-visible:ring-ring focus-visible:outline-none"
                    :class="{ 'border-destructive': form.errors.tipoExpediente }"
                >
                    <option value="" disabled>Seleccione…</option>
                    <option v-for="t in TIPOS" :key="t.value" :value="t.value">{{ t.label }}</option>
                </select>
                <p v-if="form.errors.tipoExpediente" class="text-sm text-destructive">
                    {{ form.errors.tipoExpediente }}
                </p>
            </div>

            <!-- Asunto -->
            <div class="grid gap-2">
                <Label>Asunto *</Label>
                <Input
                    v-model="form.asunto"
                    :class="{ 'border-destructive': form.errors.asunto }"
                />
                <p v-if="form.errors.asunto" class="text-sm text-destructive">{{ form.errors.asunto }}</p>
            </div>

            <!-- Fecha -->
            <div class="grid gap-2">
                <Label>Fecha *</Label>
                <Input
                    v-model="form.fecha"
                    type="date"
                    :class="{ 'border-destructive': form.errors.fecha }"
                />
                <p v-if="form.errors.fecha" class="text-sm text-destructive">{{ form.errors.fecha }}</p>
            </div>

            <!-- Observación -->
            <div class="grid gap-2">
                <Label>Observación</Label>
                <Input
                    v-model="form.observacion"
                    placeholder="Opcional"
                    :class="{ 'border-destructive': form.errors.observacion }"
                />
                <p v-if="form.errors.observacion" class="text-sm text-destructive">{{ form.errors.observacion }}</p>
            </div>

            <div class="flex justify-end pt-2">
                <Button :disabled="form.processing" @click="submit">
                    {{ form.processing ? 'Guardando…' : 'Guardar cambios' }}
                </Button>
            </div>
        </div>
    </div>
</template>
