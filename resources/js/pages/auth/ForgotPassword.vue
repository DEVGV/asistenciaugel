<script setup lang="ts">
import { Form, Head } from '@inertiajs/vue3';
import InputError from '@/components/InputError.vue';
import TextLink from '@/components/TextLink.vue';
import GlassInputWrapper from '@/components/GlassInputWrapper.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { login } from '@/routes';
import { email } from '@/routes/password';

defineOptions({
    layout: {
        title: 'Recuperar contraseña',
        description: 'Ingresa tu correo para recibir un enlace de restablecimiento',
    },
});

defineProps<{
    status?: string;
}>();
</script>

<template>
    <Head title="¿Olvidaste tu contraseña?" />

    <div
        v-if="status"
        class="mb-4 text-center text-sm font-medium text-green-600 animate-element"
    >
        {{ status }}
    </div>

    <div class="space-y-6">
        <Form v-bind="email.form()" v-slot="{ errors, processing }">
            <div class="animate-element animate-delay-200">
                <Label for="email" class="text-sm font-medium text-muted-foreground ml-1">Correo Electrónico</Label>
                <GlassInputWrapper class="mt-1.5">
                    <Input
                        id="email"
                        type="email"
                        name="email"
                        autocomplete="off"
                        autofocus
                        placeholder="nombre@ejemplo.com"
                        class="h-12 border-0 bg-transparent shadow-none focus-visible:ring-0 px-4"
                    />
                </GlassInputWrapper>
                <InputError :message="errors.email" class="mt-2 ml-1" />
            </div>

            <div class="mt-8">
                <Button
                    class="animate-element animate-delay-300 w-full h-12 rounded-2xl bg-primary py-4 font-semibold text-primary-foreground hover:bg-primary/90 transition-all duration-300 shadow-lg shadow-primary/20"
                    :disabled="processing"
                >
                    <template v-if="processing">
                        <span class="animate-spin mr-2">◌</span>
                        Enviando enlace...
                    </template>
                    <template v-else>
                        Enviar enlace de restablecimiento
                    </template>
                </Button>
            </div>
        </Form>

        <div class="animate-element animate-delay-400 space-x-1 text-center text-sm text-muted-foreground">
            <span>O, vuelve a</span>
            <TextLink :href="login()" class="text-primary font-medium hover:underline transition-colors">iniciar sesión</TextLink>
        </div>
    </div>
</template>
