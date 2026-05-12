<script setup lang="ts">
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import ParamSelect from '@/components/shared/ParamSelect.vue';

defineProps<{
    form: any;
}>();
</script>

<template>
    <div class="grid gap-4">
        <div class="grid grid-cols-2 gap-4">
            <ParamSelect
                v-model="form.tipoDocIdentidad_id"
                type="tipos-doc-identidad"
                label="Tipo Doc. *"
                :error="form.errors.tipoDocIdentidad_id"
            />

            <div class="grid gap-2">
                <Label for="docIdentidad">N° Documento *</Label>
                <Input
                    id="docIdentidad"
                    v-model="form.docIdentidad"
                    placeholder="N° documento"
                    maxlength="20"
                />
                <p v-if="form.errors.docIdentidad" class="text-sm text-destructive">{{ form.errors.docIdentidad }}</p>
            </div>
        </div>

        <div class="grid grid-cols-2 gap-4">
            <div class="grid gap-2">
                <Label for="paterno">Ap. Paterno *</Label>
                <Input id="paterno" v-model="form.paterno" placeholder="Apellido paterno" />
                <p v-if="form.errors.paterno" class="text-sm text-destructive">{{ form.errors.paterno }}</p>
            </div>
            <div class="grid gap-2">
                <Label for="materno">Ap. Materno *</Label>
                <Input id="materno" v-model="form.materno" placeholder="Apellido materno" />
                <p v-if="form.errors.materno" class="text-sm text-destructive">{{ form.errors.materno }}</p>
            </div>
        </div>

        <div class="grid gap-2">
            <Label for="nombre">Nombres *</Label>
            <Input id="nombre" v-model="form.nombre" placeholder="Nombres completos" />
            <p v-if="form.errors.nombre" class="text-sm text-destructive">{{ form.errors.nombre }}</p>
        </div>

        <div class="grid grid-cols-2 gap-4">
            <ParamSelect
                v-model="form.sexo_id"
                type="sexos"
                label="Sexo *"
                :error="form.errors.sexo_id"
            />

            <ParamSelect
                v-model="form.pais_id"
                type="paises"
                label="País *"
                :error="form.errors.pais_id"
            />
        </div>

        <div class="grid gap-2">
            <Label for="fechaNac">Fecha Nacimiento</Label>
            <Input id="fechaNac" v-model="form.fechaNac" type="date" />
            <p v-if="form.errors.fechaNac" class="text-sm text-destructive">{{ form.errors.fechaNac }}</p>
        </div>

        <div class="flex items-center space-x-2 mt-2">
            <input
                id="activo"
                type="checkbox"
                :checked="!!form.activo"
                @change="(e: Event) => form.activo = (e.target as HTMLInputElement).checked"
                class="size-4 rounded border-input accent-primary cursor-pointer"
            />
            <Label for="activo" class="cursor-pointer">Persona Activa</Label>
        </div>
        <p v-if="form.errors.activo" class="text-sm text-destructive">{{ form.errors.activo }}</p>
    </div>
</template>
