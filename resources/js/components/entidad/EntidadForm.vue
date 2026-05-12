<script setup lang="ts">
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import ParamSelect from '@/components/shared/ParamSelect.vue';

defineProps<{
    form: any; // Inertia Form instance
}>();
</script>

<template>
    <div class="grid gap-4">
        <ParamSelect
            v-model="form.tipoEntidad_id"
            type="tipo-entidad"
            label="Tipo de Entidad *"
            :error="form.errors.tipoEntidad_id"
        />

        <div class="grid gap-2">
            <Label for="ruc">RUC *</Label>
            <Input 
                id="ruc" 
                v-model="form.ruc" 
                placeholder="11 dígitos" 
                maxlength="11"
            />
            <p v-if="form.errors.ruc" class="text-sm text-destructive">{{ form.errors.ruc }}</p>
        </div>

        <div class="grid gap-2">
            <Label for="razonSocial">Razón Social *</Label>
            <Input 
                id="razonSocial" 
                v-model="form.razonSocial" 
                placeholder="Nombre legal completo" 
            />
            <p v-if="form.errors.razonSocial" class="text-sm text-destructive">{{ form.errors.razonSocial }}</p>
        </div>

        <div class="grid gap-2">
            <Label for="razonComercial">Razón Comercial</Label>
            <Input 
                id="razonComercial" 
                v-model="form.razonComercial" 
                placeholder="Nombre comercial (Opcional)" 
            />
            <p v-if="form.errors.razonComercial" class="text-sm text-destructive">{{ form.errors.razonComercial }}</p>
        </div>

        <div class="flex items-center space-x-2 mt-2">
            <input
                id="activo"
                type="checkbox"
                :checked="!!form.activo"
                @change="(e) => form.activo = (e.target as HTMLInputElement).checked"
                class="size-4 rounded border-input accent-primary cursor-pointer"
            />
            <Label for="activo" class="cursor-pointer">Entidad Activa</Label>
        </div>
        <p v-if="form.errors.activo" class="text-sm text-destructive">{{ form.errors.activo }}</p>
    </div>
</template>
