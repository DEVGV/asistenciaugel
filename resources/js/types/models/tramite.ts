import type { ParamSimple } from './params';

// ── Enums ────────────────────────────────────────────────────────────────────

export type TipoExpediente = 'J' | 'S' | 'E' | 'I';

export const TIPO_EXPEDIENTE_LABELS: Record<TipoExpediente, string> = {
    J: 'Justificación',
    S: 'Suspensión',
    E: 'Exoneración',
    I: 'Incapacidad',
};

// ── Modelos ──────────────────────────────────────────────────────────────────

export interface DocumentoTram {
    id: number;
    expediente_id: number | null;
    documento_id: number | null;
    nroDoc: string | null;
    fechaDoc: string | null;
    trabajadorDoc_id: number | null;
    rutaDoc: string | null;
    observacion: string | null;
    created_by: number | null;
    // Relaciones
    documento?: ParamSimple;
}

export interface Expediente {
    id: number;
    codigo: string | null;
    tipoExpediente: TipoExpediente | null;
    anio: number | null;
    trabajador_id: number | null;
    altaTrabajador_id: number | null;
    asunto: string | null;
    fecha: string | null;
    observacion: string | null;
    estado_id: number | null;
    created_at: string | null;
    // Relaciones
    estado?: ParamSimple;
    trabajador?: {
        id: number;
        persona?: {
            id: number;
            paterno: string | null;
            materno: string | null;
            nombre: string | null;
            docIdentidad: string | null;
        };
    };
    documentos?: DocumentoTram[];
}

// ── Formularios ──────────────────────────────────────────────────────────────

export interface DocumentoTramForm {
    documento_id: number | null;
    nroDoc: string;
    fechaDoc: string;
    observacion: string;
    archivo: File | null;
}

export interface PersonalActivoOption {
    alta_id: number;
    trabajador_id: number;
    label: string;
    docIdentidad: string | null;
    cargo: string | null;
}

export interface ExpedienteForm {
    tipoExpediente: TipoExpediente | '';
    trabajador_id: number | null;
    altaTrabajador_id: number | null;
    asunto: string;
    fecha: string;
    observacion: string;
    documentos: DocumentoTramForm[];
}
