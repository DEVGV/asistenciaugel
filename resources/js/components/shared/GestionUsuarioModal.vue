<script setup lang="ts">
/**
 * GestionUsuarioModal — gestiona el usuario de un trabajador.
 * Permisos DIRECTOS por IE (sin perfil intermedio).
 * Los perfiles solo sirven como plantilla para precargar permisos.
 *
 * Props:
 *   :trabajador-id  → carga vía /api/trabajadores/{id}/usuario
 *   :user-id        → carga vía /api/usuarios/{id}/datos
 */
import { ref, watch, computed } from 'vue';
import {
    KeyRound,
    ShieldCheck,
    ShieldOff,
    RefreshCw,
    UserX,
    X,
    ChevronDown,
    ChevronUp,
} from 'lucide-vue-next';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import StatusBadge from '@/components/shared/StatusBadge.vue';
import ConfirmModal from '@/components/shared/ConfirmModal.vue';
import type { Perfil, Permiso } from '@/types/models/configuracion';

// ── Props / Emits ──────────────────────────────────────────────────────────────
const props = defineProps<{
    show: boolean;
    trabajadorId?: number;
    userId?: number;
    trabajadorNombre: string;
}>();

const emit = defineEmits<{
    (e: 'update:show', v: boolean): void;
    (e: 'updated'): void;
}>();

function close() {
    emit('update:show', false);
}
function getCsrf(): string {
    return (
        (document.querySelector('meta[name="csrf-token"]') as HTMLMetaElement)
            ?.content ?? ''
    );
}

// ── Tipos internos ─────────────────────────────────────────────────────────────
interface UsuarioData {
    id: number;
    login: string;
    activo: boolean;
}
interface IeDisponible {
    id: number | null;
    label: string;
    codModular: string | null;
}

// ── Estado — declarar TODO antes del watch ─────────────────────────────────────
const loading = ref(false);
const error = ref<string | null>(null);
const usuario = ref<UsuarioData | null>(null);
const iesDisponibles = ref<IeDisponible[]>([]);
const permisosPorModulo = ref<Record<string, Permiso[]>>({});
const perfiles = ref<Perfil[]>([]);

// Sección activa
const section = ref<'main' | 'password' | 'permisos'>('main');

// IE seleccionada para gestionar permisos
const ieSeleccionada = ref<number | null | undefined>(undefined); // undefined = no seleccionada aún
const permisosCargando = ref(false);
const permisosSeleccionados = ref<Set<number>>(new Set());
const savingPermisos = ref(false);
const permisosSaved = ref(false);

// Plantilla de perfil
const perfilPlantillaId = ref<number | null>(null);
const modulosExpandidos = ref<Set<string>>(new Set());

// Cambiar contraseña
const passwordData = ref({
    password: '',
    password_confirmation: '',
    error: '',
});
const savingPassword = ref(false);

// Confirmaciones
const showToggleConfirm = ref(false);
const togglingActivo = ref(false);

// ── Cargar datos base del usuario ──────────────────────────────────────────────
async function cargarDatos() {
    loading.value = true;
    error.value = null;
    usuario.value = null;
    const url = props.userId
        ? `/api/usuarios/${props.userId}/datos`
        : `/api/trabajadores/${props.trabajadorId}/usuario`;
    try {
        const res = await fetch(url, {
            headers: { 'X-Requested-With': 'XMLHttpRequest' },
            credentials: 'same-origin',
        });
        if (!res.ok) throw new Error(`HTTP ${res.status}`);
        const data = await res.json();
        usuario.value = data.usuario;
        iesDisponibles.value = data.iesDisponibles ?? [];
        permisosPorModulo.value = data.permisosPorModulo ?? {};
        perfiles.value = data.perfiles ?? [];
        // Expandir todos los módulos por defecto
        modulosExpandidos.value = new Set(
            Object.keys(data.permisosPorModulo ?? {}),
        );
    } catch (e: any) {
        error.value = e.message ?? 'Error desconocido';
    } finally {
        loading.value = false;
    }
}

// ── Cargar permisos de una IE ──────────────────────────────────────────────────
async function cargarPermisosIe(ieId: number | null) {
    if (!usuario.value) return;
    permisosCargando.value = true;
    permisosSeleccionados.value = new Set();
    permisosSaved.value = false;
    perfilPlantillaId.value = null;
    try {
        const param = ieId === null ? 'null' : String(ieId);
        const res = await fetch(
            `/api/usuarios/${usuario.value.id}/permisos-ie?ie_id=${param}`,
            {
                headers: { 'X-Requested-With': 'XMLHttpRequest' },
                credentials: 'same-origin',
            },
        );
        if (!res.ok) throw new Error(`HTTP ${res.status}`);
        const data = await res.json();
        permisosSeleccionados.value = new Set(data.permiso_ids ?? []);
    } catch {
        // silencioso — queda vacío
    } finally {
        permisosCargando.value = false;
    }
}

function seleccionarIe(ieId: number | null) {
    ieSeleccionada.value = ieId;
    cargarPermisosIe(ieId);
}

// ── Reset al cerrar ────────────────────────────────────────────────────────────
function resetState() {
    usuario.value = null;
    section.value = 'main';
    ieSeleccionada.value = undefined;
    permisosSeleccionados.value = new Set();
    passwordData.value = { password: '', password_confirmation: '', error: '' };
    perfilPlantillaId.value = null;
    permisosSaved.value = false;
}

// Fix del primer open: usar immediate + flush post
watch(
    () => props.show,
    (val) => {
        if (val) cargarDatos();
        else resetState();
    },
    { immediate: false },
);

// También disparar si el componente ya está montado con show=true
// (caso cuando v-if crea el componente y show ya viene en true)
if (props.show) cargarDatos();

// ── Permisos — helpers ─────────────────────────────────────────────────────────
const modulos = computed(() => Object.keys(permisosPorModulo.value).sort());

function togglePermiso(id: number) {
    const s = new Set(permisosSeleccionados.value);
    s.has(id) ? s.delete(id) : s.add(id);
    permisosSeleccionados.value = s;
}

function toggleModulo(modulo: string) {
    const ids = permisosPorModulo.value[modulo].map((p) => p.id);
    const s = new Set(permisosSeleccionados.value);
    const allSelected = ids.every((id) => s.has(id));
    if (allSelected) ids.forEach((id) => s.delete(id));
    else ids.forEach((id) => s.add(id));
    permisosSeleccionados.value = s;
}

function moduloSeleccionado(modulo: string): boolean {
    return (
        permisosPorModulo.value[modulo]?.every((p) =>
            permisosSeleccionados.value.has(p.id),
        ) ?? false
    );
}

function toggleModuloExpand(modulo: string) {
    const s = new Set(modulosExpandidos.value);
    s.has(modulo) ? s.delete(modulo) : s.add(modulo);
    modulosExpandidos.value = s;
}

// Cargar permisos de un perfil como plantilla (sobreescribe selección)
function cargarDesdePerfilPlantilla(perfilId: number | null) {
    if (!perfilId) return;
    const perfil = perfiles.value.find((p) => p.id === perfilId);
    if (!perfil?.permisos) return;
    permisosSeleccionados.value = new Set(perfil.permisos.map((p) => p.id));
}

watch(perfilPlantillaId, (val) => {
    if (val) cargarDesdePerfilPlantilla(val);
});

async function guardarPermisos() {
    if (!usuario.value || ieSeleccionada.value === undefined) return;
    savingPermisos.value = true;
    try {
        const res = await fetch(
            `/api/usuarios/${usuario.value.id}/permisos-ie`,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest',
                    'X-CSRF-TOKEN': getCsrf(),
                },
                credentials: 'same-origin',
                body: JSON.stringify({
                    ie_id: ieSeleccionada.value,
                    permiso_ids: Array.from(permisosSeleccionados.value),
                }),
            },
        );
        if (!res.ok) {
            const d = await res.json().catch(() => ({}));
            error.value = d?.error ?? 'Error al guardar permisos';
        } else {
            permisosSaved.value = true;
            emit('updated');
        }
    } finally {
        savingPermisos.value = false;
    }
}

// ── Cambiar contraseña ─────────────────────────────────────────────────────────
async function submitPassword() {
    if (!usuario.value) return;
    passwordData.value.error = '';
    if (passwordData.value.password.length < 8) {
        passwordData.value.error = 'Mínimo 8 caracteres';
        return;
    }
    if (
        passwordData.value.password !== passwordData.value.password_confirmation
    ) {
        passwordData.value.error = 'Las contraseñas no coinciden';
        return;
    }
    savingPassword.value = true;
    try {
        const res = await fetch(
            `/usuarios/${usuario.value.id}/cambiar-password`,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest',
                    'X-CSRF-TOKEN': getCsrf(),
                },
                credentials: 'same-origin',
                body: JSON.stringify({
                    password: passwordData.value.password,
                    password_confirmation:
                        passwordData.value.password_confirmation,
                }),
            },
        );
        if (!res.ok) {
            const d = await res.json().catch(() => ({}));
            passwordData.value.error =
                d?.errors?.password?.[0] ?? 'Error al cambiar contraseña';
        } else {
            passwordData.value = {
                password: '',
                password_confirmation: '',
                error: '',
            };
            section.value = 'main';
        }
    } finally {
        savingPassword.value = false;
    }
}

// ── Toggle activo ──────────────────────────────────────────────────────────────
async function executeToggle() {
    if (!usuario.value) return;
    togglingActivo.value = true;
    try {
        await fetch(`/usuarios/${usuario.value.id}/toggle-activo`, {
            method: 'POST',
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
                'X-CSRF-TOKEN': getCsrf(),
            },
            credentials: 'same-origin',
        });
        showToggleConfirm.value = false;
        await cargarDatos();
        emit('updated');
    } finally {
        togglingActivo.value = false;
    }
}

// IE label para mostrar en el panel de permisos
const ieLabel = computed(() => {
    if (ieSeleccionada.value === undefined) return '';
    return (
        iesDisponibles.value.find((ie) => ie.id === ieSeleccionada.value)
            ?.label ?? ''
    );
});
</script>

<template>
    <Teleport to="body">
        <div
            v-if="show"
            class="fixed inset-0 z-50 flex items-center justify-center bg-black/50"
            @click.self="close"
        >
            <div
                class="mx-4 flex max-h-[90vh] w-full flex-col rounded-lg bg-background shadow-xl"
                :class="section === 'permisos' ? 'max-w-2xl' : 'max-w-lg'"
            >
                <!-- Cabecera -->
                <div
                    class="flex shrink-0 items-start justify-between border-b px-5 py-4"
                >
                    <div>
                        <h2 class="text-base leading-tight font-semibold">
                            Usuario del Sistema
                        </h2>
                        <p
                            class="mt-0.5 max-w-xs truncate text-sm text-muted-foreground"
                        >
                            {{ trabajadorNombre }}
                        </p>
                    </div>
                    <button
                        @click="close"
                        class="ml-4 shrink-0 rounded p-1 text-muted-foreground hover:bg-muted"
                    >
                        <X class="h-4 w-4" />
                    </button>
                </div>

                <!-- Cuerpo -->
                <div class="flex-1 overflow-y-auto px-5 py-4">
                    <!-- Cargando -->
                    <div
                        v-if="loading"
                        class="flex items-center justify-center gap-2 py-12 text-muted-foreground"
                    >
                        <RefreshCw class="h-4 w-4 animate-spin" /> Cargando...
                    </div>

                    <!-- Error -->
                    <div
                        v-else-if="error"
                        class="rounded border border-destructive/30 bg-destructive/10 p-3 text-sm text-destructive"
                    >
                        {{ error }}
                    </div>

                    <!-- Sin usuario -->
                    <div
                        v-else-if="!usuario"
                        class="flex flex-col items-center gap-2 py-10 text-muted-foreground"
                    >
                        <UserX class="h-8 w-8" />
                        <p class="text-sm">
                            Este trabajador no tiene usuario en el sistema.
                        </p>
                    </div>

                    <!-- ── MAIN ──────────────────────────────────────────────── -->
                    <template v-else-if="section === 'main'">
                        <!-- Info + acciones rápidas -->
                        <div
                            class="mb-5 flex items-center justify-between rounded-md border bg-muted/30 px-4 py-3"
                        >
                            <div>
                                <p class="text-xs text-muted-foreground">
                                    Login
                                </p>
                                <p class="font-mono font-semibold">
                                    {{ usuario.login }}
                                </p>
                            </div>
                            <div
                                class="flex flex-wrap items-center justify-end gap-2"
                            >
                                <StatusBadge :active="usuario.activo" />
                                <Button
                                    variant="outline"
                                    size="sm"
                                    @click="showToggleConfirm = true"
                                >
                                    <ShieldOff
                                        v-if="usuario.activo"
                                        class="mr-1 h-3.5 w-3.5"
                                    />
                                    <ShieldCheck
                                        v-else
                                        class="mr-1 h-3.5 w-3.5"
                                    />
                                    {{
                                        usuario.activo
                                            ? 'Desactivar'
                                            : 'Activar'
                                    }}
                                </Button>
                                <Button
                                    variant="outline"
                                    size="sm"
                                    @click="section = 'password'"
                                >
                                    <KeyRound class="mr-1 h-3.5 w-3.5" />
                                    Contraseña
                                </Button>
                            </div>
                        </div>

                        <!-- Selector de IE para gestionar permisos -->
                        <div>
                            <h3 class="mb-2 text-sm font-semibold">
                                Permisos por Institución
                            </h3>
                            <p class="mb-3 text-xs text-muted-foreground">
                                Selecciona una institución para ver y editar sus
                                permisos directos. Solo aparecen las IEs donde
                                el trabajador tiene alta activa.
                            </p>

                            <div
                                v-if="iesDisponibles.length === 0"
                                class="rounded border border-dashed p-4 text-center text-sm text-muted-foreground"
                            >
                                Sin instituciones disponibles (el trabajador no
                                tiene altas activas).
                            </div>

                            <div v-else class="grid gap-2">
                                <button
                                    v-for="ie in iesDisponibles"
                                    :key="String(ie.id)"
                                    @click="
                                        section = 'permisos';
                                        seleccionarIe(ie.id);
                                    "
                                    class="flex items-center justify-between rounded-md border px-4 py-2.5 text-left text-sm transition-colors hover:bg-muted/50"
                                    :class="
                                        ieSeleccionada === ie.id &&
                                        section === 'permisos'
                                            ? 'border-primary bg-primary/5'
                                            : ''
                                    "
                                >
                                    <div>
                                        <span class="font-medium">{{
                                            ie.label
                                        }}</span>
                                        <span
                                            v-if="ie.codModular"
                                            class="ml-2 font-mono text-xs text-muted-foreground"
                                            >({{ ie.codModular }})</span
                                        >
                                    </div>
                                    <span class="text-xs text-muted-foreground"
                                        >Gestionar →</span
                                    >
                                </button>
                            </div>
                        </div>
                    </template>

                    <!-- ── CONTRASEÑA ─────────────────────────────────────────── -->
                    <template v-else-if="section === 'password'">
                        <div class="space-y-4">
                            <div class="grid gap-2">
                                <Label for="gum-pwd">Nueva contraseña *</Label>
                                <Input
                                    id="gum-pwd"
                                    type="password"
                                    v-model="passwordData.password"
                                    placeholder="Mínimo 8 caracteres"
                                    autocomplete="new-password"
                                />
                            </div>
                            <div class="grid gap-2">
                                <Label for="gum-pwd2"
                                    >Confirmar contraseña *</Label
                                >
                                <Input
                                    id="gum-pwd2"
                                    type="password"
                                    v-model="passwordData.password_confirmation"
                                    placeholder="Repetir contraseña"
                                    autocomplete="new-password"
                                />
                            </div>
                            <p
                                v-if="passwordData.error"
                                class="text-sm text-destructive"
                            >
                                {{ passwordData.error }}
                            </p>
                        </div>
                    </template>

                    <!-- ── PERMISOS POR IE ─────────────────────────────────────── -->
                    <template v-else-if="section === 'permisos'">
                        <!-- IE seleccionada -->
                        <div
                            class="mb-4 flex items-center gap-2 rounded-md border bg-muted/30 px-3 py-2"
                        >
                            <span class="text-xs text-muted-foreground"
                                >IE:</span
                            >
                            <span class="text-sm font-semibold">{{
                                ieLabel
                            }}</span>
                            <span
                                v-if="permisosSaved"
                                class="ml-auto text-xs font-medium text-green-600"
                                >✓ Guardado</span
                            >
                        </div>

                        <!-- Plantilla desde perfil -->
                        <div class="mb-4 flex items-center gap-2">
                            <span class="shrink-0 text-xs text-muted-foreground"
                                >Cargar desde perfil:</span
                            >
                            <select
                                v-model="perfilPlantillaId"
                                class="flex h-8 flex-1 rounded-md border border-input bg-background px-2 py-1 text-xs shadow-sm focus:ring-1 focus:ring-ring focus:outline-none"
                            >
                                <option :value="null">— sin plantilla —</option>
                                <option
                                    v-for="p in perfiles"
                                    :key="p.id"
                                    :value="p.id"
                                >
                                    {{ p.nombre }}
                                </option>
                            </select>
                        </div>

                        <!-- Cargando permisos -->
                        <div
                            v-if="permisosCargando"
                            class="flex items-center justify-center gap-2 py-6 text-muted-foreground"
                        >
                            <RefreshCw class="h-4 w-4 animate-spin" /> Cargando
                            permisos...
                        </div>

                        <!-- Lista de permisos por módulo -->
                        <div v-else class="space-y-2">
                            <div
                                v-if="modulos.length === 0"
                                class="py-8 text-center text-sm text-muted-foreground"
                            >
                                No hay permisos configurados en el sistema.
                            </div>
                            <div
                                v-for="modulo in modulos"
                                :key="modulo"
                                class="overflow-hidden rounded-md border"
                            >
                                <!-- Cabecera módulo -->
                                <div
                                    class="flex items-center gap-2 bg-muted/40 px-3 py-2"
                                >
                                    <input
                                        type="checkbox"
                                        :id="`mod-${modulo}`"
                                        :checked="moduloSeleccionado(modulo)"
                                        @change="toggleModulo(modulo)"
                                        class="size-4 cursor-pointer accent-primary"
                                    />
                                    <label
                                        :for="`mod-${modulo}`"
                                        class="flex-1 cursor-pointer text-sm font-semibold capitalize select-none"
                                    >
                                        {{ modulo }}
                                    </label>
                                    <button
                                        @click="toggleModuloExpand(modulo)"
                                        class="text-muted-foreground hover:text-foreground"
                                    >
                                        <ChevronUp
                                            v-if="modulosExpandidos.has(modulo)"
                                            class="h-4 w-4"
                                        />
                                        <ChevronDown v-else class="h-4 w-4" />
                                    </button>
                                </div>
                                <!-- Permisos del módulo -->
                                <div
                                    v-if="modulosExpandidos.has(modulo)"
                                    class="grid grid-cols-1 gap-1 p-2 sm:grid-cols-2"
                                >
                                    <label
                                        v-for="permiso in permisosPorModulo[
                                            modulo
                                        ]"
                                        :key="permiso.id"
                                        class="flex cursor-pointer items-start gap-2 rounded p-1.5 hover:bg-muted/50"
                                    >
                                        <input
                                            type="checkbox"
                                            :checked="
                                                permisosSeleccionados.has(
                                                    permiso.id,
                                                )
                                            "
                                            @change="togglePermiso(permiso.id)"
                                            class="mt-0.5 size-4 cursor-pointer accent-primary"
                                        />
                                        <div>
                                            <p
                                                class="text-xs leading-none font-medium"
                                            >
                                                {{ permiso.codigo }}
                                            </p>
                                            <p
                                                v-if="permiso.descripcion"
                                                class="mt-0.5 text-[11px] text-muted-foreground"
                                            >
                                                {{ permiso.descripcion }}
                                            </p>
                                        </div>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </template>
                </div>

                <!-- Footer -->
                <div
                    v-if="!loading && !error && usuario"
                    class="flex shrink-0 justify-between border-t px-5 py-3"
                >
                    <Button
                        v-if="section !== 'main'"
                        variant="ghost"
                        size="sm"
                        @click="
                            section = 'main';
                            ieSeleccionada = undefined;
                        "
                    >
                        ← Volver
                    </Button>
                    <div v-else />

                    <div class="flex gap-2">
                        <Button variant="outline" @click="close">Cerrar</Button>
                        <Button
                            v-if="section === 'password'"
                            @click="submitPassword"
                            :disabled="savingPassword"
                        >
                            {{
                                savingPassword
                                    ? 'Guardando...'
                                    : 'Guardar Contraseña'
                            }}
                        </Button>
                        <Button
                            v-if="section === 'permisos'"
                            @click="guardarPermisos"
                            :disabled="savingPermisos || permisosCargando"
                        >
                            {{
                                savingPermisos
                                    ? 'Guardando...'
                                    : 'Guardar Permisos'
                            }}
                        </Button>
                    </div>
                </div>

                <!-- Footer sin usuario -->
                <div
                    v-else-if="!loading && !error && !usuario"
                    class="flex shrink-0 justify-end border-t px-5 py-3"
                >
                    <Button variant="outline" @click="close">Cerrar</Button>
                </div>
            </div>
        </div>
    </Teleport>

    <ConfirmModal
        v-model:show="showToggleConfirm"
        :title="usuario?.activo ? 'Desactivar Usuario' : 'Activar Usuario'"
        :description="`¿Confirmas ${usuario?.activo ? 'desactivar' : 'activar'} al usuario '${usuario?.login}'?`"
        :confirm-text="usuario?.activo ? 'Desactivar' : 'Activar'"
        cancel-text="Cancelar"
        :destructive="usuario?.activo"
        :processing="togglingActivo"
        @confirm="executeToggle"
    />
</template>
