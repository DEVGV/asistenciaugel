<script setup lang="ts">
import { Form, Head, setLayoutProps } from '@inertiajs/vue3';
import { computed, ref, watchEffect } from 'vue';
import InputError from '@/components/InputError.vue';
import GlassInputWrapper from '@/components/GlassInputWrapper.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import {
    InputOTP,
    InputOTPGroup,
    InputOTPSlot,
} from '@/components/ui/input-otp';
import { store } from '@/routes/two-factor/login';
import type { TwoFactorConfigContent } from '@/types';

const showRecoveryInput = ref<boolean>(false);
const code = ref<string>('');

const authConfigContent = computed<TwoFactorConfigContent>(() => {
    if (showRecoveryInput.value) {
        return {
            title: 'Código de recuperación',
            description:
                'Por favor, confirma el acceso a tu cuenta ingresando uno de tus códigos de recuperación de emergencia.',
            buttonText: 'iniciar sesión usando un código de autenticación',
        };
    }

    return {
        title: 'Código de autenticación',
        description:
            'Ingresa el código de autenticación proporcionado por tu aplicación de autenticación.',
        buttonText: 'iniciar sesión usando un código de recuperación',
    };
});

watchEffect(() => {
    setLayoutProps({
        title: authConfigContent.value.title,
        description: authConfigContent.value.description,
    });
});

const toggleRecoveryMode = (clearErrors: () => void): void => {
    showRecoveryInput.value = !showRecoveryInput.value;
    clearErrors();
    code.value = '';
};
</script>

<template>
    <Head title="Autenticación de dos factores" />

    <div class="space-y-6">
        <template v-if="!showRecoveryInput">
            <Form
                v-bind="store.form()"
                class="space-y-6"
                reset-on-error
                @error="code = ''"
                #default="{ errors, processing, clearErrors }"
            >
                <input type="hidden" name="code" :value="code" />
                <div class="animate-element animate-delay-200 flex flex-col items-center justify-center space-y-3 text-center">
                    <div class="flex w-full items-center justify-center">
                        <InputOTP
                            id="otp"
                            v-model="code"
                            :maxlength="6"
                            :disabled="processing"
                            autofocus
                        >
                            <InputOTPGroup class="gap-2">
                                <InputOTPSlot
                                    v-for="index in 6"
                                    :key="index"
                                    :index="index - 1"
                                    class="rounded-xl border-border bg-foreground/5 backdrop-blur-md size-12 text-lg focus:border-primary focus:ring-4 focus:ring-primary/10"
                                />
                            </InputOTPGroup>
                        </InputOTP>
                    </div>
                    <InputError :message="errors.code" />
                </div>
                
                <Button 
                    type="submit" 
                    class="animate-element animate-delay-300 w-full h-12 rounded-2xl bg-primary py-4 font-semibold text-primary-foreground hover:bg-primary/90 transition-all duration-300 shadow-lg shadow-primary/20" 
                    :disabled="processing"
                >
                    <template v-if="processing">
                        <span class="animate-spin mr-2">◌</span>
                        Verificando...
                    </template>
                    <template v-else>
                        Continuar
                    </template>
                </Button>

                <div class="animate-element animate-delay-400 text-center text-sm text-muted-foreground">
                    <span>o puedes </span>
                    <button
                        type="button"
                        class="text-primary font-medium hover:underline transition-colors"
                        @click="() => toggleRecoveryMode(clearErrors)"
                    >
                        {{ authConfigContent.buttonText }}
                    </button>
                </div>
            </Form>
        </template>

        <template v-else>
            <Form
                v-bind="store.form()"
                class="space-y-6"
                reset-on-error
                #default="{ errors, processing, clearErrors }"
            >
                <div class="animate-element animate-delay-200">
                    <GlassInputWrapper>
                        <Input
                            name="recovery_code"
                            type="text"
                            placeholder="Ingresa un código de recuperación"
                            :autofocus="showRecoveryInput"
                            required
                            class="h-12 border-0 bg-transparent shadow-none focus-visible:ring-0 px-4"
                        />
                    </GlassInputWrapper>
                    <InputError :message="errors.recovery_code" class="mt-2 ml-1" />
                </div>

                <Button 
                    type="submit" 
                    class="animate-element animate-delay-300 w-full h-12 rounded-2xl bg-primary py-4 font-semibold text-primary-foreground hover:bg-primary/90 transition-all duration-300 shadow-lg shadow-primary/20" 
                    :disabled="processing"
                >
                    <template v-if="processing">
                        <span class="animate-spin mr-2">◌</span>
                        Verificando...
                    </template>
                    <template v-else>
                        Continuar
                    </template>
                </Button>

                <div class="animate-element animate-delay-400 text-center text-sm text-muted-foreground">
                    <span>o puedes </span>
                    <button
                        type="button"
                        class="text-primary font-medium hover:underline transition-colors"
                        @click="() => toggleRecoveryMode(clearErrors)"
                    >
                        {{ authConfigContent.buttonText }}
                    </button>
                </div>
            </Form>
        </template>
    </div>
</template>
