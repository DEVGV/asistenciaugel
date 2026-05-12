export interface Area {
    id: number;
    codigo: string | null;
    nombre: string | null;
    sigla: string | null;
    descripcion: string | null;
    rolTrabajador_id: number | null;
    activo: boolean;
}

export interface Cargo {
    id: number;
    codigo: string | null;
    nombre: string | null;
    abreviatura: string | null;
    rolTrabajador_id: number | null;
    created_by: number | null;
    activo: boolean;
}

export interface CondicionLaboral {
    id: number;
    codigo: string | null;
    regimenLaboral_id: number;
    tipoTrabajador_id: number;
    nombre: string | null;
    abreviatura: string | null;
    descripcion: string | null;
    created_by: number | null;
    // Relations
    regimenLaboral?: { id: number; nombre: string | null };
    tipoTrabajador?: { id: number; nombre: string | null };
}
