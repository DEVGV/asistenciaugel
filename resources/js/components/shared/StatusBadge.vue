<script setup lang="ts">
import { Badge } from '@/components/ui/badge';

defineProps<{
    active: boolean;
}>();
</script>

<template>
    <Badge
        v-if="active"
        variant="outline"
        class="bg-green-50 text-green-700 border-green-200 dark:bg-green-950/30 dark:text-green-400 dark:border-green-800 font-semibold text-[10px] tracking-wider uppercase px-2 py-0.5 rounded-md"
    >
        Activo
    </Badge>
    <Badge
        v-else
        variant="outline"
        class="bg-red-50 text-red-700 border-red-200 dark:bg-red-950/30 dark:text-red-400 dark:border-red-800 font-semibold text-[10px] tracking-wider uppercase px-2 py-0.5 rounded-md"
    >
        Inactivo
    </Badge>
</template>
