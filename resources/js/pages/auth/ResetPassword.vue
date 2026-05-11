<script setup lang="ts">
import { Form, Head } from '@inertiajs/vue3';
import { ref } from 'vue';
import InputError from '@/components/InputError.vue';
import PasswordInput from '@/components/PasswordInput.vue';
import GlassInputWrapper from '@/components/GlassInputWrapper.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { update } from '@/routes/password';

defineOptions({
    layout: {
        title: 'Restablecer contraseña',
        description: 'Por favor, ingresa tu nueva contraseña a continuación',
    },
});

const props = defineProps<{
    token: string;
    email: string;
}>();

const inputEmail = ref(props.email);
</script>

<template>
    <Head title="Restablecer contraseña" />

    <Form
        v-bind="update.form()"
        :transform="(data) => ({ ...data, token, email })"
        :reset-on-success="['password', 'password_confirmation']"
        v-slot="{ errors, processing }"
        class="flex flex-col gap-6"
    >
        <div class="space-y-4">
            <!-- Email Field -->
            <div class="animate-element animate-delay-200">
                <Label for="email" class="text-sm font-medium text-muted-foreground ml-1">Correo Electrónico</Label>
                <GlassInputWrapper class="mt-1.5 opacity-60">
                    <Input
                        id="email"
                        type="email"
                        name="email"
                        autocomplete="email"
                        v-model="inputEmail"
                        readonly
                        class="h-12 border-0 bg-transparent shadow-none focus-visible:ring-0 px-4 cursor-not-allowed"
                    />
                </GlassInputWrapper>
                <InputError :message="errors.email" class="mt-2 ml-1" />
            </div>

            <!-- Password Field -->
            <div class="animate-element animate-delay-300">
                <Label for="password" class="text-sm font-medium text-muted-foreground ml-1">Nueva Contraseña</Label>
                <GlassInputWrapper class="mt-1.5">
                    <PasswordInput
                        id="password"
                        name="password"
                        autocomplete="new-password"
                        autofocus
                        placeholder="Crea una nueva contraseña"
                        class="h-12 border-0 bg-transparent shadow-none focus-visible:ring-0 px-4"
                    />
                </GlassInputWrapper>
                <InputError :message="errors.password" class="mt-2 ml-1" />
            </div>

            <!-- Confirm Password Field -->
            <div class="animate-element animate-delay-400">
                <Label for="password_confirmation" class="text-sm font-medium text-muted-foreground ml-1">Confirmar Contraseña</Label>
                <GlassInputWrapper class="mt-1.5">
                    <PasswordInput
                        id="password_confirmation"
                        name="password_confirmation"
                        autocomplete="new-password"
                        placeholder="Repite tu nueva contraseña"
                        class="h-12 border-0 bg-transparent shadow-none focus-visible:ring-0 px-4"
                    />
                </GlassInputWrapper>
                <InputError :message="errors.password_confirmation" class="mt-2 ml-1" />
            </div>

            <!-- Reset Password Button -->
            <Button
                type="submit"
                class="animate-element animate-delay-500 w-full h-12 rounded-2xl bg-primary py-4 font-semibold text-primary-foreground hover:bg-primary/90 transition-all duration-300 shadow-lg shadow-primary/20 mt-4"
                :disabled="processing"
            >
                <template v-if="processing">
                    <span class="animate-spin mr-2">◌</span>
                    Restableciendo...
                </template>
                <template v-else>
                    Restablecer Contraseña
                </template>
            </Button>
        </div>
    </Form>
</template>
