<script setup lang="ts">
import { Link } from '@inertiajs/vue3';
import {
    BookOpen,
    FolderGit2,
    LayoutGrid,
    Users,
    UserCheck,
    School,
    Building2,
    Settings,
    Server,
    CalendarCheck,
    FileText,
} from 'lucide-vue-next';
import AppLogo from '@/components/AppLogo.vue';
import NavFooter from '@/components/NavFooter.vue';
import NavMain from '@/components/NavMain.vue';
import NavUser from '@/components/NavUser.vue';
import {
    Sidebar,
    SidebarContent,
    SidebarFooter,
    SidebarHeader,
    SidebarMenu,
    SidebarMenuButton,
    SidebarMenuItem,
} from '@/components/ui/sidebar';
import { dashboard } from '@/routes';
import EntidadController from '@/actions/App/Http/Controllers/Entidad/EntidadController';
import PersonaController from '@/actions/App/Http/Controllers/Persona/PersonaController';
import AreaController from '@/actions/App/Http/Controllers/Configuracion/AreaController';
import CargoController from '@/actions/App/Http/Controllers/Configuracion/CargoController';
import CondicionLaboralController from '@/actions/App/Http/Controllers/Configuracion/CondicionLaboralController';
import type { NavItem } from '@/types';

const mainNavItems: NavItem[] = [
    {
        title: 'Panel de Control',
        href: dashboard(),
        icon: LayoutGrid,
    },
    {
        title: 'Personas',
        href: PersonaController.index().url,
        icon: Users,
    },
    {
        title: 'Trabajadores',
        href: '#', // TODO: Reemplazar con ruta real
        icon: UserCheck,
    },
    {
        title: 'Instituciones Educativas',
        href: '#', // TODO: Reemplazar con ruta real
        icon: School,
    },
    {
        title: 'Entidades',
        href: EntidadController.index().url,
        icon: Building2,
    },
    {
        title: 'Configuración',
        href: '#',
        icon: Settings,
        items: [
            { title: 'Áreas', href: AreaController.index().url },
            { title: 'Cargos', href: CargoController.index().url },
            {
                title: 'Cond. Laborales',
                href: CondicionLaboralController.index().url,
            },
        ],
    },
    {
        title: 'Infraestructura',
        href: '#',
        icon: Server,
        items: [
            { title: 'Locales', href: '#' },
            { title: 'Relojes', href: '#' },
            { title: 'Dispositivos', href: '#' },
        ],
    },
    {
        title: 'Asistencia',
        href: '#',
        icon: CalendarCheck,
        items: [
            { title: 'Marcaciones', href: '#' },
            { title: 'Mensual', href: '#' },
            { title: 'Consolidación', href: '#' },
        ],
    },
    {
        title: 'Trámites',
        href: '#',
        icon: FileText,
        items: [
            { title: 'Expedientes', href: '#' },
            { title: 'Justificaciones', href: '#' },
            { title: 'Suspensiones', href: '#' },
        ],
    },
];

const footerNavItems: NavItem[] = [
    {
        title: 'Repositorio',
        href: 'https://github.com/laravel/vue-starter-kit',
        icon: FolderGit2,
    },
    {
        title: 'Documentación',
        href: 'https://laravel.com/docs/starter-kits#vue',
        icon: BookOpen,
    },
];
</script>

<template>
    <Sidebar collapsible="icon" variant="inset">
        <SidebarHeader>
            <SidebarMenu>
                <SidebarMenuItem>
                    <SidebarMenuButton size="lg" as-child>
                        <Link :href="dashboard()">
                            <AppLogo />
                        </Link>
                    </SidebarMenuButton>
                </SidebarMenuItem>
            </SidebarMenu>
        </SidebarHeader>

        <SidebarContent>
            <NavMain :items="mainNavItems" />
        </SidebarContent>

        <SidebarFooter>
            <NavFooter :items="footerNavItems" />
            <NavUser />
        </SidebarFooter>
    </Sidebar>
    <slot />
</template>
