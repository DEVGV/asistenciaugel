-- =========================================================
-- LIMPIEZA DE BASE DE DATOS
-- Conserva:
--   - Todas las tablas del schema "param" (parametrías)
--   - Persona con docIdentidad = '76955033' (id=1)
--   - Usuario con login = '76955033' (id=1, trabajador_id=1)
--   - Trabajador id=1
--   - Roles, perfiles y permisos (auth.perfiles, auth.permisos, auth.perfil_permisos)
--   - Asignaciones del usuario id=1 (auth.usuario_perfil_ie, auth.usuario_permisos_ie)
-- Limpia:
--   - Todos los datos transaccionales del schema "conasis"
--   - Todos los datos del schema "public" EXCEPTO persona_id=1 y trabajador_id=1
--   - Usuarios de auth.users EXCEPTO id=1
--   - Sesiones y tokens de reset
-- =========================================================

BEGIN;

-- -------------------------------------------------------
-- 1. SCHEMA "auth" primero — para liberar FKs sobre t_trabajador
-- -------------------------------------------------------

-- Limpiar sesiones y tokens de reset
TRUNCATE TABLE auth.password_reset_tokens RESTART IDENTITY CASCADE;
TRUNCATE TABLE auth.sessions RESTART IDENTITY CASCADE;

-- Eliminar asignaciones de otros usuarios
-- (el CASCADE del TRUNCATE de locales ya limpió usuario_perfil_ie y usuario_permisos_ie,
--  pero las eliminamos explícitamente para los que queden después de recrearlas)
DELETE FROM auth.usuario_perfil_ie WHERE user_id <> 1;
DELETE FROM auth.usuario_permisos_ie WHERE user_id <> 1;

-- Eliminar usuarios excepto id=1 (login='76955033')
DELETE FROM auth.users WHERE id <> 1;

-- auth.perfiles, auth.permisos, auth.perfil_permisos — SE CONSERVAN INTACTOS

-- -------------------------------------------------------
-- 2. SCHEMA "conasis" — tablas transaccionales (limpiar todo)
-- -------------------------------------------------------
TRUNCATE TABLE
    conasis."t_ampliaDeduceHoras",
    conasis."t_asistencia",
    conasis."t_asistenciaMesTrabajador",
    conasis."t_cargaHoraria",
    conasis."t_consolAsistMesTrab",
    conasis."t_controladoresLocales",
    conasis."t_detalleHorarios",
    conasis."t_diasNoLaborables",
    conasis."t_dispositivosMarca",
    conasis."t_documentosTram",
    conasis."t_estadosAsistencia",
    conasis."t_exoneracionesMarcacion",
    conasis."t_expediente",
    conasis."t_feriadoLabTrabajador",
    conasis."t_horariosCursos",
    conasis."t_horariosTrabajador",
    conasis."t_incapsTempTrab",
    conasis."t_justificaciones",
    conasis."t_locales",
    conasis."t_localesInstEduc",
    conasis."t_localesMarcacion",
    conasis."t_marcaciones",
    conasis."t_relojes",
    conasis."t_suspLabTrabajador"
RESTART IDENTITY CASCADE;

-- Limpiar cache y jobs del schema conasis
TRUNCATE TABLE conasis.cache RESTART IDENTITY CASCADE;
TRUNCATE TABLE conasis.cache_locks RESTART IDENTITY CASCADE;
TRUNCATE TABLE conasis.failed_jobs RESTART IDENTITY CASCADE;
TRUNCATE TABLE conasis.job_batches RESTART IDENTITY CASCADE;
TRUNCATE TABLE conasis.jobs RESTART IDENTITY CASCADE;

-- -------------------------------------------------------
-- 3. SCHEMA "public" — eliminar todos EXCEPTO persona_id=1 y trabajador_id=1
-- -------------------------------------------------------

-- Limpiar tablas dependientes primero
TRUNCATE TABLE
    public."t_altasTrabajadores",
    public."t_areas",
    public."t_cargos",
    public."t_condicionesLaborales",
    public."t_cursosIE",
    public."t_domicilios",
    public."t_emails",
    public."t_entidades",
    public."t_gradosIE",
    public."t_historialCambios",
    public."t_institucionesEduc",
    public."t_seccionesIE",
    public."t_telefonos",
    public."t_zonas"
RESTART IDENTITY CASCADE;

-- Eliminar trabajadores excepto id=1
DELETE FROM public."t_trabajador" WHERE id <> 1;

-- Eliminar personas excepto id=1 (docIdentidad='76955033')
DELETE FROM public."t_personas" WHERE id <> 1;

-- -------------------------------------------------------
-- 4. SCHEMA "param" — NO SE TOCA (parametrías)
-- -------------------------------------------------------

COMMIT;
