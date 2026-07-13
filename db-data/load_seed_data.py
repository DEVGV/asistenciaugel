#!/usr/bin/env python3
"""
Carga datos de prueba a PostgreSQL de forma segura y RÁPIDA.
- Extrae solo los INSERT del archivo SQL de Navicat
- Los convierte a INSERT ... ON CONFLICT DO NOTHING
- Los ejecuta TODOS en un solo psql con ON_ERROR_ROLLBACK habilitado
  (errores individuales no abortan las demás inserciones)
- Deshabilita FK checks temporalmente para evitar problemas de orden
"""

import sys
import subprocess
import os
from pathlib import Path

# ── Configuración ──────────────────────────────────────────────────────────────
PROJECT_DIR = Path(__file__).parent.parent
ENV_FILE = PROJECT_DIR / ".env"
DOCKER_COMPOSE = PROJECT_DIR / "docker-compose.yml"


def load_env() -> dict:
    """Lee variables DB_* del .env"""
    env = {
        "DB_HOST": "db",
        "DB_PORT": "5432",
        "DB_DATABASE": "asistenciaugel",
        "DB_USERNAME": "sail",
        "DB_PASSWORD": "password",
    }
    if ENV_FILE.exists():
        for line in ENV_FILE.read_text().splitlines():
            line = line.strip()
            if line.startswith("DB_") and "=" in line:
                key, _, val = line.partition("=")
                env[key.strip()] = val.strip().strip('"').strip("'")
    return env


def extract_inserts(sql_path: Path) -> list[str]:
    """
    Extrae todos los INSERT INTO del archivo SQL de Navicat.
    Los INSERTs de Navicat son siempre de una sola línea.
    Agrega ON CONFLICT DO NOTHING al final de cada uno.
    """
    inserts = []
    content = sql_path.read_text(encoding="utf-8-sig", errors="replace")

    for line in content.splitlines():
        stripped = line.strip()
        if stripped.upper().startswith("INSERT INTO "):
            clean = stripped.rstrip(";").rstrip()
            inserts.append(f"{clean} ON CONFLICT DO NOTHING;")

    return inserts


def build_sql_block(inserts: list[str]) -> str:
    """
    Construye el bloque SQL completo para ejecutar en un único psql:
    - \set ON_ERROR_ROLLBACK on  → cada INSERT es autocommit, errores no abortan el lote
    - SET session_replication_role = replica  → deshabilita FK checks
    """
    lines = [
        r"\set ON_ERROR_ROLLBACK on",
        "SET session_replication_role = replica;",
        "",
    ]
    lines.extend(inserts)
    lines += [
        "",
        "SET session_replication_role = DEFAULT;",
    ]
    return "\n".join(lines)


def run_psql_batch(sql_content: str, env: dict) -> tuple[bool, str]:
    """
    Ejecuta un bloque SQL completo via docker compose exec psql.
    El SQL se pasa por stdin para evitar límites de longitud de comando.
    """
    cmd = [
        "docker", "compose", "-f", str(DOCKER_COMPOSE),
        "exec", "-T", "db",
        "psql",
        "-h", "localhost",
        "-U", env["DB_USERNAME"],
        "-d", env["DB_DATABASE"],
        "--quiet",           # suprime mensajes de rows/commands
    ]

    result = subprocess.run(
        cmd,
        input=sql_content,
        capture_output=True,
        text=True,
        env={**os.environ, "PGPASSWORD": env["DB_PASSWORD"]},
    )

    output = (result.stdout + result.stderr).strip()
    return result.returncode == 0, output


def parse_stats(output: str, total_inserts: int) -> dict:
    """Parsea la salida de psql para contar insertados vs omitidos."""
    inserted = output.count("INSERT 0 1")
    skipped = output.count("INSERT 0 0")
    # Los errores de FK o constraint aparecen como ERROR en la salida
    errors = [
        line for line in output.splitlines()
        if "ERROR" in line and "duplicate key" not in line.lower()
    ]
    return {
        "total": total_inserts,
        "ok": inserted,
        "skip": skipped,
        "err": len(errors),
        "error_lines": errors[:5],  # solo los primeros 5
    }


def load_schema(schema_name: str, sql_file: Path, env: dict) -> dict:
    """Carga los INSERTs de un schema en un único lote."""

    print(f"\n📥 Cargando schema '{schema_name}' desde {sql_file.name}...")

    inserts = extract_inserts(sql_file)
    print(f"   → {len(inserts)} registros encontrados")

    if not inserts:
        print("   ℹ️  Sin datos para insertar en este schema")
        return {"total": 0, "ok": 0, "skip": 0, "err": 0, "error_lines": []}

    sql_block = build_sql_block(inserts)
    ok, output = run_psql_batch(sql_block, env)

    stats = parse_stats(output, len(inserts))

    # Mostrar errores que no sean de clave duplicada
    if stats["error_lines"]:
        print("   ⚠️  Algunos errores encontrados:")
        for err in stats["error_lines"]:
            print(f"      {err[:120]}")

    print(
        f"   ✅ Insertados: {stats['ok']} | "
        f"Omitidos (ya existían): {stats['skip']} | "
        f"Errores FK/otros: {stats['err']}"
    )

    return stats


RESET_SEQUENCES_SQL = """
DO $$
DECLARE
    r RECORD;
    max_val BIGINT;
BEGIN
    FOR r IN
        SELECT
            n.nspname AS schema,
            t.relname AS table_name,
            a.attname AS column_name,
            pg_get_serial_sequence(format('%I.%I', n.nspname, t.relname), a.attname) AS seq
        FROM pg_attribute a
        JOIN pg_class t ON a.attrelid = t.oid
        JOIN pg_namespace n ON t.relnamespace = n.oid
        WHERE a.attnum > 0
          AND NOT a.attisdropped
          AND n.nspname IN ('public', 'param', 'conasis', 'auth')
          AND pg_get_serial_sequence(
              format('%I.%I', n.nspname, t.relname), a.attname
          ) IS NOT NULL
    LOOP
        EXECUTE format(
            'SELECT COALESCE(MAX(%I), 0) FROM %I.%I',
            r.column_name, r.schema, r.table_name
        ) INTO max_val;

        IF max_val > 0 THEN
            EXECUTE format('SELECT setval(%L, %s)', r.seq, max_val);
        END IF;
    END LOOP;
END $$;
"""


def reset_sequences(env: dict) -> None:
    """
    Resetea todas las sequences de PostgreSQL al valor MAX(id) de cada tabla.
    Necesario después de INSERTs con IDs explícitos para evitar
    'duplicate key value violates unique constraint' en inserts futuros.
    """
    print("\n🔄 Reseteando sequences al valor correcto...")
    ok, output = run_psql_batch(RESET_SEQUENCES_SQL, env)
    if ok:
        print("   ✅ Sequences sincronizadas correctamente")
    else:
        print(f"   ⚠️  Error al resetear sequences: {output[:200]}")


def main():
    print()
    print("╔═══════════════════════════════════════════════════════╗")
    print("║   Carga de datos de prueba (NO DESTRUCTIVO)           ║")
    print("║   INSERT ... ON CONFLICT DO NOTHING  (modo batch)    ║")
    print("╚═══════════════════════════════════════════════════════╝")

    env = load_env()
    print(f"\n   Base de datos : {env['DB_DATABASE']}")
    print(f"   Host          : {env['DB_HOST']}:{env['DB_PORT']}")
    print(f"   Usuario       : {env['DB_USERNAME']}")

    # Verificar conexión
    ok, output = run_psql_batch("SELECT 1;", env)
    if not ok:
        print(f"\n❌ No se puede conectar a la base de datos:")
        print(f"   {output}")
        print("\n   ¿Está corriendo Docker Sail? Intenta: composer run dev")
        sys.exit(1)

    print("\n   ✅ Conexión a la base de datos OK")

    db_data_dir = Path(__file__).parent

    # Orden: param primero (tablas de referencia/catálogos),
    # luego public, conasis, auth
    files_to_load = [
        ("param",   db_data_dir / "param.sql"),
        ("public",  db_data_dir / "public.sql"),
        ("conasis", db_data_dir / "conasis.sql"),
        ("auth",    db_data_dir / "auth.sql"),
    ]

    totals = {"total": 0, "ok": 0, "skip": 0, "err": 0}

    for schema_name, sql_file in files_to_load:
        if not sql_file.exists():
            print(f"\n⚠️  Archivo no encontrado: {sql_file.name}")
            continue

        stats = load_schema(schema_name, sql_file, env)
        for key in totals:
            totals[key] += stats[key]

    print()
    print("═" * 57)
    print("   RESUMEN FINAL")
    print(f"   Total procesados      : {totals['total']}")
    print(f"   Insertados nuevos     : {totals['ok']}")
    print(f"   Omitidos (ya existían): {totals['skip']}")
    print(f"   Errores otros         : {totals['err']}")
    print("═" * 57)
    print("\n🎉 Carga completada. Los datos existentes NO fueron modificados.\n")

    # IMPORTANTE: resetear sequences para evitar "duplicate key" en inserts futuros
    reset_sequences(env)


if __name__ == "__main__":
    main()
