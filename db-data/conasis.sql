/*
 Navicat Premium Data Transfer

 Source Server         : POSTGRES_LOCAL
 Source Server Type    : PostgreSQL
 Source Server Version : 120017
 Source Host           : localhost:5432
 Source Catalog        : db_asistenciaugel
 Source Schema         : conasis

 Target Server Type    : PostgreSQL
 Target Server Version : 120017
 File Encoding         : 65001

 Date: 06/05/2026 10:45:59
*/


-- ----------------------------
-- Sequence structure for t_ampliaDeduceHoras_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_ampliaDeduceHoras_id_seq";
CREATE SEQUENCE "conasis"."t_ampliaDeduceHoras_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_asistenciaMesTrabajador_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_asistenciaMesTrabajador_id_seq";
CREATE SEQUENCE "conasis"."t_asistenciaMesTrabajador_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_asistencia_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_asistencia_id_seq";
CREATE SEQUENCE "conasis"."t_asistencia_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_cargaHoraria_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_cargaHoraria_id_seq";
CREATE SEQUENCE "conasis"."t_cargaHoraria_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_consolAsistMesTrab_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_consolAsistMesTrab_id_seq";
CREATE SEQUENCE "conasis"."t_consolAsistMesTrab_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_controladoresLocales_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_controladoresLocales_id_seq";
CREATE SEQUENCE "conasis"."t_controladoresLocales_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_detalleHorarios_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_detalleHorarios_id_seq";
CREATE SEQUENCE "conasis"."t_detalleHorarios_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_diasNoLaborables_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_diasNoLaborables_id_seq";
CREATE SEQUENCE "conasis"."t_diasNoLaborables_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_dispositivosMarca_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_dispositivosMarca_id_seq";
CREATE SEQUENCE "conasis"."t_dispositivosMarca_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_documentosTram_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_documentosTram_id_seq";
CREATE SEQUENCE "conasis"."t_documentosTram_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_estadosAsistencia_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_estadosAsistencia_id_seq";
CREATE SEQUENCE "conasis"."t_estadosAsistencia_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_exoneracionesMarcacion_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_exoneracionesMarcacion_id_seq";
CREATE SEQUENCE "conasis"."t_exoneracionesMarcacion_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_expediente_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_expediente_id_seq";
CREATE SEQUENCE "conasis"."t_expediente_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_feriadoLabTrabajador_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_feriadoLabTrabajador_id_seq";
CREATE SEQUENCE "conasis"."t_feriadoLabTrabajador_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_horariosCursos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_horariosCursos_id_seq";
CREATE SEQUENCE "conasis"."t_horariosCursos_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_horariosTrabajador_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_horariosTrabajador_id_seq";
CREATE SEQUENCE "conasis"."t_horariosTrabajador_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_incapsTempTrab_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_incapsTempTrab_id_seq";
CREATE SEQUENCE "conasis"."t_incapsTempTrab_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_justificaciones_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_justificaciones_id_seq";
CREATE SEQUENCE "conasis"."t_justificaciones_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_localesInstEduc_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_localesInstEduc_id_seq";
CREATE SEQUENCE "conasis"."t_localesInstEduc_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_localesMarcacion_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_localesMarcacion_id_seq";
CREATE SEQUENCE "conasis"."t_localesMarcacion_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_locales_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_locales_id_seq";
CREATE SEQUENCE "conasis"."t_locales_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_marcaciones_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_marcaciones_id_seq";
CREATE SEQUENCE "conasis"."t_marcaciones_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_relojes_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_relojes_id_seq";
CREATE SEQUENCE "conasis"."t_relojes_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_suspLabTrabajador_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "conasis"."t_suspLabTrabajador_id_seq";
CREATE SEQUENCE "conasis"."t_suspLabTrabajador_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for t_ampliaDeduceHoras
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_ampliaDeduceHoras";
CREATE TABLE "conasis"."t_ampliaDeduceHoras" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_ampliaDeduceHoras_id_seq"'::regclass),
  "trabajador_id" int8 NOT NULL,
  "altaTrabajador_id" int8,
  "marcaApli" varchar(2) COLLATE "pg_catalog"."default",
  "fechaInicio" date,
  "fechaFin" date,
  "turno" int2,
  "horaIngreso" time(6),
  "horaSalida" time(6),
  "toleranciaPre" int2,
  "toleranciaPost" int2,
  "expediente_id" int8,
  "observacion" varchar(255) COLLATE "pg_catalog"."default",
  "estado_id" int2,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_ampliaDeduceHoras
-- ----------------------------

-- ----------------------------
-- Table structure for t_asistencia
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_asistencia";
CREATE TABLE "conasis"."t_asistencia" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis".t_asistencia_id_seq'::regclass),
  "institucionEduc_id" int8 NOT NULL,
  "trabajador_id" int8 NOT NULL,
  "altaTrabajador_id" int8 NOT NULL,
  "anio" int2 NOT NULL,
  "mes" int2 NOT NULL,
  "ndias_asis" "pg_catalog"."numeric",
  "nhoras_crono" "pg_catalog"."numeric",
  "nhoras_acad" "pg_catalog"."numeric",
  "ndias_perm" "pg_catalog"."numeric",
  "nhoras_perm" "pg_catalog"."numeric",
  "nminu_perm" "pg_catalog"."numeric",
  "ndias_falt" "pg_catalog"."numeric",
  "ndias_tarde" "pg_catalog"."numeric",
  "nhoras_tarde" "pg_catalog"."numeric",
  "nminu_tarde" "pg_catalog"."numeric",
  "ndias_extra" "pg_catalog"."numeric",
  "nhoras_extra" "pg_catalog"."numeric",
  "nnimu_extra" "pg_catalog"."numeric",
  "estadoUltim_id" int2,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_asistencia
-- ----------------------------

-- ----------------------------
-- Table structure for t_asistenciaMesTrabajador
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_asistenciaMesTrabajador";
CREATE TABLE "conasis"."t_asistenciaMesTrabajador" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_asistenciaMesTrabajador_id_seq"'::regclass),
  "asistencia_id" int8 NOT NULL,
  "localInstEduc_id" int8,
  "turno_id" int2,
  "nroTurno" int2,
  "created_at" timestamp(6),
  "created_by" int8,
  "e1" varchar(30) COLLATE "pg_catalog"."default",
  "s1" varchar(30) COLLATE "pg_catalog"."default",
  "c1" varchar(10) COLLATE "pg_catalog"."default",
  "e2" varchar(30) COLLATE "pg_catalog"."default",
  "s2" varchar(30) COLLATE "pg_catalog"."default",
  "c2" varchar(10) COLLATE "pg_catalog"."default",
  "e3" varchar(30) COLLATE "pg_catalog"."default",
  "s3" varchar(30) COLLATE "pg_catalog"."default",
  "c3" varchar(10) COLLATE "pg_catalog"."default",
  "e4" varchar(30) COLLATE "pg_catalog"."default",
  "s4" varchar(30) COLLATE "pg_catalog"."default",
  "c4" varchar(10) COLLATE "pg_catalog"."default",
  "e5" varchar(30) COLLATE "pg_catalog"."default",
  "s5" varchar(30) COLLATE "pg_catalog"."default",
  "c5" varchar(10) COLLATE "pg_catalog"."default",
  "e6" varchar(30) COLLATE "pg_catalog"."default",
  "s6" varchar(30) COLLATE "pg_catalog"."default",
  "c6" varchar(10) COLLATE "pg_catalog"."default",
  "e7" varchar(30) COLLATE "pg_catalog"."default",
  "s7" varchar(30) COLLATE "pg_catalog"."default",
  "c7" varchar(10) COLLATE "pg_catalog"."default",
  "e8" varchar(30) COLLATE "pg_catalog"."default",
  "s8" varchar(30) COLLATE "pg_catalog"."default",
  "c8" varchar(10) COLLATE "pg_catalog"."default",
  "e9" varchar(30) COLLATE "pg_catalog"."default",
  "s9" varchar(30) COLLATE "pg_catalog"."default",
  "c9" varchar(10) COLLATE "pg_catalog"."default",
  "e10" varchar(30) COLLATE "pg_catalog"."default",
  "s10" varchar(30) COLLATE "pg_catalog"."default",
  "c10" varchar(10) COLLATE "pg_catalog"."default",
  "e11" varchar(30) COLLATE "pg_catalog"."default",
  "s11" varchar(30) COLLATE "pg_catalog"."default",
  "c11" varchar(10) COLLATE "pg_catalog"."default",
  "e12" varchar(30) COLLATE "pg_catalog"."default",
  "s12" varchar(30) COLLATE "pg_catalog"."default",
  "c12" varchar(10) COLLATE "pg_catalog"."default",
  "e13" varchar(30) COLLATE "pg_catalog"."default",
  "s13" varchar(30) COLLATE "pg_catalog"."default",
  "c13" varchar(10) COLLATE "pg_catalog"."default",
  "e14" varchar(30) COLLATE "pg_catalog"."default",
  "s14" varchar(30) COLLATE "pg_catalog"."default",
  "c14" varchar(10) COLLATE "pg_catalog"."default",
  "e15" varchar(30) COLLATE "pg_catalog"."default",
  "s15" varchar(30) COLLATE "pg_catalog"."default",
  "c15" varchar(10) COLLATE "pg_catalog"."default",
  "e16" varchar(30) COLLATE "pg_catalog"."default",
  "s16" varchar(30) COLLATE "pg_catalog"."default",
  "c16" varchar(10) COLLATE "pg_catalog"."default",
  "e17" varchar(30) COLLATE "pg_catalog"."default",
  "s17" varchar(30) COLLATE "pg_catalog"."default",
  "c17" varchar(10) COLLATE "pg_catalog"."default",
  "e18" varchar(30) COLLATE "pg_catalog"."default",
  "s18" varchar(30) COLLATE "pg_catalog"."default",
  "c18" varchar(10) COLLATE "pg_catalog"."default",
  "e19" varchar(30) COLLATE "pg_catalog"."default",
  "s19" varchar(30) COLLATE "pg_catalog"."default",
  "c19" varchar(10) COLLATE "pg_catalog"."default",
  "e20" varchar(30) COLLATE "pg_catalog"."default",
  "s20" varchar(30) COLLATE "pg_catalog"."default",
  "c20" varchar(10) COLLATE "pg_catalog"."default",
  "e21" varchar(30) COLLATE "pg_catalog"."default",
  "s21" varchar(30) COLLATE "pg_catalog"."default",
  "c21" varchar(10) COLLATE "pg_catalog"."default",
  "e22" varchar(30) COLLATE "pg_catalog"."default",
  "s22" varchar(30) COLLATE "pg_catalog"."default",
  "c22" varchar(10) COLLATE "pg_catalog"."default",
  "e23" varchar(30) COLLATE "pg_catalog"."default",
  "s23" varchar(30) COLLATE "pg_catalog"."default",
  "c23" varchar(10) COLLATE "pg_catalog"."default",
  "e24" varchar(30) COLLATE "pg_catalog"."default",
  "s24" varchar(30) COLLATE "pg_catalog"."default",
  "c24" varchar(10) COLLATE "pg_catalog"."default",
  "e25" varchar(30) COLLATE "pg_catalog"."default",
  "s25" varchar(30) COLLATE "pg_catalog"."default",
  "c25" varchar(10) COLLATE "pg_catalog"."default",
  "e26" varchar(30) COLLATE "pg_catalog"."default",
  "s26" varchar(30) COLLATE "pg_catalog"."default",
  "c26" varchar(10) COLLATE "pg_catalog"."default",
  "e27" varchar(30) COLLATE "pg_catalog"."default",
  "s27" varchar(30) COLLATE "pg_catalog"."default",
  "c27" varchar(10) COLLATE "pg_catalog"."default",
  "e28" varchar(30) COLLATE "pg_catalog"."default",
  "s28" varchar(30) COLLATE "pg_catalog"."default",
  "c28" varchar(10) COLLATE "pg_catalog"."default",
  "e29" varchar(30) COLLATE "pg_catalog"."default",
  "s29" varchar(30) COLLATE "pg_catalog"."default",
  "c29" varchar(10) COLLATE "pg_catalog"."default",
  "e30" varchar(30) COLLATE "pg_catalog"."default",
  "s30" varchar(30) COLLATE "pg_catalog"."default",
  "c30" varchar(10) COLLATE "pg_catalog"."default",
  "e31" varchar(30) COLLATE "pg_catalog"."default",
  "s31" varchar(30) COLLATE "pg_catalog"."default",
  "c31" varchar(10) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of t_asistenciaMesTrabajador
-- ----------------------------

-- ----------------------------
-- Table structure for t_cargaHoraria
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_cargaHoraria";
CREATE TABLE "conasis"."t_cargaHoraria" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_cargaHoraria_id_seq"'::regclass),
  "horarioCurso_id" int8 NOT NULL,
  "trabajador_id" int8 NOT NULL,
  "altaTrabajador_id" int8,
  "fechaInicio" date,
  "fechaFin" date,
  "titularSuplencia" varchar(1) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_cargaHoraria
-- ----------------------------
INSERT INTO "conasis"."t_cargaHoraria" VALUES (1, 1, 1, 1, '2026-03-01', '2026-12-21', 'T', '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_cargaHoraria" VALUES (2, 2, 1, 1, '2026-03-01', '2026-12-21', 'T', '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_cargaHoraria" VALUES (3, 3, 1, 1, '2026-03-01', '2026-12-21', 'T', '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_cargaHoraria" VALUES (4, 4, 1, 1, '2026-03-01', '2026-12-21', 'T', '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_cargaHoraria" VALUES (5, 5, 2, 2, '2026-03-01', '2026-12-21', 'T', '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_cargaHoraria" VALUES (6, 6, 5, 5, '2026-03-01', '2026-12-21', 'T', '2026-05-05 00:00:00', 1);

-- ----------------------------
-- Table structure for t_consolAsistMesTrab
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_consolAsistMesTrab";
CREATE TABLE "conasis"."t_consolAsistMesTrab" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_consolAsistMesTrab_id_seq"'::regclass),
  "asistencia_id" int8,
  "motivoSuspLab_id" int2,
  "sigla" varchar(5) COLLATE "pg_catalog"."default",
  "ndias" "pg_catalog"."numeric",
  "remunerado" bool,
  "localInstEduc_id" int8,
  "asusfal" varchar(1) COLLATE "pg_catalog"."default",
  "aniopla" int2,
  "mespla" int2,
  "ndiaspla" "pg_catalog"."numeric",
  "created_at" timestamp(6),
  "created_by" int8,
  "createdenv_at" timestamp(6),
  "createdenv_by" int8,
  "estadoUltim_id" int2
)
;

-- ----------------------------
-- Records of t_consolAsistMesTrab
-- ----------------------------

-- ----------------------------
-- Table structure for t_controladoresLocales
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_controladoresLocales";
CREATE TABLE "conasis"."t_controladoresLocales" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_controladoresLocales_id_seq"'::regclass),
  "localInstEduc_id" int8 NOT NULL,
  "user_id" int8,
  "trabajador_id" int8,
  "altaTrabajador_id" int8,
  "fechaInicio" date,
  "fechaFin" date,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_controladoresLocales
-- ----------------------------
INSERT INTO "conasis"."t_controladoresLocales" VALUES (1, 1, 1, 4, 4, '2026-01-01', NULL, '2026-05-05 00:00:00', 1);

-- ----------------------------
-- Table structure for t_detalleHorarios
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_detalleHorarios";
CREATE TABLE "conasis"."t_detalleHorarios" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_detalleHorarios_id_seq"'::regclass),
  "horarioTrabajador_id" int8 NOT NULL,
  "turno_id" int2,
  "nombreTurno" varchar(100) COLLATE "pg_catalog"."default",
  "nroTurno" int2,
  "diaSemana" varchar(1) COLLATE "pg_catalog"."default",
  "nroDia" int2,
  "horarioCursoIni_id" int8,
  "entDiaInicio" int2,
  "entDiaFin" int2,
  "entHoraInicio" time(6),
  "entHoraFin" time(6),
  "entTolerancia" int2,
  "horarioCursoFin_id" int8,
  "salDiaInicio" int2,
  "salDiaFin" int2,
  "salHoraInicio" time(6),
  "salHoraFin" time(6),
  "salTolerancia" int2,
  "horaAcumula" "pg_catalog"."numeric",
  "aplicar" bool,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_detalleHorarios
-- ----------------------------
INSERT INTO "conasis"."t_detalleHorarios" VALUES (1, 1, 1, 'MAÑANA', 1, 'S', 1, 1, 1, 1, '07:30:00', '08:00:00', 5, 1, 1, 1, '09:30:00', '10:00:00', 0, 90, 't', '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_detalleHorarios" VALUES (2, 1, 1, 'MAÑANA', 1, 'S', 5, 2, 1, 1, '10:30:00', '11:00:00', 5, 2, 1, 1, '12:30:00', '13:00:00', 0, 90, 't', '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_detalleHorarios" VALUES (3, 1, 1, 'MAÑANA', 1, 'S', 2, 3, 1, 1, '08:30:00', '09:00:00', 0, 3, 1, 1, '09:45:00', '10:15:00', 0, 45, 't', '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_detalleHorarios" VALUES (4, 2, 1, 'MAÑANA', 1, 'S', 3, 5, 1, 1, '10:00:00', '10:45:00', 0, 5, 1, 1, '11:30:00', '12:00:00', 0, 45, 't', '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_detalleHorarios" VALUES (5, 2, 1, 'MAÑANA', 1, 'S', 5, 6, 1, 1, '08:30:00', '09:00:00', 0, 6, 1, 1, '10:00:00', '10:30:00', 0, 60, 't', '2026-05-05 00:00:00', 1);

-- ----------------------------
-- Table structure for t_diasNoLaborables
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_diasNoLaborables";
CREATE TABLE "conasis"."t_diasNoLaborables" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_diasNoLaborables_id_seq"'::regclass),
  "feriado_id" int2,
  "fecha" date,
  "observacion" varchar(200) COLLATE "pg_catalog"."default",
  "nacionalLocal" varchar(1) COLLATE "pg_catalog"."default",
  "recuperable" varchar(1) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6),
  "created_by" int8,
  "activo" bool
)
;

-- ----------------------------
-- Records of t_diasNoLaborables
-- ----------------------------

-- ----------------------------
-- Table structure for t_dispositivosMarca
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_dispositivosMarca";
CREATE TABLE "conasis"."t_dispositivosMarca" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_dispositivosMarca_id_seq"'::regclass),
  "telefonoMovil_id" int8 NOT NULL,
  "fechaInicio" date,
  "fechaFin" date,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_dispositivosMarca
-- ----------------------------

-- ----------------------------
-- Table structure for t_documentosTram
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_documentosTram";
CREATE TABLE "conasis"."t_documentosTram" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_documentosTram_id_seq"'::regclass),
  "expediente_id" int8,
  "documento_id" int8,
  "nroDoc" varchar(150) COLLATE "pg_catalog"."default",
  "fechaDoc" date,
  "trabajadorDoc_id" int8,
  "rutaDoc" varchar(255) COLLATE "pg_catalog"."default",
  "observacion" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_documentosTram
-- ----------------------------

-- ----------------------------
-- Table structure for t_estadosAsistencia
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_estadosAsistencia";
CREATE TABLE "conasis"."t_estadosAsistencia" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_estadosAsistencia_id_seq"'::regclass),
  "asistencia_id" int8 NOT NULL,
  "estadoAsis_id" int8 NOT NULL,
  "observacion" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_estadosAsistencia
-- ----------------------------

-- ----------------------------
-- Table structure for t_exoneracionesMarcacion
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_exoneracionesMarcacion";
CREATE TABLE "conasis"."t_exoneracionesMarcacion" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_exoneracionesMarcacion_id_seq"'::regclass),
  "trabajador_id" int8 NOT NULL,
  "altaTrabajador_id" int8,
  "fechaInicio" date,
  "fechaFin" date,
  "turno" int2,
  "marcaApli" varchar(2) COLLATE "pg_catalog"."default",
  "observacion" varchar(255) COLLATE "pg_catalog"."default",
  "expediente_id" int8,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_exoneracionesMarcacion
-- ----------------------------

-- ----------------------------
-- Table structure for t_expediente
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_expediente";
CREATE TABLE "conasis"."t_expediente" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis".t_expediente_id_seq'::regclass),
  "codigo" varchar(30) COLLATE "pg_catalog"."default",
  "anio" int2,
  "trabajador_id" int8,
  "asunto" varchar(255) COLLATE "pg_catalog"."default",
  "fecha" date,
  "observacion" varchar(255) COLLATE "pg_catalog"."default",
  "estado_id" int2,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_expediente
-- ----------------------------

-- ----------------------------
-- Table structure for t_feriadoLabTrabajador
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_feriadoLabTrabajador";
CREATE TABLE "conasis"."t_feriadoLabTrabajador" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_feriadoLabTrabajador_id_seq"'::regclass),
  "diaNoLaborable_id" int8 NOT NULL,
  "trabajador_id" int8 NOT NULL,
  "altaTrabajador_id" int8,
  "fechaInicio" date,
  "fechaFin" date,
  "observacion" varchar(255) COLLATE "pg_catalog"."default",
  "expediente_id" int8,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_feriadoLabTrabajador
-- ----------------------------

-- ----------------------------
-- Table structure for t_horariosCursos
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_horariosCursos";
CREATE TABLE "conasis"."t_horariosCursos" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_horariosCursos_id_seq"'::regclass),
  "anio" int2,
  "seccion_id" int8,
  "curso_id" int8,
  "diaSemana" varchar(1) COLLATE "pg_catalog"."default",
  "nroDia" int2,
  "horaInicio" time(6),
  "horaFin" time(6),
  "minAcum" "pg_catalog"."numeric",
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_horariosCursos
-- ----------------------------
INSERT INTO "conasis"."t_horariosCursos" VALUES (1, 2026, 1, 1, 'S', 1, '08:00:00', '09:30:00', 90, '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_horariosCursos" VALUES (2, 2026, 1, 1, 'S', 5, '11:00:00', '12:30:00', 90, '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_horariosCursos" VALUES (3, 2026, 2, 1, 'S', 2, '09:00:00', '09:45:00', 45, '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_horariosCursos" VALUES (4, 2026, 2, 1, 'S', 4, '08:00:00', '09:30:00', 90, '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_horariosCursos" VALUES (5, 2026, 5, 2, 'S', 3, '10:45:00', '11:30:00', 45, '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_horariosCursos" VALUES (6, 2026, 5, 2, 'S', 5, '09:00:00', '10:00:00', 60, '2026-05-05 00:00:00', 1);

-- ----------------------------
-- Table structure for t_horariosTrabajador
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_horariosTrabajador";
CREATE TABLE "conasis"."t_horariosTrabajador" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_horariosTrabajador_id_seq"'::regclass),
  "codigo" varchar(30) COLLATE "pg_catalog"."default",
  "anio" int2,
  "institucionEduc_id" int8,
  "trabajador_id" int8 NOT NULL,
  "altaTrabajador_id" int8,
  "tipoHorario" varchar(1) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "fechaInicio" date,
  "fechaFin" date,
  "created_at" timestamp(6),
  "created_by" int8,
  "archivado" bool,
  "activo" bool
)
;
COMMENT ON COLUMN "conasis"."t_horariosTrabajador"."tipoHorario" IS 'A: Administrativo D:docente';

-- ----------------------------
-- Records of t_horariosTrabajador
-- ----------------------------
INSERT INTO "conasis"."t_horariosTrabajador" VALUES (1, 'H00001', 2026, 1, 1, 1, 'D', 'HORARIO DOCENTE', '2026-03-01', '2026-12-21', '2026-05-05 00:00:00', 1, 't', 't');
INSERT INTO "conasis"."t_horariosTrabajador" VALUES (2, 'H00002', 2026, 1, 2, 2, 'D', 'HORARIO DOCENTE', '2026-03-01', '2026-12-21', '2026-05-05 00:00:00', 1, 't', 't');

-- ----------------------------
-- Table structure for t_incapsTempTrab
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_incapsTempTrab";
CREATE TABLE "conasis"."t_incapsTempTrab" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_incapsTempTrab_id_seq"'::regclass),
  "trabajador_id" int8 NOT NULL,
  "altaTrabajador_id" int8,
  "motivoSuspLab_id" int2,
  "condicionSubsidio" varchar(5) COLLATE "pg_catalog"."default",
  "turno" int2,
  "marcaApli" varchar(2) COLLATE "pg_catalog"."default",
  "fechaInicio" date,
  "fechaFin" date,
  "nroDias" "pg_catalog"."numeric",
  "nroCertificado" varchar(50) COLLATE "pg_catalog"."default",
  "observacion" varchar(255) COLLATE "pg_catalog"."default",
  "expediente_id" int8,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_incapsTempTrab
-- ----------------------------

-- ----------------------------
-- Table structure for t_justificaciones
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_justificaciones";
CREATE TABLE "conasis"."t_justificaciones" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis".t_justificaciones_id_seq'::regclass),
  "trabajador_id" int8 NOT NULL,
  "altaTrabajador_id" int8,
  "turno" int2,
  "fechaInicio" date,
  "fechaFin" date,
  "marcaApli" varchar(2) COLLATE "pg_catalog"."default",
  "expediente_id" int8,
  "observacion" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_justificaciones
-- ----------------------------

-- ----------------------------
-- Table structure for t_locales
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_locales";
CREATE TABLE "conasis"."t_locales" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis".t_locales_id_seq'::regclass),
  "nombre" varchar(200) COLLATE "pg_catalog"."default",
  "domicilio" varchar(200) COLLATE "pg_catalog"."default",
  "zona_id" int8,
  "ubigeo" varchar(20) COLLATE "pg_catalog"."default",
  "utm_huso" "pg_catalog"."numeric",
  "utm_banda" varchar(10) COLLATE "pg_catalog"."default",
  "utm_x_este" "pg_catalog"."numeric",
  "utm_y_norte" "pg_catalog"."numeric",
  "created_at" timestamp(6),
  "created_by" int8,
  "activo" bool
)
;

-- ----------------------------
-- Records of t_locales
-- ----------------------------
INSERT INTO "conasis"."t_locales" VALUES (1, 'LOCAL CHONTAPACCHA', 'JR. COMERCIO N° 145', 1, '060101', 17, 'M', 773449.78, 9208552.04, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "conasis"."t_locales" VALUES (2, 'LOCAL LA RECOLETA', 'JR. SILVASANTISTEBAN N° 876', 1, '060101', 17, 'M', 774743.17, 9207666.10, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "conasis"."t_locales" VALUES (3, 'LOCAL EL PENAL', 'SECTOR MOLLEPAMPA', 2, '060101', 17, 'M', 775485.20, 9206457.15, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "conasis"."t_locales" VALUES (4, 'LOCAL SAN FERNANDO', 'AV. VIA DE EVITAMIENTO SUR N° 567', 3, '060101', 17, 'M', 773125.20, 9208245.18, '2026-05-05 00:00:00', 1, 't');

-- ----------------------------
-- Table structure for t_localesInstEduc
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_localesInstEduc";
CREATE TABLE "conasis"."t_localesInstEduc" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_localesInstEduc_id_seq"'::regclass),
  "local_id" int8,
  "entidad_id" int8,
  "institucionEduc_id" int8,
  "fechaInicio" date,
  "fechaFin" date,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_localesInstEduc
-- ----------------------------
INSERT INTO "conasis"."t_localesInstEduc" VALUES (1, 1, NULL, 1, '2026-01-01', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_localesInstEduc" VALUES (2, 2, NULL, 2, '2026-01-01', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_localesInstEduc" VALUES (3, 3, NULL, 4, '2026-01-01', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_localesInstEduc" VALUES (4, 4, NULL, 5, '2026-01-01', NULL, '2026-05-05 00:00:00', 1);

-- ----------------------------
-- Table structure for t_localesMarcacion
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_localesMarcacion";
CREATE TABLE "conasis"."t_localesMarcacion" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_localesMarcacion_id_seq"'::regclass),
  "trabajador_id" int8 NOT NULL,
  "altaTrabajador_id" int8,
  "localInstEduc_id" int8,
  "fechaInicio" date,
  "fechaFin" date,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_localesMarcacion
-- ----------------------------
INSERT INTO "conasis"."t_localesMarcacion" VALUES (1, 1, 1, 1, '2026-03-01', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_localesMarcacion" VALUES (3, 3, 3, 1, '2026-03-01', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_localesMarcacion" VALUES (2, 2, 2, 1, '2026-03-01', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_localesMarcacion" VALUES (4, 4, 4, 1, '2026-03-01', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_localesMarcacion" VALUES (5, 5, 5, 2, '2026-03-01', NULL, '2026-05-05 00:00:00', 1);

-- ----------------------------
-- Table structure for t_marcaciones
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_marcaciones";
CREATE TABLE "conasis"."t_marcaciones" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis".t_marcaciones_id_seq'::regclass),
  "trabajador_id" int8 NOT NULL,
  "altaTrabajador_id" int8,
  "localMarcacion_id" int8,
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "fechaMarcacion" timestamp(6),
  "fechaRegistro" timestamp(6),
  "reloj_id" int8,
  "tipo" varchar(1) COLLATE "pg_catalog"."default",
  "medioMarcacion" varchar(1) COLLATE "pg_catalog"."default",
  "procesado" bool,
  "dispositivoMarca_id" int8,
  "utm_huso" "pg_catalog"."numeric",
  "utm_base" varchar(10) COLLATE "pg_catalog"."default",
  "utm_x_este" "pg_catalog"."numeric",
  "utm_y_norte" "pg_catalog"."numeric",
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_marcaciones
-- ----------------------------
INSERT INTO "conasis"."t_marcaciones" VALUES (1, 1, 1, 1, '11111111', '2026-05-05 08:01:15', '2026-05-05 08:01:15', NULL, 'A', 'M', 'f', NULL, 17, 'M', 773441.78, 9208551.04, '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_marcaciones" VALUES (2, 1, 1, 1, '11111111', '2026-05-05 09:40:17', '2026-05-05 09:40:17', NULL, 'A', 'M', 'f', NULL, 17, 'M', 773441.78, 9208551.04, '2026-05-05 00:00:00', 1);
INSERT INTO "conasis"."t_marcaciones" VALUES (3, 1, 1, 1, '11111111', '2026-05-05 09:41:17', '2026-05-05 09:41:17', NULL, 'A', 'M', 'f', NULL, 17, 'M', 773441.78, 9208551.04, '2026-05-05 00:00:00', 1);

-- ----------------------------
-- Table structure for t_relojes
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_relojes";
CREATE TABLE "conasis"."t_relojes" (
  "id" int4 NOT NULL DEFAULT nextval('"conasis".t_relojes_id_seq'::regclass),
  "nombre" varchar(200) COLLATE "pg_catalog"."default",
  "dreccionIP" varchar(30) COLLATE "pg_catalog"."default",
  "direccionMac" varchar(50) COLLATE "pg_catalog"."default",
  "puerto" int2,
  "serie" varchar(100) COLLATE "pg_catalog"."default",
  "localInstEduc_id" int8,
  "idBiometrico" int8,
  "created_at" timestamp(6),
  "created_by" int8,
  "activo" bool
)
;

-- ----------------------------
-- Records of t_relojes
-- ----------------------------

-- ----------------------------
-- Table structure for t_suspLabTrabajador
-- ----------------------------
DROP TABLE IF EXISTS "conasis"."t_suspLabTrabajador";
CREATE TABLE "conasis"."t_suspLabTrabajador" (
  "id" int8 NOT NULL DEFAULT nextval('"conasis"."t_suspLabTrabajador_id_seq"'::regclass),
  "trabajador_id" int8 NOT NULL,
  "altaTrabajador_id" int8,
  "motivoSuspLab_id" int2 NOT NULL,
  "fechaHoraInicio" timestamp(6),
  "fechaHoraFin" timestamp(6),
  "fechaRegistro" timestamp(6),
  "totalDias" "pg_catalog"."numeric",
  "totalHoras" "pg_catalog"."numeric",
  "marcaApli" varchar(2) COLLATE "pg_catalog"."default",
  "observacion" varchar(255) COLLATE "pg_catalog"."default",
  "expediente_id" int8,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_suspLabTrabajador
-- ----------------------------

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_ampliaDeduceHoras_id_seq"
OWNED BY "conasis"."t_ampliaDeduceHoras"."id";
SELECT setval('"conasis"."t_ampliaDeduceHoras_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_asistenciaMesTrabajador_id_seq"
OWNED BY "conasis"."t_asistenciaMesTrabajador"."id";
SELECT setval('"conasis"."t_asistenciaMesTrabajador_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_asistencia_id_seq"
OWNED BY "conasis"."t_asistencia"."id";
SELECT setval('"conasis"."t_asistencia_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_cargaHoraria_id_seq"
OWNED BY "conasis"."t_cargaHoraria"."id";
SELECT setval('"conasis"."t_cargaHoraria_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_consolAsistMesTrab_id_seq"
OWNED BY "conasis"."t_consolAsistMesTrab"."id";
SELECT setval('"conasis"."t_consolAsistMesTrab_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_controladoresLocales_id_seq"
OWNED BY "conasis"."t_controladoresLocales"."id";
SELECT setval('"conasis"."t_controladoresLocales_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_detalleHorarios_id_seq"
OWNED BY "conasis"."t_detalleHorarios"."id";
SELECT setval('"conasis"."t_detalleHorarios_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_diasNoLaborables_id_seq"
OWNED BY "conasis"."t_diasNoLaborables"."id";
SELECT setval('"conasis"."t_diasNoLaborables_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_dispositivosMarca_id_seq"
OWNED BY "conasis"."t_dispositivosMarca"."id";
SELECT setval('"conasis"."t_dispositivosMarca_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_documentosTram_id_seq"
OWNED BY "conasis"."t_documentosTram"."id";
SELECT setval('"conasis"."t_documentosTram_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_estadosAsistencia_id_seq"
OWNED BY "conasis"."t_estadosAsistencia"."id";
SELECT setval('"conasis"."t_estadosAsistencia_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_exoneracionesMarcacion_id_seq"
OWNED BY "conasis"."t_exoneracionesMarcacion"."id";
SELECT setval('"conasis"."t_exoneracionesMarcacion_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_expediente_id_seq"
OWNED BY "conasis"."t_expediente"."id";
SELECT setval('"conasis"."t_expediente_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_feriadoLabTrabajador_id_seq"
OWNED BY "conasis"."t_feriadoLabTrabajador"."id";
SELECT setval('"conasis"."t_feriadoLabTrabajador_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_horariosCursos_id_seq"
OWNED BY "conasis"."t_horariosCursos"."id";
SELECT setval('"conasis"."t_horariosCursos_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_horariosTrabajador_id_seq"
OWNED BY "conasis"."t_horariosTrabajador"."id";
SELECT setval('"conasis"."t_horariosTrabajador_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_incapsTempTrab_id_seq"
OWNED BY "conasis"."t_incapsTempTrab"."id";
SELECT setval('"conasis"."t_incapsTempTrab_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_justificaciones_id_seq"
OWNED BY "conasis"."t_justificaciones"."id";
SELECT setval('"conasis"."t_justificaciones_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_localesInstEduc_id_seq"
OWNED BY "conasis"."t_localesInstEduc"."id";
SELECT setval('"conasis"."t_localesInstEduc_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_localesMarcacion_id_seq"
OWNED BY "conasis"."t_localesMarcacion"."id";
SELECT setval('"conasis"."t_localesMarcacion_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_locales_id_seq"
OWNED BY "conasis"."t_locales"."id";
SELECT setval('"conasis"."t_locales_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_marcaciones_id_seq"
OWNED BY "conasis"."t_marcaciones"."id";
SELECT setval('"conasis"."t_marcaciones_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_relojes_id_seq"
OWNED BY "conasis"."t_relojes"."id";
SELECT setval('"conasis"."t_relojes_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "conasis"."t_suspLabTrabajador_id_seq"
OWNED BY "conasis"."t_suspLabTrabajador"."id";
SELECT setval('"conasis"."t_suspLabTrabajador_id_seq"', 1, false);

-- ----------------------------
-- Primary Key structure for table t_ampliaDeduceHoras
-- ----------------------------
ALTER TABLE "conasis"."t_ampliaDeduceHoras" ADD CONSTRAINT "t_ampliaDeduceHoras_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_asistencia
-- ----------------------------
ALTER TABLE "conasis"."t_asistencia" ADD CONSTRAINT "t_asistencia_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_asistenciaMesTrabajador
-- ----------------------------
ALTER TABLE "conasis"."t_asistenciaMesTrabajador" ADD CONSTRAINT "t_asistenciaMesTrabajador_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_cargaHoraria
-- ----------------------------
ALTER TABLE "conasis"."t_cargaHoraria" ADD CONSTRAINT "t_cargaHoraria_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_consolAsistMesTrab
-- ----------------------------
ALTER TABLE "conasis"."t_consolAsistMesTrab" ADD CONSTRAINT "t_consolAsistMesTrab_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_controladoresLocales
-- ----------------------------
ALTER TABLE "conasis"."t_controladoresLocales" ADD CONSTRAINT "t_controladoresLocales_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_detalleHorarios
-- ----------------------------
ALTER TABLE "conasis"."t_detalleHorarios" ADD CONSTRAINT "t_detalleHorarios_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_diasNoLaborables
-- ----------------------------
ALTER TABLE "conasis"."t_diasNoLaborables" ADD CONSTRAINT "t_diasNoLaborables_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_dispositivosMarca
-- ----------------------------
ALTER TABLE "conasis"."t_dispositivosMarca" ADD CONSTRAINT "t_dispositivosMarca_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_documentosTram
-- ----------------------------
ALTER TABLE "conasis"."t_documentosTram" ADD CONSTRAINT "t_documentosTram_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_estadosAsistencia
-- ----------------------------
ALTER TABLE "conasis"."t_estadosAsistencia" ADD CONSTRAINT "t_estadosAsistencia_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_exoneracionesMarcacion
-- ----------------------------
ALTER TABLE "conasis"."t_exoneracionesMarcacion" ADD CONSTRAINT "t_exoneracionesMarcacion_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_expediente
-- ----------------------------
ALTER TABLE "conasis"."t_expediente" ADD CONSTRAINT "t_expediente_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_feriadoLabTrabajador
-- ----------------------------
ALTER TABLE "conasis"."t_feriadoLabTrabajador" ADD CONSTRAINT "t_feriadoLabTrabajador_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_horariosCursos
-- ----------------------------
ALTER TABLE "conasis"."t_horariosCursos" ADD CONSTRAINT "t_horariosCursos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_horariosTrabajador
-- ----------------------------
ALTER TABLE "conasis"."t_horariosTrabajador" ADD CONSTRAINT "t_horariosTrabajador_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_incapsTempTrab
-- ----------------------------
ALTER TABLE "conasis"."t_incapsTempTrab" ADD CONSTRAINT "t_incapsTempTrab_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_justificaciones
-- ----------------------------
ALTER TABLE "conasis"."t_justificaciones" ADD CONSTRAINT "t_justificaciones_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_locales
-- ----------------------------
ALTER TABLE "conasis"."t_locales" ADD CONSTRAINT "t_locales_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_localesInstEduc
-- ----------------------------
ALTER TABLE "conasis"."t_localesInstEduc" ADD CONSTRAINT "t_localesInstEduc_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_localesMarcacion
-- ----------------------------
ALTER TABLE "conasis"."t_localesMarcacion" ADD CONSTRAINT "t_localesMarcacion_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_marcaciones
-- ----------------------------
ALTER TABLE "conasis"."t_marcaciones" ADD CONSTRAINT "t_marcaciones_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_relojes
-- ----------------------------
ALTER TABLE "conasis"."t_relojes" ADD CONSTRAINT "t_relojes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_suspLabTrabajador
-- ----------------------------
ALTER TABLE "conasis"."t_suspLabTrabajador" ADD CONSTRAINT "t_suspLabTrabajador_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table t_ampliaDeduceHoras
-- ----------------------------
ALTER TABLE "conasis"."t_ampliaDeduceHoras" ADD CONSTRAINT "fk_t_ampliaDeduceHoras_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES "public"."t_altasTrabajadores" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_ampliaDeduceHoras" ADD CONSTRAINT "fk_t_ampliaDeduceHoras_t_expediente_1" FOREIGN KEY ("expediente_id") REFERENCES "conasis"."t_expediente" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_ampliaDeduceHoras" ADD CONSTRAINT "fk_t_ampliaDeduceHoras_t_trabajador_1" FOREIGN KEY ("trabajador_id") REFERENCES "public"."t_trabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_asistencia
-- ----------------------------
ALTER TABLE "conasis"."t_asistencia" ADD CONSTRAINT "fk_t_asistencia_t00_estadosAsis_1" FOREIGN KEY ("estadoUltim_id") REFERENCES "param"."t00_estadosAsis" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_asistencia" ADD CONSTRAINT "fk_t_asistencia_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES "public"."t_altasTrabajadores" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_asistencia" ADD CONSTRAINT "fk_t_resumenAsistencia_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES "public"."t_institucionesEduc" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_asistencia" ADD CONSTRAINT "fk_t_resumenAsistencia_t_trabajador_1" FOREIGN KEY ("trabajador_id") REFERENCES "public"."t_trabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_asistenciaMesTrabajador
-- ----------------------------
ALTER TABLE "conasis"."t_asistenciaMesTrabajador" ADD CONSTRAINT "fk_t_asistenciaMesTrabajador_t00_turnos_1" FOREIGN KEY ("turno_id") REFERENCES "param"."t00_turnos" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_asistenciaMesTrabajador" ADD CONSTRAINT "fk_t_asistenciaMesTrabajador_t_asistencia_1" FOREIGN KEY ("asistencia_id") REFERENCES "conasis"."t_asistencia" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_asistenciaMesTrabajador" ADD CONSTRAINT "fk_t_asistenciaMesTrabajador_t_localesInstEduc_1" FOREIGN KEY ("localInstEduc_id") REFERENCES "conasis"."t_localesInstEduc" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_cargaHoraria
-- ----------------------------
ALTER TABLE "conasis"."t_cargaHoraria" ADD CONSTRAINT "fk_t_cargaHoraria_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES "public"."t_altasTrabajadores" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_cargaHoraria" ADD CONSTRAINT "fk_t_cargaHoraria_t_horariosCursos_1" FOREIGN KEY ("horarioCurso_id") REFERENCES "conasis"."t_horariosCursos" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_cargaHoraria" ADD CONSTRAINT "fk_t_cargaHoraria_t_trabajador_1" FOREIGN KEY ("trabajador_id") REFERENCES "public"."t_trabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_consolAsistMesTrab
-- ----------------------------
ALTER TABLE "conasis"."t_consolAsistMesTrab" ADD CONSTRAINT "fk_t_consolAsistMesTrab_t00_motivosSuspLab_1" FOREIGN KEY ("motivoSuspLab_id") REFERENCES "param"."t00_motivosSuspLab" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_consolAsistMesTrab" ADD CONSTRAINT "fk_t_consolAsistMesTrab_t_asistencia_1" FOREIGN KEY ("asistencia_id") REFERENCES "conasis"."t_asistencia" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_controladoresLocales
-- ----------------------------
ALTER TABLE "conasis"."t_controladoresLocales" ADD CONSTRAINT "fk_t_controladoresLocales_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES "public"."t_altasTrabajadores" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_controladoresLocales" ADD CONSTRAINT "fk_t_controladoresLocales_t_localesInstEduc_1" FOREIGN KEY ("localInstEduc_id") REFERENCES "conasis"."t_localesInstEduc" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_controladoresLocales" ADD CONSTRAINT "fk_t_controladoresLocales_t_trabajador_1" FOREIGN KEY ("trabajador_id") REFERENCES "public"."t_trabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_detalleHorarios
-- ----------------------------
ALTER TABLE "conasis"."t_detalleHorarios" ADD CONSTRAINT "fk_t_detalleHorarios_t00_turnos_1" FOREIGN KEY ("turno_id") REFERENCES "param"."t00_turnos" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_detalleHorarios" ADD CONSTRAINT "fk_t_detalleHorarios_t_horariosCursos_1" FOREIGN KEY ("horarioCursoIni_id") REFERENCES "conasis"."t_horariosCursos" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_detalleHorarios" ADD CONSTRAINT "fk_t_detalleHorarios_t_horariosTrabajador_1" FOREIGN KEY ("horarioTrabajador_id") REFERENCES "conasis"."t_horariosTrabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_diasNoLaborables
-- ----------------------------
ALTER TABLE "conasis"."t_diasNoLaborables" ADD CONSTRAINT "fk_t_diasNoLaborables_t00_feriados_1" FOREIGN KEY ("feriado_id") REFERENCES "param"."t00_feriados" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_dispositivosMarca
-- ----------------------------
ALTER TABLE "conasis"."t_dispositivosMarca" ADD CONSTRAINT "fk_t_dispositivosMarca_t_telefonos_1" FOREIGN KEY ("telefonoMovil_id") REFERENCES "public"."t_telefonos" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_documentosTram
-- ----------------------------
ALTER TABLE "conasis"."t_documentosTram" ADD CONSTRAINT "fk_t_documentosTram_t_documentos_1" FOREIGN KEY ("documento_id") REFERENCES "param"."t00_documentos" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_documentosTram" ADD CONSTRAINT "fk_t_documentosTram_t_expediente_1" FOREIGN KEY ("expediente_id") REFERENCES "conasis"."t_expediente" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_documentosTram" ADD CONSTRAINT "fk_t_documentosTram_t_trabajador_1" FOREIGN KEY ("trabajadorDoc_id") REFERENCES "public"."t_trabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_estadosAsistencia
-- ----------------------------
ALTER TABLE "conasis"."t_estadosAsistencia" ADD CONSTRAINT "fk_t_estadosAsistencia_t00_estadosAsis_1" FOREIGN KEY ("estadoAsis_id") REFERENCES "param"."t00_estadosAsis" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_estadosAsistencia" ADD CONSTRAINT "fk_t_estadosAsistencia_t_asistencia_1" FOREIGN KEY ("asistencia_id") REFERENCES "conasis"."t_asistencia" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_exoneracionesMarcacion
-- ----------------------------
ALTER TABLE "conasis"."t_exoneracionesMarcacion" ADD CONSTRAINT "fk_t_exoneracionesMarcacion_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES "public"."t_altasTrabajadores" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_exoneracionesMarcacion" ADD CONSTRAINT "fk_t_exoneracionesMarcacion_t_expediente_1" FOREIGN KEY ("expediente_id") REFERENCES "conasis"."t_expediente" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_exoneracionesMarcacion" ADD CONSTRAINT "fk_t_exoneracionesMarcacion_t_trabajador_1" FOREIGN KEY ("trabajador_id") REFERENCES "public"."t_trabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_expediente
-- ----------------------------
ALTER TABLE "conasis"."t_expediente" ADD CONSTRAINT "fk_t_expediente_t00_estadosTram_1" FOREIGN KEY ("estado_id") REFERENCES "param"."t00_estadosTram" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_expediente" ADD CONSTRAINT "fk_t_expediente_t_trabajador_1" FOREIGN KEY ("trabajador_id") REFERENCES "public"."t_trabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_feriadoLabTrabajador
-- ----------------------------
ALTER TABLE "conasis"."t_feriadoLabTrabajador" ADD CONSTRAINT "fk_t_feriadoLabTrabajador_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES "public"."t_altasTrabajadores" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_feriadoLabTrabajador" ADD CONSTRAINT "fk_t_feriadoLabTrabajador_t_diasNoLaborables_1" FOREIGN KEY ("diaNoLaborable_id") REFERENCES "conasis"."t_diasNoLaborables" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_feriadoLabTrabajador" ADD CONSTRAINT "fk_t_feriadoLabTrabajador_t_expediente_1" FOREIGN KEY ("expediente_id") REFERENCES "conasis"."t_expediente" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_feriadoLabTrabajador" ADD CONSTRAINT "fk_t_feriadoLabTrabajador_t_trabajador_1" FOREIGN KEY ("trabajador_id") REFERENCES "public"."t_trabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_horariosCursos
-- ----------------------------
ALTER TABLE "conasis"."t_horariosCursos" ADD CONSTRAINT "fk_t_horariosCursos_t_cursosIE_1" FOREIGN KEY ("curso_id") REFERENCES "public"."t_cursosIE" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_horariosCursos" ADD CONSTRAINT "fk_t_horariosCursos_t_seccionesIE_1" FOREIGN KEY ("seccion_id") REFERENCES "public"."t_seccionesIE" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_horariosTrabajador
-- ----------------------------
ALTER TABLE "conasis"."t_horariosTrabajador" ADD CONSTRAINT "fk_t_horariosTrabajador_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES "public"."t_altasTrabajadores" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_horariosTrabajador" ADD CONSTRAINT "fk_t_horariosTrabajador_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES "public"."t_institucionesEduc" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_horariosTrabajador" ADD CONSTRAINT "fk_t_horariosTrabajador_t_trabajador_1" FOREIGN KEY ("trabajador_id") REFERENCES "public"."t_trabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_incapsTempTrab
-- ----------------------------
ALTER TABLE "conasis"."t_incapsTempTrab" ADD CONSTRAINT "fk_t_incapsTempTrab_t00_motivosSuspLab_1" FOREIGN KEY ("motivoSuspLab_id") REFERENCES "param"."t00_motivosSuspLab" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_incapsTempTrab" ADD CONSTRAINT "fk_t_incapsTempTrab_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES "public"."t_altasTrabajadores" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_incapsTempTrab" ADD CONSTRAINT "fk_t_incapsTempTrab_t_expediente_1" FOREIGN KEY ("expediente_id") REFERENCES "conasis"."t_expediente" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_incapsTempTrab" ADD CONSTRAINT "fk_t_incapsTempTrab_t_trabajador_1" FOREIGN KEY ("trabajador_id") REFERENCES "public"."t_trabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_justificaciones
-- ----------------------------
ALTER TABLE "conasis"."t_justificaciones" ADD CONSTRAINT "fk_t_justificaciones_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES "public"."t_altasTrabajadores" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_justificaciones" ADD CONSTRAINT "fk_t_justificaciones_t_expediente_1" FOREIGN KEY ("expediente_id") REFERENCES "conasis"."t_expediente" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_justificaciones" ADD CONSTRAINT "fk_t_justificaciones_t_trabajador_1" FOREIGN KEY ("trabajador_id") REFERENCES "public"."t_trabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_locales
-- ----------------------------
ALTER TABLE "conasis"."t_locales" ADD CONSTRAINT "fk_t_locales_t_zonas_1" FOREIGN KEY ("zona_id") REFERENCES "public"."t_zonas" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_localesInstEduc
-- ----------------------------
ALTER TABLE "conasis"."t_localesInstEduc" ADD CONSTRAINT "fk_t_localesInstEduc_t_entidades_1" FOREIGN KEY ("entidad_id") REFERENCES "public"."t_entidades" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_localesInstEduc" ADD CONSTRAINT "fk_t_localesInstEduc_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES "public"."t_institucionesEduc" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_localesInstEduc" ADD CONSTRAINT "fk_t_localesInstEduc_t_locales_1" FOREIGN KEY ("local_id") REFERENCES "conasis"."t_locales" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_localesMarcacion
-- ----------------------------
ALTER TABLE "conasis"."t_localesMarcacion" ADD CONSTRAINT "fk_t_localesMarcacion_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES "public"."t_altasTrabajadores" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_localesMarcacion" ADD CONSTRAINT "fk_t_localesMarcacion_t_localesInstEduc_1" FOREIGN KEY ("localInstEduc_id") REFERENCES "conasis"."t_localesInstEduc" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_marcaciones
-- ----------------------------
ALTER TABLE "conasis"."t_marcaciones" ADD CONSTRAINT "fk_t_marcaciones_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES "public"."t_altasTrabajadores" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_marcaciones" ADD CONSTRAINT "fk_t_marcaciones_t_dispositivosMarca_1" FOREIGN KEY ("dispositivoMarca_id") REFERENCES "conasis"."t_dispositivosMarca" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_marcaciones" ADD CONSTRAINT "fk_t_marcaciones_t_localesMarcacion_1" FOREIGN KEY ("localMarcacion_id") REFERENCES "conasis"."t_localesMarcacion" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_marcaciones" ADD CONSTRAINT "fk_t_marcaciones_t_relojes_1" FOREIGN KEY ("reloj_id") REFERENCES "conasis"."t_relojes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_marcaciones" ADD CONSTRAINT "fk_t_marcaciones_t_trabajador_1" FOREIGN KEY ("trabajador_id") REFERENCES "public"."t_trabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_relojes
-- ----------------------------
ALTER TABLE "conasis"."t_relojes" ADD CONSTRAINT "fk_t_relojes_t_localesInstEduc_1" FOREIGN KEY ("localInstEduc_id") REFERENCES "conasis"."t_localesInstEduc" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_suspLabTrabajador
-- ----------------------------
ALTER TABLE "conasis"."t_suspLabTrabajador" ADD CONSTRAINT "fk_t_suspLabTrabajador_t00_motivosSuspLab_1" FOREIGN KEY ("motivoSuspLab_id") REFERENCES "param"."t00_motivosSuspLab" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_suspLabTrabajador" ADD CONSTRAINT "fk_t_suspLabTrabajador_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES "public"."t_altasTrabajadores" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_suspLabTrabajador" ADD CONSTRAINT "fk_t_suspLabTrabajador_t_expediente_1" FOREIGN KEY ("expediente_id") REFERENCES "conasis"."t_expediente" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "conasis"."t_suspLabTrabajador" ADD CONSTRAINT "fk_t_suspLabTrabajador_t_trabajador_1" FOREIGN KEY ("trabajador_id") REFERENCES "public"."t_trabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
