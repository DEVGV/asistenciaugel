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
    title?: string;
    description?: string;
    processing?: boolean;
    confirmText?: string;
    cancelText?: string;
    destructive?: boolean;
}>();

const emit = defineEmits<{
    (e: 'update:show', value: boolean): void;
    (e: 'confirm'): void;
    (e: 'cancel'): void;
}>();

function onUpdateOpen(value: boolean) {
    emit('update:show', value);
    if (!value) {
        emit('cancel');
    }
}
</script>

<template>
    <Dialog :open="show" @update:open="onUpdateOpen">
        <DialogContent class="sm:max-w-md p-0 overflow-hidden flex flex-col font-sans max-h-[min(800px,_80vh)] gap-0 duration-300">
            <DialogHeader class="sticky top-0 bg-background border-b pt-6 pb-5 px-6 z-10 shrink-0">
                <DialogTitle class="text-2xl font-semibold tracking-[-0.029375rem]">{{ title || 'Confirmar acción' }}</DialogTitle>
                <DialogDescription class="text-base text-muted-foreground mt-2">
                    {{ description || '¿Estás seguro de que deseas continuar con esta acción? Esta acción no se puede deshacer.' }}
                </DialogDescription>
            </DialogHeader>

            <DialogFooter class="sticky bottom-0 p-4 flex flex-row justify-between sm:justify-between shrink-0 bg-muted/30 border-t rounded-b-xl z-10">
                <Button type="button" variant="outline" @click="onUpdateOpen(false)" :disabled="processing">
                    {{ cancelText || 'Cancelar' }}
                </Button>
                <Button 
                    type="button" 
                    :variant="destructive ? 'destructive' : 'default'" 
                    :disabled="processing"
                    @click="emit('confirm')"
                >
                    {{ confirmText || 'Confirmar' }}
                </Button>
            </DialogFooter>
        </DialogContent>
    </Dialog>
</template>
