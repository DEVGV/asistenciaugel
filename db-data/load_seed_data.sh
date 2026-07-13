#!/usr/bin/env bash

# =============================================================================
# Script de carga de datos de prueba (NO DESTRUCTIVO)
# Solo hace INSERT ... ON CONFLICT DO NOTHING - nunca borra datos existentes
# =============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# Credenciales de la BD (leídas del .env)
DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-5432}"
DB_DATABASE="${DB_DATABASE:-asistenciaugel}"
DB_USERNAME="${DB_USERNAME:-sail}"
DB_PASSWORD="${DB_PASSWORD:-password}"

# Leer variables del .env si existe
if [ -f "$PROJECT_DIR/.env" ]; then
    eval "$(grep -E '^DB_(HOST|PORT|DATABASE|USERNAME|PASSWORD)=' "$PROJECT_DIR/.env" | sed 's/^/export /')"
fi

echo ""
echo "╔══════════════════════════════════════════════════╗"
echo "║   Carga de datos de prueba (sin borrar datos)   ║"
echo "╠══════════════════════════════════════════════════╣"
echo "║  Base de datos : $DB_DATABASE"
echo "║  Host          : $DB_HOST:$DB_PORT"
echo "║  Usuario       : $DB_USERNAME"
echo "╚══════════════════════════════════════════════════╝"
echo ""

# Función para extraer y ejecutar solo los INSERTs de un archivo SQL
load_inserts() {
    local schema="$1"
    local sql_file="$2"

    if [ ! -f "$sql_file" ]; then
        echo "⚠️  Archivo no encontrado: $sql_file"
        return
    fi

    echo "📥 Cargando schema '$schema' desde $(basename "$sql_file")..."

    # Extraer solo las líneas INSERT, reemplazando "VALUES (" con "VALUES ("
    # y agregando ON CONFLICT DO NOTHING al final de cada INSERT
    local temp_sql
    temp_sql=$(mktemp /tmp/seed_XXXXXX.sql)

    # Encabezado de transacción
    echo "BEGIN;" > "$temp_sql"
    echo "SET session_replication_role = replica; -- deshabilita FK checks temporalmente" >> "$temp_sql"
    echo "" >> "$temp_sql"

    # Extraer líneas que son INSERT INTO y transformarlas para agregar ON CONFLICT DO NOTHING
    # Los INSERTs de Navicat son de una sola línea: INSERT INTO "schema"."tabla" VALUES (...)
    grep -E '^INSERT INTO ' "$sql_file" | \
        sed 's/;$/  ON CONFLICT DO NOTHING;/' >> "$temp_sql"

    echo "" >> "$temp_sql"
    echo "SET session_replication_role = DEFAULT;" >> "$temp_sql"
    echo "COMMIT;" >> "$temp_sql"

    # Contar cuántos inserts hay
    local count
    count=$(grep -c 'ON CONFLICT DO NOTHING' "$temp_sql" || true)
    echo "   → $count registros a insertar"

    # Ejecutar usando docker compose exec o psql directo
    if docker compose -f "$PROJECT_DIR/docker-compose.yml" ps --services 2>/dev/null | grep -q "^db$"; then
        # Ejecutar via Docker
        PGPASSWORD="$DB_PASSWORD" docker compose -f "$PROJECT_DIR/docker-compose.yml" exec -T db \
            psql -h localhost -U "$DB_USERNAME" -d "$DB_DATABASE" -f - < "$temp_sql" \
            2>&1 | grep -v "^SET$" | grep -v "^BEGIN$" | grep -v "^COMMIT$" | grep -v "^$" || true
    else
        # Ejecutar psql directamente
        PGPASSWORD="$DB_PASSWORD" psql \
            -h "$DB_HOST" -p "$DB_PORT" \
            -U "$DB_USERNAME" -d "$DB_DATABASE" \
            -f "$temp_sql" \
            2>&1 | grep -v "^SET$" | grep -v "^BEGIN$" | grep -v "^COMMIT$" | grep -v "^$" || true
    fi

    rm -f "$temp_sql"
    echo "   ✅ Schema '$schema' cargado"
    echo ""
}

# ============================================================
# Orden de carga: param primero (tablas de referencia),
# luego public, luego conasis, luego auth
# ============================================================
load_inserts "param"   "$SCRIPT_DIR/param.sql"
load_inserts "public"  "$SCRIPT_DIR/public.sql"
load_inserts "conasis" "$SCRIPT_DIR/conasis.sql"

# auth.sql está vacío, pero lo intentamos de todas formas
if [ -s "$SCRIPT_DIR/auth.sql" ]; then
    load_inserts "auth" "$SCRIPT_DIR/auth.sql"
fi

echo "🎉 Carga completada. Los datos existentes no fueron modificados."
echo ""
