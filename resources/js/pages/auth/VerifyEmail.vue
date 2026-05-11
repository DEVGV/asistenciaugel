<script setup lang="ts">
import { Form, Head } from '@inertiajs/vue3';
import TextLink from '@/components/TextLink.vue';
import { Button } from '@/components/ui/button';
import { logout } from '@/routes';
import { send } from '@/routes/verification';

defineOptions({
    layout: {
        title: 'Verifica tu correo',
        description:
            'Por favor, verifica tu dirección de correo haciendo clic en el enlace que acabamos de enviarte.',
    },
});

defineProps<{
    status?: string;
}>();
</script>

<template>
    <Head title="Verificación de correo" />

    <div
        v-if="status === 'verification-link-sent'"
        class="mb-6 text-center text-sm font-medium text-green-600 animate-element"
    >
        Se ha enviado un nuevo enlace de verificación a la dirección de correo que proporcionaste.
    </div>

    <Form
        v-bind="send.form()"
        class="flex flex-col gap-6"
        v-slot="{ processing }"
    >
        <div class="space-y-4">
            <Button 
                type="submit"
                class="animate-element animate-delay-200 w-full h-12 rounded-2xl bg-primary py-4 font-semibold text-primary-foreground hover:bg-primary/90 transition-all duration-300 shadow-lg shadow-primary/20"
                :disabled="processing"
            >
                <template v-if="processing">
                    <span class="animate-spin mr-2">◌</span>
                    Reenviando...
                </template>
                <template v-else>
                    Reenviar correo de verificación
                </template>
            </Button>

            <TextLink :href="logout()" as="button" class="animate-element animate-delay-300 mx-auto block text-sm text-muted-foreground hover:text-primary transition-colors">
                Cerrar sesión
            </TextLink>
        </div>
    </Form>
</template>
