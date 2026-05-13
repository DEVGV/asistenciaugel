<script setup lang="ts">
import { Head, Link } from '@inertiajs/vue3';
import {
    ArrowLeft,
    UserCheck,
    User,
    FileText,
    Calendar,
    Phone,
    Mail,
    MapPin,
} from 'lucide-vue-next';
import { ref } from 'vue';
import TrabajadorController from '@/actions/App/Http/Controllers/Trabajador/TrabajadorController';
import DomiciliosList from '@/components/persona/DomiciliosList.vue';
import EmailsList from '@/components/persona/EmailsList.vue';
import TelefonosList from '@/components/persona/TelefonosList.vue';
import StatusBadge from '@/components/shared/StatusBadge.vue';
import { Button } from '@/components/ui/button';
import type { Trabajador } from '@/types/models/trabajador';

const props = defineProps<{
    trabajador: Trabajador;
}>();

defineOptions({
    layout: {
        breadcrumbs: [
            { title: 'Trabajadores', href: TrabajadorController.index().url },
            {
                title: 'Detalles del Trabajador',
                href: '#',
            },
        ],
    },
});

const activeTab = ref<'datos' | 'altas' | 'horarios'>('datos');
</script>

<template>
    <Head :title="`Trabajador ${props.trabajador.codigo}`" />

    <div class="mx-auto max-w-6xl p-4 sm:p-6">
        <!-- Banner de Encabezado Superior -->
        <div class="rounded-2xl border bg-card p-6 shadow-xs relative overflow-hidden mb-6">
            <div class="absolute top-0 right-0 w-96 h-96 bg-primary/5 rounded-full blur-3xl -z-10 pointer-events-none"></div>

            <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div class="flex items-start gap-4">
                    <div class="rounded-xl bg-primary/10 p-3 text-primary mt-1">
                        <UserCheck class="h-8 w-8" />
                    </div>
                    <div>
                        <div class="flex items-center gap-2">
                            <span class="text-xs font-semibold text-primary uppercase tracking-wider">
                                Código Asignado
                            </span>
                            <StatusBadge :active="props.trabajador.activo" />
                        </div>
                        <h1 class="text-2xl font-bold tracking-tight text-foreground mt-0.5">
                            {{ props.trabajador.codigo }}
                        </h1>
                        <p class="text-base font-medium text-muted-foreground mt-1">
                            {{ props.trabajador.persona?.paterno }} {{ props.trabajador.persona?.materno }},
                            {{ props.trabajador.persona?.nombre }}
                        </p>
                        <p class="text-xs text-muted-foreground mt-0.5">
                            {{ props.trabajador.persona?.tipoDocIdentidad?.nombre }}:
                            {{ props.trabajador.persona?.docIdentidad }}
                        </p>
                    </div>
                </div>

                <div class="flex items-center gap-2 self-start md:self-center">
                    <Button variant="outline" as-child size="sm">
                        <Link :href="TrabajadorController.edit({ trabajador: props.trabajador.id }).url">
                            Editar Asignación
                        </Link>
                    </Button>
                    <Button variant="secondary" as-child size="sm">
                        <Link :href="TrabajadorController.index().url">
                            <ArrowLeft class="mr-2 h-4 w-4" />
                            Volver
                        </Link>
                    </Button>
                </div>
            </div>

            <!-- Navegación de Tabs -->
            <div class="mt-6 -mb-6 flex gap-2 border-t pt-2 overflow-x-auto">
                <button
                    @click="activeTab = 'datos'"
                    :class="[
                        'flex items-center gap-2 border-b-2 py-3 px-4 text-sm font-medium transition-colors whitespace-nowrap',
                        activeTab === 'datos'
                            ? 'border-primary text-primary font-semibold'
                            : 'border-transparent text-muted-foreground hover:text-foreground',
                    ]"
                >
                    <User class="h-4 w-4" />
                    Datos Personales y Contacto
                </button>
                <button
                    @click="activeTab = 'altas'"
                    :class="[
                        'flex items-center gap-2 border-b-2 py-3 px-4 text-sm font-medium transition-colors whitespace-nowrap',
                        activeTab === 'altas'
                            ? 'border-primary text-primary font-semibold'
                            : 'border-transparent text-muted-foreground hover:text-foreground',
                    ]"
                >
                    <FileText class="h-4 w-4" />
                    Altas Laborales
                    <span class="ml-1 rounded-full bg-muted px-2 py-0.5 text-xs text-muted-foreground font-normal">
                        Fase 4
                    </span>
                </button>
                <button
                    @click="activeTab = 'horarios'"
                    :class="[
                        'flex items-center gap-2 border-b-2 py-3 px-4 text-sm font-medium transition-colors whitespace-nowrap',
                        activeTab === 'horarios'
                            ? 'border-primary text-primary font-semibold'
                            : 'border-transparent text-muted-foreground hover:text-foreground',
                    ]"
                >
                    <Calendar class="h-4 w-4" />
                    Horarios Asignados
                    <span class="ml-1 rounded-full bg-muted px-2 py-0.5 text-xs text-muted-foreground font-normal">
                        Fase 6
                    </span>
                </button>
            </div>
        </div>

        <!-- Contenido de los Tabs -->
        <div class="mt-6">
            <!-- TAB 1: Datos Personales y Sub-recursos -->
            <div v-if="activeTab === 'datos'" class="space-y-6">
                <!-- Tarjeta de Datos de Identificación -->
                <div class="rounded-xl border bg-card p-6 shadow-xs">
                    <h2 class="text-lg font-semibold mb-4 pb-2 border-b">
                        Información de Identificación
                    </h2>
                    <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                        <div>
                            <p class="text-xs text-muted-foreground">Tipo de Documento</p>
                            <p class="text-sm font-medium mt-0.5">
                                {{ props.trabajador.persona?.tipoDocIdentidad?.nombre || '-' }}
                            </p>
                        </div>
                        <div>
                            <p class="text-xs text-muted-foreground">N° de Documento</p>
                            <p class="text-sm font-medium mt-0.5">
                                {{ props.trabajador.persona?.docIdentidad }}
                            </p>
                        </div>
                        <div>
                            <p class="text-xs text-muted-foreground">Sexo</p>
                            <p class="text-sm font-medium mt-0.5">
                                {{ props.trabajador.persona?.sexo?.nombre || '-' }}
                            </p>
                        </div>
                        <div>
                            <p class="text-xs text-muted-foreground">País de Origen</p>
                            <p class="text-sm font-medium mt-0.5">
                                {{ props.trabajador.persona?.pais?.nombre || '-' }}
                            </p>
                        </div>
                        <div>
                            <p class="text-xs text-muted-foreground">Fecha de Nacimiento</p>
                            <p class="text-sm font-medium mt-0.5">
                                {{ props.trabajador.persona?.fechaNac || 'No especificada' }}
                            </p>
                        </div>
                        <div>
                            <p class="text-xs text-muted-foreground">Ubigeo</p>
                            <p class="text-sm font-medium mt-0.5">
                                {{ props.trabajador.persona?.ubigeo || '-' }}
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Sección de Gestión Integrada de Sub-recursos -->
                <div v-if="props.trabajador.persona" class="grid gap-6 md:grid-cols-3">
                    <div class="rounded-xl border bg-card p-4 shadow-xs">
                        <div class="flex items-center gap-2 mb-3 pb-2 border-b">
                            <Phone class="h-4 w-4 text-primary" />
                            <h3 class="font-semibold text-sm">Teléfonos</h3>
                        </div>
                        <TelefonosList
                            :telefonos="props.trabajador.persona.telefonos || []"
                            :persona-id="props.trabajador.persona.id"
                        />
                    </div>

                    <div class="rounded-xl border bg-card p-4 shadow-xs">
                        <div class="flex items-center gap-2 mb-3 pb-2 border-b">
                            <Mail class="h-4 w-4 text-primary" />
                            <h3 class="font-semibold text-sm">Correos Electrónicos</h3>
                        </div>
                        <EmailsList
                            :emails="props.trabajador.persona.emails || []"
                            :persona-id="props.trabajador.persona.id"
                        />
                    </div>

                    <div class="rounded-xl border bg-card p-4 shadow-xs">
                        <div class="flex items-center gap-2 mb-3 pb-2 border-b">
                            <MapPin class="h-4 w-4 text-primary" />
                            <h3 class="font-semibold text-sm">Domicilios</h3>
                        </div>
                        <DomiciliosList
                            :domicilios="props.trabajador.persona.domicilios || []"
                            :persona-id="props.trabajador.persona.id"
                        />
                    </div>
                </div>
            </div>

            <!-- TAB 2: Altas Laborales -->
            <div v-if="activeTab === 'altas'" class="rounded-xl border bg-card p-12 text-center shadow-xs">
                <div class="mx-auto max-w-md">
                    <div class="mx-auto flex h-12 w-12 items-center justify-center rounded-full bg-primary/10 text-primary">
                        <FileText class="h-6 w-6" />
                    </div>
                    <h3 class="mt-4 text-lg font-semibold">Módulo de Altas Laborales</h3>
                    <p class="mt-2 text-sm text-muted-foreground">
                        La gestión de altas, bajas, asignación de cargos, áreas y condiciones laborales para este trabajador se implementará en la **Fase 4**.
                    </p>
                    <div class="mt-6 flex justify-center">
                        <span class="inline-flex items-center rounded-md bg-muted px-3 py-1 text-xs font-medium text-muted-foreground">
                            Próximamente disponible
                        </span>
                    </div>
                </div>
            </div>

            <!-- TAB 3: Horarios -->
            <div v-if="activeTab === 'horarios'" class="rounded-xl border bg-card p-12 text-center shadow-xs">
                <div class="mx-auto max-w-md">
                    <div class="mx-auto flex h-12 w-12 items-center justify-center rounded-full bg-primary/10 text-primary">
                        <Calendar class="h-6 w-6" />
                    </div>
                    <h3 class="mt-4 text-lg font-semibold">Módulo de Horarios y Turnos</h3>
                    <p class="mt-2 text-sm text-muted-foreground">
                        La programación de turnos de asistencia, asignación de cursos, tolerancias y horarios semanales se habilitará en la **Fase 6**.
                    </p>
                    <div class="mt-6 flex justify-center">
                        <span class="inline-flex items-center rounded-md bg-muted px-3 py-1 text-xs font-medium text-muted-foreground">
                            Próximamente disponible
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
