<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue';
import { onClickOutside } from '@vueuse/core';
import { Label } from '@/components/ui/label';
import { Check, ChevronDown, Search } from 'lucide-vue-next';
import type { ParamSimple } from '@/types/models/params';
import { cn } from '@/lib/utils';

const props = defineProps<{
    type: string;
    parentId?: number | null;
    modelValue?: number | string | null;
    label?: string;
    placeholder?: string;
    error?: string;
    disabled?: boolean;
}>();

const emit = defineEmits<{
    (e: 'update:modelValue', value: number | string | null): void;
    (e: 'update:item', item: ParamSimple | null): void;
}>();

const data = ref<ParamSimple[]>([]);
const loading = ref(true);
const isOpen = ref(false);
const searchQuery = ref('');
const target = ref(null);

onClickOutside(target, () => {
    isOpen.value = false;
});

async function fetchData() {
    loading.value = true;
    try {
        const url = props.parentId 
            ? `/api/params/${props.type}?parent_id=${props.parentId}`
            : `/api/params/${props.type}`;
            
        const response = await fetch(url);
        if (!response.ok) throw new Error('Network response was not ok');
        const json = await response.json();
        data.value = json.data;
        if (props.modelValue) {
            const initialItem = data.value.find(i => String(i.id) === String(props.modelValue));
            if (initialItem) {
                emit('update:item', initialItem);
            }
        }
    } catch (e) {
        console.error(`Error loading params for ${props.type}`, e);
    } finally {
        loading.value = false;
    }
}

onMounted(() => {
    fetchData();
});

watch(() => props.parentId, () => {
    fetchData();
    emit('update:modelValue', null); // Limpiar si cambia el padre
    emit('update:item', null);
});

watch(() => props.modelValue, (newVal) => {
    if (!newVal) {
        emit('update:item', null);
    } else if (data.value.length > 0) {
        const item = data.value.find(i => String(i.id) === String(newVal));
        if (item) emit('update:item', item);
    }
});

// Altamente optimizado para miles de registros: filtra localmente y renderiza máximo 100
const filteredData = computed(() => {
    const query = searchQuery.value.toLowerCase().trim();
    let results = data.value;
    
    if (query) {
        results = results.filter(item => {
            const name = item.nombre || item.descripcion || '';
            return String(name).toLowerCase().includes(query);
        });
    }
    
    return results.slice(0, 100);
});

const selectedItemName = computed(() => {
    if (!props.modelValue) return '';
    const item = data.value.find(i => String(i.id) === String(props.modelValue));
    return item ? (item.nombre || item.descripcion) : '';
});

function toggleDropdown() {
    if (props.disabled || loading.value) return;
    isOpen.value = !isOpen.value;
    if (isOpen.value) {
        searchQuery.value = ''; // Limpiar búsqueda al abrir
    }
}

function selectItem(item: ParamSimple) {
    emit('update:modelValue', item.id);
    emit('update:item', item);
    isOpen.value = false;
    searchQuery.value = '';
}
</script>

<template>
    <div class="grid gap-2" ref="target">
        <Label v-if="label">{{ label }}</Label>
        <div class="relative">
            <!-- Trigger -->
            <button
                type="button"
                @click="toggleDropdown"
                :disabled="disabled || loading"
                :class="cn(
                    'w-full flex items-center justify-between px-3 py-2 text-sm bg-background border rounded-md shadow-sm outline-none focus:ring-2 focus:ring-primary focus:ring-offset-2 transition-all disabled:opacity-50 disabled:cursor-not-allowed',
                    isOpen ? 'ring-2 ring-primary ring-offset-2 border-primary' : 'border-input',
                    error ? 'border-destructive ring-destructive' : ''
                )"
            >
                <span :class="!selectedItemName ? 'text-muted-foreground' : 'text-foreground line-clamp-1 text-left'">
                    {{ loading ? 'Cargando...' : (selectedItemName || placeholder || 'Seleccionar...') }}
                </span>
                <ChevronDown class="w-4 h-4 text-muted-foreground ml-2 opacity-50 shrink-0" />
            </button>

            <!-- Dropdown Menu -->
            <div
                v-if="isOpen"
                class="absolute z-50 w-full mt-1 bg-background border rounded-md shadow-lg text-sm overflow-hidden animate-in fade-in-0 zoom-in-95"
            >
                <!-- Search Input -->
                <div class="flex items-center border-b px-3">
                    <Search class="h-4 w-4 text-muted-foreground shrink-0 opacity-50" />
                    <input
                        type="text"
                        v-model="searchQuery"
                        placeholder="Buscar..."
                        class="flex h-10 w-full rounded-md bg-transparent py-3 px-3 text-sm outline-none placeholder:text-muted-foreground"
                        @click.stop
                    />
                </div>

                <!-- Viewport -->
                <div class="max-h-60 overflow-y-auto p-1">
                    <div v-if="filteredData.length === 0" class="py-6 text-center text-sm text-muted-foreground">
                        No se encontraron resultados.
                    </div>
                    
                    <div
                        v-for="item in filteredData"
                        :key="item.id"
                        @click="selectItem(item)"
                        :class="cn(
                            'relative flex w-full cursor-pointer select-none items-center rounded-sm py-2 pl-8 pr-2 text-sm outline-none hover:bg-accent hover:text-accent-foreground transition-colors',
                            String(item.id) === String(modelValue) ? 'bg-primary/10 text-primary font-medium' : ''
                        )"
                    >
                        <span v-if="String(item.id) === String(modelValue)" class="absolute left-2 flex h-3.5 w-3.5 items-center justify-center">
                            <Check class="h-4 w-4" />
                        </span>
                        <span class="line-clamp-1">{{ item.nombre || item.descripcion }}</span>
                    </div>
                </div>
            </div>
        </div>
        <p v-if="error" class="text-sm text-destructive">{{ error }}</p>
    </div>
</template>
