<script setup lang="ts">
import { ref } from 'vue';
import { useForm, router } from '@inertiajs/vue3';
import { Plus, Pencil, Trash2, MapPin } from 'lucide-vue-next';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import {
    Table, TableBody, TableCell, TableHead, TableHeader, TableRow,
} from '@/components/ui/table';
import FormModal from '@/components/shared/FormModal.vue';
import ConfirmModal from '@/components/shared/ConfirmModal.vue';
import StatusBadge from '@/components/shared/StatusBadge.vue';
import type { Domicilio } from '@/types/models/persona';
import DomicilioController from '@/actions/App/Http/Controllers/Persona/DomicilioController';

const props = defineProps<{
    domicilios: Domicilio[];
    personaId: number;
}>();

const showModal = ref(false);
const isEditing = ref(false);
const editingId = ref<number | null>(null);
const showDeleteModal = ref(false);
const itemToDelete = ref<Domicilio | null>(null);
const isDeleting = ref(false);

const form = useForm({
    domicilio: '',
    zona_id: null as number | null,
    ubigeo: '',
    fechaInicio: '',
    fechaFin: '',
});

function openCreate() {
    isEditing.value = false;
    editingId.value = null;
    form.reset();
    form.clearErrors();
    form.fechaInicio = new Date().toISOString().split('T')[0];
    showModal.value = true;
}

function openEdit(item: Domicilio) {
    isEditing.value = true;
    editingId.value = item.id;
    form.clearErrors();
    form.domicilio = item.domicilio;
    form.zona_id = item.zona_id;
    form.ubigeo = item.ubigeo || '';
    form.fechaInicio = item.fechaInicio || '';
    form.fechaFin = item.fechaFin || '';
    showModal.value = true;
}

function submitForm() {
    if (isEditing.value && editingId.value) {
        form.put(DomicilioController.update({ domicilio: editingId.value }).url, {
            onSuccess: () => { showModal.value = false; },
        });
    } else {
        form.post(DomicilioController.store({ persona: props.personaId }).url, {
            onSuccess: () => { showModal.value = false; },
        });
    }
}

function confirmDelete(item: Domicilio) {
    itemToDelete.value = item;
    showDeleteModal.value = true;
}

function executeDelete() {
    if (!itemToDelete.value) return;
    isDeleting.value = true;
    router.delete(DomicilioController.destroy({ domicilio: itemToDelete.value.id }).url, {
        onSuccess: () => { showDeleteModal.value = false; itemToDelete.value = null; },
        onFinish: () => { isDeleting.value = false; },
    });
}
</script>

<template>
    <div>
        <div class="flex items-center justify-between mb-3">
            <h3 class="text-sm font-semibold text-muted-foreground">Domicilios</h3>
            <Button size="sm" variant="outline" @click="openCreate">
                <Plus class="mr-1 h-3.5 w-3.5" /> Agregar
            </Button>
        </div>

        <div class="rounded-md border">
            <Table>
                <TableHeader>
                    <TableRow>
                        <TableHead>Dirección</TableHead>
                        <TableHead>Zona</TableHead>
                        <TableHead>Estado</TableHead>
                        <TableHead class="text-right">Acciones</TableHead>
                    </TableRow>
                </TableHeader>
                <TableBody>
                    <TableRow v-for="item in domicilios" :key="item.id">
                        <TableCell class="font-medium">
                            <div class="flex items-center gap-1.5">
                                <MapPin class="h-4 w-4 text-muted-foreground shrink-0" />
                                <span class="line-clamp-1">{{ item.domicilio }}</span>
                            </div>
                        </TableCell>
                        <TableCell>{{ item.zona?.nombre || '-' }}</TableCell>
                        <TableCell>
                            <StatusBadge :active="!item.fechaFin" />
                        </TableCell>
                        <TableCell class="text-right">
                            <Button variant="ghost" size="icon" class="h-7 w-7" @click="openEdit(item)">
                                <Pencil class="h-3.5 w-3.5" />
                            </Button>
                            <Button variant="ghost" size="icon" class="h-7 w-7 text-destructive" @click="confirmDelete(item)">
                                <Trash2 class="h-3.5 w-3.5" />
                            </Button>
                        </TableCell>
                    </TableRow>
                    <TableRow v-if="domicilios.length === 0">
                        <TableCell colspan="4" class="h-16 text-center text-muted-foreground text-sm">
                            Sin domicilios registrados.
                        </TableCell>
                    </TableRow>
                </TableBody>
            </Table>
        </div>

        <FormModal v-model:show="showModal" :title="isEditing ? 'Editar Domicilio' : 'Nuevo Domicilio'" :processing="form.processing" @submit="submitForm">
            <div class="grid gap-4">
                <div class="grid gap-2">
                    <Label>Dirección *</Label>
                    <Input v-model="form.domicilio" placeholder="Av. / Jr. / Calle..." />
                    <p v-if="form.errors.domicilio" class="text-sm text-destructive">{{ form.errors.domicilio }}</p>
                </div>
                <div class="grid grid-cols-2 gap-4">
                    <div class="grid gap-2">
                        <Label>Ubigeo</Label>
                        <Input v-model="form.ubigeo" placeholder="Código ubigeo" maxlength="6" />
                    </div>
                    <div class="grid gap-2">
                        <!-- zona_id se puede expandir con un ParamSelect si hay tipos-zona -->
                        <Label>Zona</Label>
                        <Input v-model="form.zona_id" placeholder="ID Zona (opcional)" />
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-4">
                    <div class="grid gap-2">
                        <Label>Fecha Inicio</Label>
                        <Input v-model="form.fechaInicio" type="date" />
                    </div>
                    <div class="grid gap-2">
                        <Label>Fecha de Baja</Label>
                        <Input v-model="form.fechaFin" type="date" />
                        <p class="text-xs text-muted-foreground">Establece una fecha para marcarlo como inactivo.</p>
                    </div>
                </div>
            </div>
        </FormModal>

        <ConfirmModal
            v-model:show="showDeleteModal"
            title="Eliminar Domicilio"
            description="¿Eliminar este domicilio?"
            confirm-text="Eliminar"
            destructive
            :processing="isDeleting"
            @confirm="executeDelete"
        />
    </div>
</template>
