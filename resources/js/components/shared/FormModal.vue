<script setup lang="ts">
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from '@/components/ui/dialog';
import { Button } from '@/components/ui/button';

defineProps<{
    show: boolean;
    title: string;
    description?: string;
    processing?: boolean;
    submitText?: string;
    cancelText?: string;
    maxWidth?: 'sm' | 'md' | 'lg' | 'xl' | '2xl' | '3xl' | '4xl' | '5xl';
}>();

const emit = defineEmits<{
    (e: 'update:show', value: boolean): void;
    (e: 'submit'): void;
    (e: 'close'): void;
}>();

function onUpdateOpen(value: boolean) {
    emit('update:show', value);
    if (!value) {
        emit('close');
    }
}
</script>

<template>
    <Dialog :open="show" @update:open="onUpdateOpen">
        <DialogContent :class="['sm:max-w-md p-0 overflow-hidden flex flex-col font-sans max-h-[min(800px,_80vh)] gap-0 duration-300', {
            'sm:max-w-sm': maxWidth === 'sm',
            'sm:max-w-lg': maxWidth === 'lg',
            'sm:max-w-xl': maxWidth === 'xl',
            'sm:max-w-2xl': maxWidth === '2xl',
        }]">
            <DialogHeader class="sticky top-0 bg-background border-b pt-6 pb-5 px-6 z-10 shrink-0">
                <DialogTitle class="text-2xl font-semibold tracking-[-0.029375rem]">{{ title }}</DialogTitle>
                <DialogDescription :class="['text-base text-muted-foreground', { 'sr-only': !description }]">
                    {{ description || 'Complete el formulario a continuación.' }}
                </DialogDescription>
            </DialogHeader>

            <form @submit.prevent="emit('submit')" class="flex flex-col flex-1 overflow-hidden">
                <div class="overflow-y-auto text-sm px-6 py-6 flex-1">
                    <slot />
                </div>
                
                <DialogFooter class="sticky bottom-0 p-4 flex flex-row justify-between sm:justify-between shrink-0 bg-muted/30 border-t rounded-b-xl z-10">
                    <Button type="button" variant="outline" @click="onUpdateOpen(false)" :disabled="processing">
                        {{ cancelText || 'Cancelar' }}
                    </Button>
                    <Button type="submit" :disabled="processing">
                        {{ submitText || 'Guardar' }}
                    </Button>
                </DialogFooter>
            </form>
        </DialogContent>
    </Dialog>
</template>
