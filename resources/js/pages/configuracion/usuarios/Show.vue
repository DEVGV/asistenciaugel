<script setup lang="ts">
import { Head, useForm, router } from '@inertiajs/vue3';
import {
    KeyRound,
    Plus,
    Trash2,
    ShieldCheck,
    ShieldOff,
} from 'lucide-vue-next';
import { ref, watch } from 'vue';
import UsuarioController from '@/actions/App/Http/Controllers/Configuracion/UsuarioController';
import ConfirmModal from '@/components/shared/ConfirmModal.vue';
import FormModal from '@/components/shared/FormModal.vue';
import StatusBadge from '@/components/shared/StatusBadge.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table';
import type {
    Perfil,
    Usuario,
    UsuarioPerfilIe,
} from '@/types/models/configuracion';

interface InstitucionSimple {
    id: number;
    nombreLegal: string;
    codigoModular: string | null;
}

const props = defineProps<{
    usuario: Usuario;
    perfilesIe: UsuarioPerfilIe[];
    perfiles: Perfil[];
    instituciones: InstitucionSimple[];
}>();

defineOptions({
    layout: {
        breadcrumbs: [
            { title: 'Configuración', href: '#' },
            { title: 'Usuarios', href: UsuarioController.index().url },
            { title: 'Gestionar Usuario', href: '#' },
        ],
    },
});

function nombreCompleto(): string {
    const p = props.usuario.trabajador?.persona;
    if (!p) return props.usuario.login;
    return [p.paterno, p.materno, p.nombre].filter(Boolean).join(' ');
}

// ── Cambiar contraseña ────────────────────────────────────────────────────────
const showPasswordModal = ref(false);
const passwordForm = useForm({
    password: '',
    password_confirmation: '',
});

watch(showPasswordModal, (val) => {
    if (!val) {
        passwordForm.reset();
        passwordForm.clearErrors();
    }
});

function submitPassword() {
    passwordForm.post(UsuarioController.cambiarPassword(props.usuario.id).url, {
        onSuccess: () => {
            showPasswordModal.value = false;
            passwordForm.reset();
        },
    });
}

// ── Toggle activo ─────────────────────────────────────────────────────────────
const showToggleModal = ref(false);
const isToggling = ref(false);

function executeToggle() {
    isToggling.value = true;
    router.post(
        UsuarioController.toggleActivo(props.usuario.id).url,
        {},
        {
            onSuccess: () => {
                showToggleModal.value = false;
            },
            onFinish: () => {
                isToggling.value = false;
            },
        },
    );
}

// ── Asignar perfil ────────────────────────────────────────────────────────────
const showAsignarModal = ref(false);
const asignarForm = useForm({
    perfil_id: null as number | null,
    institucionEducativa_id: null as number | null,
});

watch(showAsignarModal, (val) => {
    if (!val) {
        asignarForm.reset();
        asignarForm.clearErrors();
    }
});

function submitAsignar() {
    asignarForm.post(UsuarioController.asignarPerfil(props.usuario.id).url, {
        onSuccess: () => {
            showAsignarModal.value = false;
            asignarForm.reset();
        },
    });
}

// ── Revocar perfil ────────────────────────────────────────────────────────────
const showRevocarModal = ref(false);
const perfilIeAEliminar = ref<UsuarioPerfilIe | null>(null);
const isRevoking = ref(false);

function confirmRevocar(upi: UsuarioPerfilIe) {
    perfilIeAEliminar.value = upi;
    showRevocarModal.value = true;
}

function executeRevocar() {
    if (!perfilIeAEliminar.value) return;
    isRevoking.value = true;
    router.delete(
        UsuarioController.revocarPerfil({
            usuario: props.usuario.id,
            perfilIe: perfilIeAEliminar.value.id,
        }).url,
        {
            onSuccess: () => {
                showRevocarModal.value = false;
                perfilIeAEliminar.value = null;
            },
            onFinish: () => {
                isRevoking.value = false;
            },
        },
    );
}
</script>

<template>
    <Head :title="`Usuario: ${usuario.login}`" />

    <div class="flex flex-col gap-6 p-4">
        <!-- Encabezado -->
        <div class="flex items-start justify-between">
            <div>
                <h1 class="text-2xl font-bold tracking-tight">
                    {{ nombreCompleto() }}
                </h1>
                <p class="mt-1 font-mono text-sm text-muted-foreground">
                    {{ usuario.login }}
                </p>
            </div>
            <div class="flex items-center gap-2">
                <StatusBadge :active="usuario.activo" />
                <Button
                    variant="outline"
                    size="sm"
                    @click="showToggleModal = true"
                >
                    <ShieldOff v-if="usuario.activo" class="mr-1 h-4 w-4" />
                    <ShieldCheck v-else class="mr-1 h-4 w-4" />
                    {{ usuario.activo ? 'Desactivar' : 'Activar' }}
                </Button>
                <Button
                    variant="outline"
                    size="sm"
                    @click="showPasswordModal = true"
                >
                    <KeyRound class="mr-1 h-4 w-4" />
                    Cambiar Contraseña
                </Button>
            </div>
        </div>

        <!-- Perfiles por IE -->
        <div class="rounded-md border bg-card">
            <div class="flex items-center justify-between border-b px-4 py-3">
                <h2 class="font-semibold">
                    Perfiles e Instituciones Asignadas
                </h2>
                <Button size="sm" @click="showAsignarModal = true">
                    <Plus class="mr-1 h-4 w-4" />
                    Asignar Perfil
                </Button>
            </div>
            <Table>
                <TableHeader>
                    <TableRow>
                        <TableHead>Perfil</TableHead>
                        <TableHead>Institución Educativa</TableHead>
                        <TableHead class="text-right">Acciones</TableHead>
                    </TableRow>
                </TableHeader>
                <TableBody>
                    <TableRow v-for="upi in perfilesIe" :key="upi.id">
                        <TableCell class="font-medium">{{
                            upi.perfil?.nombre
                        }}</TableCell>
                        <TableCell>
                            <span v-if="upi.institucionEducativa">
                                {{ upi.institucionEducativa.nombreLegal }}
                                <span
                                    class="ml-1 font-mono text-xs text-muted-foreground"
                                >
                                    ({{
                                        upi.institucionEducativa.codigoModular
                                    }})
                                </span>
                            </span>
                            <span
                                v-else
                                class="text-sm text-muted-foreground italic"
                                >Global (UGEL)</span
                            >
                        </TableCell>
                        <TableCell class="text-right">
                            <Button
                                variant="ghost"
                                size="sm"
                                class="text-destructive hover:bg-destructive/10 hover:text-destructive"
                                @click="confirmRevocar(upi)"
                            >
                                <Trash2 class="h-4 w-4" />
                            </Button>
                        </TableCell>
                    </TableRow>
                    <TableRow v-if="perfilesIe.length === 0">
                        <TableCell
                            colspan="3"
                            class="h-20 text-center text-muted-foreground"
                        >
                            Sin perfiles asignados.
                        </TableCell>
                    </TableRow>
                </TableBody>
            </Table>
        </div>

        <!-- Modal cambiar contraseña -->
        <FormModal
            v-model:show="showPasswordModal"
            title="Cambiar Contraseña"
            :processing="passwordForm.processing"
            @submit="submitPassword"
        >
            <div class="grid gap-4">
                <div class="grid gap-2">
                    <Label for="password">Nueva contraseña *</Label>
                    <Input
                        id="password"
                        type="password"
                        v-model="passwordForm.password"
                        placeholder="Mínimo 8 caracteres"
                        autocomplete="new-password"
                    />
                    <p
                        v-if="passwordForm.errors.password"
                        class="text-sm text-destructive"
                    >
                        {{ passwordForm.errors.password }}
                    </p>
                </div>
                <div class="grid gap-2">
                    <Label for="password_confirmation"
                        >Confirmar contraseña *</Label
                    >
                    <Input
                        id="password_confirmation"
                        type="password"
                        v-model="passwordForm.password_confirmation"
                        placeholder="Repetir contraseña"
                        autocomplete="new-password"
                    />
                </div>
            </div>
        </FormModal>

        <!-- Modal asignar perfil -->
        <FormModal
            v-model:show="showAsignarModal"
            title="Asignar Perfil"
            :processing="asignarForm.processing"
            @submit="submitAsignar"
        >
            <div class="grid gap-4">
                <div class="grid gap-2">
                    <Label for="perfil_id">Perfil *</Label>
                    <select
                        id="perfil_id"
                        v-model="asignarForm.perfil_id"
                        class="flex h-9 w-full rounded-md border border-input bg-background px-3 py-1 text-sm shadow-sm focus:ring-1 focus:ring-ring focus:outline-none"
                    >
                        <option :value="null" disabled>
                            Seleccionar perfil...
                        </option>
                        <option v-for="p in perfiles" :key="p.id" :value="p.id">
                            {{ p.nombre }}
                        </option>
                    </select>
                    <p
                        v-if="asignarForm.errors.perfil_id"
                        class="text-sm text-destructive"
                    >
                        {{ asignarForm.errors.perfil_id }}
                    </p>
                </div>

                <div class="grid gap-2">
                    <Label for="ie_id">Institución Educativa</Label>
                    <select
                        id="ie_id"
                        v-model="asignarForm.institucionEducativa_id"
                        class="flex h-9 w-full rounded-md border border-input bg-background px-3 py-1 text-sm shadow-sm focus:ring-1 focus:ring-ring focus:outline-none"
                    >
                        <option :value="null">
                            Global (UGEL — sin IE específica)
                        </option>
                        <option
                            v-for="ie in instituciones"
                            :key="ie.id"
                            :value="ie.id"
                        >
                            {{ ie.nombreLegal
                            }}{{
                                ie.codigoModular ? ` (${ie.codigoModular})` : ''
                            }}
                        </option>
                    </select>
                    <p
                        v-if="asignarForm.errors.institucionEducativa_id"
                        class="text-sm text-destructive"
                    >
                        {{ asignarForm.errors.institucionEducativa_id }}
                    </p>
                </div>
            </div>
        </FormModal>

        <!-- Modal confirmar toggle -->
        <ConfirmModal
            v-model:show="showToggleModal"
            :title="usuario.activo ? 'Desactivar Usuario' : 'Activar Usuario'"
            :description="`¿Confirmas ${usuario.activo ? 'desactivar' : 'activar'} al usuario '${usuario.login}'?`"
            :confirm-text="usuario.activo ? 'Desactivar' : 'Activar'"
            cancel-text="Cancelar"
            :destructive="usuario.activo"
            :processing="isToggling"
            @confirm="executeToggle"
        />

        <!-- Modal confirmar revocar -->
        <ConfirmModal
            v-model:show="showRevocarModal"
            title="Revocar Perfil"
            :description="`¿Revocar el perfil '${perfilIeAEliminar?.perfil?.nombre}' de este usuario?`"
            confirm-text="Revocar"
            cancel-text="Cancelar"
            destructive
            :processing="isRevoking"
            @confirm="executeRevocar"
            @cancel="perfilIeAEliminar = null"
        />
    </div>
</template>
