<script setup lang="ts">
import { Link } from '@inertiajs/vue3';
import AppLogoIcon from '@/components/AppLogoIcon.vue';
import { home } from '@/routes';

const props = withDefaults(defineProps<{
    title?: string;
    description?: string;
}>(), {});
</script>

<template>
    <div class="h-[100dvh] flex flex-col md:flex-row font-sans w-[100dvw] bg-background overflow-hidden">
        <!-- Left column: sign-in form -->
        <section class="flex-1 flex items-center justify-center p-8 overflow-y-auto">
            <div class="w-full max-w-md">
                <div class="flex flex-col gap-6">
                    <div class="animate-element animate-delay-100 mb-2">
                        <Link :href="home()" class="inline-block">
                            <AppLogoIcon class="size-10 fill-current text-foreground" />
                        </Link>
                    </div>
                    
                    <h1 class="animate-element animate-delay-100 text-4xl md:text-5xl font-semibold leading-tight tracking-tighter">
                        {{ title || 'Bienvenido' }}
                    </h1>
                    <p class="animate-element animate-delay-200 text-muted-foreground">
                        {{ description || 'Accede a tu cuenta y continúa tu jornada con nosotros' }}
                    </p>

                    <div class="mt-2">
                        <slot />
                    </div>
                </div>
            </div>
        </section>

        <!-- Right column: background image + logo -->
        <section class="hidden md:block flex-1 relative p-4">
            <!-- Background Image -->
            <div 
                class="animate-slide-right animate-delay-300 absolute inset-4 rounded-3xl bg-cover bg-center shadow-2xl overflow-hidden" 
                style="background-image: url('/img/fondo_1.jpeg')"
            >
                <!-- Gradient from white to transparent (light mode) / dark to transparent (dark mode) -->
                <div class="absolute inset-0 bg-gradient-to-b from-white via-white/70 to-transparent dark:from-zinc-950 dark:via-zinc-950/80 dark:to-transparent"></div>
                
                <!-- Logo overlay -->
                <div class="absolute inset-x-0 top-0 pt-8 flex justify-center">
                    <img 
                        src="/img/dre_logo.png" 
                        alt="Logo DRE" 
                        class="animate-element animate-delay-1000 w-full max-w-md lg:max-w-lg xl:max-w-xl drop-shadow-xl z-10 px-6" 
                    />
                </div>
            </div>
            
        </section>
    </div>
</template>
