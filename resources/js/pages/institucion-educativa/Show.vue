<script setup lang="ts">
import { Head, useForm, router, Link } from '@inertiajs/vue3';
import { ArrowLeft, Plus, Pencil, Trash2, School, BookOpen, GraduationCap, LayoutGrid, ChevronDown } from 'lucide-vue-next';
import { ref, watch } from 'vue';
import InstitucionEducativaController from '@/actions/App/Http/Controllers/InstitucionEducativa/InstitucionEducativaController';
import CursoIEController from '@/actions/App/Http/Controllers/InstitucionEducativa/CursoIEController';
import GradoIEController from '@/actions/App/Http/Controllers/InstitucionEducativa/GradoIEController';
import SeccionIEController from '@/actions/App/Http/Controllers/InstitucionEducativa/SeccionIEController';
import ConfirmModal from '@/components/shared/ConfirmModal.vue';
import FormModal from '@/components/shared/FormModal.vue';
import StatusBadge from '@/components/shared/StatusBadge.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/components/ui/table';
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger } from '@/components/ui/dropdown-menu';
import type { InstitucionEducativa, CursoIE, GradoIE, SeccionIE } from '@/types/models/institucion-educativa';

defineOptions({
    layout: {
        breadcrumbs: [
            { title: 'Instituciones Educativas', href: InstitucionEducativaController.index().url },
            { title: 'Detalle', href: '#' },
        ],
    },
});

const props = defineProps<{ institucion: InstitucionEducativa }>();

const activeTab = ref<'datos' | 'cursos' | 'grados'>('datos');

// ─── Sub-recurso Modal (compartido para cursos, grados, secciones) ───
const showSubModal = ref(false);
const subModalType = ref<'curso' | 'grado' | 'seccion'>('curso');
const subIsEditing = ref(false);
const subEditingId = ref<number | null>(null);
const subParentId = ref<number | null>(null);

const subForm = useForm({ nombre: '', sigla: '', activo: true });

watch(showSubModal, (val) => { if (!val) { subForm.reset(); subForm.clearErrors(); } });

function openSubCreate(type: 'curso' | 'grado' | 'seccion', parentId?: number) {
    subModalType.value = type;
    subIsEditing.value = false;
    subEditingId.value = null;
    subParentId.value = parentId ?? null;
    subForm.reset();
    subForm.clearErrors();
    showSubModal.value = true;
}

function openSubEdit(type: 'curso' | 'grado' | 'seccion', item: CursoIE | GradoIE | SeccionIE) {
    subModalType.value = type;
    subIsEditing.value = true;
    subEditingId.value = item.id;
    subForm.clearErrors();
    subForm.nombre = item.nombre;
    subForm.sigla = item.sigla || '';
    subForm.activo = item.activo;
    showSubModal.value = true;
}

function submitSub() {
    const ieId = props.institucion.id;
    let targetUrl = '';

    if (subIsEditing.value && subEditingId.value) {
        if (subModalType.value === 'curso') {
            targetUrl = CursoIEController.update({ curso: subEditingId.value }).url;
        } else if (subModalType.value === 'grado') {
            targetUrl = GradoIEController.update({ grado: subEditingId.value }).url;
        } else {
            targetUrl = SeccionIEController.update({ seccione: subEditingId.value }).url;
        }
        subForm.put(targetUrl, { onSuccess: () => { showSubModal.value = false; } });
    } else {
        if (subModalType.value === 'curso') {
            targetUrl = CursoIEController.store({ institucione: ieId }).url;
        } else if (subModalType.value === 'grado') {
            targetUrl = GradoIEController.store({ institucione: ieId }).url;
        } else {
            targetUrl = SeccionIEController.store({ grado: subParentId.value! }).url;
        }
        subForm.post(targetUrl, { onSuccess: () => { showSubModal.value = false; } });
    }
}

// ─── Eliminar sub-recurso ───
const showDeleteSub = ref(false);
const deleteSubType = ref<'curso' | 'grado' | 'seccion'>('curso');
const deleteSubId = ref<number | null>(null);
const deleteSubName = ref('');
const isDeletingSub = ref(false);

function confirmDeleteSub(type: 'curso' | 'grado' | 'seccion', id: number, name: string) {
    deleteSubType.value = type;
    deleteSubId.value = id;
    deleteSubName.value = name;
    showDeleteSub.value = true;
}

function executeDeleteSub() {
    if (!deleteSubId.value) return;
    isDeletingSub.value = true;
    let targetUrl = '';

    if (deleteSubType.value === 'curso') {
        targetUrl = CursoIEController.destroy({ curso: deleteSubId.value }).url;
    } else if (deleteSubType.value === 'grado') {
        targetUrl = GradoIEController.destroy({ grado: deleteSubId.value }).url;
    } else {
        targetUrl = SeccionIEController.destroy({ seccione: deleteSubId.value }).url;
    }

    router.delete(targetUrl, {
        onSuccess: () => { showDeleteSub.value = false; deleteSubId.value = null; },
        onFinish: () => { isDeletingSub.value = false; },
    });
}

const subModalTitles: Record<string, Record<string, string>> = {
    curso: { create: 'Nuevo Curso', edit: 'Editar Curso' },
    grado: { create: 'Nuevo Grado', edit: 'Editar Grado' },
    seccion: { create: 'Nueva Sección', edit: 'Editar Sección' },
};

const tabs = [
    { key: 'datos', label: 'Datos Generales', icon: School },
    { key: 'cursos', label: 'Cursos', icon: BookOpen },
    { key: 'grados', label: 'Grados y Secciones', icon: GraduationCap },
] as const;
</script>

<template>
    <Head :title="`IE: ${props.institucion.nombreLegal}`" />

    <div class="flex flex-col gap-4 p-4">
        <!-- Encabezado -->
        <div class="flex items-center justify-between">
            <div>
                <h1 class="text-2xl font-bold tracking-tight text-foreground">{{ props.institucion.nombreLegal }}</h1>
                <p class="text-sm text-muted-foreground">
                    Código: <span class="font-semibold text-primary">{{ props.institucion.codigoInstitucion }}</span>
                    <span v-if="props.institucion.codigoModular" class="ml-2">
                        · Modular: <span class="font-semibold">{{ props.institucion.codigoModular }}</span>
                    </span>
                </p>
            </div>
            <Button variant="outline" as-child size="sm">
                <Link :href="InstitucionEducativaController.index().url">
                    <ArrowLeft class="mr-2 h-4 w-4" /> Volver
                </Link>
            </Button>
        </div>

        <!-- Tabs -->
        <div class="flex gap-1 border-b">
            <button
                v-for="tab in tabs" :key="tab.key"
                @click="activeTab = tab.key"
                :class="[
                    'flex items-center gap-2 px-4 py-2.5 text-sm font-medium transition-colors border-b-2 -mb-px',
                    activeTab === tab.key
                        ? 'border-primary text-primary'
                        : 'border-transparent text-muted-foreground hover:text-foreground hover:border-muted-foreground/50',
                ]"
            >
                <component :is="tab.icon" class="h-4 w-4" />
                {{ tab.label }}
            </button>
        </div>

        <!-- Tab: Datos Generales -->
        <div v-if="activeTab === 'datos'" class="rounded-xl border bg-card p-6 shadow-xs">
            <div class="grid grid-cols-2 gap-x-8 gap-y-4 text-sm">
                <div><span class="text-muted-foreground">Tipo Institución:</span><p class="font-medium">{{ props.institucion.tipo_inst_educ?.nombre || '-' }}</p></div>
                <div><span class="text-muted-foreground">Régimen Educativo:</span><p class="font-medium">{{ props.institucion.regimen_educ?.nombre || '-' }}</p></div>
                <div><span class="text-muted-foreground">Modalidad Formativa:</span><p class="font-medium">{{ props.institucion.modalidad_formativa?.nombre || '-' }}</p></div>
                <div><span class="text-muted-foreground">Nivel / Ciclo:</span><p class="font-medium">{{ props.institucion.nivel_ciclo?.nombre || '-' }}</p></div>
                <div><span class="text-muted-foreground">UGEL:</span><p class="font-medium">{{ props.institucion.entidad_ugel?.razonSocial || '-' }}</p></div>
                <div><span class="text-muted-foreground">Entidad Admin:</span><p class="font-medium">{{ props.institucion.entidad_admin?.razonSocial || '-' }}</p></div>
                <div><span class="text-muted-foreground">Fecha Inicio:</span><p class="font-medium">{{ props.institucion.fechaInicio || '-' }}</p></div>
                <div><span class="text-muted-foreground">Fecha Fin:</span><p class="font-medium">{{ props.institucion.fechaFin || '-' }}</p></div>
            </div>
        </div>

        <!-- Tab: Cursos -->
        <div v-if="activeTab === 'cursos'" class="space-y-3">
            <div class="flex justify-between items-center">
                <h2 class="text-lg font-semibold">Cursos</h2>
                <Button size="sm" @click="openSubCreate('curso')"><Plus class="mr-2 h-4 w-4" /> Nuevo Curso</Button>
            </div>
            <div class="rounded-md border bg-card overflow-hidden">
                <Table>
                    <TableHeader>
                        <TableRow>
                            <TableHead class="w-[100px]">Código</TableHead>
                            <TableHead>Nombre</TableHead>
                            <TableHead class="w-[100px]">Sigla</TableHead>
                            <TableHead class="w-[80px]">Estado</TableHead>
                            <TableHead class="w-[100px] text-right">Acciones</TableHead>
                        </TableRow>
                    </TableHeader>
                    <TableBody>
                        <TableRow v-for="curso in props.institucion.cursos || []" :key="curso.id">
                            <TableCell class="font-medium text-xs">{{ curso.codigo || '-' }}</TableCell>
                            <TableCell class="text-sm">{{ curso.nombre }}</TableCell>
                            <TableCell class="text-xs">{{ curso.sigla || '-' }}</TableCell>
                            <TableCell><StatusBadge :active="curso.activo" /></TableCell>
                            <TableCell class="text-right">
                                <DropdownMenu>
                                    <DropdownMenuTrigger as-child><Button variant="ghost" size="sm" class="h-7"><ChevronDown class="h-4 w-4" /></Button></DropdownMenuTrigger>
                                    <DropdownMenuContent align="end">
                                        <DropdownMenuItem @click="openSubEdit('curso', curso)"><Pencil class="mr-2 h-4 w-4" /> Editar</DropdownMenuItem>
                                        <DropdownMenuItem @click="confirmDeleteSub('curso', curso.id, curso.nombre)" class="text-destructive"><Trash2 class="mr-2 h-4 w-4" /> Desactivar</DropdownMenuItem>
                                    </DropdownMenuContent>
                                </DropdownMenu>
                            </TableCell>
                        </TableRow>
                        <TableRow v-if="!props.institucion.cursos?.length"><TableCell colspan="5" class="h-20 text-center text-muted-foreground">No hay cursos registrados.</TableCell></TableRow>
                    </TableBody>
                </Table>
            </div>
        </div>

        <!-- Tab: Grados y Secciones -->
        <div v-if="activeTab === 'grados'" class="space-y-4">
            <div class="flex justify-between items-center">
                <h2 class="text-lg font-semibold">Grados y Secciones</h2>
                <Button size="sm" @click="openSubCreate('grado')"><Plus class="mr-2 h-4 w-4" /> Nuevo Grado</Button>
            </div>
            <div v-for="grado in props.institucion.grados || []" :key="grado.id" class="rounded-lg border bg-card overflow-hidden">
                <div class="flex items-center justify-between border-b bg-muted/30 px-4 py-2.5">
                    <div class="flex items-center gap-2">
                        <GraduationCap class="h-4 w-4 text-primary" />
                        <span class="text-sm font-semibold">{{ grado.nombre }}</span>
                        <span v-if="grado.codigo" class="text-xs text-muted-foreground">({{ grado.codigo }})</span>
                        <StatusBadge :active="grado.activo" />
                    </div>
                    <div class="flex gap-1">
                        <Button variant="ghost" size="sm" class="h-7 text-xs" @click="openSubCreate('seccion', grado.id)"><Plus class="mr-1 h-3 w-3" /> Sección</Button>
                        <Button variant="ghost" size="sm" class="h-7" @click="openSubEdit('grado', grado)"><Pencil class="h-3.5 w-3.5" /></Button>
                        <Button variant="ghost" size="sm" class="h-7 text-destructive" @click="confirmDeleteSub('grado', grado.id, grado.nombre)"><Trash2 class="h-3.5 w-3.5" /></Button>
                    </div>
                </div>
                <div v-if="grado.secciones?.length" class="p-3">
                    <div class="flex flex-wrap gap-2">
                        <div v-for="sec in grado.secciones" :key="sec.id"
                            class="flex items-center gap-2 rounded-md border bg-background px-3 py-1.5 text-sm">
                            <LayoutGrid class="h-3.5 w-3.5 text-muted-foreground" />
                            <span class="font-medium">{{ sec.nombre }}</span>
                            <span v-if="sec.sigla" class="text-xs text-muted-foreground">({{ sec.sigla }})</span>
                            <button @click="openSubEdit('seccion', sec)" class="ml-1 text-muted-foreground hover:text-foreground"><Pencil class="h-3 w-3" /></button>
                            <button @click="confirmDeleteSub('seccion', sec.id, sec.nombre)" class="text-muted-foreground hover:text-destructive"><Trash2 class="h-3 w-3" /></button>
                        </div>
                    </div>
                </div>
                <div v-else class="p-4 text-center text-xs text-muted-foreground">Sin secciones registradas.</div>
            </div>
            <div v-if="!props.institucion.grados?.length" class="rounded-md border p-8 text-center text-muted-foreground">No hay grados registrados.</div>
        </div>

        <!-- Modal Sub-recurso (Curso/Grado/Sección) -->
        <FormModal
            v-model:show="showSubModal"
            :title="subModalTitles[subModalType][subIsEditing ? 'edit' : 'create']"
            :processing="subForm.processing"
            @submit="submitSub"
        >
            <div class="space-y-4">
                <div class="grid gap-2">
                    <Label>Nombre *</Label>
                    <Input v-model="subForm.nombre" placeholder="Nombre del recurso" :class="{ 'border-destructive': subForm.errors.nombre }" />
                    <p v-if="subForm.errors.nombre" class="text-sm text-destructive">{{ subForm.errors.nombre }}</p>
                </div>
                <div class="grid gap-2">
                    <Label>Sigla</Label>
                    <Input v-model="subForm.sigla" placeholder="Opcional" />
                </div>
            </div>
        </FormModal>

        <!-- Modal Eliminar Sub-recurso -->
        <ConfirmModal
            v-model:show="showDeleteSub"
            title="Desactivar Recurso"
            :description="`¿Desactivar '${deleteSubName}'?`"
            confirm-text="Desactivar"
            destructive
            :processing="isDeletingSub"
            @confirm="executeDeleteSub"
            @cancel="deleteSubId = null"
        />
    </div>
</template>
