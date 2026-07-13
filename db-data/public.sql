/*
 Navicat Premium Data Transfer

 Source Server         : POSTGRES_LOCAL
 Source Server Type    : PostgreSQL
 Source Server Version : 120017
 Source Host           : localhost:5432
 Source Catalog        : db_asistenciaugel
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120017
 File Encoding         : 65001

 Date: 06/05/2026 10:46:29
*/


-- ----------------------------
-- Sequence structure for t_altasTrabajadores_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_altasTrabajadores_id_seq";
CREATE SEQUENCE "public"."t_altasTrabajadores_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_areas_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_areas_id_seq";
CREATE SEQUENCE "public"."t_areas_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_cargos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_cargos_id_seq";
CREATE SEQUENCE "public"."t_cargos_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_condicionesLaborales_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_condicionesLaborales_id_seq";
CREATE SEQUENCE "public"."t_condicionesLaborales_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_cursosIE_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_cursosIE_id_seq";
CREATE SEQUENCE "public"."t_cursosIE_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_domicilios_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_domicilios_id_seq";
CREATE SEQUENCE "public"."t_domicilios_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_emails_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_emails_id_seq";
CREATE SEQUENCE "public"."t_emails_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_entidades_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_entidades_id_seq";
CREATE SEQUENCE "public"."t_entidades_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_gradosIE_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_gradosIE_id_seq";
CREATE SEQUENCE "public"."t_gradosIE_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_historialCambios_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_historialCambios_id_seq";
CREATE SEQUENCE "public"."t_historialCambios_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_institucionesEduc_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_institucionesEduc_id_seq";
CREATE SEQUENCE "public"."t_institucionesEduc_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_personas_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_personas_id_seq";
CREATE SEQUENCE "public"."t_personas_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_seccionesIE_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_seccionesIE_id_seq";
CREATE SEQUENCE "public"."t_seccionesIE_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_telefonos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_telefonos_id_seq";
CREATE SEQUENCE "public"."t_telefonos_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_trabajador_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_trabajador_id_seq";
CREATE SEQUENCE "public"."t_trabajador_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_zonas_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_zonas_id_seq";
CREATE SEQUENCE "public"."t_zonas_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for t_altasTrabajadores
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_altasTrabajadores";
CREATE TABLE "public"."t_altasTrabajadores" (
  "id" int8 NOT NULL DEFAULT nextval('"t_altasTrabajadores_id_seq"'::regclass),
  "codigoAirsp" varchar(20) COLLATE "pg_catalog"."default",
  "trabajador_id" int8 NOT NULL,
  "fechaInicio" date NOT NULL,
  "fechaFin" date,
  "fechaAlta" date NOT NULL,
  "condicionLaboral_id" int2 NOT NULL,
  "tipoContrato_id" int2 NOT NULL,
  "institucionEducativa_id" int8 NOT NULL,
  "rolTrabajador_id" int2,
  "area_id" int2 NOT NULL,
  "cargo_id" int4 NOT NULL,
  "situacionLaboral_id" int2 NOT NULL,
  "observacion" varchar(200) COLLATE "pg_catalog"."default",
  "fechaBaja" date,
  "motivoBaja_id" int2,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_altasTrabajadores
-- ----------------------------
INSERT INTO "public"."t_altasTrabajadores" VALUES (1, '265455', 1, '2026-01-01', NULL, '2026-01-01', 1, 24, 1, 2, 1, 2, 2, NULL, NULL, NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_altasTrabajadores" VALUES (2, '248455', 2, '2026-01-01', NULL, '2026-01-01', 2, 11, 1, 2, 1, 4, 2, NULL, NULL, NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_altasTrabajadores" VALUES (3, '333155', 3, '2026-01-01', '2026-12-31', '2026-01-01', 2, 11, 1, 2, 1, 1, 2, NULL, '2026-12-31', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_altasTrabajadores" VALUES (4, '333155', 4, '2026-01-01', '2026-12-31', '2026-01-01', 3, 7, 1, 3, 2, 3, 2, NULL, '2026-12-31', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_altasTrabajadores" VALUES (5, '451555', 5, '2026-01-01', NULL, '2026-01-01', 1, 24, 1, 2, 1, 4, 2, NULL, NULL, NULL, '2026-05-05 00:00:00', 1);

-- ----------------------------
-- Table structure for t_areas
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_areas";
CREATE TABLE "public"."t_areas" (
  "id" int2 NOT NULL DEFAULT nextval('t_areas_id_seq'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "sigla" varchar(20) COLLATE "pg_catalog"."default",
  "descripcion" varchar(100) COLLATE "pg_catalog"."default",
  "rolTrabajador_id" int2,
  "activo" bool
)
;

-- ----------------------------
-- Records of t_areas
-- ----------------------------
INSERT INTO "public"."t_areas" VALUES (2, '2', 'DIRECCION DE LA I.E.', 'DIRECCION', NULL, 3, 't');
INSERT INTO "public"."t_areas" VALUES (3, '3', 'ADMINISTRACION', 'ADMINISTRACION', NULL, 1, 't');
INSERT INTO "public"."t_areas" VALUES (1, '1', 'DOCENCIA', 'DOCENCIA', NULL, 2, 't');

-- ----------------------------
-- Table structure for t_cargos
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_cargos";
CREATE TABLE "public"."t_cargos" (
  "id" int4 NOT NULL DEFAULT nextval('t_cargos_id_seq'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "rolTrabajador_id" int2,
  "created_at" timestamp(6),
  "created_by" int8,
  "activo" bool
)
;

-- ----------------------------
-- Records of t_cargos
-- ----------------------------
INSERT INTO "public"."t_cargos" VALUES (1, '00001', 'PROFESOR DE EDUCACION INICIAL', NULL, 2, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_cargos" VALUES (2, '00002', 'DOCENTE DE INGLES', NULL, 2, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_cargos" VALUES (3, '00003', 'DIRECTOR', NULL, 3, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_cargos" VALUES (4, '00004', 'DOCENTE DE MATEMATICA', NULL, 2, '2026-05-05 00:00:00', 1, 't');

-- ----------------------------
-- Table structure for t_condicionesLaborales
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_condicionesLaborales";
CREATE TABLE "public"."t_condicionesLaborales" (
  "id" int4 NOT NULL DEFAULT nextval('"t_condicionesLaborales_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "regimenLaboral_id" int2 NOT NULL,
  "tipoTrabajador_id" int2 NOT NULL,
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "descripcion" varchar(200) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_condicionesLaborales
-- ----------------------------
INSERT INTO "public"."t_condicionesLaborales" VALUES (3, '239603', 23, 40, 'MAGISTERIO DL 29944 | DIRECTIVO', NULL, NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_condicionesLaborales" VALUES (4, '239604', 23, 40, 'MAGISTERIO DL 29944 | ESPECIALISTA EN EDUCACION', NULL, NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_condicionesLaborales" VALUES (1, '239601', 23, 40, 'MAGISTERIO DL 29944 | DOCENTE NOMBRADO', NULL, NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_condicionesLaborales" VALUES (2, '239602', 23, 40, 'MAGISTERIO DL 29944 | DOCENTE CONTRATADO', NULL, NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_condicionesLaborales" VALUES (5, '239605', 23, 40, 'MAGISTERIO DL 29944 | ACT. DE INVESTIGACION', NULL, NULL, '2026-05-05 00:00:00', 1);

-- ----------------------------
-- Table structure for t_cursosIE
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_cursosIE";
CREATE TABLE "public"."t_cursosIE" (
  "id" int8 NOT NULL DEFAULT nextval('"t_cursosIE_id_seq"'::regclass),
  "institucionEduc_id" int8 NOT NULL,
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "sigla" varchar(50) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6),
  "created_by" int8,
  "activo" bool
)
;

-- ----------------------------
-- Records of t_cursosIE
-- ----------------------------
INSERT INTO "public"."t_cursosIE" VALUES (3, 1, 'IE00001M03', 'QUIMICA', 'QUIM', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_cursosIE" VALUES (6, 1, 'IE00001M06', 'TUTORIA', 'TUTO', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_cursosIE" VALUES (5, 1, 'IE00001M05', 'LITERATURA', 'LITE', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_cursosIE" VALUES (4, 1, 'IE00001M04', 'FISICA', 'FISI', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_cursosIE" VALUES (2, 1, 'IE00001M02', 'MATEMATICAS', 'MATE', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_cursosIE" VALUES (1, 1, 'IE00001M01', 'INGLES', 'INGL', '2026-05-05 00:00:00', 1, 't');

-- ----------------------------
-- Table structure for t_domicilios
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_domicilios";
CREATE TABLE "public"."t_domicilios" (
  "id" int8 NOT NULL DEFAULT nextval('t_domicilios_id_seq'::regclass),
  "persona_id" int8,
  "entidad_id" int8,
  "institucionEduc_id" int8,
  "domicilio" varchar(200) COLLATE "pg_catalog"."default",
  "zona_id" int8 NOT NULL,
  "ubigeo" varchar(20) COLLATE "pg_catalog"."default",
  "fechaInicio" date,
  "fechaFin" date,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_domicilios
-- ----------------------------
INSERT INTO "public"."t_domicilios" VALUES (1, NULL, 1, NULL, 'JR. AMALIA PUGA N° 123', 1, '060101', '2026-05-05', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_domicilios" VALUES (2, 1, NULL, NULL, 'JR. REVILLA PEREZ N° 845', 2, '060101', '2026-05-05', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_domicilios" VALUES (3, 2, NULL, NULL, 'AV. HOYOS RUBIO', 3, '060101', '2026-05-05', NULL, '2026-05-05 00:00:00', 1);

-- ----------------------------
-- Table structure for t_emails
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_emails";
CREATE TABLE "public"."t_emails" (
  "id" int8 NOT NULL DEFAULT nextval('t_emails_id_seq'::regclass),
  "persona_id" int8,
  "entidad_id" int8,
  "institucionEduc_id" int8,
  "email" varchar(200) COLLATE "pg_catalog"."default",
  "personalInst" varchar(1) COLLATE "pg_catalog"."default",
  "fechaInicio" date,
  "fechaFin" date,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_emails
-- ----------------------------
INSERT INTO "public"."t_emails" VALUES (1, NULL, 1, NULL, 'ugelcajamarca@minedu.gob.pe', 'I', '2026-05-05', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_emails" VALUES (2, 1, NULL, NULL, 'persona1@gmail.com', 'P', '2026-05-05', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_emails" VALUES (3, 2, NULL, NULL, 'persona2@gmail.com', 'P', '2026-05-05', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_emails" VALUES (4, 3, NULL, NULL, 'persona3@hotmail.com', 'P', '2026-05-05', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_emails" VALUES (5, 4, NULL, NULL, 'persona4@minedu.gob.pe', 'I', '2026-05-05', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_emails" VALUES (6, NULL, NULL, 1, 'sanramon@gmail.com', 'I', '2026-05-05', NULL, '2026-05-05 00:00:00', 1);

-- ----------------------------
-- Table structure for t_entidades
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_entidades";
CREATE TABLE "public"."t_entidades" (
  "id" int8 NOT NULL DEFAULT nextval('t_entidades_id_seq'::regclass),
  "tipoEntidad_id" int2,
  "ruc" varchar(20) COLLATE "pg_catalog"."default",
  "razonSocial" varchar(200) COLLATE "pg_catalog"."default",
  "razonComercial" varchar(200) COLLATE "pg_catalog"."default",
  "personaRepLegal_id" int8,
  "created_at" timestamp(6),
  "created_by" int8,
  "activo" bool
)
;

-- ----------------------------
-- Records of t_entidades
-- ----------------------------
INSERT INTO "public"."t_entidades" VALUES (1, 1, '20231584691', 'UGEL CAJAMARCA', 'UGEL CAJAMARCA', 2, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_entidades" VALUES (2, 1, '20142584516', 'COLEGIO SAN FERNANDO', 'COLEGIO SAN FERNADO', 1, '2026-05-05 00:00:00', 1, 't');

-- ----------------------------
-- Table structure for t_gradosIE
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_gradosIE";
CREATE TABLE "public"."t_gradosIE" (
  "id" int8 NOT NULL DEFAULT nextval('"t_gradosIE_id_seq"'::regclass),
  "institucionEduc_id" int8 NOT NULL,
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "sigla" varchar(50) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6),
  "created_by" int8,
  "activo" bool
)
;

-- ----------------------------
-- Records of t_gradosIE
-- ----------------------------
INSERT INTO "public"."t_gradosIE" VALUES (1, 1, 'IE0000101', 'PRIMER GRADO', '1G', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (2, 1, 'IE0000102', 'SEGUNDO GRADO', '2G', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (3, 1, 'IE0000103', 'TERCER GRADO', '3G', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (4, 1, 'IE0000104', 'CUARTO GRADO', '4G', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (5, 1, 'IE0000105', 'QUINTO GRADO', '5G', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (6, 2, 'IE0000201', 'PRIMER GRADO', '1G', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (7, 2, 'IE0000202', 'SEGUNDO GRADO', '2G', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (8, 2, 'IE0000203', 'TERCER GRADO', '3G', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (9, 2, 'IE0000204', 'CUARTO GRADO', '4G', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (10, 2, 'IE0000205', 'QUINTO GRADO', '5G', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (11, 3, 'IE0000301', '3 AÑITOS', '3A', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (12, 3, 'IE0000302', '4 AÑITOS', '4A', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (13, 3, 'IE0000303', '5 AÑITOS', '5A', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (14, 4, 'IE0000401', 'PRIMER GRADO', '1G', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (15, 4, 'IE0000402', 'SEGUNDO GRADO', '2G', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (16, 4, 'IE0000403', 'TERCER GRADO', '3G', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (17, 4, 'IE0000404', 'CUARTO GRADO', '4G', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (18, 4, 'IE0000405', 'QUINTO GRADO', '5G', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_gradosIE" VALUES (19, 4, 'IE0000406', 'SEXTO GRADO', '5G', '2026-05-05 00:00:00', 1, 't');

-- ----------------------------
-- Table structure for t_historialCambios
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_historialCambios";
CREATE TABLE "public"."t_historialCambios" (
  "id" int8 NOT NULL DEFAULT nextval('"t_historialCambios_id_seq"'::regclass),
  "esquema" varchar(20) COLLATE "pg_catalog"."default",
  "tabla" varchar(50) COLLATE "pg_catalog"."default",
  "registro_id" int8,
  "accion" varchar(20) COLLATE "pg_catalog"."default",
  "dato_old" varchar(300) COLLATE "pg_catalog"."default",
  "dato_new" varchar(300) COLLATE "pg_catalog"."default",
  "accion_at" timestamp(6),
  "accion_by" int8
)
;

-- ----------------------------
-- Records of t_historialCambios
-- ----------------------------

-- ----------------------------
-- Table structure for t_institucionesEduc
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_institucionesEduc";
CREATE TABLE "public"."t_institucionesEduc" (
  "id" int8 NOT NULL DEFAULT nextval('"t_institucionesEduc_id_seq"'::regclass),
  "entidadUgel_id" int8,
  "entidadAdmin_id" int8,
  "codigoInstitucion" varchar(30) COLLATE "pg_catalog"."default",
  "codigoModular" varchar(30) COLLATE "pg_catalog"."default",
  "nombreLegal" varchar(200) COLLATE "pg_catalog"."default",
  "regimenEduc_id" int2,
  "tipoInstEduc_id" int2,
  "modalidadFormativa_id" int2 NOT NULL,
  "nivelCiclo_id" int2 NOT NULL,
  "fechaInicio" date,
  "fechaFin" date,
  "created_at" timestamp(6),
  "created_by" int2
)
;

-- ----------------------------
-- Records of t_institucionesEduc
-- ----------------------------
INSERT INTO "public"."t_institucionesEduc" VALUES (1, 1, 1, 'IE00001', '48546612', 'COLEGIO SAN RAMON', 1, 2, 1, 3, '2026-01-01', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_institucionesEduc" VALUES (2, 1, 1, 'IE00002', '58821554', 'COLEGIO SANTA TERESITA', 1, 2, 1, 3, '2026-01-01', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_institucionesEduc" VALUES (4, 1, 1, 'IE00004', '12313155', 'I.E. CARDUCI', 1, 2, 1, 3, '2026-01-01', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_institucionesEduc" VALUES (5, 1, 2, 'IE00005', '24518745', 'COLEGIO SAN FERNANDO', 3, 2, 1, 3, '2026-01-01', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_institucionesEduc" VALUES (3, 1, 1, 'IE00003', '36546256', 'I.E. 82023 INICIAL', 1, 1, 1, 1, '2026-01-01', NULL, '2026-05-05 00:00:00', 1);

-- ----------------------------
-- Table structure for t_personas
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_personas";
CREATE TABLE "public"."t_personas" (
  "id" int8 NOT NULL DEFAULT nextval('t_personas_id_seq'::regclass),
  "pais_id" int2 NOT NULL,
  "tipoDocIdentidad_id" int2 NOT NULL,
  "docIdentidad" varchar(20) COLLATE "pg_catalog"."default",
  "paterno" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "materno" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "nombre" varchar(150) COLLATE "pg_catalog"."default",
  "sexo_id" int2 NOT NULL,
  "fechaNac" date,
  "ubigeo" varchar(20) COLLATE "pg_catalog"."default",
  "foto" varchar(200) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6),
  "created_by" int8,
  "activo" bool
)
;

-- ----------------------------
-- Records of t_personas
-- ----------------------------
INSERT INTO "public"."t_personas" VALUES (1, 193, 1, '11111111', 'appaterno1', 'apmaterno1', 'nombre1', 1, '2000-01-01', NULL, NULL, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_personas" VALUES (2, 193, 1, '22222222', 'appaterno2', 'apmaterno2', 'nombre2', 1, '2009-01-01', NULL, NULL, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_personas" VALUES (3, 193, 1, '33333333', 'appaterno3', 'apmaterno3', 'nombre3', 1, '2003-01-01', NULL, NULL, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_personas" VALUES (4, 193, 1, '44444444', 'appaterno4', 'apmaterno4', 'nombre4', 2, '2008-01-01', NULL, NULL, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_personas" VALUES (5, 193, 1, '55555555', 'appaterno5', 'apmaterno5', 'nombre5', 1, '1995-01-01', NULL, NULL, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_personas" VALUES (6, 193, 1, '66666666', 'appaterno6', 'apmaterno6', 'nombre6', 1, '1998-01-01', NULL, NULL, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_personas" VALUES (7, 193, 1, '77777777', 'appaterno7', 'apmaterno7', 'nombre7', 2, '2001-01-01', NULL, NULL, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_personas" VALUES (8, 193, 1, '88888888', 'appaterno8', 'apmaterno8', 'nombre8', 1, '1999-01-01', NULL, NULL, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_personas" VALUES (9, 193, 1, '99999999', 'appaterno9', 'apmaterno9', 'nombre9', 2, '2005-01-01', NULL, NULL, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_personas" VALUES (10, 193, 2, '1010101099', 'appaterno10', 'apmaterno10', 'nombre10', 1, '2004-01-01', NULL, NULL, '2026-05-05 00:00:00', 1, 't');

-- ----------------------------
-- Table structure for t_seccionesIE
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_seccionesIE";
CREATE TABLE "public"."t_seccionesIE" (
  "id" int8 NOT NULL DEFAULT nextval('"t_seccionesIE_id_seq"'::regclass),
  "grado_id" int8 NOT NULL,
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "sigla" varchar(50) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6),
  "created_by" int8,
  "activo" bool
)
;

-- ----------------------------
-- Records of t_seccionesIE
-- ----------------------------
INSERT INTO "public"."t_seccionesIE" VALUES (1, 1, 'IE000010101', 'SECCION A', '1GA', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_seccionesIE" VALUES (2, 1, 'IE000010102', 'SECCION B', '1GB', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_seccionesIE" VALUES (3, 1, 'IE000010103', 'SECCION C', '1GC', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_seccionesIE" VALUES (4, 2, 'IE000010201', 'SECCION A', '2GA', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_seccionesIE" VALUES (5, 2, 'IE000010202', 'SECCION B', '2GB', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_seccionesIE" VALUES (6, 3, 'IE000010301', 'SECCION A', '3GA', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_seccionesIE" VALUES (7, 4, 'IE000010401', 'SECCION A', '4GA', '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_seccionesIE" VALUES (8, 5, 'IE000010501', 'SECCION A', '5GA', '2026-05-05 00:00:00', 1, 't');

-- ----------------------------
-- Table structure for t_telefonos
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_telefonos";
CREATE TABLE "public"."t_telefonos" (
  "id" int8 NOT NULL DEFAULT nextval('t_telefonos_id_seq'::regclass),
  "persona_id" int8,
  "entidad_id" int8,
  "institucionEduc_id" int8,
  "operador_id" int2 NOT NULL,
  "movilFijo" varchar(1) COLLATE "pg_catalog"."default",
  "codigoPais" varchar(10) COLLATE "pg_catalog"."default",
  "numero" varchar(30) COLLATE "pg_catalog"."default",
  "imei" varchar(50) COLLATE "pg_catalog"."default",
  "fechaInicio" date,
  "fechaFin" date,
  "created_at" timestamp(6),
  "created_by" int8
)
;

-- ----------------------------
-- Records of t_telefonos
-- ----------------------------
INSERT INTO "public"."t_telefonos" VALUES (1, NULL, 1, NULL, 1, 'F', '51', '74155166', NULL, '2026-05-05', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_telefonos" VALUES (2, NULL, NULL, 1, 1, 'F', '51', '78445415', NULL, '2026-05-05', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_telefonos" VALUES (3, 1, NULL, NULL, 2, 'M', '51', '95494555', NULL, '2026-05-05', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_telefonos" VALUES (4, 2, NULL, NULL, 3, 'M', '51', '65499474', NULL, '2026-05-05', NULL, '2026-05-05 00:00:00', 1);
INSERT INTO "public"."t_telefonos" VALUES (5, 3, NULL, NULL, 2, 'M', '51', '48845645', NULL, '2026-05-05', NULL, '2026-05-05 00:00:00', 1);

-- ----------------------------
-- Table structure for t_trabajador
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_trabajador";
CREATE TABLE "public"."t_trabajador" (
  "id" int8 NOT NULL DEFAULT nextval('t_trabajador_id_seq'::regclass),
  "codigo" varchar(30) COLLATE "pg_catalog"."default",
  "persona_id" int8,
  "created_at" timestamp(6),
  "created_by" int8,
  "activo" bool
)
;

-- ----------------------------
-- Records of t_trabajador
-- ----------------------------
INSERT INTO "public"."t_trabajador" VALUES (1, '0000001', 1, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_trabajador" VALUES (2, '0000002', 2, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_trabajador" VALUES (3, '0000003', 3, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_trabajador" VALUES (4, '0000004', 4, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_trabajador" VALUES (5, '0000005', 5, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_trabajador" VALUES (6, '0000006', 6, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_trabajador" VALUES (7, '0000007', 7, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_trabajador" VALUES (8, '0000008', 8, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_trabajador" VALUES (9, '0000009', 9, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_trabajador" VALUES (10, '0000010', 10, '2026-05-05 00:00:00', 1, 't');

-- ----------------------------
-- Table structure for t_zonas
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_zonas";
CREATE TABLE "public"."t_zonas" (
  "id" int8 NOT NULL DEFAULT nextval('t_zonas_id_seq'::regclass),
  "tipoZona_id" int2 NOT NULL,
  "distrito_id" int2,
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(50) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6),
  "created_by" int8,
  "activo" bool
)
;

-- ----------------------------
-- Records of t_zonas
-- ----------------------------
INSERT INTO "public"."t_zonas" VALUES (1, 12, 551, 'CAJAMARCA', NULL, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_zonas" VALUES (2, 1, 551, 'MOLLEPAMPA', NULL, '2026-05-05 00:00:00', 1, 't');
INSERT INTO "public"."t_zonas" VALUES (3, 1, 551, 'FONAVI II', NULL, '2026-05-05 00:00:00', 1, 't');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_altasTrabajadores_id_seq"
OWNED BY "public"."t_altasTrabajadores"."id";
SELECT setval('"public"."t_altasTrabajadores_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_areas_id_seq"
OWNED BY "public"."t_areas"."id";
SELECT setval('"public"."t_areas_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_cargos_id_seq"
OWNED BY "public"."t_cargos"."id";
SELECT setval('"public"."t_cargos_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_condicionesLaborales_id_seq"
OWNED BY "public"."t_condicionesLaborales"."id";
SELECT setval('"public"."t_condicionesLaborales_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_cursosIE_id_seq"
OWNED BY "public"."t_cursosIE"."id";
SELECT setval('"public"."t_cursosIE_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_domicilios_id_seq"
OWNED BY "public"."t_domicilios"."id";
SELECT setval('"public"."t_domicilios_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_emails_id_seq"
OWNED BY "public"."t_emails"."id";
SELECT setval('"public"."t_emails_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_entidades_id_seq"
OWNED BY "public"."t_entidades"."id";
SELECT setval('"public"."t_entidades_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_gradosIE_id_seq"
OWNED BY "public"."t_gradosIE"."id";
SELECT setval('"public"."t_gradosIE_id_seq"', 19, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_historialCambios_id_seq"
OWNED BY "public"."t_historialCambios"."id";
SELECT setval('"public"."t_historialCambios_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_institucionesEduc_id_seq"
OWNED BY "public"."t_institucionesEduc"."id";
SELECT setval('"public"."t_institucionesEduc_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_personas_id_seq"
OWNED BY "public"."t_personas"."id";
SELECT setval('"public"."t_personas_id_seq"', 10, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_seccionesIE_id_seq"
OWNED BY "public"."t_seccionesIE"."id";
SELECT setval('"public"."t_seccionesIE_id_seq"', 8, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_telefonos_id_seq"
OWNED BY "public"."t_telefonos"."id";
SELECT setval('"public"."t_telefonos_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_trabajador_id_seq"
OWNED BY "public"."t_trabajador"."id";
SELECT setval('"public"."t_trabajador_id_seq"', 10, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_zonas_id_seq"
OWNED BY "public"."t_zonas"."id";
SELECT setval('"public"."t_zonas_id_seq"', 3, true);

-- ----------------------------
-- Primary Key structure for table t_altasTrabajadores
-- ----------------------------
ALTER TABLE "public"."t_altasTrabajadores" ADD CONSTRAINT "t_altasTrabajadores_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_areas
-- ----------------------------
ALTER TABLE "public"."t_areas" ADD CONSTRAINT "t_areas_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_cargos
-- ----------------------------
ALTER TABLE "public"."t_cargos" ADD CONSTRAINT "t_cargos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_condicionesLaborales
-- ----------------------------
ALTER TABLE "public"."t_condicionesLaborales" ADD CONSTRAINT "t_condicionesLaborales_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_cursosIE
-- ----------------------------
ALTER TABLE "public"."t_cursosIE" ADD CONSTRAINT "t_cursosIE_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_domicilios
-- ----------------------------
ALTER TABLE "public"."t_domicilios" ADD CONSTRAINT "t_domicilios_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_emails
-- ----------------------------
ALTER TABLE "public"."t_emails" ADD CONSTRAINT "t_emails_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_entidades
-- ----------------------------
ALTER TABLE "public"."t_entidades" ADD CONSTRAINT "t_entidades_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_gradosIE
-- ----------------------------
ALTER TABLE "public"."t_gradosIE" ADD CONSTRAINT "t_gradosIE_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_historialCambios
-- ----------------------------
ALTER TABLE "public"."t_historialCambios" ADD CONSTRAINT "t_historialCambios_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_institucionesEduc
-- ----------------------------
ALTER TABLE "public"."t_institucionesEduc" ADD CONSTRAINT "t_institucionesEduc_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_personas
-- ----------------------------
ALTER TABLE "public"."t_personas" ADD CONSTRAINT "t_personas_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_seccionesIE
-- ----------------------------
ALTER TABLE "public"."t_seccionesIE" ADD CONSTRAINT "t_seccionesIE_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_telefonos
-- ----------------------------
ALTER TABLE "public"."t_telefonos" ADD CONSTRAINT "t_telefonos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_trabajador
-- ----------------------------
ALTER TABLE "public"."t_trabajador" ADD CONSTRAINT "t_trabajador_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_zonas
-- ----------------------------
ALTER TABLE "public"."t_zonas" ADD CONSTRAINT "t_zonas_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table t_altasTrabajadores
-- ----------------------------
ALTER TABLE "public"."t_altasTrabajadores" ADD CONSTRAINT "fk_t_altasTrabajadores_t00_rolTrabajador_1" FOREIGN KEY ("rolTrabajador_id") REFERENCES "param"."t00_rolTrabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_altasTrabajadores" ADD CONSTRAINT "fk_t_altasTrabajadores_t12_tipoContrato_1" FOREIGN KEY ("tipoContrato_id") REFERENCES "param"."t12_tipoContrato" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_altasTrabajadores" ADD CONSTRAINT "fk_t_altasTrabajadores_t15_situacionLaboral_1" FOREIGN KEY ("situacionLaboral_id") REFERENCES "param"."t15_situacionLaboral" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_altasTrabajadores" ADD CONSTRAINT "fk_t_altasTrabajadores_t17_motivoDeBajas_1" FOREIGN KEY ("motivoBaja_id") REFERENCES "param"."t17_motivoDeBajas" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_altasTrabajadores" ADD CONSTRAINT "fk_t_altasTrabajadores_t_areas_1" FOREIGN KEY ("area_id") REFERENCES "public"."t_areas" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_altasTrabajadores" ADD CONSTRAINT "fk_t_altasTrabajadores_t_cargos_1" FOREIGN KEY ("cargo_id") REFERENCES "public"."t_cargos" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_altasTrabajadores" ADD CONSTRAINT "fk_t_altasTrabajadores_t_condicionesLaborales_1" FOREIGN KEY ("condicionLaboral_id") REFERENCES "public"."t_condicionesLaborales" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_altasTrabajadores" ADD CONSTRAINT "fk_t_altasTrabajadores_t_institucionesEduc_1" FOREIGN KEY ("institucionEducativa_id") REFERENCES "public"."t_institucionesEduc" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_altasTrabajadores" ADD CONSTRAINT "fk_t_altasTrabajadores_t_trabajador_1" FOREIGN KEY ("trabajador_id") REFERENCES "public"."t_trabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_areas
-- ----------------------------
ALTER TABLE "public"."t_areas" ADD CONSTRAINT "fk_t_areas_t00_rolTrabajador_1" FOREIGN KEY ("rolTrabajador_id") REFERENCES "param"."t00_rolTrabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_cargos
-- ----------------------------
ALTER TABLE "public"."t_cargos" ADD CONSTRAINT "fk_t_cargos_t00_rolTrabajador_1" FOREIGN KEY ("rolTrabajador_id") REFERENCES "param"."t00_rolTrabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_condicionesLaborales
-- ----------------------------
ALTER TABLE "public"."t_condicionesLaborales" ADD CONSTRAINT "fk_t_condicionesLaborales_t33_regimenLaboral_1" FOREIGN KEY ("regimenLaboral_id") REFERENCES "param"."t33_regimenLaboral" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_condicionesLaborales" ADD CONSTRAINT "fk_t_condicionesLaborales_t8_tipoTrabajador_1" FOREIGN KEY ("tipoTrabajador_id") REFERENCES "param"."t8_tipoTrabajador" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_cursosIE
-- ----------------------------
ALTER TABLE "public"."t_cursosIE" ADD CONSTRAINT "fk_t_cursosIE_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES "public"."t_institucionesEduc" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_domicilios
-- ----------------------------
ALTER TABLE "public"."t_domicilios" ADD CONSTRAINT "fk_t_domicilios_t_entidades_1" FOREIGN KEY ("entidad_id") REFERENCES "public"."t_entidades" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_domicilios" ADD CONSTRAINT "fk_t_domicilios_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES "public"."t_institucionesEduc" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_domicilios" ADD CONSTRAINT "fk_t_domicilios_t_personas_1" FOREIGN KEY ("persona_id") REFERENCES "public"."t_personas" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_domicilios" ADD CONSTRAINT "fk_t_domicilios_t_zonas_1" FOREIGN KEY ("zona_id") REFERENCES "public"."t_zonas" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_emails
-- ----------------------------
ALTER TABLE "public"."t_emails" ADD CONSTRAINT "fk_emails_t_entidades_1" FOREIGN KEY ("entidad_id") REFERENCES "public"."t_entidades" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_emails" ADD CONSTRAINT "fk_emails_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES "public"."t_institucionesEduc" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_emails" ADD CONSTRAINT "fk_emails_t_personas_1" FOREIGN KEY ("persona_id") REFERENCES "public"."t_personas" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_entidades
-- ----------------------------
ALTER TABLE "public"."t_entidades" ADD CONSTRAINT "fk_t_entidades_t00_tipoEntidad_1" FOREIGN KEY ("tipoEntidad_id") REFERENCES "param"."t00_tipoEntidad" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_gradosIE
-- ----------------------------
ALTER TABLE "public"."t_gradosIE" ADD CONSTRAINT "fk_t_gradosIE_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES "public"."t_institucionesEduc" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_institucionesEduc
-- ----------------------------
ALTER TABLE "public"."t_institucionesEduc" ADD CONSTRAINT "fk_t_institucionesEduc_t34_modalidadesForm_1" FOREIGN KEY ("modalidadFormativa_id") REFERENCES "param"."t34_modalidadesForm" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_institucionesEduc" ADD CONSTRAINT "fk_t_institucionesEduc_t34_nivelesCiclo_1" FOREIGN KEY ("nivelCiclo_id") REFERENCES "param"."t34_nivelesCiclo" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_institucionesEduc" ADD CONSTRAINT "fk_t_institucionesEduc_t34_regimenEduc_1" FOREIGN KEY ("regimenEduc_id") REFERENCES "param"."t34_regimenEduc" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_institucionesEduc" ADD CONSTRAINT "fk_t_institucionesEduc_t34_tipoInstEduc_1" FOREIGN KEY ("tipoInstEduc_id") REFERENCES "param"."t34_tipoInstEduc" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_institucionesEduc" ADD CONSTRAINT "fk_t_institucionesEduc_t_entidades_1" FOREIGN KEY ("entidadUgel_id") REFERENCES "public"."t_entidades" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_institucionesEduc" ADD CONSTRAINT "fk_t_institucionesEduc_t_entidades_2" FOREIGN KEY ("entidadAdmin_id") REFERENCES "public"."t_entidades" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_personas
-- ----------------------------
ALTER TABLE "public"."t_personas" ADD CONSTRAINT "fk_t_personas_t00_sexos_1" FOREIGN KEY ("sexo_id") REFERENCES "param"."t00_sexos" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_personas" ADD CONSTRAINT "fk_t_personas_t3_tipoDocIdentidad_1" FOREIGN KEY ("tipoDocIdentidad_id") REFERENCES "param"."t3_tipoDocIdentidad" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_seccionesIE
-- ----------------------------
ALTER TABLE "public"."t_seccionesIE" ADD CONSTRAINT "fk_t_seccionesIE_t_gradosIE_1" FOREIGN KEY ("grado_id") REFERENCES "public"."t_gradosIE" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_telefonos
-- ----------------------------
ALTER TABLE "public"."t_telefonos" ADD CONSTRAINT "fk_t_telefonos_t00_operadores_1" FOREIGN KEY ("operador_id") REFERENCES "param"."t00_operadores" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_telefonos" ADD CONSTRAINT "fk_t_telefonos_t_entidades_1" FOREIGN KEY ("entidad_id") REFERENCES "public"."t_entidades" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_telefonos" ADD CONSTRAINT "fk_t_telefonos_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES "public"."t_institucionesEduc" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_telefonos" ADD CONSTRAINT "fk_t_telefonos_t_personas_1" FOREIGN KEY ("persona_id") REFERENCES "public"."t_personas" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_trabajador
-- ----------------------------
ALTER TABLE "public"."t_trabajador" ADD CONSTRAINT "fk_t_trabajador_t_personas_1" FOREIGN KEY ("persona_id") REFERENCES "public"."t_personas" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_zonas
-- ----------------------------
ALTER TABLE "public"."t_zonas" ADD CONSTRAINT "fk_t_zonas_t28_distritos_1" FOREIGN KEY ("distrito_id") REFERENCES "param"."t28_distritos" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_zonas" ADD CONSTRAINT "fk_t_zonas_t6_tiposZona_1" FOREIGN KEY ("tipoZona_id") REFERENCES "param"."t6_tiposZona" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
