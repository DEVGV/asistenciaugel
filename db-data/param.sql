/*
 Navicat Premium Data Transfer

 Source Server         : POSTGRES_LOCAL
 Source Server Type    : PostgreSQL
 Source Server Version : 120017
 Source Host           : localhost:5432
 Source Catalog        : db_asistenciaugel
 Source Schema         : param

 Target Server Type    : PostgreSQL
 Target Server Version : 120017
 File Encoding         : 65001

 Date: 06/05/2026 10:46:17
*/


-- ----------------------------
-- Sequence structure for t00_documentos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t00_documentos_id_seq";
CREATE SEQUENCE "param"."t00_documentos_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t00_estadosAsis_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t00_estadosAsis_id_seq";
CREATE SEQUENCE "param"."t00_estadosAsis_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t00_estadosTram_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t00_estadosTram_id_seq";
CREATE SEQUENCE "param"."t00_estadosTram_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t00_feriados_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t00_feriados_id_seq";
CREATE SEQUENCE "param"."t00_feriados_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t00_motivosSuspLab_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t00_motivosSuspLab_id_seq";
CREATE SEQUENCE "param"."t00_motivosSuspLab_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t00_operadores_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t00_operadores_id_seq";
CREATE SEQUENCE "param"."t00_operadores_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t00_rolTrabajador_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t00_rolTrabajador_id_seq";
CREATE SEQUENCE "param"."t00_rolTrabajador_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t00_sexos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t00_sexos_id_seq";
CREATE SEQUENCE "param"."t00_sexos_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t00_tipoEntidad_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t00_tipoEntidad_id_seq";
CREATE SEQUENCE "param"."t00_tipoEntidad_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t00_turnos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t00_turnos_id_seq";
CREATE SEQUENCE "param"."t00_turnos_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t12_tipoContrato_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t12_tipoContrato_id_seq";
CREATE SEQUENCE "param"."t12_tipoContrato_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t15_situacionLaboral_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t15_situacionLaboral_id_seq";
CREATE SEQUENCE "param"."t15_situacionLaboral_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t17_motivoDeBajas_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t17_motivoDeBajas_id_seq";
CREATE SEQUENCE "param"."t17_motivoDeBajas_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t21_tipoSuspensionLaboral_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t21_tipoSuspensionLaboral_id_seq";
CREATE SEQUENCE "param"."t21_tipoSuspensionLaboral_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t26_pais_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t26_pais_id_seq";
CREATE SEQUENCE "param"."t26_pais_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t28_departamento_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t28_departamento_id_seq";
CREATE SEQUENCE "param"."t28_departamento_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t28_distritos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t28_distritos_id_seq";
CREATE SEQUENCE "param"."t28_distritos_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t28_provincias_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t28_provincias_id_seq";
CREATE SEQUENCE "param"."t28_provincias_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t33_regimenLaboral_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t33_regimenLaboral_id_seq";
CREATE SEQUENCE "param"."t33_regimenLaboral_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t34_modalidadesForm_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t34_modalidadesForm_id_seq";
CREATE SEQUENCE "param"."t34_modalidadesForm_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t34_nivelesCiclo_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t34_nivelesCiclo_id_seq";
CREATE SEQUENCE "param"."t34_nivelesCiclo_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t34_regimenEduc_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t34_regimenEduc_id_seq";
CREATE SEQUENCE "param"."t34_regimenEduc_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t34_tipoInstEduc_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t34_tipoInstEduc_id_seq";
CREATE SEQUENCE "param"."t34_tipoInstEduc_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t3_tipoDocIdentidad_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t3_tipoDocIdentidad_id_seq";
CREATE SEQUENCE "param"."t3_tipoDocIdentidad_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t6_tiposZona_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t6_tiposZona_id_seq";
CREATE SEQUENCE "param"."t6_tiposZona_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t8_tipoTrabajador_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "param"."t8_tipoTrabajador_id_seq";
CREATE SEQUENCE "param"."t8_tipoTrabajador_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Table structure for t00_documentos
-- ----------------------------
DROP TABLE IF EXISTS "param"."t00_documentos";
CREATE TABLE "param"."t00_documentos" (
  "id" int2 NOT NULL DEFAULT nextval('"param".t00_documentos_id_seq'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(50) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t00_documentos
-- ----------------------------
INSERT INTO "param"."t00_documentos" VALUES (1, '00', '(FUT) FORMULARIO UNICO DE TRAMITE', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (2, '01', 'ACTA', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (3, '02', 'ACUERDO', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (4, '03', 'AUTORIZACION', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (5, '04', 'AVISO', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (6, '05', 'CARTA', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (7, '06', 'CARTA MULTIPLE', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (8, '07', 'CARTA NOTARIAL', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (9, '08', 'CEDULA DE NOTIFICACION', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (10, '09', 'CERTIFICADO', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (11, '10', 'CITACION', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (12, '11', 'CONFORMIDAD', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (13, '12', 'CONSTANCIA', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (14, '13', 'CONTRATO', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (15, '14', 'COTIZACION', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (16, '15', 'CREDENCIAL', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (17, '16', 'CURRICULUM VITAE', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (18, '17', 'DECLARACION JURADA', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (19, '18', 'DECRETO', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (20, '19', 'DESCARGO', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (21, '20', 'DICTAMEN', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (22, '21', 'DIRECTIVA', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (23, '22', 'ESCRITO', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (24, '23', 'FE DE ERRATAS', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (25, '24', 'HOJA DE ENVIO', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (26, '25', 'INFORME', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (27, '26', 'INFORME DE PRECALIFICACIÓN', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (28, '27', 'INFORME DE ÓRGANO INSTRUCTOR', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (29, '28', 'INFORME LEGAL', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (30, '29', 'INFORME MULTIPLE', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (31, '30', 'INFORME TECNICO', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (32, '31', 'MEMORANDO', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (33, '32', 'MEMORANDO MULTIPLE', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (34, '33', 'NOTIFICACION', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (35, '34', 'OFICIO', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (36, '35', 'OFICIO CIRCULAR', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (37, '36', 'OFICIO MULTIPLE', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (38, '37', 'PAPELETA DE SALIDA', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (39, '38', 'PROVEIDO', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (40, '39', 'RECIBO', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (41, '40', 'RECURSO DE APELACION', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (42, '41', 'RECURSO DE RECONSIDERACION', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (43, '42', 'REQUERIMIENTO', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (44, '43', 'REQUERIMIENTO DE PAGO', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (45, '44', 'RESOLUCION', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (46, '45', 'RESOLUCION DE GERENCIA', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (47, '46', 'RESOLUCIÓN DE ÓRGANO INSTRUCTOR', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (48, '47', 'RESOLUCIÓN DE ÓRGANO SANCIONADOR', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (49, '48', 'SENTENCIA', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (50, '49', 'SOLICITUD', NULL, 't');
INSERT INTO "param"."t00_documentos" VALUES (51, '50', 'VALE', NULL, 't');

-- ----------------------------
-- Table structure for t00_estadosAsis
-- ----------------------------
DROP TABLE IF EXISTS "param"."t00_estadosAsis";
CREATE TABLE "param"."t00_estadosAsis" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t00_estadosAsis_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(50) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t00_estadosAsis
-- ----------------------------
INSERT INTO "param"."t00_estadosAsis" VALUES (1, '1', 'CREADO', 'CREADO', 't');
INSERT INTO "param"."t00_estadosAsis" VALUES (2, '2', 'CONSOLIDADO', 'CONSOLIDADO', 't');
INSERT INTO "param"."t00_estadosAsis" VALUES (3, '3', 'VALIDADO', 'VALIDADO', 't');
INSERT INTO "param"."t00_estadosAsis" VALUES (4, '4', 'CERRADO', 'CERRADO', 't');

-- ----------------------------
-- Table structure for t00_estadosTram
-- ----------------------------
DROP TABLE IF EXISTS "param"."t00_estadosTram";
CREATE TABLE "param"."t00_estadosTram" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t00_estadosTram_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(50) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t00_estadosTram
-- ----------------------------
INSERT INTO "param"."t00_estadosTram" VALUES (1, '1', 'REGISTRADO', 'REGISTRADO', 't');
INSERT INTO "param"."t00_estadosTram" VALUES (2, '2', 'APROBADO', 'APROBADO', 't');
INSERT INTO "param"."t00_estadosTram" VALUES (3, '3', 'RECHAZADO', 'RECHAZADO', 't');
INSERT INTO "param"."t00_estadosTram" VALUES (4, '4', 'AUTORIZADO', 'AUTORIZADO', 't');
INSERT INTO "param"."t00_estadosTram" VALUES (5, '5', 'ANULADO', 'ANULADO', 't');

-- ----------------------------
-- Table structure for t00_feriados
-- ----------------------------
DROP TABLE IF EXISTS "param"."t00_feriados";
CREATE TABLE "param"."t00_feriados" (
  "id" int2 NOT NULL DEFAULT nextval('"param".t00_feriados_id_seq'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "descripcion" varchar(100) COLLATE "pg_catalog"."default",
  "diaMesDefault" varchar(20) COLLATE "pg_catalog"."default",
  "programaDefault" bool,
  "activo" bool
)
;

-- ----------------------------
-- Records of t00_feriados
-- ----------------------------
INSERT INTO "param"."t00_feriados" VALUES (1, '01', '01 AÑO NUEVO (Dia: 01 Ene)', '01-01', 't', 't');
INSERT INTO "param"."t00_feriados" VALUES (2, '02', '02 SEMANA SANTA (Dia: NoEsp)', '17-04', 't', 't');
INSERT INTO "param"."t00_feriados" VALUES (3, '03', '03 DIA DEL TRABAJO (Dia: 01 May)', '01-05', 't', 't');
INSERT INTO "param"."t00_feriados" VALUES (4, '04', '04 BATALLA DE ARICA Y DIA DE LA BANDERA (Dia: 07 Jun)', '07-06', 't', 't');
INSERT INTO "param"."t00_feriados" VALUES (5, '05', '05 SAN PEDRO Y SAN PABLO (Dia: 29 Jun)', '29-06', 't', 't');
INSERT INTO "param"."t00_feriados" VALUES (6, '06', '06 DIA DE LA FUERZA AEREA DEL PERU (Dia: 23 Jul)', '23-07', 't', 't');
INSERT INTO "param"."t00_feriados" VALUES (7, '07', '07 FIESTAS PATRIAS (Dia: 28-29 Jul)', '28-07', 't', 't');
INSERT INTO "param"."t00_feriados" VALUES (8, '08', '08 BATALLA DE JUNIN (Dia: 06 Ago)', '06-08', 't', 't');
INSERT INTO "param"."t00_feriados" VALUES (9, '09', '09 SANTA ROSA DE LIMA (Dia: 30 Ago)', '30-08', 't', 't');
INSERT INTO "param"."t00_feriados" VALUES (10, '10', '10 COMBATE DE ANGAMOS (Dia: 08 Oct)', '08-10', 't', 't');
INSERT INTO "param"."t00_feriados" VALUES (11, '11', '11 DIA DE TODOS LOS SANTOS (Dia: 01 Nov)', '01-11', 't', 't');
INSERT INTO "param"."t00_feriados" VALUES (12, '12', '12 INMACULADA CONCEPCION (Dia: 08 Dic)', '08-12', 't', 't');
INSERT INTO "param"."t00_feriados" VALUES (13, '13', '13 BATALLA DE AYACUCHO (Dia: 09 Dic)', '09-12', 't', 't');
INSERT INTO "param"."t00_feriados" VALUES (14, '14', '14 NAVIDAD (Dia: 25 Dic)', '25-12', 't', 't');
INSERT INTO "param"."t00_feriados" VALUES (15, '15', '[OTROS DIAS FERIADO]', NULL, 't', 't');
INSERT INTO "param"."t00_feriados" VALUES (16, '16', '[OTROS DIAS NO LABORABLES]', NULL, 't', 't');

-- ----------------------------
-- Table structure for t00_motivosSuspLab
-- ----------------------------
DROP TABLE IF EXISTS "param"."t00_motivosSuspLab";
CREATE TABLE "param"."t00_motivosSuspLab" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t00_motivosSuspLab_id_seq"'::regclass),
  "codigo" varchar(10) COLLATE "pg_catalog"."default",
  "tipoSuspensionLaboral_id" int2,
  "descripcion" varchar(200) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(10) COLLATE "pg_catalog"."default",
  "conGoceHaber" bool,
  "asusfal" varchar(1) COLLATE "pg_catalog"."default",
  "diasMaxCiclo" "pg_catalog"."numeric",
  "codigoProg" varchar(20) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6),
  "created_by" int8,
  "activo" bool
)
;

-- ----------------------------
-- Records of t00_motivosSuspLab
-- ----------------------------
INSERT INTO "param"."t00_motivosSuspLab" VALUES (6, '06', 19, 'FALTA JUSTIFICADA', 'FJ', 't', 'A', NULL, '5_JUST', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (7, '07', 7, 'FALTA', 'F', 'f', 'F', NULL, '6_FALT', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (8, '08', 13, 'ENFERM/ACCIDENTE (20 PRIMEROS DÍAS)', 'EA', 't', 'S', NULL, '7_CITT', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (9, '09', 15, 'MATERNIDAD -PRE Y POST NATAL', 'MAT', 't', 'C', NULL, '7_CITT', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (10, '10', 14, 'ENFERM/ACCIDENTE (SUBSIDIADO)', 'EAS', 't', 'C', NULL, '7_CITT', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (11, '11', 20, 'COMPENSACION POR HORAS TRABAJADAS EN SOBRETIEMPO', 'CHT', 't', 'S', NULL, 'SUSP', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (13, '13', 16, 'DESCANSO VACACIONAL', 'V', 't', 'S', NULL, 'SUSP', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (14, '14', 19, 'LICENCIA CON GOCE DE HABER', 'LCG', 't', 'S', NULL, 'SUSP', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (15, '15', 21, 'LICENCIA POR PATERNIDAD', 'LP', 't', 'S', NULL, 'SUSP', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (16, '16', 9, 'LICENCIA POR MATERNINAD', 'LM', 't', 'S', NULL, 'SUSP', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (17, '17', 18, 'LICENCIA SINDICAL', 'LS', 't', 'S', NULL, 'SUSP', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (18, '18', 28, 'LICENCIA POR ENFERMEDAD DE FAMILIAR DIRECTO', 'EF', 't', 'S', NULL, 'SUSP', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (19, '19', 19, 'COMPENSACION POR LABORAR EN ONOMASTICO', 'CON', 't', 'S', NULL, 'SUSP', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (20, '20', 1, 'SANCIÓN DISCIPLINARIA', 'SD', 'f', 'S', NULL, 'SUSP', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (21, '21', 19, 'CITA MEDICA', 'CM', 't', 'S', NULL, 'SUSP', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (22, '22', 5, 'LICENCIA SIN GOCE DE HABERES', 'LSG', 'f', 'S', NULL, 'SUSP', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (1, '01', NULL, 'ASISTENCIA PRESENCIAL', 'A', 't', 'A', NULL, '0_ASIS', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (2, '02', NULL, 'ASISTENCIA NO PRESENCIAL', 'EXO', 't', 'A', NULL, '1_EXO', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (3, '03', NULL, 'DIA LIBRE NO LABORABLE', 'DL', 't', 'A', NULL, '2_DIAL', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (4, '04', NULL, 'FERIADO', 'FER', 't', 'A', NULL, '3_FER', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (5, '05', NULL, 'ONOMASTICO', 'O', 't', 'A', NULL, '4_ONO', NULL, NULL, 't');
INSERT INTO "param"."t00_motivosSuspLab" VALUES (12, '12', 25, 'FALLECIMIENTO DE PADRES, CÓNYUGE O HIJOS', 'FFD', 't', 'S', NULL, 'SUSP', NULL, NULL, 't');

-- ----------------------------
-- Table structure for t00_operadores
-- ----------------------------
DROP TABLE IF EXISTS "param"."t00_operadores";
CREATE TABLE "param"."t00_operadores" (
  "id" int2 NOT NULL DEFAULT nextval('"param".t00_operadores_id_seq'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(50) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t00_operadores
-- ----------------------------
INSERT INTO "param"."t00_operadores" VALUES (1, '1', 'BITEL', 'BITEL', 't');
INSERT INTO "param"."t00_operadores" VALUES (2, '2', 'MOVISTAR', 'MOVISTAR', 't');
INSERT INTO "param"."t00_operadores" VALUES (3, '3', 'CLARO', 'CLARO', 't');
INSERT INTO "param"."t00_operadores" VALUES (4, '4', 'ENTEL', 'ENTEL', 't');

-- ----------------------------
-- Table structure for t00_rolTrabajador
-- ----------------------------
DROP TABLE IF EXISTS "param"."t00_rolTrabajador";
CREATE TABLE "param"."t00_rolTrabajador" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t00_rolTrabajador_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "descripcion" varchar(100) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t00_rolTrabajador
-- ----------------------------
INSERT INTO "param"."t00_rolTrabajador" VALUES (1, '1', 'ADMINISTRATIVO', 'ADMINISTRATIVO', 't');
INSERT INTO "param"."t00_rolTrabajador" VALUES (2, '2', 'DOCENTE', 'DOCENTE', 't');
INSERT INTO "param"."t00_rolTrabajador" VALUES (3, '3', 'DIRECTOR', 'DIRECTOR', 't');
INSERT INTO "param"."t00_rolTrabajador" VALUES (4, '4', 'AUXILIAR', 'AUXILIAR', 't');

-- ----------------------------
-- Table structure for t00_sexos
-- ----------------------------
DROP TABLE IF EXISTS "param"."t00_sexos";
CREATE TABLE "param"."t00_sexos" (
  "id" int2 NOT NULL DEFAULT nextval('"param".t00_sexos_id_seq'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(50) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t00_sexos
-- ----------------------------
INSERT INTO "param"."t00_sexos" VALUES (1, '1', 'MASCULINO', 'M', 't');
INSERT INTO "param"."t00_sexos" VALUES (2, '2', 'FEMENINO', 'F', 't');

-- ----------------------------
-- Table structure for t00_tipoEntidad
-- ----------------------------
DROP TABLE IF EXISTS "param"."t00_tipoEntidad";
CREATE TABLE "param"."t00_tipoEntidad" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t00_tipoEntidad_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t00_tipoEntidad
-- ----------------------------
INSERT INTO "param"."t00_tipoEntidad" VALUES (1, '1', 'UNIDAD DE GESTION EDUCATIVA LOCAL', 'UGEL', 't');
INSERT INTO "param"."t00_tipoEntidad" VALUES (2, '2', 'DIRECCION REGIONAL DE EDUCACION', 'DRE', 't');
INSERT INTO "param"."t00_tipoEntidad" VALUES (3, '3', 'INSTITUCION EDUCATIVA', 'IE', 't');

-- ----------------------------
-- Table structure for t00_turnos
-- ----------------------------
DROP TABLE IF EXISTS "param"."t00_turnos";
CREATE TABLE "param"."t00_turnos" (
  "id" int2 NOT NULL DEFAULT nextval('"param".t00_turnos_id_seq'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(50) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t00_turnos
-- ----------------------------
INSERT INTO "param"."t00_turnos" VALUES (1, '1', 'MAÑANA', 'MAÑANA', 't');
INSERT INTO "param"."t00_turnos" VALUES (2, '2', 'TARDE', 'TARDE', 't');
INSERT INTO "param"."t00_turnos" VALUES (3, '3', 'NOCHE', 'NOCHE', 't');

-- ----------------------------
-- Table structure for t12_tipoContrato
-- ----------------------------
DROP TABLE IF EXISTS "param"."t12_tipoContrato";
CREATE TABLE "param"."t12_tipoContrato" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t12_tipoContrato_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t12_tipoContrato
-- ----------------------------
INSERT INTO "param"."t12_tipoContrato" VALUES (3, '03', 'POR INICIO O INCREMENTO DE ACTIVIDAD', 'POR INICIO O INCREM DE ACTIV', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (4, '04', 'POR NECESIDADES DEL MERCADO', 'POR NECES DEL MERCADO', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (5, '05', 'POR RECONVERSIÓN EMPRESARIAL', 'POR RECONV EMPRESARIAL', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (6, '06', 'OCASIONAL', 'OCASIONAL', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (7, '07', 'DE SUPLENCIA', 'DE SUPLENCIA', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (8, '08', 'DE EMERGENCIA', 'DE EMERGENCIA', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (9, '09', 'PARA OBRA DETERMINADA O SERVICIO ESPECÍFICO', 'OBRA DETERM O SERV ESPEC', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (10, '10', 'INTERMITENTE', 'INTERMITENTE', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (11, '11', 'DE TEMPORADA', 'DE TEMPORADA', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (12, '12', 'DE EXPORTACIÓN NO TRADICIONAL D.LEY 22342', 'DE EXPORT. NO TRADIC.', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (13, '13', 'DE EXTRANJERO - D.LEG.689', 'DE EXTRANJERO - D.LEG. 689', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (14, '14', 'ADMINISTRATIVO DE SERVICIOS - D.LEG 1057 (1)', 'CAS  - D.LEG 1057', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (15, '15', 'NOMBRADO - D.LEG. N.° 276 (1)', 'NOMBRADO - D.LEG. N.° 276 (1)', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (16, '16', 'SERVICIOS PERSONALES  - APLICABLES A LOS REGÍM. DE CARRERA (1)', 'SERV. PERS  - REGÍM. DE CARRERA (1)', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (17, '17', 'GERENTE PÚBLICO - D.LEG. 1024 (1)', 'GERENTE PÚBLICO - DL 1024', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (18, '18', 'A DOMICILIO', 'A DOMICILIO', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (19, '19', 'FUTBOLISTAS PROFESIONALES', 'FUTBOLISTAS PROFESIONALES', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (20, '20', 'AGRARIO - LEY 27360', 'AGRARIO - LEY 27360', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (21, '21', 'MIGRANTE ANDINO DECISIÓN 545', 'MIGRANTE ANDINO ', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (22, '22', 'A PLAZO INDETERMINADO - LEY 30057', 'A PLAZO INDETERMINADO - LEY 30057', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (23, '23', 'A PLAZO FIJO - LEY 30057', 'A PLAZO FIJO - LEY 30057', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (24, '24', 'NOMBRADO - CARRERAS ESPECIALES DEL SECTOR PÚBLICO', 'NOMBRADO CARRERAS ESPECIALES', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (25, '25', 'CONTRATADO - CARRERAS ESPECIALES DEL SECTOR PÚBLICO ', 'CONTRATADO CARRERAS ESPECIALES', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (26, '99', 'OTROS NO PREVISTOS', 'OTROS NO PREVISTOS', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (1, '01', 'A PLAZO INDETERMINADO - D.LEG. 728', 'A PLAZO INDET - D.LEG. 728', 't');
INSERT INTO "param"."t12_tipoContrato" VALUES (2, '02', 'A TIEMPO PARCIAL', 'A TIEMPO PARCIAL', 't');

-- ----------------------------
-- Table structure for t15_situacionLaboral
-- ----------------------------
DROP TABLE IF EXISTS "param"."t15_situacionLaboral";
CREATE TABLE "param"."t15_situacionLaboral" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t15_situacionLaboral_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t15_situacionLaboral
-- ----------------------------
INSERT INTO "param"."t15_situacionLaboral" VALUES (1, '0', 'BAJA (1)', 'BAJA', 't');
INSERT INTO "param"."t15_situacionLaboral" VALUES (2, '1', 'ACTIVO O SUBSIDIADO (1)', 'ACTIVO O SUBSIDIADO', 't');
INSERT INTO "param"."t15_situacionLaboral" VALUES (3, '2', 'SIN VÍNCULO LABORAL CON CONCEPTOS PENDIENTE DE LIQUIDAR  (2)', 'SIN VINC. LAB. CON CONC PEND POR LIQUIDAR', 't');
INSERT INTO "param"."t15_situacionLaboral" VALUES (4, '3', 'SUSPENSIÓN PERFECTA DE LABORES (3)', 'SUSPENSIÓN PERFECTA DE LABORES', 't');

-- ----------------------------
-- Table structure for t17_motivoDeBajas
-- ----------------------------
DROP TABLE IF EXISTS "param"."t17_motivoDeBajas";
CREATE TABLE "param"."t17_motivoDeBajas" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t17_motivoDeBajas_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(150) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(150) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t17_motivoDeBajas
-- ----------------------------
INSERT INTO "param"."t17_motivoDeBajas" VALUES (1, '01', 'RENUNCIA', 'RENUNCIA', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (2, '02', 'RENUNCIA CON INCENTIVOS', 'RENUNCIA CON INCENTIVOS', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (3, '03', 'DESPIDO O DESTITUCIÓN', 'DESPIDO O DESTITUCIÓN', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (4, '04', 'CESE COLECTIVO', 'CESE COLECTIVO', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (5, '05', 'JUBILACIÓN', 'JUBILACIÓN', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (6, '06', 'INVALIDEZ ABSOLUTA PERMANENTE', 'INVALIDEZ ABSOLUTA PERMAN', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (7, '07', 'TERMINACIÓN DE LA OBRA O SERVICIO, CUMPLIMIENTO CONDICIÓN RESOLUTORIA O VENCIMIENTO DEL PLAZO', 'TERMIN OBRA/SERV, CUMPLIM CONDIC RESOL. O VENC PLAZO', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (8, '08', 'MUTUO DISENSO', 'MUTUO DISENSO', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (9, '09', 'FALLECIMIENTO', 'FALLECIMIENTO', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (10, '10', 'SUSPENSIÓN DE LA PENSIÓN (1)', 'SUSPENSIÓN DE LA PENSIÓN', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (11, '11', 'REASIGNACIÓN SERVIDOR DE LA ADMINISTRACIÓN PÚBLICA(2)', 'REASIGNACIÓN', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (12, '12', 'PERMUTA SERVIDOR DE LA ADMINISTRACIÓN PÚBLICA (2)', 'PERMUTA', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (13, '13', 'TRANSFERENCIA SERVIDOR DE LA ADMINISTRACIÓN PÚBLICA (2)', 'TRANSFERENCIA', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (14, '14', 'BAJA POR SUCESIÓN EN POSICIÓN DEL EMPLEADOR', 'BAJA POR SUC. EN POSIC DEL EMPLEADOR', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (15, '15', 'EXTINCIÓN O LIQUIDACIÓN DEL EMPLEADOR', 'EXTINCIÓN O LIQUID. DEL EMPLEADOR', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (16, '16', 'OTROS MOTIVOS DE CADUCIDAD DE LA PENSIÓN (1)', 'OTR MOTIV CADUC PENSIÓN ', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (17, '17', 'NO SE INICIÓ LA RELACIÓN LABORAL O PRESTACIÓN EFECTIVA DE SERVICIOS', 'NO SE INICIÓ LA REL.  LABORAL O PREST. DE SERVICIOS', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (18, '18', 'LÍMITE DE EDAD 70 AÑOS', 'LÍMITE DE EDAD 70 AÑOS', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (19, '19', 'OTRAS CAUSALES RÉGIMEN PÚBLICO GENERAL SERVICIO CIVIL - LEY 30057', 'OTRAS CAUSALES - LEY 30057', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (20, '20', 'INHABILITACIÓN PARA EL EJERCICIO PROFESIONAL O DE LA FUNCIÓN PÚBLICA POR MÁS DE TRES MESES - LEY 30057', 'INHABILITAC. PARA EJERC. PROF. O FUNC. PÚB. POR MÁS DE 3 MESES - LEY 30057', 't');
INSERT INTO "param"."t17_motivoDeBajas" VALUES (21, '99', 'SIN VÍNCULO LABORAL - HABILITADO PARA PDT PLAME', 'SVL -HABILITADO PARA PDT PLAME (3)', 't');

-- ----------------------------
-- Table structure for t21_tipoSuspensionLaboral
-- ----------------------------
DROP TABLE IF EXISTS "param"."t21_tipoSuspensionLaboral";
CREATE TABLE "param"."t21_tipoSuspensionLaboral" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t21_tipoSuspensionLaboral_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(200) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(200) COLLATE "pg_catalog"."default",
  "perfeImperfe" varchar(1) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t21_tipoSuspensionLaboral
-- ----------------------------
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (1, '01', 'S.P. SANCIÓN DISCIPLINARIA', NULL, 'P', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (2, '02', 'S.P. EJERCICIO DEL DERECHO DE HUELGA', NULL, 'P', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (3, '03', 'S.P. DETENCIÓN DEL TRABAJADOR, SALVO EL CASO DE CONDENA PRIVATIVA DE LA LIBERTAD', NULL, 'P', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (4, '04', 'S.P. INHABILITACIÓN ADMINISTRATIVA, JUDICIAL  O PENA PRIVATIVA DE LA LIBERTAD EFECTIVA POR DELITO CULPOSO, POR PERIODO NO SUPERIOR A TRES MESES', NULL, 'P', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (5, '05', 'S.P. PERMISO, LICENCIA U OTROS MOTIVOS SIN GOCE DE HABER', NULL, 'P', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (6, '06', 'S.P. CASO FORTUITO O FUERZA MAYOR', NULL, 'P', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (7, '07', 'S.P. FALTA NO JUSTIFICADA', NULL, 'P', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (8, '08', 'S.P. POR TEMPORADA O INTERMITENTE', NULL, 'P', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (9, '09', '''S.P. MATERNIDAD DURANTE EL DESCANSO PRE Y POST NATAL', NULL, 'P', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (10, '10', 'S.P. SENTENCIA DE PRIMERA INSTANCIA POR DELITOS DE TERRORISMO, NARCOTRÁFICO, CORRUPCIÓN O VIOLACIÓN DE LA LIBERTAD SEXUAL.', NULL, 'P', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (11, '11', 'S.P. IMPOSICIÓN DE MEDIDA CAUTELAR.', NULL, 'P', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (12, '12', 'S.P. ENFERMEDAD GRAVE DEL PADRE, CÓNYUGE, CONVIVIENTE RECONOCIDO JUDICIALMENTE O HIJOS.', NULL, 'P', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (13, '20', 'S.I. ENFERMEDAD O ACCIDENTE (PRIMEROS VEINTE DÍAS)', NULL, 'I', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (14, '21', 'S.I. INCAPACIDAD TEMPORAL (INVALIDEZ, ENFERMEDAD Y ACCIDENTES)', NULL, 'I', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (15, '22', 'S.I. MATERNIDAD DURANTE EL DESCANSO PRE Y POST NATAL', NULL, 'I', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (16, '23', 'S.I. DESCANSO VACACIONAL', NULL, 'I', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (17, '24', 'S.I. LICENCIA PARA DESEMPEÑAR CARGO CÍVICO Y PARA CUMPLIR CON EL SERVICIO MILITAR OBLIGATORIO', NULL, 'I', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (18, '25', 'S.I. PERMISO Y LICENCIA PARA EL DESEMPEÑO DE CARGOS SINDICALES', NULL, 'I', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (19, '26', 'S.I. LICENCIA U OTROS MOTIVOS CON GOCE DE HABER', NULL, 'I', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (20, '27', 'S.I. DÍAS COMPENSADOS POR HORAS TRABAJADAS EN SOBRETIEMPO', NULL, 'I', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (21, '28', 'S.I. DÍAS LICENCIA POR PATERNIDAD', NULL, 'I', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (22, '29', 'S.I. DIAS LICENCIA POR ADOPCIÓN ', NULL, 'I', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (23, '30', 'S.I. IMPOSICIÓN DE MEDIDA CAUTELAR', NULL, 'I', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (24, '31', 'S.I. CITACIÓN EXPRESA JUDICIAL, MILITAR, POLICIAL U OTRAS CITACIONES DERIVADAS DE ACTOS DE ADMINISTRACIÓN INTERNA', NULL, 'I', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (25, '32', 'S.I. FALLECIMIENTO DE PADRES, CÓNYUGE O HIJOS', NULL, 'I', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (26, '33', 'S.I. ASUMIR REPRESENTACIÓN OFICIAL DEL ESTADO PERUANO EN EVENTOS CIENTÍFICOS, EDUCATIVOS, CULTURALES Y DEPORTIVOS', NULL, 'I', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (27, '34', 'S.I. DESC VACACIONAL - LICENCIA ASIST MÉDICA O TERAPIA DE REHABIL DE DEPEND CON DISCAPACIDAD ', NULL, 'I', 't');
INSERT INTO "param"."t21_tipoSuspensionLaboral" VALUES (28, '35', 'S.I.ENFERMEDAD GRAVE O TERMINAL O ACCIDENTE GRAVE DE FAMILIARES DIRECTOS ', NULL, 'I', 't');

-- ----------------------------
-- Table structure for t26_pais
-- ----------------------------
DROP TABLE IF EXISTS "param"."t26_pais";
CREATE TABLE "param"."t26_pais" (
  "id" int2 NOT NULL DEFAULT nextval('"param".t26_pais_id_seq'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t26_pais
-- ----------------------------
INSERT INTO "param"."t26_pais" VALUES (7, '9007', 'MAYOTTE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (9, '9009', 'SVALBARD AND JAN MAYEN ISLANDS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (10, '9010', 'UNITED STATES MINOR OUTLYING ISLANDS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (11, '9011', 'OTROS PAISES O LUGARES', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (12, '9013', 'AFGANISTAN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (13, '9017', 'ALBANIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (14, '9019', 'ALDERNEY', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (15, '9023', 'ALEMANIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (16, '9026', 'ARMENIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (17, '9027', 'ARUBA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (18, '9028', 'ASCENCION', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (19, '9029', 'BOSNIA-HERZEGOVINA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (20, '9031', 'BURKINA FASO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (21, '9037', 'ANDORRA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (22, '9040', 'ANGOLA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (23, '9041', 'ANGUILLA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (24, '9043', 'ANTIGUA Y BARBUDA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (25, '9047', 'ANTILLAS HOLANDESAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (26, '9053', 'ARABIA SAUDITA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (27, '9059', 'ARGELIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (28, '9063', 'ARGENTINA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (29, '9069', 'AUSTRALIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (30, '9072', 'AUSTRIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (31, '9074', 'AZERBAIJÁN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (32, '9077', 'BAHAMAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (33, '9080', 'BAHREIN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (34, '9081', 'BANGLA DESH', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (35, '9083', 'BARBADOS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (36, '9087', 'BÉLGICA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (37, '9088', 'BELICE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (38, '9090', 'BERMUDAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (39, '9091', 'BELARUS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (40, '9093', 'MYANMAR', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (41, '9097', 'BOLIVIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (42, '9101', 'BOTSWANA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (43, '9105', 'BRASIL', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (44, '9108', 'BRUNEI DARUSSALAM', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (45, '9111', 'BULGARIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (46, '9115', 'BURUNDI', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (47, '9119', 'BUTÁN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (48, '9127', 'CABO VERDE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (49, '9137', 'CAIMÁN, ISLAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (50, '9141', 'CAMBOYA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (51, '9145', 'CAMERÚN, REPUBLICA UNIDA DEL', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (52, '9147', 'CAMPIONE D TALIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (53, '9149', 'CANADÁ', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (54, '9155', 'CANAL (NORMANDAS), ISLAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (55, '9157', 'CANTÓN Y ENDERBURRY', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (56, '9159', 'SANTA SEDE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (57, '9165', 'COCOS (KEELING),ISLAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (58, '9169', 'COLOMBIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (59, '9173', 'COMORAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (60, '9177', 'CONGO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (61, '9183', 'COOK, ISLAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (62, '9187', 'COREA (NORTE), REPUBLICA POPULAR DEMOCRATICA DE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (63, '9190', 'COREA (SUR), REPUBLICA DE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (64, '9193', 'COSTA DE MARFIL', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (65, '9196', 'COSTA RICA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (66, '9198', 'CROACIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (67, '9199', 'CUBA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (68, '9203', 'CHAD', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (69, '9207', 'CHECOSLOVAQUIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (70, '9211', 'CHILE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (71, '9215', 'CHINA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (72, '9218', 'TAIWAN (FORMOSA)', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (73, '9221', 'CHIPRE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (74, '9229', 'BENIN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (75, '9232', 'DINAMARCA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (76, '9235', 'DOMINICA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (77, '9239', 'ECUADOR', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (78, '9240', 'EGIPTO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (79, '9242', 'EL SALVADOR', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (80, '9243', 'ERITREA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (81, '9244', 'EMIRATOS ARABES UNIDOS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (82, '9245', 'ESPAÑA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (83, '9246', 'ESLOVAQUIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (84, '9247', 'ESLOVENIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (85, '9249', 'ESTADOS UNIDOS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (86, '9251', 'ESTONIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (87, '9253', 'ETIOPIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (88, '9259', 'FEROE, ISLAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (89, '9267', 'FILIPINAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (90, '9271', 'FINLANDIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (91, '9275', 'FRANCIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (92, '9281', 'GABON', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (93, '9285', 'GAMBIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (94, '9286', 'GAZA Y JERICO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (95, '9287', 'GEORGIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (96, '9289', 'GHANA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (97, '9293', 'GIBRALTAR', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (98, '9297', 'GRANADA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (99, '9301', 'GRECIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (100, '9305', 'GROENLANDIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (101, '9309', 'GUADALUPE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (102, '9313', 'GUAM', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (103, '9317', 'GUATEMALA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (104, '9325', 'GUAYANA FRANCESA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (105, '9327', 'GUERNSEY', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (106, '9329', 'GUINEA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (107, '9331', 'GUINEA ECUATORIAL', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (108, '9334', 'GUINEA-BISSAU', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (109, '9337', 'GUYANA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (110, '9341', 'HAITI', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (111, '9345', 'HONDURAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (112, '9348', 'HONDURAS BRITANICAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (113, '9351', 'HONG KONG', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (114, '9355', 'HUNGRIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (115, '9361', 'INDIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (116, '9365', 'INDONESIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (117, '9369', 'IRAK', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (118, '9372', 'IRAN, REPUBLICA ISLAMICA DEL', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (119, '9375', 'IRLANDA (EIRE)', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (120, '9377', 'ISLA AZORES', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (121, '9378', 'ISLA DEL MAN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (122, '9379', 'ISLANDIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (123, '9380', 'ISLAS CANARIAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (124, '9381', 'ISLAS DE CHRISTMAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (125, '9382', 'ISLAS QESHM', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (126, '9383', 'ISRAEL', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (127, '9386', 'ITALIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (128, '9391', 'JAMAICA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (129, '9395', 'JONSTON, ISLAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (130, '9399', 'JAPON', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (131, '9401', 'JERSEY', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (132, '9403', 'JORDANIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (133, '9406', 'KAZAJSTAN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (134, '9410', 'KENIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (135, '9411', 'KIRIBATI', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (136, '9412', 'KIRGUIZISTAN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (137, '9413', 'KUWAIT', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (138, '9418', 'LABUN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (139, '9420', 'LAOS, REPUBLICA POPULAR DEMOCRATICA DE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (140, '9426', 'LESOTHO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (141, '9429', 'LETONIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (142, '9431', 'LIBANO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (143, '9434', 'LIBERIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (144, '9438', 'LIBIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (145, '9440', 'LIECHTENSTEIN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (2, '9002', 'COTE D IVOIRE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (3, '9003', 'FALKLAND ISLANDS (MALVINAS)', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (4, '9004', 'FRANCE, METROPOLITAN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (6, '9006', 'HEARD AND MC DONALD ISLANDS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (231, '9756', 'SUDAFRICA, REPUBLICA DE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (232, '9759', 'SUDAN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (233, '9764', 'SUECIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (149, '9448', 'MACEDONIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (150, '9450', 'MADAGASCAR', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (151, '9453', 'MADEIRA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (180, '9538', 'NORUEGA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (181, '9542', 'NUEVA CALEDONIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (182, '9545', 'PAPUASIA NUEVA GUINEA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (183, '9548', 'NUEVA ZELANDA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (184, '9551', 'VANUATU', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (185, '9556', 'OMAN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (186, '9566', 'PACIFICO, ISLAS DEL', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (187, '9573', 'PAISES BAJOS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (188, '9576', 'PAKISTAN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (189, '9578', 'PALAU, ISLAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (190, '9579', 'TERRITORIO AUTONOMO DE PALESTINA.', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (191, '9580', 'PANAMA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (192, '9586', 'PARAGUAY', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (193, '9589', 'PERÚ', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (194, '9593', 'PITCAIRN, ISLA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (195, '9599', 'POLINESIA FRANCESA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (196, '9603', 'POLONIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (197, '9607', 'PORTUGAL', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (198, '9611', 'PUERTO RICO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (199, '9618', 'QATAR', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (200, '9628', 'REINO UNIDO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (201, '9629', 'ESCOCIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (202, '9633', 'REPUBLICA ARABE UNIDA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (203, '9640', 'REPUBLICA CENTROAFRICANA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (204, '9644', 'REPUBLICA CHECA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (205, '9645', 'REPUBLICA DE SWAZILANDIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (206, '9646', 'REPUBLICA DE TUNEZ', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (207, '9647', 'REPUBLICA DOMINICANA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (208, '9660', 'REUNION', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (209, '9665', 'ZIMBABWE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (210, '9670', 'RUMANIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (211, '9675', 'RUANDA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (212, '9676', 'RUSIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (213, '9677', 'SALOMON, ISLAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (214, '9685', 'SAHARA OCCIDENTAL', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (215, '9687', 'SAMOA OCCIDENTAL', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (216, '9690', 'SAMOA NORTEAMERICANA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (217, '9695', 'SAN CRISTOBAL Y NIEVES', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (218, '9697', 'SAN MARINO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (219, '9700', 'SAN PEDRO Y MIQUELON', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (220, '9705', 'SAN VICENTE Y LAS GRANADINAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (221, '9710', 'SANTA ELENA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (222, '9715', 'SANTA LUCIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (223, '9720', 'SANTO TOME Y PRINCIPE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (224, '9728', 'SENEGAL', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (225, '9731', 'SEYCHELLES', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (226, '9735', 'SIERRA LEONA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (227, '9741', 'SINGAPUR', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (228, '9744', 'SIRIA, REPUBLICA ARABE DE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (229, '9748', 'SOMALIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (230, '9750', 'SRI LANKA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (234, '9767', 'SUIZA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (235, '9770', 'SURINAM', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (236, '9773', 'SAWSILANDIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (237, '9774', 'TADJIKISTAN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (238, '9776', 'TAILANDIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (239, '9780', 'TANZANIA, REPUBLICA UNIDA DE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (240, '9783', 'DJIBOUTI', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (241, '9786', 'TERRITORIO ANTARTICO BRITANICO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (242, '9787', 'TERRITORIO BRITANICO DEL OCEANO INDICO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (243, '9788', 'TIMOR DEL ESTE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (244, '9800', 'TOGO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (245, '9805', 'TOKELAU', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (246, '9810', 'TONGA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (247, '9815', 'TRINIDAD Y TOBAGO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (248, '9816', 'TRISTAN DA CUNHA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (249, '9820', 'TUNICIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (250, '9823', 'TURCAS Y CAICOS, ISLAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (251, '9825', 'TURKMENISTAN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (252, '9827', 'TURQUIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (253, '9828', 'TUVALU', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (254, '9830', 'UCRANIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (255, '9833', 'UGANDA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (256, '9840', 'URSS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (257, '9845', 'URUGUAY', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (258, '9847', 'UZBEKISTAN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (259, '9850', 'VENEZUELA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (260, '9855', 'VIET NAM', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (261, '9858', 'VIETNAM (DEL NORTE)', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (262, '9863', 'VIRGENES, ISLAS (BRITANICAS)', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (263, '9866', 'VIRGENES, ISLAS (NORTEAMERICANAS)', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (264, '9870', 'FIJI', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (265, '9873', 'WAKE, ISLA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (266, '9875', 'WALLIS Y FORTUNA, ISLAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (267, '9880', 'YEMEN', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (268, '9885', 'YUGOSLAVIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (269, '9888', 'ZAIRE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (270, '9890', 'ZAMBIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (271, '9895', 'ZONA DEL CANAL DE PANAMA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (272, '9896', 'ZONA LIBRE OSTRAVA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (273, '9897', 'ZONA NEUTRAL (PALESTINA)', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (1, '9001', 'BOUVET ISLAND', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (5, '9005', 'FRENCH SOUTHERN TERRITORIES', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (8, '9008', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (146, '9443', 'LITUANIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (147, '9445', 'LUXEMBURGO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (148, '9447', 'MACAO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (152, '9455', 'MALAYSIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (153, '9458', 'MALAWI', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (154, '9461', 'MALDIVAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (155, '9464', 'MALI', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (156, '9467', 'MALTA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (157, '9469', 'MARIANAS DEL NORTE, ISLAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (158, '9472', 'MARSHALL, ISLAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (159, '9474', 'MARRUECOS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (160, '9477', 'MARTINICA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (161, '9485', 'MAURICIO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (162, '9488', 'MAURITANIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (163, '9493', 'MEXICO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (164, '9494', 'MICRONESIA, ESTADOS FEDERADOS DE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (165, '9495', 'MIDWAY ISLAS', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (166, '9496', 'MOLDAVIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (167, '9497', 'MONGOLIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (168, '9498', 'MONACO', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (169, '9501', 'MONTSERRAT, ISLA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (170, '9505', 'MOZAMBIQUE', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (171, '9507', 'NAMIBIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (172, '9508', 'NAURU', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (173, '9511', 'NAVIDAD (CHRISTMAS), ISLA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (174, '9517', 'NEPAL', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (175, '9521', 'NICARAGUA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (176, '9525', 'NIGER', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (177, '9528', 'NIGERIA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (178, '9531', 'NIUE, ISLA', NULL, 't');
INSERT INTO "param"."t26_pais" VALUES (179, '9535', 'NORFOLK, ISLA', NULL, 't');

-- ----------------------------
-- Table structure for t28_departamento
-- ----------------------------
DROP TABLE IF EXISTS "param"."t28_departamento";
CREATE TABLE "param"."t28_departamento" (
  "id" int2 NOT NULL DEFAULT nextval('"param".t28_departamento_id_seq'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "pais_id" int2 NOT NULL,
  "activo" bool
)
;

-- ----------------------------
-- Records of t28_departamento
-- ----------------------------
INSERT INTO "param"."t28_departamento" VALUES (1, '01', 'DEPARTAMENTO AMAZONAS', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (2, '02', 'DEPARTAMENTO ANCASH', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (3, '03', 'DEPARTAMENTO APURIMAC', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (4, '04', 'DEPARTAMENTO AREQUIPA', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (5, '05', 'DEPARTAMENTO AYACUCHO', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (6, '06', 'DEPARTAMENTO CAJAMARCA', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (7, '07', 'DEPARTAMENTO CUSCO', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (8, '08', 'DEPARTAMENTO HUANCAVELICA', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (9, '09', 'DEPARTAMENTO HUANUCO', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (10, '10', 'DEPARTAMENTO ICA', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (11, '11', 'DEPARTAMENTO JUNIN', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (12, '12', 'DEPARTAMENTO LA LIBERTAD', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (13, '13', 'DEPARTAMENTO LAMBAYEQUE', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (14, '14', 'DEPARTAMENTO LIMA', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (15, '15', 'DEPARTAMENTO LORETO', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (16, '16', 'DEPARTAMENTO MADRE DE DIOS', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (17, '17', 'DEPARTAMENTO MOQUEGUA', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (18, '18', 'DEPARTAMENTO PASCO', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (19, '19', 'DEPARTAMENTO PIURA', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (20, '20', 'DEPARTAMENTO PUNO', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (21, '21', 'DEPARTAMENTO SAN MARTIN', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (22, '22', 'DEPARTAMENTO TACNA', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (23, '23', 'DEPARTAMENTO TUMBES', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (24, '24', 'PROV. CONST. DEL CALLAO', NULL, 193, 't');
INSERT INTO "param"."t28_departamento" VALUES (25, '25', 'DEPARTAMENTO UCAYALI', NULL, 193, 't');

-- ----------------------------
-- Table structure for t28_distritos
-- ----------------------------
DROP TABLE IF EXISTS "param"."t28_distritos";
CREATE TABLE "param"."t28_distritos" (
  "id" int2 NOT NULL DEFAULT nextval('"param".t28_distritos_id_seq'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "provincia_id" int2 NOT NULL,
  "activo" bool
)
;

-- ----------------------------
-- Records of t28_distritos
-- ----------------------------
INSERT INTO "param"."t28_distritos" VALUES (1, '010101', 'CHACHAPOYAS', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (2, '010102', 'ASUNCION', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (3, '010103', 'BALSAS', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (4, '010104', 'CHETO', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (5, '010105', 'CHILIQUIN', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (6, '010106', 'CHUQUIBAMBA', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (7, '010107', 'GRANADA', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (8, '010108', 'HUANCAS', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (9, '010109', 'LA JALCA', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (10, '010110', 'LEIMEBAMBA', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (11, '010111', 'LEVANTO', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (12, '010112', 'MAGDALENA', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (13, '010113', 'MARISCAL CASTILLA', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (14, '010114', 'MOLINOPAMPA', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (15, '010115', 'MONTEVIDEO', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (16, '010116', 'OLLEROS', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (17, '010117', 'QUINJALCA', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (18, '010118', 'SAN FCO DE DAGUAS', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (19, '010119', 'SAN ISIDRO DE MAINO', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (20, '010120', 'SOLOCO', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (21, '010121', 'SONCHE', NULL, 1, NULL);
INSERT INTO "param"."t28_distritos" VALUES (22, '010201', 'LA PECA', NULL, 2, NULL);
INSERT INTO "param"."t28_distritos" VALUES (23, '010202', 'ARAMANGO', NULL, 2, NULL);
INSERT INTO "param"."t28_distritos" VALUES (24, '010203', 'COPALLIN', NULL, 2, NULL);
INSERT INTO "param"."t28_distritos" VALUES (25, '010204', 'EL PARCO', NULL, 2, NULL);
INSERT INTO "param"."t28_distritos" VALUES (26, '010205', 'BAGUA', NULL, 2, NULL);
INSERT INTO "param"."t28_distritos" VALUES (27, '010206', 'IMAZA', NULL, 2, NULL);
INSERT INTO "param"."t28_distritos" VALUES (28, '010301', 'JUMBILLA', NULL, 3, NULL);
INSERT INTO "param"."t28_distritos" VALUES (29, '010302', 'COROSHA', NULL, 3, NULL);
INSERT INTO "param"."t28_distritos" VALUES (30, '010303', 'CUISPES', NULL, 3, NULL);
INSERT INTO "param"."t28_distritos" VALUES (31, '010304', 'CHISQUILLA', NULL, 3, NULL);
INSERT INTO "param"."t28_distritos" VALUES (32, '010305', 'CHURUJA', NULL, 3, NULL);
INSERT INTO "param"."t28_distritos" VALUES (33, '010306', 'FLORIDA', NULL, 3, NULL);
INSERT INTO "param"."t28_distritos" VALUES (34, '010307', 'RECTA', NULL, 3, NULL);
INSERT INTO "param"."t28_distritos" VALUES (35, '010308', 'SAN CARLOS', NULL, 3, NULL);
INSERT INTO "param"."t28_distritos" VALUES (36, '010309', 'SHIPASBAMBA', NULL, 3, NULL);
INSERT INTO "param"."t28_distritos" VALUES (37, '010310', 'VALERA', NULL, 3, NULL);
INSERT INTO "param"."t28_distritos" VALUES (38, '010311', 'YAMBRASBAMBA', NULL, 3, NULL);
INSERT INTO "param"."t28_distritos" VALUES (39, '010312', 'JAZAN', NULL, 3, NULL);
INSERT INTO "param"."t28_distritos" VALUES (40, '010401', 'LAMUD', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (41, '010402', 'CAMPORREDONDO', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (42, '010403', 'COCABAMBA', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (43, '010404', 'COLCAMAR', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (44, '010405', 'CONILA', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (45, '010406', 'INGUILPATA', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (46, '010407', 'LONGUITA', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (47, '010408', 'LONYA CHICO', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (48, '010409', 'LUYA', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (49, '010410', 'LUYA VIEJO', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (50, '010411', 'MARIA', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (51, '010412', 'OCALLI', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (52, '010413', 'OCUMAL', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (53, '010414', 'PISUQUIA', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (54, '010415', 'SAN CRISTOBAL', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (55, '010416', 'SAN FRANCISCO DE YESO', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (56, '010417', 'SAN JERONIMO', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (57, '010418', 'SAN JUAN DE LOPECANCHA', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (58, '010419', 'SANTA CATALINA', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (59, '010420', 'SANTO TOMAS', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (60, '010421', 'TINGO', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (61, '010422', 'TRITA', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (62, '010423', 'PROVIDENCIA', NULL, 4, NULL);
INSERT INTO "param"."t28_distritos" VALUES (63, '010501', 'SAN NICOLAS', NULL, 5, NULL);
INSERT INTO "param"."t28_distritos" VALUES (64, '010502', 'COCHAMAL', NULL, 5, NULL);
INSERT INTO "param"."t28_distritos" VALUES (65, '010503', 'CHIRIMOTO', NULL, 5, NULL);
INSERT INTO "param"."t28_distritos" VALUES (66, '010504', 'HUAMBO', NULL, 5, NULL);
INSERT INTO "param"."t28_distritos" VALUES (67, '010505', 'LIMABAMBA', NULL, 5, NULL);
INSERT INTO "param"."t28_distritos" VALUES (68, '010506', 'LONGAR', NULL, 5, NULL);
INSERT INTO "param"."t28_distritos" VALUES (69, '010507', 'MILPUC', NULL, 5, NULL);
INSERT INTO "param"."t28_distritos" VALUES (70, '010508', 'MCAL BENAVIDES', NULL, 5, NULL);
INSERT INTO "param"."t28_distritos" VALUES (71, '010509', 'OMIA', NULL, 5, NULL);
INSERT INTO "param"."t28_distritos" VALUES (72, '010510', 'SANTA ROSA', NULL, 5, NULL);
INSERT INTO "param"."t28_distritos" VALUES (73, '010511', 'TOTORA', NULL, 5, NULL);
INSERT INTO "param"."t28_distritos" VALUES (74, '010512', 'VISTA ALEGRE', NULL, 5, NULL);
INSERT INTO "param"."t28_distritos" VALUES (75, '010601', 'NIEVA', NULL, 6, NULL);
INSERT INTO "param"."t28_distritos" VALUES (76, '010602', 'RIO SANTIAGO', NULL, 6, NULL);
INSERT INTO "param"."t28_distritos" VALUES (77, '010603', 'EL CENEPA', NULL, 6, NULL);
INSERT INTO "param"."t28_distritos" VALUES (78, '010701', 'BAGUA GRANDE', NULL, 7, NULL);
INSERT INTO "param"."t28_distritos" VALUES (79, '010702', 'CAJARURO', NULL, 7, NULL);
INSERT INTO "param"."t28_distritos" VALUES (80, '010703', 'CUMBA', NULL, 7, NULL);
INSERT INTO "param"."t28_distritos" VALUES (81, '010704', 'EL MILAGRO', NULL, 7, NULL);
INSERT INTO "param"."t28_distritos" VALUES (82, '010705', 'JAMALCA', NULL, 7, NULL);
INSERT INTO "param"."t28_distritos" VALUES (83, '010706', 'LONYA GRANDE', NULL, 7, NULL);
INSERT INTO "param"."t28_distritos" VALUES (84, '010707', 'YAMON', NULL, 7, NULL);
INSERT INTO "param"."t28_distritos" VALUES (85, '020101', 'HUARAZ', NULL, 8, NULL);
INSERT INTO "param"."t28_distritos" VALUES (86, '020102', 'INDEPENDENCIA', NULL, 8, NULL);
INSERT INTO "param"."t28_distritos" VALUES (87, '020103', 'COCHABAMBA', NULL, 8, NULL);
INSERT INTO "param"."t28_distritos" VALUES (88, '020104', 'COLCABAMBA', NULL, 8, NULL);
INSERT INTO "param"."t28_distritos" VALUES (89, '020105', 'HUANCHAY', NULL, 8, NULL);
INSERT INTO "param"."t28_distritos" VALUES (90, '020106', 'JANGAS', NULL, 8, NULL);
INSERT INTO "param"."t28_distritos" VALUES (91, '020107', 'LA LIBERTAD', NULL, 8, NULL);
INSERT INTO "param"."t28_distritos" VALUES (92, '020108', 'OLLEROS', NULL, 8, NULL);
INSERT INTO "param"."t28_distritos" VALUES (93, '020109', 'PAMPAS', NULL, 8, NULL);
INSERT INTO "param"."t28_distritos" VALUES (94, '020110', 'PARIACOTO', NULL, 8, NULL);
INSERT INTO "param"."t28_distritos" VALUES (95, '020111', 'PIRA', NULL, 8, NULL);
INSERT INTO "param"."t28_distritos" VALUES (96, '020112', 'TARICA', NULL, 8, NULL);
INSERT INTO "param"."t28_distritos" VALUES (97, '020201', 'AIJA', NULL, 9, NULL);
INSERT INTO "param"."t28_distritos" VALUES (98, '020203', 'CORIS', NULL, 9, NULL);
INSERT INTO "param"."t28_distritos" VALUES (99, '020205', 'HUACLLAN', NULL, 9, NULL);
INSERT INTO "param"."t28_distritos" VALUES (100, '020206', 'LA MERCED', NULL, 9, NULL);
INSERT INTO "param"."t28_distritos" VALUES (101, '020208', 'SUCCHA', NULL, 9, NULL);
INSERT INTO "param"."t28_distritos" VALUES (102, '020301', 'CHIQUIAN', NULL, 10, NULL);
INSERT INTO "param"."t28_distritos" VALUES (103, '020302', 'A PARDO LEZAMETA', NULL, 10, NULL);
INSERT INTO "param"."t28_distritos" VALUES (104, '020304', 'AQUIA', NULL, 10, NULL);
INSERT INTO "param"."t28_distritos" VALUES (105, '020305', 'CAJACAY', NULL, 10, NULL);
INSERT INTO "param"."t28_distritos" VALUES (106, '020310', 'HUAYLLACAYAN', NULL, 10, NULL);
INSERT INTO "param"."t28_distritos" VALUES (107, '020311', 'HUASTA', NULL, 10, NULL);
INSERT INTO "param"."t28_distritos" VALUES (108, '020313', 'MANGAS', NULL, 10, NULL);
INSERT INTO "param"."t28_distritos" VALUES (109, '020315', 'PACLLON', NULL, 10, NULL);
INSERT INTO "param"."t28_distritos" VALUES (110, '020317', 'SAN MIGUEL DE CORPANQUI', NULL, 10, NULL);
INSERT INTO "param"."t28_distritos" VALUES (111, '020320', 'TICLLOS', NULL, 10, NULL);
INSERT INTO "param"."t28_distritos" VALUES (112, '020321', 'ANTONIO RAIMONDI', NULL, 10, NULL);
INSERT INTO "param"."t28_distritos" VALUES (113, '020322', 'CANIS', NULL, 10, NULL);
INSERT INTO "param"."t28_distritos" VALUES (114, '020323', 'COLQUIOC', NULL, 10, NULL);
INSERT INTO "param"."t28_distritos" VALUES (115, '020324', 'LA PRIMAVERA', NULL, 10, NULL);
INSERT INTO "param"."t28_distritos" VALUES (116, '020325', 'HUALLANCA', NULL, 10, NULL);
INSERT INTO "param"."t28_distritos" VALUES (117, '020401', 'CARHUAZ', NULL, 11, NULL);
INSERT INTO "param"."t28_distritos" VALUES (118, '020402', 'ACOPAMPA', NULL, 11, NULL);
INSERT INTO "param"."t28_distritos" VALUES (119, '020403', 'AMASHCA', NULL, 11, NULL);
INSERT INTO "param"."t28_distritos" VALUES (120, '020404', 'ANTA', NULL, 11, NULL);
INSERT INTO "param"."t28_distritos" VALUES (121, '020405', 'ATAQUERO', NULL, 11, NULL);
INSERT INTO "param"."t28_distritos" VALUES (122, '020406', 'MARCARA', NULL, 11, NULL);
INSERT INTO "param"."t28_distritos" VALUES (123, '020407', 'PARIAHUANCA', NULL, 11, NULL);
INSERT INTO "param"."t28_distritos" VALUES (124, '020408', 'SAN MIGUEL DE ACO', NULL, 11, NULL);
INSERT INTO "param"."t28_distritos" VALUES (125, '020409', 'SHILLA', NULL, 11, NULL);
INSERT INTO "param"."t28_distritos" VALUES (126, '020410', 'TINCO', NULL, 11, NULL);
INSERT INTO "param"."t28_distritos" VALUES (127, '020411', 'YUNGAR', NULL, 11, NULL);
INSERT INTO "param"."t28_distritos" VALUES (128, '020501', 'CASMA', NULL, 12, NULL);
INSERT INTO "param"."t28_distritos" VALUES (129, '020502', 'BUENA VISTA ALTA', NULL, 12, NULL);
INSERT INTO "param"."t28_distritos" VALUES (130, '020503', 'COMANDANTE NOEL', NULL, 12, NULL);
INSERT INTO "param"."t28_distritos" VALUES (131, '020505', 'YAUTAN', NULL, 12, NULL);
INSERT INTO "param"."t28_distritos" VALUES (132, '020601', 'CORONGO', NULL, 13, NULL);
INSERT INTO "param"."t28_distritos" VALUES (133, '020602', 'ACO', NULL, 13, NULL);
INSERT INTO "param"."t28_distritos" VALUES (134, '020603', 'BAMBAS', NULL, 13, NULL);
INSERT INTO "param"."t28_distritos" VALUES (135, '020604', 'CUSCA', NULL, 13, NULL);
INSERT INTO "param"."t28_distritos" VALUES (136, '020605', 'LA PAMPA', NULL, 13, NULL);
INSERT INTO "param"."t28_distritos" VALUES (137, '020606', 'YANAC', NULL, 13, NULL);
INSERT INTO "param"."t28_distritos" VALUES (138, '020607', 'YUPAN', NULL, 13, NULL);
INSERT INTO "param"."t28_distritos" VALUES (139, '020701', 'CARAZ', NULL, 14, NULL);
INSERT INTO "param"."t28_distritos" VALUES (140, '020702', 'HUALLANCA', NULL, 14, NULL);
INSERT INTO "param"."t28_distritos" VALUES (141, '020703', 'HUATA', NULL, 14, NULL);
INSERT INTO "param"."t28_distritos" VALUES (142, '020704', 'HUAYLAS', NULL, 14, NULL);
INSERT INTO "param"."t28_distritos" VALUES (143, '020705', 'MATO', NULL, 14, NULL);
INSERT INTO "param"."t28_distritos" VALUES (144, '020706', 'PAMPAROMAS', NULL, 14, NULL);
INSERT INTO "param"."t28_distritos" VALUES (145, '020707', 'PUEBLO LIBRE', NULL, 14, NULL);
INSERT INTO "param"."t28_distritos" VALUES (146, '020708', 'SANTA CRUZ', NULL, 14, NULL);
INSERT INTO "param"."t28_distritos" VALUES (147, '020709', 'YURACMARCA', NULL, 14, NULL);
INSERT INTO "param"."t28_distritos" VALUES (148, '020710', 'SANTO TORIBIO', NULL, 14, NULL);
INSERT INTO "param"."t28_distritos" VALUES (149, '020801', 'HUARI', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (150, '020802', 'CAJAY', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (151, '020803', 'CHAVIN DE HUANTAR', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (152, '020804', 'HUACACHI', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (153, '020805', 'HUACHIS', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (154, '020806', 'HUACCHIS', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (155, '020807', 'HUANTAR', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (156, '020808', 'MASIN', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (157, '020809', 'PAUCAS', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (158, '020810', 'PONTO', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (159, '020811', 'RAHUAPAMPA', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (160, '020812', 'RAPAYAN', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (161, '020813', 'SAN MARCOS', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (162, '020814', 'SAN PEDRO DE CHANA', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (163, '020815', 'UCO', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (164, '020816', 'ANRA', NULL, 15, NULL);
INSERT INTO "param"."t28_distritos" VALUES (165, '020901', 'PISCOBAMBA', NULL, 16, NULL);
INSERT INTO "param"."t28_distritos" VALUES (166, '020902', 'CASCA', NULL, 16, NULL);
INSERT INTO "param"."t28_distritos" VALUES (167, '020903', 'LUCMA', NULL, 16, NULL);
INSERT INTO "param"."t28_distritos" VALUES (168, '020904', 'FIDEL OLIVAS ESCUDERO', NULL, 16, NULL);
INSERT INTO "param"."t28_distritos" VALUES (169, '020905', 'LLAMA', NULL, 16, NULL);
INSERT INTO "param"."t28_distritos" VALUES (170, '020906', 'LLUMPA', NULL, 16, NULL);
INSERT INTO "param"."t28_distritos" VALUES (171, '020907', 'MUSGA', NULL, 16, NULL);
INSERT INTO "param"."t28_distritos" VALUES (172, '020908', 'ELEAZAR GUZMAN BARRON', NULL, 16, NULL);
INSERT INTO "param"."t28_distritos" VALUES (173, '021001', 'CABANA', NULL, 17, NULL);
INSERT INTO "param"."t28_distritos" VALUES (174, '021002', 'BOLOGNESI', NULL, 17, NULL);
INSERT INTO "param"."t28_distritos" VALUES (175, '021003', 'CONCHUCOS', NULL, 17, NULL);
INSERT INTO "param"."t28_distritos" VALUES (176, '021004', 'HUACASCHUQUE', NULL, 17, NULL);
INSERT INTO "param"."t28_distritos" VALUES (177, '021005', 'HUANDOVAL', NULL, 17, NULL);
INSERT INTO "param"."t28_distritos" VALUES (178, '021006', 'LACABAMBA', NULL, 17, NULL);
INSERT INTO "param"."t28_distritos" VALUES (179, '021007', 'LLAPO', NULL, 17, NULL);
INSERT INTO "param"."t28_distritos" VALUES (180, '021008', 'PALLASCA', NULL, 17, NULL);
INSERT INTO "param"."t28_distritos" VALUES (181, '021009', 'PAMPAS', NULL, 17, NULL);
INSERT INTO "param"."t28_distritos" VALUES (182, '021010', 'SANTA ROSA', NULL, 17, NULL);
INSERT INTO "param"."t28_distritos" VALUES (183, '021011', 'TAUCA', NULL, 17, NULL);
INSERT INTO "param"."t28_distritos" VALUES (184, '021101', 'POMABAMBA', NULL, 18, NULL);
INSERT INTO "param"."t28_distritos" VALUES (185, '021102', 'HUAYLLAN', NULL, 18, NULL);
INSERT INTO "param"."t28_distritos" VALUES (186, '021103', 'PAROBAMBA', NULL, 18, NULL);
INSERT INTO "param"."t28_distritos" VALUES (187, '021104', 'QUINUABAMBA', NULL, 18, NULL);
INSERT INTO "param"."t28_distritos" VALUES (188, '021201', 'RECUAY', NULL, 19, NULL);
INSERT INTO "param"."t28_distritos" VALUES (189, '021202', 'COTAPARACO', NULL, 19, NULL);
INSERT INTO "param"."t28_distritos" VALUES (190, '021203', 'HUAYLLAPAMPA', NULL, 19, NULL);
INSERT INTO "param"."t28_distritos" VALUES (191, '021204', 'MARCA', NULL, 19, NULL);
INSERT INTO "param"."t28_distritos" VALUES (192, '021205', 'PAMPAS CHICO', NULL, 19, NULL);
INSERT INTO "param"."t28_distritos" VALUES (193, '021206', 'PARARIN', NULL, 19, NULL);
INSERT INTO "param"."t28_distritos" VALUES (194, '021207', 'TAPACOCHA', NULL, 19, NULL);
INSERT INTO "param"."t28_distritos" VALUES (195, '021208', 'TICAPAMPA', NULL, 19, NULL);
INSERT INTO "param"."t28_distritos" VALUES (196, '021209', 'LLACLLIN', NULL, 19, NULL);
INSERT INTO "param"."t28_distritos" VALUES (197, '021210', 'CATAC', NULL, 19, NULL);
INSERT INTO "param"."t28_distritos" VALUES (198, '021301', 'CHIMBOTE', NULL, 20, NULL);
INSERT INTO "param"."t28_distritos" VALUES (199, '021302', 'CACERES DEL PERU', NULL, 20, NULL);
INSERT INTO "param"."t28_distritos" VALUES (200, '021303', 'MACATE', NULL, 20, NULL);
INSERT INTO "param"."t28_distritos" VALUES (201, '021304', 'MORO', NULL, 20, NULL);
INSERT INTO "param"."t28_distritos" VALUES (202, '021305', 'NEPENA', NULL, 20, NULL);
INSERT INTO "param"."t28_distritos" VALUES (203, '021306', 'SAMANCO', NULL, 20, NULL);
INSERT INTO "param"."t28_distritos" VALUES (204, '021307', 'SANTA', NULL, 20, NULL);
INSERT INTO "param"."t28_distritos" VALUES (205, '021308', 'COISHCO', NULL, 20, NULL);
INSERT INTO "param"."t28_distritos" VALUES (206, '021309', 'NUEVO CHIMBOTE', NULL, 20, NULL);
INSERT INTO "param"."t28_distritos" VALUES (207, '021401', 'SIHUAS', NULL, 21, NULL);
INSERT INTO "param"."t28_distritos" VALUES (208, '021402', 'ALFONSO UGARTE', NULL, 21, NULL);
INSERT INTO "param"."t28_distritos" VALUES (209, '021403', 'CHINGALPO', NULL, 21, NULL);
INSERT INTO "param"."t28_distritos" VALUES (210, '021404', 'HUAYLLABAMBA', NULL, 21, NULL);
INSERT INTO "param"."t28_distritos" VALUES (211, '021405', 'QUICHES', NULL, 21, NULL);
INSERT INTO "param"."t28_distritos" VALUES (212, '021406', 'SICSIBAMBA', NULL, 21, NULL);
INSERT INTO "param"."t28_distritos" VALUES (213, '021407', 'ACOBAMBA', NULL, 21, NULL);
INSERT INTO "param"."t28_distritos" VALUES (214, '021408', 'CASHAPAMPA', NULL, 21, NULL);
INSERT INTO "param"."t28_distritos" VALUES (215, '021409', 'RAGASH', NULL, 21, NULL);
INSERT INTO "param"."t28_distritos" VALUES (216, '021410', 'SAN JUAN', NULL, 21, NULL);
INSERT INTO "param"."t28_distritos" VALUES (217, '021501', 'YUNGAY', NULL, 22, NULL);
INSERT INTO "param"."t28_distritos" VALUES (218, '021502', 'CASCAPARA', NULL, 22, NULL);
INSERT INTO "param"."t28_distritos" VALUES (219, '021503', 'MANCOS', NULL, 22, NULL);
INSERT INTO "param"."t28_distritos" VALUES (220, '021504', 'MATACOTO', NULL, 22, NULL);
INSERT INTO "param"."t28_distritos" VALUES (221, '021505', 'QUILLO', NULL, 22, NULL);
INSERT INTO "param"."t28_distritos" VALUES (222, '021506', 'RANRAHIRCA', NULL, 22, NULL);
INSERT INTO "param"."t28_distritos" VALUES (223, '021507', 'SHUPLUY', NULL, 22, NULL);
INSERT INTO "param"."t28_distritos" VALUES (224, '021508', 'YANAMA', NULL, 22, NULL);
INSERT INTO "param"."t28_distritos" VALUES (225, '021601', 'LLAMELLIN', NULL, 23, NULL);
INSERT INTO "param"."t28_distritos" VALUES (226, '021602', 'ACZO', NULL, 23, NULL);
INSERT INTO "param"."t28_distritos" VALUES (227, '021603', 'CHACCHO', NULL, 23, NULL);
INSERT INTO "param"."t28_distritos" VALUES (228, '021604', 'CHINGAS', NULL, 23, NULL);
INSERT INTO "param"."t28_distritos" VALUES (229, '021605', 'MIRGAS', NULL, 23, NULL);
INSERT INTO "param"."t28_distritos" VALUES (230, '021606', 'SAN JUAN DE RONTOY', NULL, 23, NULL);
INSERT INTO "param"."t28_distritos" VALUES (231, '021701', 'SAN LUIS', NULL, 24, NULL);
INSERT INTO "param"."t28_distritos" VALUES (232, '021702', 'YAUYA', NULL, 24, NULL);
INSERT INTO "param"."t28_distritos" VALUES (233, '021703', 'SAN NICOLAS', NULL, 24, NULL);
INSERT INTO "param"."t28_distritos" VALUES (234, '021801', 'CHACAS', NULL, 25, NULL);
INSERT INTO "param"."t28_distritos" VALUES (235, '021802', 'ACOCHACA', NULL, 25, NULL);
INSERT INTO "param"."t28_distritos" VALUES (236, '021901', 'HUARMEY', NULL, 26, NULL);
INSERT INTO "param"."t28_distritos" VALUES (237, '021902', 'COCHAPETI', NULL, 26, NULL);
INSERT INTO "param"."t28_distritos" VALUES (238, '021903', 'HUAYAN', NULL, 26, NULL);
INSERT INTO "param"."t28_distritos" VALUES (239, '021904', 'MALVAS', NULL, 26, NULL);
INSERT INTO "param"."t28_distritos" VALUES (240, '021905', 'CULEBRAS', NULL, 26, NULL);
INSERT INTO "param"."t28_distritos" VALUES (241, '022001', 'ACAS', NULL, 27, NULL);
INSERT INTO "param"."t28_distritos" VALUES (242, '022002', 'CAJAMARQUILLA', NULL, 27, NULL);
INSERT INTO "param"."t28_distritos" VALUES (243, '022003', 'CARHUAPAMPA', NULL, 27, NULL);
INSERT INTO "param"."t28_distritos" VALUES (244, '022004', 'COCHAS', NULL, 27, NULL);
INSERT INTO "param"."t28_distritos" VALUES (245, '022005', 'CONGAS', NULL, 27, NULL);
INSERT INTO "param"."t28_distritos" VALUES (246, '022006', 'LLIPA', NULL, 27, NULL);
INSERT INTO "param"."t28_distritos" VALUES (247, '022007', 'OCROS', NULL, 27, NULL);
INSERT INTO "param"."t28_distritos" VALUES (248, '022008', 'SAN CRISTOBAL DE RAJAN', NULL, 27, NULL);
INSERT INTO "param"."t28_distritos" VALUES (249, '022009', 'SAN PEDRO', NULL, 27, NULL);
INSERT INTO "param"."t28_distritos" VALUES (250, '022010', 'SANTIAGO DE CHILCAS', NULL, 27, NULL);
INSERT INTO "param"."t28_distritos" VALUES (251, '030101', 'ABANCAY', NULL, 28, NULL);
INSERT INTO "param"."t28_distritos" VALUES (252, '030102', 'CIRCA', NULL, 28, NULL);
INSERT INTO "param"."t28_distritos" VALUES (253, '030103', 'CURAHUASI', NULL, 28, NULL);
INSERT INTO "param"."t28_distritos" VALUES (254, '030104', 'CHACOCHE', NULL, 28, NULL);
INSERT INTO "param"."t28_distritos" VALUES (255, '030105', 'HUANIPACA', NULL, 28, NULL);
INSERT INTO "param"."t28_distritos" VALUES (256, '030106', 'LAMBRAMA', NULL, 28, NULL);
INSERT INTO "param"."t28_distritos" VALUES (257, '030107', 'PICHIRHUA', NULL, 28, NULL);
INSERT INTO "param"."t28_distritos" VALUES (258, '030108', 'SAN PEDRO DE CACHORA', NULL, 28, NULL);
INSERT INTO "param"."t28_distritos" VALUES (259, '030109', 'TAMBURCO', NULL, 28, NULL);
INSERT INTO "param"."t28_distritos" VALUES (260, '030201', 'CHALHUANCA', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (261, '030202', 'CAPAYA', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (262, '030203', 'CARAYBAMBA', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (263, '030204', 'COLCABAMBA', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (264, '030205', 'COTARUSE', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (265, '030206', 'CHAPIMARCA', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (266, '030207', 'IHUAYLLO', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (267, '030208', 'LUCRE', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (268, '030209', 'POCOHUANCA', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (269, '030210', 'SANAICA', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (270, '030211', 'SORAYA', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (271, '030212', 'TAPAIRIHUA', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (272, '030213', 'TINTAY', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (273, '030214', 'TORAYA', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (274, '030215', 'YANACA', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (275, '030216', 'SAN JUAN DE CHACNA', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (276, '030217', 'JUSTO APU SAHUARAURA', NULL, 29, NULL);
INSERT INTO "param"."t28_distritos" VALUES (277, '030301', 'ANDAHUAYLAS', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (278, '030302', 'ANDARAPA', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (279, '030303', 'CHIARA', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (280, '030304', 'HUANCARAMA', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (281, '030305', 'HUANCARAY', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (282, '030306', 'KISHUARA', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (283, '030307', 'PACOBAMBA', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (284, '030308', 'PAMPACHIRI', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (285, '030309', 'SAN ANTONIO DE CACHI', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (286, '030310', 'SAN JERONIMO', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (287, '030311', 'TALAVERA', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (288, '030312', 'TURPO', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (289, '030313', 'PACUCHA', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (290, '030314', 'POMACOCHA', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (291, '030315', 'STA MARIA DE CHICMO', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (292, '030316', 'TUMAY HUARACA', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (293, '030317', 'HUAYANA', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (294, '030318', 'SAN MIGUEL DE CHACCRAMPA', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (295, '030319', 'KAQUIABAMBA', NULL, 30, NULL);
INSERT INTO "param"."t28_distritos" VALUES (296, '030401', 'ANTABAMBA', NULL, 31, NULL);
INSERT INTO "param"."t28_distritos" VALUES (297, '030402', 'EL ORO', NULL, 31, NULL);
INSERT INTO "param"."t28_distritos" VALUES (298, '030403', 'HUAQUIRCA', NULL, 31, NULL);
INSERT INTO "param"."t28_distritos" VALUES (299, '030404', 'JUAN ESPINOZA MEDRANO', NULL, 31, NULL);
INSERT INTO "param"."t28_distritos" VALUES (300, '030405', 'OROPESA', NULL, 31, NULL);
INSERT INTO "param"."t28_distritos" VALUES (301, '030406', 'PACHACONAS', NULL, 31, NULL);
INSERT INTO "param"."t28_distritos" VALUES (302, '030407', 'SABAINO', NULL, 31, NULL);
INSERT INTO "param"."t28_distritos" VALUES (303, '030501', 'TAMBOBAMBA', NULL, 32, NULL);
INSERT INTO "param"."t28_distritos" VALUES (304, '030502', 'COYLLURQUI', NULL, 32, NULL);
INSERT INTO "param"."t28_distritos" VALUES (305, '030503', 'COTABAMBAS', NULL, 32, NULL);
INSERT INTO "param"."t28_distritos" VALUES (306, '030504', 'HAQUIRA', NULL, 32, NULL);
INSERT INTO "param"."t28_distritos" VALUES (307, '030505', 'MARA', NULL, 32, NULL);
INSERT INTO "param"."t28_distritos" VALUES (308, '030506', 'CHALLHUAHUACHO', NULL, 32, NULL);
INSERT INTO "param"."t28_distritos" VALUES (309, '030601', 'CHUQUIBAMBILLA', NULL, 33, NULL);
INSERT INTO "param"."t28_distritos" VALUES (310, '030602', 'CURPAHUASI', NULL, 33, NULL);
INSERT INTO "param"."t28_distritos" VALUES (311, '030603', 'HUAILLATI', NULL, 33, NULL);
INSERT INTO "param"."t28_distritos" VALUES (312, '030604', 'MAMARA', NULL, 33, NULL);
INSERT INTO "param"."t28_distritos" VALUES (313, '030605', 'MARISCAL GAMARRA', NULL, 33, NULL);
INSERT INTO "param"."t28_distritos" VALUES (314, '030606', 'MICAELA BASTIDAS', NULL, 33, NULL);
INSERT INTO "param"."t28_distritos" VALUES (315, '030607', 'PROGRESO', NULL, 33, NULL);
INSERT INTO "param"."t28_distritos" VALUES (316, '030608', 'PATAYPAMPA', NULL, 33, NULL);
INSERT INTO "param"."t28_distritos" VALUES (317, '030609', 'SAN ANTONIO', NULL, 33, NULL);
INSERT INTO "param"."t28_distritos" VALUES (318, '030610', 'TURPAY', NULL, 33, NULL);
INSERT INTO "param"."t28_distritos" VALUES (319, '030611', 'VILCABAMBA', NULL, 33, NULL);
INSERT INTO "param"."t28_distritos" VALUES (320, '030612', 'VIRUNDO', NULL, 33, NULL);
INSERT INTO "param"."t28_distritos" VALUES (321, '030613', 'SANTA ROSA', NULL, 33, NULL);
INSERT INTO "param"."t28_distritos" VALUES (322, '030614', 'CURASCO', NULL, 33, NULL);
INSERT INTO "param"."t28_distritos" VALUES (323, '030701', 'CHINCHEROS', NULL, 34, NULL);
INSERT INTO "param"."t28_distritos" VALUES (324, '030702', 'ONGOY', NULL, 34, NULL);
INSERT INTO "param"."t28_distritos" VALUES (325, '030703', 'OCOBAMBA', NULL, 34, NULL);
INSERT INTO "param"."t28_distritos" VALUES (326, '030704', 'COCHARCAS', NULL, 34, NULL);
INSERT INTO "param"."t28_distritos" VALUES (327, '030705', 'ANCO HUALLO', NULL, 34, NULL);
INSERT INTO "param"."t28_distritos" VALUES (328, '030706', 'HUACCANA', NULL, 34, NULL);
INSERT INTO "param"."t28_distritos" VALUES (329, '030707', 'URANMARCA', NULL, 34, NULL);
INSERT INTO "param"."t28_distritos" VALUES (330, '030708', 'RANRACANCHA', NULL, 34, NULL);
INSERT INTO "param"."t28_distritos" VALUES (331, '040101', 'AREQUIPA', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (332, '040102', 'CAYMA', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (333, '040103', 'CERRO COLORADO', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (334, '040104', 'CHARACATO', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (335, '040105', 'CHIGUATA', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (336, '040106', 'LA JOYA', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (337, '040107', 'MIRAFLORES', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (338, '040108', 'MOLLEBAYA', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (339, '040109', 'PAUCARPATA', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (340, '040110', 'POCSI', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (341, '040111', 'POLOBAYA', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (342, '040112', 'QUEQUENA', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (343, '040113', 'SABANDIA', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (344, '040114', 'SACHACA', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (345, '040115', 'SAN JUAN DE SIGUAS', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (346, '040116', 'SAN JUAN DE TARUCANI', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (347, '040117', 'SANTA ISABEL DE SIGUAS', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (348, '040118', 'STA RITA DE SIGUAS', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (349, '040119', 'SOCABAYA', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (350, '040120', 'TIABAYA', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (351, '040121', 'UCHUMAYO', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (352, '040122', 'VITOR', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (353, '040123', 'YANAHUARA', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (354, '040124', 'YARABAMBA', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (355, '040125', 'YURA', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (356, '040126', 'MARIANO MELGAR', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (357, '040127', 'JACOBO HUNTER', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (358, '040128', 'ALTO SELVA ALEGRE', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (359, '040129', 'JOSE LUIS BUSTAMANTE Y RIVERO', NULL, 35, NULL);
INSERT INTO "param"."t28_distritos" VALUES (360, '040201', 'CHIVAY', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (361, '040202', 'ACHOMA', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (362, '040203', 'CABANACONDE', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (363, '040204', 'CAYLLOMA', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (364, '040205', 'CALLALLI', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (365, '040206', 'COPORAQUE', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (366, '040207', 'HUAMBO', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (367, '040208', 'HUANCA', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (368, '040209', 'ICHUPAMPA', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (369, '040210', 'LARI', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (370, '040211', 'LLUTA', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (371, '040212', 'MACA', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (372, '040213', 'MADRIGAL', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (373, '040214', 'SAN ANTONIO DE CHUCA', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (374, '040215', 'SIBAYO', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (375, '040216', 'TAPAY', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (376, '040217', 'TISCO', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (377, '040218', 'TUTI', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (378, '040219', 'YANQUE', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (379, '040220', 'MAJES', NULL, 36, NULL);
INSERT INTO "param"."t28_distritos" VALUES (380, '040301', 'CAMANA', NULL, 37, NULL);
INSERT INTO "param"."t28_distritos" VALUES (381, '040302', 'JOSE MARIA QUIMPER', NULL, 37, NULL);
INSERT INTO "param"."t28_distritos" VALUES (382, '040303', 'MARIANO N VALCARCEL', NULL, 37, NULL);
INSERT INTO "param"."t28_distritos" VALUES (383, '040304', 'MARISCAL CACERES', NULL, 37, NULL);
INSERT INTO "param"."t28_distritos" VALUES (384, '040305', 'NICOLAS DE PIEROLA', NULL, 37, NULL);
INSERT INTO "param"."t28_distritos" VALUES (385, '040306', 'OCONA', NULL, 37, NULL);
INSERT INTO "param"."t28_distritos" VALUES (386, '040307', 'QUILCA', NULL, 37, NULL);
INSERT INTO "param"."t28_distritos" VALUES (387, '040308', 'SAMUEL PASTOR', NULL, 37, NULL);
INSERT INTO "param"."t28_distritos" VALUES (388, '040401', 'CARAVELI', NULL, 38, NULL);
INSERT INTO "param"."t28_distritos" VALUES (389, '040402', 'ACARI', NULL, 38, NULL);
INSERT INTO "param"."t28_distritos" VALUES (390, '040403', 'ATICO', NULL, 38, NULL);
INSERT INTO "param"."t28_distritos" VALUES (391, '040404', 'ATIQUIPA', NULL, 38, NULL);
INSERT INTO "param"."t28_distritos" VALUES (392, '040405', 'BELLA UNION', NULL, 38, NULL);
INSERT INTO "param"."t28_distritos" VALUES (393, '040406', 'CAHUACHO', NULL, 38, NULL);
INSERT INTO "param"."t28_distritos" VALUES (394, '040407', 'CHALA', NULL, 38, NULL);
INSERT INTO "param"."t28_distritos" VALUES (395, '040408', 'CHAPARRA', NULL, 38, NULL);
INSERT INTO "param"."t28_distritos" VALUES (396, '040409', 'HUANUHUANU', NULL, 38, NULL);
INSERT INTO "param"."t28_distritos" VALUES (397, '040410', 'JAQUI', NULL, 38, NULL);
INSERT INTO "param"."t28_distritos" VALUES (398, '040411', 'LOMAS', NULL, 38, NULL);
INSERT INTO "param"."t28_distritos" VALUES (399, '040412', 'QUICACHA', NULL, 38, NULL);
INSERT INTO "param"."t28_distritos" VALUES (400, '040413', 'YAUCA', NULL, 38, NULL);
INSERT INTO "param"."t28_distritos" VALUES (401, '040501', 'APLAO', NULL, 39, NULL);
INSERT INTO "param"."t28_distritos" VALUES (402, '040502', 'ANDAGUA', NULL, 39, NULL);
INSERT INTO "param"."t28_distritos" VALUES (403, '040503', 'AYO', NULL, 39, NULL);
INSERT INTO "param"."t28_distritos" VALUES (404, '040504', 'CHACHAS', NULL, 39, NULL);
INSERT INTO "param"."t28_distritos" VALUES (405, '040505', 'CHILCAYMARCA', NULL, 39, NULL);
INSERT INTO "param"."t28_distritos" VALUES (406, '040506', 'CHOCO', NULL, 39, NULL);
INSERT INTO "param"."t28_distritos" VALUES (407, '040507', 'HUANCARQUI', NULL, 39, NULL);
INSERT INTO "param"."t28_distritos" VALUES (408, '040508', 'MACHAGUAY', NULL, 39, NULL);
INSERT INTO "param"."t28_distritos" VALUES (409, '040509', 'ORCOPAMPA', NULL, 39, NULL);
INSERT INTO "param"."t28_distritos" VALUES (410, '040510', 'PAMPACOLCA', NULL, 39, NULL);
INSERT INTO "param"."t28_distritos" VALUES (411, '040511', 'TIPAN', NULL, 39, NULL);
INSERT INTO "param"."t28_distritos" VALUES (412, '040512', 'URACA', NULL, 39, NULL);
INSERT INTO "param"."t28_distritos" VALUES (413, '040513', 'UNON', NULL, 39, NULL);
INSERT INTO "param"."t28_distritos" VALUES (414, '040514', 'VIRACO', NULL, 39, NULL);
INSERT INTO "param"."t28_distritos" VALUES (415, '040601', 'CHUQUIBAMBA', NULL, 40, NULL);
INSERT INTO "param"."t28_distritos" VALUES (416, '040602', 'ANDARAY', NULL, 40, NULL);
INSERT INTO "param"."t28_distritos" VALUES (417, '040603', 'CAYARANI', NULL, 40, NULL);
INSERT INTO "param"."t28_distritos" VALUES (418, '040604', 'CHICHAS', NULL, 40, NULL);
INSERT INTO "param"."t28_distritos" VALUES (419, '040605', 'IRAY', NULL, 40, NULL);
INSERT INTO "param"."t28_distritos" VALUES (420, '040606', 'SALAMANCA', NULL, 40, NULL);
INSERT INTO "param"."t28_distritos" VALUES (421, '040607', 'YANAQUIHUA', NULL, 40, NULL);
INSERT INTO "param"."t28_distritos" VALUES (422, '040608', 'RIO GRANDE', NULL, 40, NULL);
INSERT INTO "param"."t28_distritos" VALUES (423, '040701', 'MOLLENDO', NULL, 41, NULL);
INSERT INTO "param"."t28_distritos" VALUES (424, '040702', 'COCACHACRA', NULL, 41, NULL);
INSERT INTO "param"."t28_distritos" VALUES (425, '040703', 'DEAN VALDIVIA', NULL, 41, NULL);
INSERT INTO "param"."t28_distritos" VALUES (426, '040704', 'ISLAY', NULL, 41, NULL);
INSERT INTO "param"."t28_distritos" VALUES (427, '040705', 'MEJIA', NULL, 41, NULL);
INSERT INTO "param"."t28_distritos" VALUES (428, '040706', 'PUNTA DE BOMBON', NULL, 41, NULL);
INSERT INTO "param"."t28_distritos" VALUES (429, '040801', 'COTAHUASI', NULL, 42, NULL);
INSERT INTO "param"."t28_distritos" VALUES (430, '040802', 'ALCA', NULL, 42, NULL);
INSERT INTO "param"."t28_distritos" VALUES (431, '040803', 'CHARCANA', NULL, 42, NULL);
INSERT INTO "param"."t28_distritos" VALUES (432, '040804', 'HUAYNACOTAS', NULL, 42, NULL);
INSERT INTO "param"."t28_distritos" VALUES (433, '040805', 'PAMPAMARCA', NULL, 42, NULL);
INSERT INTO "param"."t28_distritos" VALUES (434, '040806', 'PUYCA', NULL, 42, NULL);
INSERT INTO "param"."t28_distritos" VALUES (435, '040807', 'QUECHUALLA', NULL, 42, NULL);
INSERT INTO "param"."t28_distritos" VALUES (436, '040808', 'SAYLA', NULL, 42, NULL);
INSERT INTO "param"."t28_distritos" VALUES (437, '040809', 'TAURIA', NULL, 42, NULL);
INSERT INTO "param"."t28_distritos" VALUES (438, '040810', 'TOMEPAMPA', NULL, 42, NULL);
INSERT INTO "param"."t28_distritos" VALUES (439, '040811', 'TORO', NULL, 42, NULL);
INSERT INTO "param"."t28_distritos" VALUES (440, '050101', 'AYACUCHO', NULL, 43, NULL);
INSERT INTO "param"."t28_distritos" VALUES (441, '050102', 'ACOS VINCHOS', NULL, 43, NULL);
INSERT INTO "param"."t28_distritos" VALUES (442, '050103', 'CARMEN ALTO', NULL, 43, NULL);
INSERT INTO "param"."t28_distritos" VALUES (443, '050104', 'CHIARA', NULL, 43, NULL);
INSERT INTO "param"."t28_distritos" VALUES (444, '050105', 'QUINUA', NULL, 43, NULL);
INSERT INTO "param"."t28_distritos" VALUES (445, '050106', 'SAN JOSE DE TICLLAS', NULL, 43, NULL);
INSERT INTO "param"."t28_distritos" VALUES (446, '050107', 'SAN JUAN BAUTISTA', NULL, 43, NULL);
INSERT INTO "param"."t28_distritos" VALUES (447, '050108', 'SANTIAGO DE PISCHA', NULL, 43, NULL);
INSERT INTO "param"."t28_distritos" VALUES (448, '050109', 'VINCHOS', NULL, 43, NULL);
INSERT INTO "param"."t28_distritos" VALUES (449, '050110', 'TAMBILLO', NULL, 43, NULL);
INSERT INTO "param"."t28_distritos" VALUES (450, '050111', 'ACOCRO', NULL, 43, NULL);
INSERT INTO "param"."t28_distritos" VALUES (451, '050112', 'SOCOS', NULL, 43, NULL);
INSERT INTO "param"."t28_distritos" VALUES (452, '050113', 'OCROS', NULL, 43, NULL);
INSERT INTO "param"."t28_distritos" VALUES (453, '050114', 'PACAYCASA', NULL, 43, NULL);
INSERT INTO "param"."t28_distritos" VALUES (454, '050115', 'JESUS NAZARENO', NULL, 43, NULL);
INSERT INTO "param"."t28_distritos" VALUES (455, '050201', 'CANGALLO', NULL, 44, NULL);
INSERT INTO "param"."t28_distritos" VALUES (456, '050204', 'CHUSCHI', NULL, 44, NULL);
INSERT INTO "param"."t28_distritos" VALUES (457, '050206', 'LOS MOROCHUCOS', NULL, 44, NULL);
INSERT INTO "param"."t28_distritos" VALUES (458, '050207', 'PARAS', NULL, 44, NULL);
INSERT INTO "param"."t28_distritos" VALUES (459, '050208', 'TOTOS', NULL, 44, NULL);
INSERT INTO "param"."t28_distritos" VALUES (460, '050211', 'MARIA PARADO DE BELLIDO', NULL, 44, NULL);
INSERT INTO "param"."t28_distritos" VALUES (461, '050301', 'HUANTA', NULL, 45, NULL);
INSERT INTO "param"."t28_distritos" VALUES (462, '050302', 'AYAHUANCO', NULL, 45, NULL);
INSERT INTO "param"."t28_distritos" VALUES (463, '050303', 'HUAMANGUILLA', NULL, 45, NULL);
INSERT INTO "param"."t28_distritos" VALUES (464, '050304', 'IGUAIN', NULL, 45, NULL);
INSERT INTO "param"."t28_distritos" VALUES (465, '050305', 'LURICOCHA', NULL, 45, NULL);
INSERT INTO "param"."t28_distritos" VALUES (466, '050307', 'SANTILLANA', NULL, 45, NULL);
INSERT INTO "param"."t28_distritos" VALUES (467, '050308', 'SIVIA', NULL, 45, NULL);
INSERT INTO "param"."t28_distritos" VALUES (468, '050309', 'LLOCHEGUA', NULL, 45, NULL);
INSERT INTO "param"."t28_distritos" VALUES (469, '050401', 'SAN MIGUEL', NULL, 46, NULL);
INSERT INTO "param"."t28_distritos" VALUES (470, '050402', 'ANCO', NULL, 46, NULL);
INSERT INTO "param"."t28_distritos" VALUES (471, '050403', 'AYNA', NULL, 46, NULL);
INSERT INTO "param"."t28_distritos" VALUES (472, '050404', 'CHILCAS', NULL, 46, NULL);
INSERT INTO "param"."t28_distritos" VALUES (473, '050405', 'CHUNGUI', NULL, 46, NULL);
INSERT INTO "param"."t28_distritos" VALUES (474, '050406', 'TAMBO', NULL, 46, NULL);
INSERT INTO "param"."t28_distritos" VALUES (475, '050407', 'LUIS CARRANZA', NULL, 46, NULL);
INSERT INTO "param"."t28_distritos" VALUES (476, '050408', 'SANTA ROSA', NULL, 46, NULL);
INSERT INTO "param"."t28_distritos" VALUES (477, '050501', 'PUQUIO', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (478, '050502', 'AUCARA', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (479, '050503', 'CABANA', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (480, '050504', 'CARMEN SALCEDO', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (481, '050506', 'CHAVINA', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (482, '050508', 'CHIPAO', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (483, '050510', 'HUAC-HUAS', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (484, '050511', 'LARAMATE', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (485, '050512', 'LEONCIO PRADO', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (486, '050513', 'LUCANAS', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (487, '050514', 'LLAUTA', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (488, '050516', 'OCANA', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (489, '050517', 'OTOCA', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (490, '050520', 'SANCOS', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (491, '050521', 'SAN JUAN', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (492, '050522', 'SAN PEDRO', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (493, '050524', 'STA ANA DE HUAYCAHUACHO', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (494, '050525', 'SANTA LUCIA', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (495, '050529', 'SAISA', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (496, '050531', 'SAN PEDRO DE PALCO', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (497, '050532', 'SAN CRISTOBAL', NULL, 47, NULL);
INSERT INTO "param"."t28_distritos" VALUES (498, '050601', 'CORACORA', NULL, 48, NULL);
INSERT INTO "param"."t28_distritos" VALUES (499, '050604', 'CORONEL CASTANEDA', NULL, 48, NULL);
INSERT INTO "param"."t28_distritos" VALUES (500, '050605', 'CHUMPI', NULL, 48, NULL);
INSERT INTO "param"."t28_distritos" VALUES (501, '050608', 'PACAPAUSA', NULL, 48, NULL);
INSERT INTO "param"."t28_distritos" VALUES (502, '050611', 'PULLO', NULL, 48, NULL);
INSERT INTO "param"."t28_distritos" VALUES (503, '050612', 'PUYUSCA', NULL, 48, NULL);
INSERT INTO "param"."t28_distritos" VALUES (504, '050615', 'SAN FCO DE RAVACAYCO', NULL, 48, NULL);
INSERT INTO "param"."t28_distritos" VALUES (505, '050616', 'UPAHUACHO', NULL, 48, NULL);
INSERT INTO "param"."t28_distritos" VALUES (506, '050701', 'HUANCAPI', NULL, 49, NULL);
INSERT INTO "param"."t28_distritos" VALUES (507, '050702', 'ALCAMENCA', NULL, 49, NULL);
INSERT INTO "param"."t28_distritos" VALUES (508, '050703', 'APONGO', NULL, 49, NULL);
INSERT INTO "param"."t28_distritos" VALUES (509, '050704', 'CANARIA', NULL, 49, NULL);
INSERT INTO "param"."t28_distritos" VALUES (510, '050706', 'CAYARA', NULL, 49, NULL);
INSERT INTO "param"."t28_distritos" VALUES (511, '050707', 'COLCA', NULL, 49, NULL);
INSERT INTO "param"."t28_distritos" VALUES (512, '050708', 'HUAYA', NULL, 49, NULL);
INSERT INTO "param"."t28_distritos" VALUES (513, '050709', 'HUAMANQUIQUIA', NULL, 49, NULL);
INSERT INTO "param"."t28_distritos" VALUES (514, '050710', 'HUANCARAYLLA', NULL, 49, NULL);
INSERT INTO "param"."t28_distritos" VALUES (515, '050713', 'SARHUA', NULL, 49, NULL);
INSERT INTO "param"."t28_distritos" VALUES (516, '050714', 'VILCANCHOS', NULL, 49, NULL);
INSERT INTO "param"."t28_distritos" VALUES (517, '050715', 'ASQUIPATA', NULL, 49, NULL);
INSERT INTO "param"."t28_distritos" VALUES (518, '050801', 'SANCOS', NULL, 50, NULL);
INSERT INTO "param"."t28_distritos" VALUES (519, '050802', 'SACSAMARCA', NULL, 50, NULL);
INSERT INTO "param"."t28_distritos" VALUES (520, '050803', 'SANTIAGO DE LUCANAMARCA', NULL, 50, NULL);
INSERT INTO "param"."t28_distritos" VALUES (521, '050804', 'CARAPO', NULL, 50, NULL);
INSERT INTO "param"."t28_distritos" VALUES (522, '050901', 'VILCAS HUAMAN', NULL, 51, NULL);
INSERT INTO "param"."t28_distritos" VALUES (523, '050902', 'VISCHONGO', NULL, 51, NULL);
INSERT INTO "param"."t28_distritos" VALUES (524, '050903', 'ACCOMARCA', NULL, 51, NULL);
INSERT INTO "param"."t28_distritos" VALUES (525, '050904', 'CARHUANCA', NULL, 51, NULL);
INSERT INTO "param"."t28_distritos" VALUES (526, '050905', 'CONCEPCION', NULL, 51, NULL);
INSERT INTO "param"."t28_distritos" VALUES (527, '050906', 'HUAMBALPA', NULL, 51, NULL);
INSERT INTO "param"."t28_distritos" VALUES (528, '050907', 'SAURAMA', NULL, 51, NULL);
INSERT INTO "param"."t28_distritos" VALUES (529, '050908', 'INDEPENDENCIA', NULL, 51, NULL);
INSERT INTO "param"."t28_distritos" VALUES (530, '051001', 'PAUSA', NULL, 52, NULL);
INSERT INTO "param"."t28_distritos" VALUES (531, '051002', 'COLTA', NULL, 52, NULL);
INSERT INTO "param"."t28_distritos" VALUES (532, '051003', 'CORCULLA', NULL, 52, NULL);
INSERT INTO "param"."t28_distritos" VALUES (533, '051004', 'LAMPA', NULL, 52, NULL);
INSERT INTO "param"."t28_distritos" VALUES (534, '051005', 'MARCABAMBA', NULL, 52, NULL);
INSERT INTO "param"."t28_distritos" VALUES (535, '051006', 'OYOLO', NULL, 52, NULL);
INSERT INTO "param"."t28_distritos" VALUES (536, '051007', 'PARARCA', NULL, 52, NULL);
INSERT INTO "param"."t28_distritos" VALUES (537, '051008', 'SAN JAVIER DE ALPABAMBA', NULL, 52, NULL);
INSERT INTO "param"."t28_distritos" VALUES (538, '051009', 'SAN JOSE DE USHUA', NULL, 52, NULL);
INSERT INTO "param"."t28_distritos" VALUES (539, '051010', 'SARA SARA', NULL, 52, NULL);
INSERT INTO "param"."t28_distritos" VALUES (540, '051101', 'QUEROBAMBA', NULL, 53, NULL);
INSERT INTO "param"."t28_distritos" VALUES (541, '051102', 'BELEN', NULL, 53, NULL);
INSERT INTO "param"."t28_distritos" VALUES (542, '051103', 'CHALCOS', NULL, 53, NULL);
INSERT INTO "param"."t28_distritos" VALUES (543, '051104', 'SAN SALVADOR DE QUIJE', NULL, 53, NULL);
INSERT INTO "param"."t28_distritos" VALUES (544, '051105', 'PAICO', NULL, 53, NULL);
INSERT INTO "param"."t28_distritos" VALUES (545, '051106', 'SANTIAGO DE PAUCARAY', NULL, 53, NULL);
INSERT INTO "param"."t28_distritos" VALUES (546, '051107', 'SAN PEDRO DE LARCAY', NULL, 53, NULL);
INSERT INTO "param"."t28_distritos" VALUES (547, '051108', 'SORAS', NULL, 53, NULL);
INSERT INTO "param"."t28_distritos" VALUES (548, '051109', 'HUACANA', NULL, 53, NULL);
INSERT INTO "param"."t28_distritos" VALUES (549, '051110', 'CHILCAYOC', NULL, 53, NULL);
INSERT INTO "param"."t28_distritos" VALUES (550, '051111', 'MORCOLLA', NULL, 53, NULL);
INSERT INTO "param"."t28_distritos" VALUES (551, '060101', 'CAJAMARCA', NULL, 54, NULL);
INSERT INTO "param"."t28_distritos" VALUES (552, '060102', 'ASUNCION', NULL, 54, NULL);
INSERT INTO "param"."t28_distritos" VALUES (553, '060103', 'COSPAN', NULL, 54, NULL);
INSERT INTO "param"."t28_distritos" VALUES (554, '060104', 'CHETILLA', NULL, 54, NULL);
INSERT INTO "param"."t28_distritos" VALUES (555, '060105', 'ENCANADA', NULL, 54, NULL);
INSERT INTO "param"."t28_distritos" VALUES (556, '060106', 'JESUS', NULL, 54, NULL);
INSERT INTO "param"."t28_distritos" VALUES (557, '060107', 'LOS BANOS DEL INCA', NULL, 54, NULL);
INSERT INTO "param"."t28_distritos" VALUES (558, '060108', 'LLACANORA', NULL, 54, NULL);
INSERT INTO "param"."t28_distritos" VALUES (559, '060109', 'MAGDALENA', NULL, 54, NULL);
INSERT INTO "param"."t28_distritos" VALUES (560, '060110', 'MATARA', NULL, 54, NULL);
INSERT INTO "param"."t28_distritos" VALUES (561, '060111', 'NAMORA', NULL, 54, NULL);
INSERT INTO "param"."t28_distritos" VALUES (562, '060112', 'SAN JUAN', NULL, 54, NULL);
INSERT INTO "param"."t28_distritos" VALUES (563, '060201', 'CAJABAMBA', NULL, 55, NULL);
INSERT INTO "param"."t28_distritos" VALUES (564, '060202', 'CACHACHI', NULL, 55, NULL);
INSERT INTO "param"."t28_distritos" VALUES (565, '060203', 'CONDEBAMBA', NULL, 55, NULL);
INSERT INTO "param"."t28_distritos" VALUES (566, '060205', 'SITACOCHA', NULL, 55, NULL);
INSERT INTO "param"."t28_distritos" VALUES (567, '060301', 'CELENDIN', NULL, 56, NULL);
INSERT INTO "param"."t28_distritos" VALUES (568, '060302', 'CORTEGANA', NULL, 56, NULL);
INSERT INTO "param"."t28_distritos" VALUES (569, '060303', 'CHUMUCH', NULL, 56, NULL);
INSERT INTO "param"."t28_distritos" VALUES (570, '060304', 'HUASMIN', NULL, 56, NULL);
INSERT INTO "param"."t28_distritos" VALUES (571, '060305', 'JORGE CHAVEZ', NULL, 56, NULL);
INSERT INTO "param"."t28_distritos" VALUES (572, '060306', 'JOSE GALVEZ', NULL, 56, NULL);
INSERT INTO "param"."t28_distritos" VALUES (573, '060307', 'MIGUEL IGLESIAS', NULL, 56, NULL);
INSERT INTO "param"."t28_distritos" VALUES (574, '060308', 'OXAMARCA', NULL, 56, NULL);
INSERT INTO "param"."t28_distritos" VALUES (575, '060309', 'SOROCHUCO', NULL, 56, NULL);
INSERT INTO "param"."t28_distritos" VALUES (576, '060310', 'SUCRE', NULL, 56, NULL);
INSERT INTO "param"."t28_distritos" VALUES (577, '060311', 'UTCO', NULL, 56, NULL);
INSERT INTO "param"."t28_distritos" VALUES (578, '060312', 'LA LIBERTAD DE PALLAN', NULL, 56, NULL);
INSERT INTO "param"."t28_distritos" VALUES (579, '060401', 'CONTUMAZA', NULL, 57, NULL);
INSERT INTO "param"."t28_distritos" VALUES (580, '060403', 'CHILETE', NULL, 57, NULL);
INSERT INTO "param"."t28_distritos" VALUES (581, '060404', 'GUZMANGO', NULL, 57, NULL);
INSERT INTO "param"."t28_distritos" VALUES (582, '060405', 'SAN BENITO', NULL, 57, NULL);
INSERT INTO "param"."t28_distritos" VALUES (583, '060406', 'CUPISNIQUE', NULL, 57, NULL);
INSERT INTO "param"."t28_distritos" VALUES (584, '060407', 'TANTARICA', NULL, 57, NULL);
INSERT INTO "param"."t28_distritos" VALUES (585, '060408', 'YONAN', NULL, 57, NULL);
INSERT INTO "param"."t28_distritos" VALUES (586, '060409', 'STA CRUZ DE TOLEDO', NULL, 57, NULL);
INSERT INTO "param"."t28_distritos" VALUES (587, '060501', 'CUTERVO', NULL, 58, NULL);
INSERT INTO "param"."t28_distritos" VALUES (588, '060502', 'CALLAYUC', NULL, 58, NULL);
INSERT INTO "param"."t28_distritos" VALUES (589, '060503', 'CUJILLO', NULL, 58, NULL);
INSERT INTO "param"."t28_distritos" VALUES (590, '060504', 'CHOROS', NULL, 58, NULL);
INSERT INTO "param"."t28_distritos" VALUES (591, '060505', 'LA RAMADA', NULL, 58, NULL);
INSERT INTO "param"."t28_distritos" VALUES (592, '060506', 'PIMPINGOS', NULL, 58, NULL);
INSERT INTO "param"."t28_distritos" VALUES (593, '060507', 'QUEROCOTILLO', NULL, 58, NULL);
INSERT INTO "param"."t28_distritos" VALUES (594, '060508', 'SAN ANDRES DE CUTERVO', NULL, 58, NULL);
INSERT INTO "param"."t28_distritos" VALUES (595, '060509', 'SAN JUAN DE CUTERVO', NULL, 58, NULL);
INSERT INTO "param"."t28_distritos" VALUES (596, '060510', 'SAN LUIS DE LUCMA', NULL, 58, NULL);
INSERT INTO "param"."t28_distritos" VALUES (597, '060511', 'SANTA CRUZ', NULL, 58, NULL);
INSERT INTO "param"."t28_distritos" VALUES (598, '060512', 'SANTO DOMINGO DE LA CAPILLA', NULL, 58, NULL);
INSERT INTO "param"."t28_distritos" VALUES (599, '060513', 'SANTO TOMAS', NULL, 58, NULL);
INSERT INTO "param"."t28_distritos" VALUES (600, '060514', 'SOCOTA', NULL, 58, NULL);
INSERT INTO "param"."t28_distritos" VALUES (601, '060515', 'TORIBIO CASANOVA', NULL, 58, NULL);
INSERT INTO "param"."t28_distritos" VALUES (602, '060601', 'CHOTA', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (603, '060602', 'ANGUIA', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (604, '060603', 'COCHABAMBA', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (605, '060604', 'CONCHAN', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (606, '060605', 'CHADIN', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (607, '060606', 'CHIGUIRIP', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (608, '060607', 'CHIMBAN', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (609, '060608', 'HUAMBOS', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (610, '060609', 'LAJAS', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (611, '060610', 'LLAMA', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (612, '060611', 'MIRACOSTA', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (613, '060612', 'PACCHA', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (614, '060613', 'PION', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (615, '060614', 'QUEROCOTO', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (616, '060615', 'TACABAMBA', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (617, '060616', 'TOCMOCHE', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (618, '060617', 'SAN JUAN DE LICUPIS', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (619, '060618', 'CHOROPAMPA', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (620, '060619', 'CHALAMARCA', NULL, 59, NULL);
INSERT INTO "param"."t28_distritos" VALUES (621, '060701', 'BAMBAMARCA', NULL, 60, NULL);
INSERT INTO "param"."t28_distritos" VALUES (622, '060702', 'CHUGUR', NULL, 60, NULL);
INSERT INTO "param"."t28_distritos" VALUES (623, '060703', 'HUALGAYOC', NULL, 60, NULL);
INSERT INTO "param"."t28_distritos" VALUES (624, '060801', 'JAEN', NULL, 61, NULL);
INSERT INTO "param"."t28_distritos" VALUES (625, '060802', 'BELLAVISTA', NULL, 61, NULL);
INSERT INTO "param"."t28_distritos" VALUES (626, '060803', 'COLASAY', NULL, 61, NULL);
INSERT INTO "param"."t28_distritos" VALUES (627, '060804', 'CHONTALI', NULL, 61, NULL);
INSERT INTO "param"."t28_distritos" VALUES (628, '060805', 'POMAHUACA', NULL, 61, NULL);
INSERT INTO "param"."t28_distritos" VALUES (629, '060806', 'PUCARA', NULL, 61, NULL);
INSERT INTO "param"."t28_distritos" VALUES (630, '060807', 'SALLIQUE', NULL, 61, NULL);
INSERT INTO "param"."t28_distritos" VALUES (631, '060808', 'SAN FELIPE', NULL, 61, NULL);
INSERT INTO "param"."t28_distritos" VALUES (632, '060809', 'SAN JOSE DEL ALTO', NULL, 61, NULL);
INSERT INTO "param"."t28_distritos" VALUES (633, '060810', 'SANTA ROSA', NULL, 61, NULL);
INSERT INTO "param"."t28_distritos" VALUES (634, '060811', 'LAS PIRIAS', NULL, 61, NULL);
INSERT INTO "param"."t28_distritos" VALUES (635, '060812', 'HUABAL', NULL, 61, NULL);
INSERT INTO "param"."t28_distritos" VALUES (636, '060901', 'SANTA CRUZ', NULL, 62, NULL);
INSERT INTO "param"."t28_distritos" VALUES (637, '060902', 'CATACHE', NULL, 62, NULL);
INSERT INTO "param"."t28_distritos" VALUES (638, '060903', 'CHANCAIBANOS', NULL, 62, NULL);
INSERT INTO "param"."t28_distritos" VALUES (639, '060904', 'LA ESPERANZA', NULL, 62, NULL);
INSERT INTO "param"."t28_distritos" VALUES (640, '060905', 'NINABAMBA', NULL, 62, NULL);
INSERT INTO "param"."t28_distritos" VALUES (641, '060906', 'PULAN', NULL, 62, NULL);
INSERT INTO "param"."t28_distritos" VALUES (642, '060907', 'SEXI', NULL, 62, NULL);
INSERT INTO "param"."t28_distritos" VALUES (643, '060908', 'UTICYACU', NULL, 62, NULL);
INSERT INTO "param"."t28_distritos" VALUES (644, '060909', 'YAUYUCAN', NULL, 62, NULL);
INSERT INTO "param"."t28_distritos" VALUES (645, '060910', 'ANDABAMBA', NULL, 62, NULL);
INSERT INTO "param"."t28_distritos" VALUES (646, '060911', 'SAUCEPAMPA', NULL, 62, NULL);
INSERT INTO "param"."t28_distritos" VALUES (647, '061001', 'SAN MIGUEL', NULL, 63, NULL);
INSERT INTO "param"."t28_distritos" VALUES (648, '061002', 'CALQUIS', NULL, 63, NULL);
INSERT INTO "param"."t28_distritos" VALUES (649, '061003', 'LA FLORIDA', NULL, 63, NULL);
INSERT INTO "param"."t28_distritos" VALUES (650, '061004', 'LLAPA', NULL, 63, NULL);
INSERT INTO "param"."t28_distritos" VALUES (651, '061005', 'NANCHOC', NULL, 63, NULL);
INSERT INTO "param"."t28_distritos" VALUES (652, '061006', 'NIEPOS', NULL, 63, NULL);
INSERT INTO "param"."t28_distritos" VALUES (653, '061007', 'SAN GREGORIO', NULL, 63, NULL);
INSERT INTO "param"."t28_distritos" VALUES (654, '061008', 'SAN SILVESTRE DE COCHAN', NULL, 63, NULL);
INSERT INTO "param"."t28_distritos" VALUES (655, '061009', 'EL PRADO', NULL, 63, NULL);
INSERT INTO "param"."t28_distritos" VALUES (656, '061010', 'UNION AGUA BLANCA', NULL, 63, NULL);
INSERT INTO "param"."t28_distritos" VALUES (657, '061011', 'TONGOD', NULL, 63, NULL);
INSERT INTO "param"."t28_distritos" VALUES (658, '061012', 'CATILLUC', NULL, 63, NULL);
INSERT INTO "param"."t28_distritos" VALUES (659, '061013', 'BOLIVAR', NULL, 63, NULL);
INSERT INTO "param"."t28_distritos" VALUES (660, '061101', 'SAN IGNACIO', NULL, 64, NULL);
INSERT INTO "param"."t28_distritos" VALUES (661, '061102', 'CHIRINOS', NULL, 64, NULL);
INSERT INTO "param"."t28_distritos" VALUES (662, '061103', 'HUARANGO', NULL, 64, NULL);
INSERT INTO "param"."t28_distritos" VALUES (663, '061104', 'NAMBALLE', NULL, 64, NULL);
INSERT INTO "param"."t28_distritos" VALUES (664, '061105', 'LA COIPA', NULL, 64, NULL);
INSERT INTO "param"."t28_distritos" VALUES (665, '061106', 'SAN JOSE DE LOURDES', NULL, 64, NULL);
INSERT INTO "param"."t28_distritos" VALUES (666, '061107', 'TABACONAS', NULL, 64, NULL);
INSERT INTO "param"."t28_distritos" VALUES (667, '061201', 'PEDRO GALVEZ', NULL, 65, NULL);
INSERT INTO "param"."t28_distritos" VALUES (668, '061202', 'ICHOCAN', NULL, 65, NULL);
INSERT INTO "param"."t28_distritos" VALUES (669, '061203', 'GREGORIO PITA', NULL, 65, NULL);
INSERT INTO "param"."t28_distritos" VALUES (670, '061204', 'JOSE MANUEL QUIROZ', NULL, 65, NULL);
INSERT INTO "param"."t28_distritos" VALUES (671, '061205', 'EDUARDO VILLANUEVA', NULL, 65, NULL);
INSERT INTO "param"."t28_distritos" VALUES (672, '061206', 'JOSE SABOGAL', NULL, 65, NULL);
INSERT INTO "param"."t28_distritos" VALUES (673, '061207', 'CHANCAY', NULL, 65, NULL);
INSERT INTO "param"."t28_distritos" VALUES (674, '061301', 'SAN PABLO', NULL, 66, NULL);
INSERT INTO "param"."t28_distritos" VALUES (675, '061302', 'SAN BERNARDINO', NULL, 66, NULL);
INSERT INTO "param"."t28_distritos" VALUES (676, '061303', 'SAN LUIS', NULL, 66, NULL);
INSERT INTO "param"."t28_distritos" VALUES (677, '061304', 'TUMBADEN', NULL, 66, NULL);
INSERT INTO "param"."t28_distritos" VALUES (678, '070101', 'CUSCO', NULL, 67, NULL);
INSERT INTO "param"."t28_distritos" VALUES (679, '070102', 'CCORCA', NULL, 67, NULL);
INSERT INTO "param"."t28_distritos" VALUES (680, '070103', 'POROY', NULL, 67, NULL);
INSERT INTO "param"."t28_distritos" VALUES (681, '070104', 'SAN JERONIMO', NULL, 67, NULL);
INSERT INTO "param"."t28_distritos" VALUES (682, '070105', 'SAN SEBASTIAN', NULL, 67, NULL);
INSERT INTO "param"."t28_distritos" VALUES (683, '070106', 'SANTIAGO', NULL, 67, NULL);
INSERT INTO "param"."t28_distritos" VALUES (684, '070107', 'SAYLLA', NULL, 67, NULL);
INSERT INTO "param"."t28_distritos" VALUES (685, '070108', 'WANCHAQ', NULL, 67, NULL);
INSERT INTO "param"."t28_distritos" VALUES (686, '070201', 'ACOMAYO', NULL, 68, NULL);
INSERT INTO "param"."t28_distritos" VALUES (687, '070202', 'ACOPIA', NULL, 68, NULL);
INSERT INTO "param"."t28_distritos" VALUES (688, '070203', 'ACOS', NULL, 68, NULL);
INSERT INTO "param"."t28_distritos" VALUES (689, '070204', 'POMACANCHI', NULL, 68, NULL);
INSERT INTO "param"."t28_distritos" VALUES (690, '070205', 'RONDOCAN', NULL, 68, NULL);
INSERT INTO "param"."t28_distritos" VALUES (691, '070206', 'SANGARARA', NULL, 68, NULL);
INSERT INTO "param"."t28_distritos" VALUES (692, '070207', 'MOSOC LLACTA', NULL, 68, NULL);
INSERT INTO "param"."t28_distritos" VALUES (693, '070301', 'ANTA', NULL, 69, NULL);
INSERT INTO "param"."t28_distritos" VALUES (694, '070302', 'CHINCHAYPUJIO', NULL, 69, NULL);
INSERT INTO "param"."t28_distritos" VALUES (695, '070303', 'HUAROCONDO', NULL, 69, NULL);
INSERT INTO "param"."t28_distritos" VALUES (696, '070304', 'LIMATAMBO', NULL, 69, NULL);
INSERT INTO "param"."t28_distritos" VALUES (697, '070305', 'MOLLEPATA', NULL, 69, NULL);
INSERT INTO "param"."t28_distritos" VALUES (698, '070306', 'PUCYURA', NULL, 69, NULL);
INSERT INTO "param"."t28_distritos" VALUES (699, '070307', 'ZURITE', NULL, 69, NULL);
INSERT INTO "param"."t28_distritos" VALUES (700, '070308', 'CACHIMAYO', NULL, 69, NULL);
INSERT INTO "param"."t28_distritos" VALUES (701, '070309', 'ANCAHUASI', NULL, 69, NULL);
INSERT INTO "param"."t28_distritos" VALUES (702, '070401', 'CALCA', NULL, 70, NULL);
INSERT INTO "param"."t28_distritos" VALUES (703, '070402', 'COYA', NULL, 70, NULL);
INSERT INTO "param"."t28_distritos" VALUES (704, '070403', 'LAMAY', NULL, 70, NULL);
INSERT INTO "param"."t28_distritos" VALUES (705, '070404', 'LARES', NULL, 70, NULL);
INSERT INTO "param"."t28_distritos" VALUES (706, '070405', 'PISAC', NULL, 70, NULL);
INSERT INTO "param"."t28_distritos" VALUES (707, '070406', 'SAN SALVADOR', NULL, 70, NULL);
INSERT INTO "param"."t28_distritos" VALUES (708, '070407', 'TARAY', NULL, 70, NULL);
INSERT INTO "param"."t28_distritos" VALUES (709, '070408', 'YANATILE', NULL, 70, NULL);
INSERT INTO "param"."t28_distritos" VALUES (710, '070501', 'YANAOCA', NULL, 71, NULL);
INSERT INTO "param"."t28_distritos" VALUES (711, '070502', 'CHECCA', NULL, 71, NULL);
INSERT INTO "param"."t28_distritos" VALUES (712, '070503', 'KUNTURKANKI', NULL, 71, NULL);
INSERT INTO "param"."t28_distritos" VALUES (713, '070504', 'LANGUI', NULL, 71, NULL);
INSERT INTO "param"."t28_distritos" VALUES (714, '070505', 'LAYO', NULL, 71, NULL);
INSERT INTO "param"."t28_distritos" VALUES (715, '070506', 'PAMPAMARCA', NULL, 71, NULL);
INSERT INTO "param"."t28_distritos" VALUES (716, '070507', 'QUEHUE', NULL, 71, NULL);
INSERT INTO "param"."t28_distritos" VALUES (717, '070508', 'TUPAC AMARU', NULL, 71, NULL);
INSERT INTO "param"."t28_distritos" VALUES (718, '070601', 'SICUANI', NULL, 72, NULL);
INSERT INTO "param"."t28_distritos" VALUES (719, '070602', 'COMBAPATA', NULL, 72, NULL);
INSERT INTO "param"."t28_distritos" VALUES (720, '070603', 'CHECACUPE', NULL, 72, NULL);
INSERT INTO "param"."t28_distritos" VALUES (721, '070604', 'MARANGANI', NULL, 72, NULL);
INSERT INTO "param"."t28_distritos" VALUES (722, '070605', 'PITUMARCA', NULL, 72, NULL);
INSERT INTO "param"."t28_distritos" VALUES (723, '070606', 'SAN PABLO', NULL, 72, NULL);
INSERT INTO "param"."t28_distritos" VALUES (724, '070607', 'SAN PEDRO', NULL, 72, NULL);
INSERT INTO "param"."t28_distritos" VALUES (725, '070608', 'TINTA', NULL, 72, NULL);
INSERT INTO "param"."t28_distritos" VALUES (726, '070701', 'SANTO TOMAS', NULL, 73, NULL);
INSERT INTO "param"."t28_distritos" VALUES (727, '070702', 'CAPACMARCA', NULL, 73, NULL);
INSERT INTO "param"."t28_distritos" VALUES (728, '070703', 'COLQUEMARCA', NULL, 73, NULL);
INSERT INTO "param"."t28_distritos" VALUES (729, '070704', 'CHAMACA', NULL, 73, NULL);
INSERT INTO "param"."t28_distritos" VALUES (730, '070705', 'LIVITACA', NULL, 73, NULL);
INSERT INTO "param"."t28_distritos" VALUES (731, '070706', 'LLUSCO', NULL, 73, NULL);
INSERT INTO "param"."t28_distritos" VALUES (732, '070707', 'QUINOTA', NULL, 73, NULL);
INSERT INTO "param"."t28_distritos" VALUES (733, '070708', 'VELILLE', NULL, 73, NULL);
INSERT INTO "param"."t28_distritos" VALUES (734, '070801', 'ESPINAR', NULL, 74, NULL);
INSERT INTO "param"."t28_distritos" VALUES (735, '070802', 'CONDOROMA', NULL, 74, NULL);
INSERT INTO "param"."t28_distritos" VALUES (736, '070803', 'COPORAQUE', NULL, 74, NULL);
INSERT INTO "param"."t28_distritos" VALUES (737, '070804', 'OCORURO', NULL, 74, NULL);
INSERT INTO "param"."t28_distritos" VALUES (738, '070805', 'PALLPATA', NULL, 74, NULL);
INSERT INTO "param"."t28_distritos" VALUES (739, '070806', 'PICHIGUA', NULL, 74, NULL);
INSERT INTO "param"."t28_distritos" VALUES (740, '070807', 'SUYKUTAMBO', NULL, 74, NULL);
INSERT INTO "param"."t28_distritos" VALUES (741, '070808', 'ALTO PICHIGUA', NULL, 74, NULL);
INSERT INTO "param"."t28_distritos" VALUES (742, '070901', 'SANTA ANA', NULL, 75, NULL);
INSERT INTO "param"."t28_distritos" VALUES (743, '070902', 'ECHARATE', NULL, 75, NULL);
INSERT INTO "param"."t28_distritos" VALUES (744, '070903', 'HUAYOPATA', NULL, 75, NULL);
INSERT INTO "param"."t28_distritos" VALUES (745, '070904', 'MARANURA', NULL, 75, NULL);
INSERT INTO "param"."t28_distritos" VALUES (746, '070905', 'OCOBAMBA', NULL, 75, NULL);
INSERT INTO "param"."t28_distritos" VALUES (747, '070906', 'SANTA TERESA', NULL, 75, NULL);
INSERT INTO "param"."t28_distritos" VALUES (748, '070907', 'VILCABAMBA', NULL, 75, NULL);
INSERT INTO "param"."t28_distritos" VALUES (749, '070908', 'QUELLOUNO', NULL, 75, NULL);
INSERT INTO "param"."t28_distritos" VALUES (750, '070909', 'KIMBIRI', NULL, 75, NULL);
INSERT INTO "param"."t28_distritos" VALUES (751, '070910', 'PICHARI', NULL, 75, NULL);
INSERT INTO "param"."t28_distritos" VALUES (752, '071001', 'PARURO', NULL, 76, NULL);
INSERT INTO "param"."t28_distritos" VALUES (753, '071002', 'ACCHA', NULL, 76, NULL);
INSERT INTO "param"."t28_distritos" VALUES (754, '071003', 'CCAPI', NULL, 76, NULL);
INSERT INTO "param"."t28_distritos" VALUES (755, '071004', 'COLCHA', NULL, 76, NULL);
INSERT INTO "param"."t28_distritos" VALUES (756, '071005', 'HUANOQUITE', NULL, 76, NULL);
INSERT INTO "param"."t28_distritos" VALUES (757, '071006', 'OMACHA', NULL, 76, NULL);
INSERT INTO "param"."t28_distritos" VALUES (758, '071007', 'YAURISQUE', NULL, 76, NULL);
INSERT INTO "param"."t28_distritos" VALUES (759, '071008', 'PACCARITAMBO', NULL, 76, NULL);
INSERT INTO "param"."t28_distritos" VALUES (760, '071009', 'PILLPINTO', NULL, 76, NULL);
INSERT INTO "param"."t28_distritos" VALUES (761, '071101', 'PAUCARTAMBO', NULL, 77, NULL);
INSERT INTO "param"."t28_distritos" VALUES (762, '071102', 'CAICAY', NULL, 77, NULL);
INSERT INTO "param"."t28_distritos" VALUES (763, '071103', 'COLQUEPATA', NULL, 77, NULL);
INSERT INTO "param"."t28_distritos" VALUES (764, '071104', 'CHALLABAMBA', NULL, 77, NULL);
INSERT INTO "param"."t28_distritos" VALUES (765, '071105', 'COSNIPATA', NULL, 77, NULL);
INSERT INTO "param"."t28_distritos" VALUES (766, '071106', 'HUANCARANI', NULL, 77, NULL);
INSERT INTO "param"."t28_distritos" VALUES (767, '071201', 'URCOS', NULL, 78, NULL);
INSERT INTO "param"."t28_distritos" VALUES (768, '071202', 'ANDAHUAYLILLAS', NULL, 78, NULL);
INSERT INTO "param"."t28_distritos" VALUES (769, '071203', 'CAMANTI', NULL, 78, NULL);
INSERT INTO "param"."t28_distritos" VALUES (770, '071204', 'CCARHUAYO', NULL, 78, NULL);
INSERT INTO "param"."t28_distritos" VALUES (771, '071205', 'CCATCA', NULL, 78, NULL);
INSERT INTO "param"."t28_distritos" VALUES (772, '071206', 'CUSIPATA', NULL, 78, NULL);
INSERT INTO "param"."t28_distritos" VALUES (773, '071207', 'HUARO', NULL, 78, NULL);
INSERT INTO "param"."t28_distritos" VALUES (774, '071208', 'LUCRE', NULL, 78, NULL);
INSERT INTO "param"."t28_distritos" VALUES (775, '071209', 'MARCAPATA', NULL, 78, NULL);
INSERT INTO "param"."t28_distritos" VALUES (776, '071210', 'OCONGATE', NULL, 78, NULL);
INSERT INTO "param"."t28_distritos" VALUES (777, '071211', 'OROPESA', NULL, 78, NULL);
INSERT INTO "param"."t28_distritos" VALUES (778, '071212', 'QUIQUIJANA', NULL, 78, NULL);
INSERT INTO "param"."t28_distritos" VALUES (779, '071301', 'URUBAMBA', NULL, 79, NULL);
INSERT INTO "param"."t28_distritos" VALUES (780, '071302', 'CHINCHERO', NULL, 79, NULL);
INSERT INTO "param"."t28_distritos" VALUES (781, '071303', 'HUAYLLABAMBA', NULL, 79, NULL);
INSERT INTO "param"."t28_distritos" VALUES (782, '071304', 'MACHUPICCHU', NULL, 79, NULL);
INSERT INTO "param"."t28_distritos" VALUES (783, '071305', 'MARAS', NULL, 79, NULL);
INSERT INTO "param"."t28_distritos" VALUES (784, '071306', 'OLLANTAYTAMBO', NULL, 79, NULL);
INSERT INTO "param"."t28_distritos" VALUES (785, '071307', 'YUCAY', NULL, 79, NULL);
INSERT INTO "param"."t28_distritos" VALUES (786, '080101', 'HUANCAVELICA', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (787, '080102', 'ACOBAMBILLA', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (788, '080103', 'ACORIA', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (789, '080104', 'CONAYCA', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (790, '080105', 'CUENCA', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (791, '080106', 'HUACHOCOLPA', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (792, '080108', 'HUAYLLAHUARA', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (793, '080109', 'IZCUCHACA', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (794, '080110', 'LARIA', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (795, '080111', 'MANTA', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (796, '080112', 'MARISCAL CACERES', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (797, '080113', 'MOYA', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (798, '080114', 'NUEVO OCCORO', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (799, '080115', 'PALCA', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (800, '080116', 'PILCHACA', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (801, '080117', 'VILCA', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (802, '080118', 'YAULI', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (803, '080119', 'ASCENCION', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (804, '080120', 'HUANDO', NULL, 80, NULL);
INSERT INTO "param"."t28_distritos" VALUES (805, '080201', 'ACOBAMBA', NULL, 81, NULL);
INSERT INTO "param"."t28_distritos" VALUES (806, '080202', 'ANTA', NULL, 81, NULL);
INSERT INTO "param"."t28_distritos" VALUES (807, '080203', 'ANDABAMBA', NULL, 81, NULL);
INSERT INTO "param"."t28_distritos" VALUES (808, '080204', 'CAJA', NULL, 81, NULL);
INSERT INTO "param"."t28_distritos" VALUES (809, '080205', 'MARCAS', NULL, 81, NULL);
INSERT INTO "param"."t28_distritos" VALUES (810, '080206', 'PAUCARA', NULL, 81, NULL);
INSERT INTO "param"."t28_distritos" VALUES (811, '080207', 'POMACOCHA', NULL, 81, NULL);
INSERT INTO "param"."t28_distritos" VALUES (812, '080208', 'ROSARIO', NULL, 81, NULL);
INSERT INTO "param"."t28_distritos" VALUES (813, '080301', 'LIRCAY', NULL, 82, NULL);
INSERT INTO "param"."t28_distritos" VALUES (814, '080302', 'ANCHONGA', NULL, 82, NULL);
INSERT INTO "param"."t28_distritos" VALUES (815, '080303', 'CALLANMARCA', NULL, 82, NULL);
INSERT INTO "param"."t28_distritos" VALUES (816, '080304', 'CONGALLA', NULL, 82, NULL);
INSERT INTO "param"."t28_distritos" VALUES (817, '080305', 'CHINCHO', NULL, 82, NULL);
INSERT INTO "param"."t28_distritos" VALUES (818, '080306', 'HUAYLLAY GRANDE', NULL, 82, NULL);
INSERT INTO "param"."t28_distritos" VALUES (819, '080307', 'HUANCA HUANCA', NULL, 82, NULL);
INSERT INTO "param"."t28_distritos" VALUES (820, '080308', 'JULCAMARCA', NULL, 82, NULL);
INSERT INTO "param"."t28_distritos" VALUES (821, '080309', 'SAN ANTONIO DE ANTAPARCO', NULL, 82, NULL);
INSERT INTO "param"."t28_distritos" VALUES (822, '080310', 'STO TOMAS DE PATA', NULL, 82, NULL);
INSERT INTO "param"."t28_distritos" VALUES (823, '080311', 'SECCLLA', NULL, 82, NULL);
INSERT INTO "param"."t28_distritos" VALUES (824, '080312', 'CCOCHACCASA', NULL, 82, NULL);
INSERT INTO "param"."t28_distritos" VALUES (825, '080401', 'CASTROVIRREYNA', NULL, 83, NULL);
INSERT INTO "param"."t28_distritos" VALUES (826, '080402', 'ARMA', NULL, 83, NULL);
INSERT INTO "param"."t28_distritos" VALUES (827, '080403', 'AURAHUA', NULL, 83, NULL);
INSERT INTO "param"."t28_distritos" VALUES (828, '080405', 'CAPILLAS', NULL, 83, NULL);
INSERT INTO "param"."t28_distritos" VALUES (829, '080406', 'COCAS', NULL, 83, NULL);
INSERT INTO "param"."t28_distritos" VALUES (830, '080408', 'CHUPAMARCA', NULL, 83, NULL);
INSERT INTO "param"."t28_distritos" VALUES (831, '080409', 'HUACHOS', NULL, 83, NULL);
INSERT INTO "param"."t28_distritos" VALUES (832, '080410', 'HUAMATAMBO', NULL, 83, NULL);
INSERT INTO "param"."t28_distritos" VALUES (833, '080414', 'MOLLEPAMPA', NULL, 83, NULL);
INSERT INTO "param"."t28_distritos" VALUES (834, '080422', 'SAN JUAN', NULL, 83, NULL);
INSERT INTO "param"."t28_distritos" VALUES (835, '080427', 'TANTARA', NULL, 83, NULL);
INSERT INTO "param"."t28_distritos" VALUES (836, '080428', 'TICRAPO', NULL, 83, NULL);
INSERT INTO "param"."t28_distritos" VALUES (837, '080429', 'SANTA ANA', NULL, 83, NULL);
INSERT INTO "param"."t28_distritos" VALUES (838, '080501', 'PAMPAS', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (839, '080502', 'ACOSTAMBO', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (840, '080503', 'ACRAQUIA', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (841, '080504', 'AHUAYCHA', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (842, '080506', 'COLCABAMBA', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (843, '080509', 'DANIEL HERNANDEZ', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (844, '080511', 'HUACHOCOLPA', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (845, '080512', 'HUARIBAMBA', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (846, '080515', 'NAHUIMPUQUIO', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (847, '080517', 'PAZOS', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (848, '080518', 'QUISHUAR', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (849, '080519', 'SALCABAMBA', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (850, '080520', 'SAN MARCOS DE ROCCHAC', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (851, '080523', 'SURCUBAMBA', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (852, '080525', 'TINTAY PUNCU', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (853, '080526', 'SALCAHUASI', NULL, 84, NULL);
INSERT INTO "param"."t28_distritos" VALUES (854, '080601', 'AYAVI', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (855, '080602', 'CORDOVA', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (856, '080603', 'HUAYACUNDO ARMA', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (857, '080604', 'HUAYTARA', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (858, '080605', 'LARAMARCA', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (859, '080606', 'OCOYO', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (860, '080607', 'PILPICHACA', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (861, '080608', 'QUERCO', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (862, '080609', 'QUITO ARMA', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (863, '080610', 'SAN ANTONIO DE CUSICANCHA', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (864, '080611', 'SAN FRANCISCO DE SANGAYAICO', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (865, '080612', 'SAN ISIDRO', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (866, '080613', 'SANTIAGO DE CHOCORVOS', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (867, '080614', 'SANTIAGO DE QUIRAHUARA', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (868, '080615', 'SANTO DOMINGO DE CAPILLA', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (869, '080616', 'TAMBO', NULL, 85, NULL);
INSERT INTO "param"."t28_distritos" VALUES (870, '080701', 'CHURCAMPA', NULL, 86, NULL);
INSERT INTO "param"."t28_distritos" VALUES (871, '080702', 'ANCO', NULL, 86, NULL);
INSERT INTO "param"."t28_distritos" VALUES (872, '080703', 'CHINCHIHUASI', NULL, 86, NULL);
INSERT INTO "param"."t28_distritos" VALUES (873, '080704', 'EL CARMEN', NULL, 86, NULL);
INSERT INTO "param"."t28_distritos" VALUES (874, '080705', 'LA MERCED', NULL, 86, NULL);
INSERT INTO "param"."t28_distritos" VALUES (875, '080706', 'LOCROJA', NULL, 86, NULL);
INSERT INTO "param"."t28_distritos" VALUES (876, '080707', 'PAUCARBAMBA', NULL, 86, NULL);
INSERT INTO "param"."t28_distritos" VALUES (877, '080708', 'SAN MIGUEL DE MAYOC', NULL, 86, NULL);
INSERT INTO "param"."t28_distritos" VALUES (878, '080709', 'SAN PEDRO DE CORIS', NULL, 86, NULL);
INSERT INTO "param"."t28_distritos" VALUES (879, '080710', 'PACHAMARCA', NULL, 86, NULL);
INSERT INTO "param"."t28_distritos" VALUES (880, '090101', 'HUANUCO', NULL, 87, NULL);
INSERT INTO "param"."t28_distritos" VALUES (881, '090102', 'CHINCHAO', NULL, 87, NULL);
INSERT INTO "param"."t28_distritos" VALUES (882, '090103', 'CHURUBAMBA', NULL, 87, NULL);
INSERT INTO "param"."t28_distritos" VALUES (883, '090104', 'MARGOS', NULL, 87, NULL);
INSERT INTO "param"."t28_distritos" VALUES (884, '090105', 'QUISQUI', NULL, 87, NULL);
INSERT INTO "param"."t28_distritos" VALUES (885, '090106', 'SAN FCO DE CAYRAN', NULL, 87, NULL);
INSERT INTO "param"."t28_distritos" VALUES (886, '090107', 'SAN PEDRO DE CHAULAN', NULL, 87, NULL);
INSERT INTO "param"."t28_distritos" VALUES (887, '090108', 'STA MARIA DEL VALLE', NULL, 87, NULL);
INSERT INTO "param"."t28_distritos" VALUES (888, '090109', 'YARUMAYO', NULL, 87, NULL);
INSERT INTO "param"."t28_distritos" VALUES (889, '090110', 'AMARILIS', NULL, 87, NULL);
INSERT INTO "param"."t28_distritos" VALUES (890, '090111', 'PILLCO MARCA', NULL, 87, NULL);
INSERT INTO "param"."t28_distritos" VALUES (891, '090201', 'AMBO', NULL, 88, NULL);
INSERT INTO "param"."t28_distritos" VALUES (892, '090202', 'CAYNA', NULL, 88, NULL);
INSERT INTO "param"."t28_distritos" VALUES (893, '090203', 'COLPAS', NULL, 88, NULL);
INSERT INTO "param"."t28_distritos" VALUES (894, '090204', 'CONCHAMARCA', NULL, 88, NULL);
INSERT INTO "param"."t28_distritos" VALUES (895, '090205', 'HUACAR', NULL, 88, NULL);
INSERT INTO "param"."t28_distritos" VALUES (896, '090206', 'SAN FRANCISCO', NULL, 88, NULL);
INSERT INTO "param"."t28_distritos" VALUES (897, '090207', 'SAN RAFAEL', NULL, 88, NULL);
INSERT INTO "param"."t28_distritos" VALUES (898, '090208', 'TOMAY KICHWA', NULL, 88, NULL);
INSERT INTO "param"."t28_distritos" VALUES (899, '090301', 'LA UNION', NULL, 89, NULL);
INSERT INTO "param"."t28_distritos" VALUES (900, '090307', 'CHUQUIS', NULL, 89, NULL);
INSERT INTO "param"."t28_distritos" VALUES (901, '090312', 'MARIAS', NULL, 89, NULL);
INSERT INTO "param"."t28_distritos" VALUES (902, '090314', 'PACHAS', NULL, 89, NULL);
INSERT INTO "param"."t28_distritos" VALUES (903, '090316', 'QUIVILLA', NULL, 89, NULL);
INSERT INTO "param"."t28_distritos" VALUES (904, '090317', 'RIPAN', NULL, 89, NULL);
INSERT INTO "param"."t28_distritos" VALUES (905, '090321', 'SHUNQUI', NULL, 89, NULL);
INSERT INTO "param"."t28_distritos" VALUES (906, '090322', 'SILLAPATA', NULL, 89, NULL);
INSERT INTO "param"."t28_distritos" VALUES (907, '090323', 'YANAS', NULL, 89, NULL);
INSERT INTO "param"."t28_distritos" VALUES (908, '090401', 'LLATA', NULL, 90, NULL);
INSERT INTO "param"."t28_distritos" VALUES (909, '090402', 'ARANCAY', NULL, 90, NULL);
INSERT INTO "param"."t28_distritos" VALUES (910, '090403', 'CHAVIN DE PARIARCA', NULL, 90, NULL);
INSERT INTO "param"."t28_distritos" VALUES (911, '090404', 'JACAS GRANDE', NULL, 90, NULL);
INSERT INTO "param"."t28_distritos" VALUES (912, '090405', 'JIRCAN', NULL, 90, NULL);
INSERT INTO "param"."t28_distritos" VALUES (913, '090406', 'MIRAFLORES', NULL, 90, NULL);
INSERT INTO "param"."t28_distritos" VALUES (914, '090407', 'MONZON', NULL, 90, NULL);
INSERT INTO "param"."t28_distritos" VALUES (915, '090408', 'PUNCHAO', NULL, 90, NULL);
INSERT INTO "param"."t28_distritos" VALUES (916, '090409', 'PUNOS', NULL, 90, NULL);
INSERT INTO "param"."t28_distritos" VALUES (917, '090410', 'SINGA', NULL, 90, NULL);
INSERT INTO "param"."t28_distritos" VALUES (918, '090411', 'TANTAMAYO', NULL, 90, NULL);
INSERT INTO "param"."t28_distritos" VALUES (919, '090501', 'HUACRACHUCO', NULL, 91, NULL);
INSERT INTO "param"."t28_distritos" VALUES (920, '090502', 'CHOLON', NULL, 91, NULL);
INSERT INTO "param"."t28_distritos" VALUES (921, '090505', 'SAN BUENAVENTURA', NULL, 91, NULL);
INSERT INTO "param"."t28_distritos" VALUES (922, '090601', 'RUPA RUPA', NULL, 92, NULL);
INSERT INTO "param"."t28_distritos" VALUES (923, '090602', 'DANIEL ALOMIA ROBLES', NULL, 92, NULL);
INSERT INTO "param"."t28_distritos" VALUES (924, '090603', 'HERMILIO VALDIZAN', NULL, 92, NULL);
INSERT INTO "param"."t28_distritos" VALUES (925, '090604', 'LUYANDO', NULL, 92, NULL);
INSERT INTO "param"."t28_distritos" VALUES (926, '090605', 'MARIANO DAMASO BERAUN', NULL, 92, NULL);
INSERT INTO "param"."t28_distritos" VALUES (927, '090606', 'JOSE CRESPO Y CASTILLO', NULL, 92, NULL);
INSERT INTO "param"."t28_distritos" VALUES (928, '090701', 'PANAO', NULL, 93, NULL);
INSERT INTO "param"."t28_distritos" VALUES (929, '090702', 'CHAGLLA', NULL, 93, NULL);
INSERT INTO "param"."t28_distritos" VALUES (930, '090704', 'MOLINO', NULL, 93, NULL);
INSERT INTO "param"."t28_distritos" VALUES (931, '090706', 'UMARI', NULL, 93, NULL);
INSERT INTO "param"."t28_distritos" VALUES (932, '090801', 'HONORIA', NULL, 94, NULL);
INSERT INTO "param"."t28_distritos" VALUES (933, '090802', 'PUERTO INCA', NULL, 94, NULL);
INSERT INTO "param"."t28_distritos" VALUES (934, '090803', 'CODO DEL POZUZO', NULL, 94, NULL);
INSERT INTO "param"."t28_distritos" VALUES (935, '090804', 'TOURNAVISTA', NULL, 94, NULL);
INSERT INTO "param"."t28_distritos" VALUES (936, '090805', 'YUYAPICHIS', NULL, 94, NULL);
INSERT INTO "param"."t28_distritos" VALUES (937, '090901', 'HUACAYBAMBA', NULL, 95, NULL);
INSERT INTO "param"."t28_distritos" VALUES (938, '090902', 'PINRA', NULL, 95, NULL);
INSERT INTO "param"."t28_distritos" VALUES (939, '090903', 'CANCHABAMBA', NULL, 95, NULL);
INSERT INTO "param"."t28_distritos" VALUES (940, '090904', 'COCHABAMBA', NULL, 95, NULL);
INSERT INTO "param"."t28_distritos" VALUES (941, '091001', 'JESUS', NULL, 96, NULL);
INSERT INTO "param"."t28_distritos" VALUES (942, '091002', 'BANOS', NULL, 96, NULL);
INSERT INTO "param"."t28_distritos" VALUES (943, '091003', 'SAN FRANCISCO DE ASIS', NULL, 96, NULL);
INSERT INTO "param"."t28_distritos" VALUES (944, '091004', 'QUEROPALCA', NULL, 96, NULL);
INSERT INTO "param"."t28_distritos" VALUES (945, '091005', 'SAN MIGUEL DE CAURI', NULL, 96, NULL);
INSERT INTO "param"."t28_distritos" VALUES (946, '091006', 'RONDOS', NULL, 96, NULL);
INSERT INTO "param"."t28_distritos" VALUES (947, '091007', 'JIVIA', NULL, 96, NULL);
INSERT INTO "param"."t28_distritos" VALUES (948, '091101', 'CHAVINILLO', NULL, 97, NULL);
INSERT INTO "param"."t28_distritos" VALUES (949, '091102', 'APARICIO POMARES (CHUPAN)', NULL, 97, NULL);
INSERT INTO "param"."t28_distritos" VALUES (950, '091103', 'CAHUAC', NULL, 97, NULL);
INSERT INTO "param"."t28_distritos" VALUES (951, '091104', 'CHACABAMBA', NULL, 97, NULL);
INSERT INTO "param"."t28_distritos" VALUES (952, '091105', 'JACAS CHICO', NULL, 97, NULL);
INSERT INTO "param"."t28_distritos" VALUES (953, '091106', 'OBAS', NULL, 97, NULL);
INSERT INTO "param"."t28_distritos" VALUES (954, '091107', 'PAMPAMARCA', NULL, 97, NULL);
INSERT INTO "param"."t28_distritos" VALUES (955, '091108', 'CHORAS                   ', NULL, 97, NULL);
INSERT INTO "param"."t28_distritos" VALUES (956, '100101', 'ICA', NULL, 98, NULL);
INSERT INTO "param"."t28_distritos" VALUES (957, '100102', 'LA TINGUINA', NULL, 98, NULL);
INSERT INTO "param"."t28_distritos" VALUES (958, '100103', 'LOS AQUIJES', NULL, 98, NULL);
INSERT INTO "param"."t28_distritos" VALUES (959, '100104', 'PARCONA', NULL, 98, NULL);
INSERT INTO "param"."t28_distritos" VALUES (960, '100105', 'PUEBLO NUEVO', NULL, 98, NULL);
INSERT INTO "param"."t28_distritos" VALUES (961, '100106', 'SALAS', NULL, 98, NULL);
INSERT INTO "param"."t28_distritos" VALUES (962, '100107', 'SAN JOSE DE LOS MOLINOS', NULL, 98, NULL);
INSERT INTO "param"."t28_distritos" VALUES (963, '100108', 'SAN JUAN BAUTISTA', NULL, 98, NULL);
INSERT INTO "param"."t28_distritos" VALUES (964, '100109', 'SANTIAGO', NULL, 98, NULL);
INSERT INTO "param"."t28_distritos" VALUES (965, '100110', 'SUBTANJALLA', NULL, 98, NULL);
INSERT INTO "param"."t28_distritos" VALUES (966, '100111', 'YAUCA DEL ROSARIO', NULL, 98, NULL);
INSERT INTO "param"."t28_distritos" VALUES (967, '100112', 'TATE', NULL, 98, NULL);
INSERT INTO "param"."t28_distritos" VALUES (968, '100113', 'PACHACUTEC', NULL, 98, NULL);
INSERT INTO "param"."t28_distritos" VALUES (969, '100114', 'OCUCAJE', NULL, 98, NULL);
INSERT INTO "param"."t28_distritos" VALUES (970, '100201', 'CHINCHA ALTA', NULL, 99, NULL);
INSERT INTO "param"."t28_distritos" VALUES (971, '100202', 'CHAVIN', NULL, 99, NULL);
INSERT INTO "param"."t28_distritos" VALUES (972, '100203', 'CHINCHA BAJA', NULL, 99, NULL);
INSERT INTO "param"."t28_distritos" VALUES (973, '100204', 'EL CARMEN', NULL, 99, NULL);
INSERT INTO "param"."t28_distritos" VALUES (974, '100205', 'GROCIO PRADO', NULL, 99, NULL);
INSERT INTO "param"."t28_distritos" VALUES (975, '100206', 'SAN PEDRO DE HUACARPANA', NULL, 99, NULL);
INSERT INTO "param"."t28_distritos" VALUES (976, '100207', 'SUNAMPE', NULL, 99, NULL);
INSERT INTO "param"."t28_distritos" VALUES (977, '100208', 'TAMBO DE MORA', NULL, 99, NULL);
INSERT INTO "param"."t28_distritos" VALUES (978, '100209', 'ALTO LARAN', NULL, 99, NULL);
INSERT INTO "param"."t28_distritos" VALUES (979, '100210', 'PUEBLO NUEVO', NULL, 99, NULL);
INSERT INTO "param"."t28_distritos" VALUES (980, '100211', 'SAN JUAN DE YANAC', NULL, 99, NULL);
INSERT INTO "param"."t28_distritos" VALUES (981, '100301', 'NAZCA', NULL, 100, NULL);
INSERT INTO "param"."t28_distritos" VALUES (982, '100302', 'CHANGUILLO', NULL, 100, NULL);
INSERT INTO "param"."t28_distritos" VALUES (983, '100303', 'EL INGENIO', NULL, 100, NULL);
INSERT INTO "param"."t28_distritos" VALUES (984, '100304', 'MARCONA', NULL, 100, NULL);
INSERT INTO "param"."t28_distritos" VALUES (985, '100305', 'VISTA ALEGRE', NULL, 100, NULL);
INSERT INTO "param"."t28_distritos" VALUES (986, '100401', 'PISCO', NULL, 101, NULL);
INSERT INTO "param"."t28_distritos" VALUES (987, '100402', 'HUANCANO', NULL, 101, NULL);
INSERT INTO "param"."t28_distritos" VALUES (988, '100403', 'HUMAY', NULL, 101, NULL);
INSERT INTO "param"."t28_distritos" VALUES (989, '100404', 'INDEPENDENCIA', NULL, 101, NULL);
INSERT INTO "param"."t28_distritos" VALUES (990, '100405', 'PARACAS', NULL, 101, NULL);
INSERT INTO "param"."t28_distritos" VALUES (991, '100406', 'SAN ANDRES', NULL, 101, NULL);
INSERT INTO "param"."t28_distritos" VALUES (992, '100407', 'SAN CLEMENTE', NULL, 101, NULL);
INSERT INTO "param"."t28_distritos" VALUES (993, '100408', 'TUPAC AMARU INCA', NULL, 101, NULL);
INSERT INTO "param"."t28_distritos" VALUES (994, '100501', 'PALPA', NULL, 102, NULL);
INSERT INTO "param"."t28_distritos" VALUES (995, '100502', 'LLIPATA', NULL, 102, NULL);
INSERT INTO "param"."t28_distritos" VALUES (996, '100503', 'RIO GRANDE', NULL, 102, NULL);
INSERT INTO "param"."t28_distritos" VALUES (997, '100504', 'SANTA CRUZ', NULL, 102, NULL);
INSERT INTO "param"."t28_distritos" VALUES (998, '100505', 'TIBILLO', NULL, 102, NULL);
INSERT INTO "param"."t28_distritos" VALUES (999, '110101', 'HUANCAYO', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1000, '110103', 'CARHUACALLANGA', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1001, '110104', 'COLCA', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1002, '110105', 'CULLHUAS', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1003, '110106', 'CHACAPAMPA', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1004, '110107', 'CHICCHE', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1005, '110108', 'CHILCA', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1006, '110109', 'CHONGOS ALTO', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1007, '110112', 'CHUPURO', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1008, '110113', 'EL TAMBO', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1009, '110114', 'HUACRAPUQUIO', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1010, '110116', 'HUALHUAS', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1011, '110118', 'HUANCAN', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1012, '110119', 'HUASICANCHA', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1013, '110120', 'HUAYUCACHI', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1014, '110121', 'INGENIO', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1015, '110122', 'PARIAHUANCA', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1016, '110123', 'PILCOMAYO', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1017, '110124', 'PUCARA', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1018, '110125', 'QUICHUAY', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1019, '110126', 'QUILCAS', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1020, '110127', 'SAN AGUSTIN', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1021, '110128', 'SAN JERONIMO DE TUNAN', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1022, '110131', 'STO DOMINGO DE ACOBAMBA', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1023, '110132', 'SANO', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1024, '110133', 'SAPALLANGA', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1025, '110134', 'SICAYA', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1026, '110136', 'VIQUES', NULL, 103, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1027, '110201', 'CONCEPCION', NULL, 104, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1028, '110202', 'ACO', NULL, 104, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1029, '110203', 'ANDAMARCA', NULL, 104, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1030, '110204', 'COMAS', NULL, 104, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1031, '110205', 'COCHAS', NULL, 104, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1032, '110206', 'CHAMBARA', NULL, 104, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1033, '110207', 'HEROINAS TOLEDO', NULL, 104, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1034, '110208', 'MANZANARES', NULL, 104, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1035, '110209', 'MCAL CASTILLA', NULL, 104, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1036, '110210', 'MATAHUASI', NULL, 104, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1037, '110211', 'MITO', NULL, 104, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1038, '110212', 'NUEVE DE JULIO', NULL, 104, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1039, '110213', 'ORCOTUNA', NULL, 104, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1040, '110214', 'STA ROSA DE OCOPA', NULL, 104, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1041, '110215', 'SAN JOSE DE QUERO', NULL, 104, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1042, '110301', 'JAUJA', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1043, '110302', 'ACOLLA', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1044, '110303', 'APATA', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1045, '110304', 'ATAURA', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1046, '110305', 'CANCHAILLO', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1047, '110306', 'EL MANTARO', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1048, '110307', 'HUAMALI', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1049, '110308', 'HUARIPAMPA', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1050, '110309', 'HUERTAS', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1051, '110310', 'JANJAILLO', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1052, '110311', 'JULCAN', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1053, '110312', 'LEONOR ORDONEZ', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1054, '110313', 'LLOCLLAPAMPA', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1055, '110314', 'MARCO', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1056, '110315', 'MASMA', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1057, '110316', 'MOLINOS', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1058, '110317', 'MONOBAMBA', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1059, '110318', 'MUQUI', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1060, '110319', 'MUQUIYAUYO', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1061, '110320', 'PACA', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1062, '110321', 'PACCHA', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1063, '110322', 'PANCAN', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1064, '110323', 'PARCO', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1065, '110324', 'POMACANCHA', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1066, '110325', 'RICRAN', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1067, '110326', 'SAN LORENZO', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1068, '110327', 'SAN PEDRO DE CHUNAN', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1069, '110328', 'SINCOS', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1070, '110329', 'TUNAN MARCA', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1071, '110330', 'YAULI', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1072, '110331', 'CURICACA', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1073, '110332', 'MASMA CHICCHE', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1074, '110333', 'SAUSA', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1075, '110334', 'YAUYOS', NULL, 105, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1076, '110401', 'JUNIN', NULL, 106, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1077, '110402', 'CARHUAMAYO', NULL, 106, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1078, '110403', 'ONDORES', NULL, 106, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1079, '110404', 'ULCUMAYO', NULL, 106, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1080, '110501', 'TARMA', NULL, 107, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1081, '110502', 'ACOBAMBA', NULL, 107, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1082, '110503', 'HUARICOLCA', NULL, 107, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1083, '110504', 'HUASAHUASI', NULL, 107, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1084, '110505', 'LA UNION', NULL, 107, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1085, '110506', 'PALCA', NULL, 107, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1086, '110507', 'PALCAMAYO', NULL, 107, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1087, '110508', 'SAN PEDRO DE CAJAS', NULL, 107, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1088, '110509', 'TAPO', NULL, 107, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1089, '110601', 'LA OROYA', NULL, 108, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1090, '110602', 'CHACAPALPA', NULL, 108, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1091, '110603', 'HUAY HUAY', NULL, 108, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1092, '110604', 'MARCAPOMACOCHA', NULL, 108, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1093, '110605', 'MOROCOCHA', NULL, 108, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1094, '110606', 'PACCHA', NULL, 108, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1095, '110607', 'STA BARBARA DE CARHUACAYAN', NULL, 108, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1096, '110608', 'SUITUCANCHA', NULL, 108, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1097, '110609', 'YAULI', NULL, 108, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1098, '110610', 'STA ROSA DE SACCO', NULL, 108, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1099, '110701', 'SATIPO', NULL, 109, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1100, '110702', 'COVIRIALI', NULL, 109, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1101, '110703', 'LLAYLLA', NULL, 109, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1102, '110704', 'MAZAMARI', NULL, 109, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1103, '110705', 'PAMPA HERMOSA', NULL, 109, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1104, '110706', 'PANGOA', NULL, 109, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1105, '110707', 'RIO NEGRO', NULL, 109, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1106, '110708', 'RIO TAMBO', NULL, 109, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1107, '110801', 'CHANCHAMAYO', NULL, 110, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1108, '110802', 'SAN RAMON', NULL, 110, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1109, '110803', 'VITOC', NULL, 110, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1110, '110804', 'SAN LUIS DE SHUARO', NULL, 110, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1111, '110805', 'PICHANAQUI', NULL, 110, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1112, '110806', 'PERENE', NULL, 110, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1113, '110901', 'CHUPACA', NULL, 111, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1114, '110902', 'AHUAC', NULL, 111, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1115, '110903', 'CHONGOS BAJO', NULL, 111, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1116, '110904', 'HUACHAC', NULL, 111, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1117, '110905', 'HUAMANCACA CHICO', NULL, 111, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1118, '110906', 'SAN JUAN DE ISCOS', NULL, 111, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1119, '110907', 'SAN JUAN DE JARPA', NULL, 111, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1120, '110908', 'TRES DE DICIEMBRE', NULL, 111, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1121, '110909', 'YANACANCHA', NULL, 111, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1122, '120101', 'TRUJILLO', NULL, 112, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1123, '120102', 'HUANCHACO', NULL, 112, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1124, '120103', 'LAREDO', NULL, 112, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1125, '120104', 'MOCHE', NULL, 112, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1126, '120105', 'SALAVERRY', NULL, 112, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1127, '120106', 'SIMBAL', NULL, 112, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1128, '120107', 'VICTOR LARCO HERRERA', NULL, 112, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1129, '120109', 'POROTO', NULL, 112, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1130, '120110', 'EL PORVENIR', NULL, 112, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1131, '120111', 'LA ESPERANZA', NULL, 112, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1132, '120112', 'FLORENCIA DE MORA', NULL, 112, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1133, '120201', 'BOLIVAR', NULL, 113, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1134, '120202', 'BAMBAMARCA', NULL, 113, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1135, '120203', 'CONDORMARCA', NULL, 113, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1136, '120204', 'LONGOTEA', NULL, 113, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1137, '120205', 'UCUNCHA', NULL, 113, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1138, '120206', 'UCHUMARCA', NULL, 113, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1139, '120301', 'HUAMACHUCO', NULL, 114, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1140, '120302', 'COCHORCO', NULL, 114, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1141, '120303', 'CURGOS', NULL, 114, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1142, '120304', 'CHUGAY', NULL, 114, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1143, '120305', 'MARCABAL', NULL, 114, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1144, '120306', 'SANAGORAN', NULL, 114, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1145, '120307', 'SARIN', NULL, 114, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1146, '120308', 'SARTIMBAMBA', NULL, 114, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1147, '120401', 'OTUZCO', NULL, 115, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1148, '120402', 'AGALLPAMPA', NULL, 115, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1149, '120403', 'CHARAT', NULL, 115, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1150, '120404', 'HUARANCHAL', NULL, 115, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1151, '120405', 'LA CUESTA', NULL, 115, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1152, '120408', 'PARANDAY', NULL, 115, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1153, '120409', 'SALPO', NULL, 115, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1154, '120410', 'SINSICAP', NULL, 115, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1155, '120411', 'USQUIL', NULL, 115, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1156, '120413', 'MACHE', NULL, 115, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1157, '120501', 'SAN PEDRO DE LLOC', NULL, 116, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1158, '120503', 'GUADALUPE', NULL, 116, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1159, '120504', 'JEQUETEPEQUE', NULL, 116, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1160, '120506', 'PACASMAYO', NULL, 116, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1161, '120508', 'SAN JOSE', NULL, 116, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1162, '120601', 'TAYABAMBA', NULL, 117, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1163, '120602', 'BULDIBUYO', NULL, 117, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1164, '120603', 'CHILLIA', NULL, 117, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1165, '120604', 'HUAYLILLAS', NULL, 117, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1166, '120605', 'HUANCASPATA', NULL, 117, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1167, '120606', 'HUAYO', NULL, 117, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1168, '120607', 'ONGON', NULL, 117, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1169, '120608', 'PARCOY', NULL, 117, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1170, '120609', 'PATAZ', NULL, 117, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1171, '120610', 'PIAS', NULL, 117, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1172, '120611', 'TAURIJA', NULL, 117, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1173, '120612', 'URPAY', NULL, 117, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1174, '120613', 'SANTIAGO DE CHALLAS', NULL, 117, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1175, '120701', 'SANTIAGO DE CHUCO', NULL, 118, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1176, '120702', 'CACHICADAN', NULL, 118, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1177, '120703', 'MOLLEBAMBA', NULL, 118, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1178, '120704', 'MOLLEPATA', NULL, 118, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1179, '120705', 'QUIRUVILCA', NULL, 118, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1180, '120706', 'SANTA CRUZ DE CHUCA', NULL, 118, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1181, '120707', 'SITABAMBA', NULL, 118, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1182, '120708', 'ANGASMARCA', NULL, 118, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1183, '120801', 'ASCOPE', NULL, 119, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1184, '120802', 'CHICAMA', NULL, 119, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1185, '120803', 'CHOCOPE', NULL, 119, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1186, '120804', 'SANTIAGO DE CAO', NULL, 119, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1187, '120805', 'MAGDALENA DE CAO', NULL, 119, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1188, '120806', 'PAIJAN', NULL, 119, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1189, '120807', 'RAZURI', NULL, 119, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1190, '120808', 'CASA GRANDE', NULL, 119, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1191, '120901', 'CHEPEN', NULL, 120, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1192, '120902', 'PACANGA', NULL, 120, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1193, '120903', 'PUEBLO NUEVO', NULL, 120, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1194, '121001', 'JULCAN', NULL, 121, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1195, '121002', 'CARABAMBA', NULL, 121, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1196, '121003', 'CALAMARCA', NULL, 121, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1197, '121004', 'HUASO', NULL, 121, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1198, '121101', 'CASCAS', NULL, 122, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1199, '121102', 'LUCMA', NULL, 122, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1200, '121103', 'MARMOT', NULL, 122, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1201, '121104', 'SAYAPULLO', NULL, 122, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1202, '121201', 'VIRU', NULL, 123, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1203, '121202', 'CHAO', NULL, 123, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1204, '121203', 'GUADALUPITO', NULL, 123, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1205, '130101', 'CHICLAYO', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1206, '130102', 'CHONGOYAPE', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1207, '130103', 'ETEN', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1208, '130104', 'ETEN PUERTO', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1209, '130105', 'LAGUNAS', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1210, '130106', 'MONSEFU', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1211, '130107', 'NUEVA ARICA', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1212, '130108', 'OYOTUN', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1213, '130109', 'PICSI', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1214, '130110', 'PIMENTEL', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1215, '130111', 'REQUE', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1216, '130112', 'JOSE LEONARDO ORTIZ', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1217, '130113', 'SANTA ROSA', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1218, '130114', 'SANA', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1219, '130115', 'LA VICTORIA', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1220, '130116', 'CAYALTI', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1221, '130117', 'PATAPO', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1222, '130118', 'POMALCA', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1223, '130119', 'PUCALA', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1224, '130120', 'TUMAN', NULL, 124, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1225, '130201', 'FERRENAFE', NULL, 125, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1226, '130202', 'INCAHUASI', NULL, 125, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1227, '130203', 'CANARIS', NULL, 125, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1228, '130204', 'PITIPO', NULL, 125, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1229, '130205', 'PUEBLO NUEVO', NULL, 125, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1230, '130206', 'MANUEL ANTONIO MESONES MURO', NULL, 125, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1231, '130301', 'LAMBAYEQUE', NULL, 126, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1232, '130302', 'CHOCHOPE', NULL, 126, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1233, '130303', 'ILLIMO', NULL, 126, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1234, '130304', 'JAYANCA', NULL, 126, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1235, '130305', 'MOCHUMI', NULL, 126, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1236, '130306', 'MORROPE', NULL, 126, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1237, '130307', 'MOTUPE', NULL, 126, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1238, '130308', 'OLMOS', NULL, 126, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1239, '130309', 'PACORA', NULL, 126, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1240, '130310', 'SALAS', NULL, 126, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1241, '130311', 'SAN JOSE', NULL, 126, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1242, '130312', 'TUCUME', NULL, 126, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1243, '140101', 'LIMA', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1244, '140102', 'ANCON', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1245, '140103', 'ATE', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1246, '140104', 'BRENA', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1247, '140105', 'CARABAYLLO', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1248, '140106', 'COMAS', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1249, '140107', 'CHACLACAYO', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1250, '140108', 'CHORRILLOS', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1251, '140109', 'LA VICTORIA', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1252, '140110', 'LA MOLINA', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1253, '140111', 'LINCE', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1254, '140112', 'LURIGANCHO', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1255, '140113', 'LURIN', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1256, '140114', 'MAGDALENA DEL MAR', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1257, '140115', 'MIRAFLORES', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1258, '140116', 'PACHACAMAC', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1259, '140117', 'PUEBLO LIBRE', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1260, '140118', 'PUCUSANA', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1261, '140119', 'PUENTE PIEDRA', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1262, '140120', 'PUNTA HERMOSA', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1263, '140121', 'PUNTA NEGRA', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1264, '140122', 'RIMAC', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1265, '140123', 'SAN BARTOLO', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1266, '140124', 'SAN ISIDRO', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1267, '140125', 'BARRANCO', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1268, '140126', 'SAN MARTIN DE PORRES', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1269, '140127', 'SAN MIGUEL', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1270, '140128', 'STA MARIA DEL MAR', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1271, '140129', 'SANTA ROSA', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1272, '140130', 'SANTIAGO DE SURCO', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1273, '140131', 'SURQUILLO', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1274, '140132', 'VILLA MARIA DEL TRIUNFO', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1275, '140133', 'JESUS MARIA', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1276, '140134', 'INDEPENDENCIA', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1277, '140135', 'EL AGUSTINO', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1278, '140136', 'SAN JUAN DE MIRAFLORES', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1279, '140137', 'SAN JUAN DE LURIGANCHO', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1280, '140138', 'SAN LUIS', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1281, '140139', 'CIENEGUILLA', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1282, '140140', 'SAN BORJA', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1283, '140141', 'VILLA EL SALVADOR', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1284, '140142', 'LOS OLIVOS', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1285, '140143', 'SANTA ANITA', NULL, 127, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1286, '140201', 'CAJATAMBO', NULL, 128, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1287, '140205', 'COPA', NULL, 128, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1288, '140206', 'GORGOR', NULL, 128, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1289, '140207', 'HUANCAPON', NULL, 128, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1290, '140208', 'MANAS', NULL, 128, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1291, '140301', 'CANTA', NULL, 129, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1292, '140302', 'ARAHUAY', NULL, 129, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1293, '140303', 'HUAMANTANGA', NULL, 129, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1294, '140304', 'HUAROS', NULL, 129, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1295, '140305', 'LACHAQUI', NULL, 129, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1296, '140306', 'SAN BUENAVENTURA', NULL, 129, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1297, '140307', 'SANTA ROSA DE QUIVES', NULL, 129, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1298, '140401', 'SAN VICENTE DE CANETE', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1299, '140402', 'CALANGO', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1300, '140403', 'CERRO AZUL', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1301, '140404', 'COAYLLO', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1302, '140405', 'CHILCA', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1303, '140406', 'IMPERIAL', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1304, '140407', 'LUNAHUANA', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1305, '140408', 'MALA', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1306, '140409', 'NUEVO IMPERIAL', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1307, '140410', 'PACARAN', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1308, '140411', 'QUILMANA', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1309, '140412', 'SAN ANTONIO', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1310, '140413', 'SAN LUIS', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1311, '140414', 'SANTA CRUZ DE FLORES', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1312, '140415', 'ZUNIGA', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1313, '140416', 'ASIA', NULL, 130, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1314, '140501', 'HUACHO', NULL, 131, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1315, '140502', 'AMBAR', NULL, 131, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1316, '140504', 'CALETA DE CARQUIN', NULL, 131, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1317, '140505', 'CHECRAS', NULL, 131, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1318, '140506', 'HUALMAY', NULL, 131, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1319, '140507', 'HUAURA', NULL, 131, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1320, '140508', 'LEONCIO PRADO', NULL, 131, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1321, '140509', 'PACCHO', NULL, 131, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1322, '140511', 'SANTA LEONOR', NULL, 131, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1323, '140512', 'SANTA MARIA', NULL, 131, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1324, '140513', 'SAYAN', NULL, 131, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1325, '140516', 'VEGUETA', NULL, 131, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1326, '140601', 'MATUCANA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1327, '140602', 'ANTIOQUIA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1328, '140603', 'CALLAHUANCA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1329, '140604', 'CARAMPOMA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1330, '140605', 'CASTA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1331, '140606', 'CUENCA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1332, '140607', 'CHICLA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1333, '140608', 'HUANZA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1334, '140609', 'HUAROCHIRI', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1335, '140610', 'LAHUAYTAMBO', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1336, '140611', 'LANGA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1337, '140612', 'MARIATANA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1338, '140613', 'RICARDO PALMA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1339, '140614', 'SAN ANDRES DE TUPICOCHA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1340, '140615', 'SAN ANTONIO', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1341, '140616', 'SAN BARTOLOME', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1342, '140617', 'SAN DAMIAN', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1343, '140618', 'SANGALLAYA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1344, '140619', 'SAN JUAN DE TANTARANCHE', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1345, '140620', 'SAN LORENZO DE QUINTI', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1346, '140621', 'SAN MATEO', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1347, '140622', 'SAN MATEO DE OTAO', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1348, '140623', 'SAN PEDRO DE HUANCAYRE', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1349, '140624', 'SANTA CRUZ DE COCACHACRA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1350, '140625', 'SANTA EULALIA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1351, '140626', 'SANTIAGO DE ANCHUCAYA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1352, '140627', 'SANTIAGO DE TUNA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1353, '140628', 'SANTO DOMINGO DE LOS OLLEROS', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1354, '140629', 'SURCO', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1355, '140630', 'HUACHUPAMPA', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1356, '140631', 'LARAOS', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1357, '140632', 'SAN JUAN DE IRIS', NULL, 132, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1358, '140701', 'YAUYOS', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1359, '140702', 'ALIS', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1360, '140703', 'AYAUCA', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1361, '140704', 'AYAVIRI', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1362, '140705', 'AZANGARO', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1363, '140706', 'CACRA', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1364, '140707', 'CARANIA', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1365, '140708', 'COCHAS', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1366, '140709', 'COLONIA', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1367, '140710', 'CHOCOS', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1368, '140711', 'HUAMPARA', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1369, '140712', 'HUANCAYA', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1370, '140713', 'HUANGASCAR', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1371, '140714', 'HUANTAN', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1372, '140715', 'HUANEC', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1373, '140716', 'LARAOS', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1374, '140717', 'LINCHA', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1375, '140718', 'MIRAFLORES', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1376, '140719', 'OMAS', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1377, '140720', 'QUINCHES', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1378, '140721', 'QUINOCAY', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1379, '140722', 'SAN JOAQUIN', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1380, '140723', 'SAN PEDRO DE PILAS', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1381, '140724', 'TANTA', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1382, '140725', 'TAURIPAMPA', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1383, '140726', 'TUPE', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1384, '140727', 'TOMAS', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1385, '140728', 'VINAC', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1386, '140729', 'VITIS', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1387, '140730', 'HONGOS', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1388, '140731', 'MADEAN', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1389, '140732', 'PUTINZA', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1390, '140733', 'CATAHUASI', NULL, 133, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1391, '140801', 'HUARAL', NULL, 134, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1392, '140802', 'ATAVILLOS ALTO', NULL, 134, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1393, '140803', 'ATAVILLOS BAJO', NULL, 134, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1394, '140804', 'AUCALLAMA', NULL, 134, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1395, '140805', 'CHANCAY', NULL, 134, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1396, '140806', 'IHUARI', NULL, 134, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1397, '140807', 'LAMPIAN', NULL, 134, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1398, '140808', 'PACARAOS', NULL, 134, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1399, '140809', 'SAN MIGUEL DE ACOS', NULL, 134, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1400, '140810', 'VEINTISIETE DE NOVIEMBRE', NULL, 134, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1401, '140811', 'STA CRUZ DE ANDAMARCA', NULL, 134, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1402, '140812', 'SUMBILCA', NULL, 134, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1403, '140901', 'BARRANCA', NULL, 135, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1404, '140902', 'PARAMONGA', NULL, 135, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1405, '140903', 'PATIVILCA', NULL, 135, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1406, '140904', 'SUPE', NULL, 135, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1407, '140905', 'SUPE PUERTO', NULL, 135, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1408, '141001', 'OYON', NULL, 136, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1409, '141002', 'NAVAN', NULL, 136, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1410, '141003', 'CAUJUL', NULL, 136, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1411, '141004', 'ANDAJES', NULL, 136, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1412, '141005', 'PACHANGARA', NULL, 136, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1413, '141006', 'COCHAMARCA', NULL, 136, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1414, '150101', 'IQUITOS', NULL, 137, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1415, '150102', 'ALTO NANAY', NULL, 137, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1416, '150103', 'FERNANDO LORES', NULL, 137, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1417, '150104', 'LAS AMAZONAS', NULL, 137, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1418, '150105', 'MAZAN', NULL, 137, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1419, '150106', 'NAPO', NULL, 137, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1420, '150107', 'PUTUMAYO', NULL, 137, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1421, '150108', 'TORRES CAUSANA', NULL, 137, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1422, '150110', 'INDIANA', NULL, 137, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1423, '150111', 'PUNCHANA', NULL, 137, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1424, '150112', 'BELEN', NULL, 137, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1425, '150113', 'SAN JUAN BAUTISTA', NULL, 137, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1426, '150114', 'TNTE MANUEL CLAVERO', NULL, 137, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1427, '150201', 'YURIMAGUAS', NULL, 138, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1428, '150202', 'BALSAPUERTO', NULL, 138, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1429, '150205', 'JEBEROS', NULL, 138, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1430, '150206', 'LAGUNAS', NULL, 138, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1431, '150210', 'SANTA CRUZ', NULL, 138, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1432, '150211', 'TNTE CESAR LOPEZ ROJAS', NULL, 138, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1433, '150301', 'NAUTA', NULL, 139, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1434, '150302', 'PARINARI', NULL, 139, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1435, '150303', 'TIGRE', NULL, 139, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1436, '150304', 'URARINAS', NULL, 139, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1437, '150305', 'TROMPETEROS', NULL, 139, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1438, '150401', 'REQUENA', NULL, 140, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1439, '150402', 'ALTO TAPICHE', NULL, 140, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1440, '150403', 'CAPELO', NULL, 140, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1441, '150404', 'EMILIO SAN MARTIN', NULL, 140, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1442, '150405', 'MAQUIA', NULL, 140, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1443, '150406', 'PUINAHUA', NULL, 140, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1444, '150407', 'SAQUENA', NULL, 140, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1445, '150408', 'SOPLIN', NULL, 140, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1446, '150409', 'TAPICHE', NULL, 140, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1447, '150410', 'JENARO HERRERA', NULL, 140, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1448, '150411', 'YAQUERANA', NULL, 140, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1449, '150501', 'CONTAMANA', NULL, 141, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1450, '150502', 'VARGAS GUERRA', NULL, 141, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1451, '150503', 'PADRE MARQUEZ', NULL, 141, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1452, '150504', 'PAMPA HERMOZA', NULL, 141, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1453, '150505', 'SARAYACU', NULL, 141, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1454, '150506', 'INAHUAYA', NULL, 141, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1455, '150601', 'MARISCAL RAMON CASTILLA', NULL, 142, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1456, '150602', 'PEBAS', NULL, 142, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1457, '150603', 'YAVARI', NULL, 142, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1458, '150604', 'SAN PABLO', NULL, 142, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1459, '150701', 'BARRANCA', NULL, 143, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1460, '150702', 'ANDOAS', NULL, 143, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1461, '150703', 'CAHUAPANAS', NULL, 143, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1462, '150704', 'MANSERICHE', NULL, 143, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1463, '150705', 'MORONA', NULL, 143, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1464, '150706', 'PASTAZA', NULL, 143, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1465, '160101', 'TAMBOPATA', NULL, 144, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1466, '160102', 'INAMBARI', NULL, 144, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1467, '160103', 'LAS PIEDRAS', NULL, 144, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1468, '160104', 'LABERINTO', NULL, 144, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1469, '160201', 'MANU', NULL, 145, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1470, '160202', 'FITZCARRALD', NULL, 145, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1471, '160203', 'MADRE DE DIOS', NULL, 145, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1472, '160204', 'HUEPETUHE', NULL, 145, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1473, '160301', 'INAPARI', NULL, 146, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1474, '160302', 'IBERIA', NULL, 146, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1475, '160303', 'TAHUAMANU', NULL, 146, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1476, '170101', 'MOQUEGUA', NULL, 147, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1477, '170102', 'CARUMAS', NULL, 147, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1478, '170103', 'CUCHUMBAYA', NULL, 147, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1479, '170104', 'SAN CRISTOBAL', NULL, 147, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1480, '170105', 'TORATA', NULL, 147, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1481, '170106', 'SAMEGUA', NULL, 147, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1482, '170201', 'OMATE', NULL, 148, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1483, '170202', 'COALAQUE', NULL, 148, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1484, '170203', 'CHOJATA', NULL, 148, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1485, '170204', 'ICHUNA', NULL, 148, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1486, '170205', 'LA CAPILLA', NULL, 148, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1487, '170206', 'LLOQUE', NULL, 148, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1488, '170207', 'MATALAQUE', NULL, 148, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1489, '170208', 'PUQUINA', NULL, 148, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1490, '170209', 'QUINISTAQUILLAS', NULL, 148, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1491, '170210', 'UBINAS', NULL, 148, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1492, '170211', 'YUNGA', NULL, 148, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1493, '170301', 'ILO', NULL, 149, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1494, '170302', 'EL ALGARROBAL', NULL, 149, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1495, '170303', 'PACOCHA', NULL, 149, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1496, '180101', 'CHAUPIMARCA', NULL, 150, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1497, '180103', 'HUACHON', NULL, 150, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1498, '180104', 'HUARIACA', NULL, 150, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1499, '180105', 'HUAYLLAY', NULL, 150, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1500, '180106', 'NINACACA', NULL, 150, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1501, '180107', 'PALLANCHACRA', NULL, 150, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1502, '180108', 'PAUCARTAMBO', NULL, 150, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1503, '180109', 'SAN FCO DE ASIS DE YARUSYACAN', NULL, 150, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1504, '180110', 'SIMON BOLIVAR', NULL, 150, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1505, '180111', 'TICLACAYAN', NULL, 150, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1506, '180112', 'TINYAHUARCO', NULL, 150, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1507, '180113', 'VICCO', NULL, 150, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1508, '180114', 'YANACANCHA', NULL, 150, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1509, '180201', 'YANAHUANCA', NULL, 151, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1510, '180202', 'CHACAYAN', NULL, 151, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1511, '180203', 'GOYLLARISQUIZGA', NULL, 151, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1512, '180204', 'PAUCAR', NULL, 151, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1513, '180205', 'SAN PEDRO DE PILLAO', NULL, 151, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1514, '180206', 'SANTA ANA DE TUSI', NULL, 151, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1515, '180207', 'TAPUC', NULL, 151, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1516, '180208', 'VILCABAMBA', NULL, 151, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1517, '180301', 'OXAPAMPA', NULL, 152, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1518, '180302', 'CHONTABAMBA', NULL, 152, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1519, '180303', 'HUANCABAMBA', NULL, 152, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1520, '180304', 'PUERTO BERMUDEZ', NULL, 152, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1521, '180305', 'VILLA RICA', NULL, 152, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1522, '180306', 'POZUZO', NULL, 152, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1523, '180307', 'PALCAZU', NULL, 152, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1524, '190101', 'PIURA', NULL, 153, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1525, '190103', 'CASTILLA', NULL, 153, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1526, '190104', 'CATACAOS', NULL, 153, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1527, '190105', 'LA ARENA', NULL, 153, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1528, '190106', 'LA UNION', NULL, 153, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1529, '190107', 'LAS LOMAS', NULL, 153, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1530, '190109', 'TAMBO GRANDE', NULL, 153, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1531, '190113', 'CURA MORI', NULL, 153, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1532, '190114', 'EL TALLAN', NULL, 153, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1533, '190201', 'AYABACA', NULL, 154, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1534, '190202', 'FRIAS', NULL, 154, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1535, '190203', 'LAGUNAS', NULL, 154, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1536, '190204', 'MONTERO', NULL, 154, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1537, '190205', 'PACAIPAMPA', NULL, 154, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1538, '190206', 'SAPILLICA', NULL, 154, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1539, '190207', 'SICCHEZ', NULL, 154, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1540, '190208', 'SUYO', NULL, 154, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1541, '190209', 'JILILI', NULL, 154, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1542, '190210', 'PAIMAS', NULL, 154, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1543, '190301', 'HUANCABAMBA', NULL, 155, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1544, '190302', 'CANCHAQUE', NULL, 155, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1545, '190303', 'HUARMACA', NULL, 155, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1546, '190304', 'SONDOR', NULL, 155, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1547, '190305', 'SONDORILLO', NULL, 155, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1548, '190306', 'EL CARMEN DE LA FRONTERA', NULL, 155, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1549, '190307', 'SAN MIGUEL DE EL FAIQUE', NULL, 155, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1550, '190308', 'LALAQUIZ', NULL, 155, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1551, '190401', 'CHULUCANAS', NULL, 156, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1552, '190402', 'BUENOS AIRES', NULL, 156, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1553, '190403', 'CHALACO', NULL, 156, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1554, '190404', 'MORROPON', NULL, 156, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1555, '190405', 'SALITRAL', NULL, 156, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1556, '190406', 'SANTA CATALINA DE MOSSA', NULL, 156, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1557, '190407', 'SANTO DOMINGO', NULL, 156, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1558, '190408', 'LA MATANZA', NULL, 156, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1559, '190409', 'YAMANGO', NULL, 156, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1560, '190410', 'SAN JUAN DE BIGOTE', NULL, 156, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1561, '190501', 'PAITA', NULL, 157, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1562, '190502', 'AMOTAPE', NULL, 157, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1563, '190503', 'ARENAL', NULL, 157, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1564, '190504', 'LA HUACA', NULL, 157, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1565, '190505', 'PUEBLO NUEVO DE COLAN', NULL, 157, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1566, '190506', 'TAMARINDO', NULL, 157, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1567, '190507', 'VICHAYAL', NULL, 157, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1568, '190601', 'SULLANA', NULL, 158, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1569, '190602', 'BELLAVISTA', NULL, 158, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1570, '190603', 'LANCONES', NULL, 158, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1571, '190604', 'MARCAVELICA', NULL, 158, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1572, '190605', 'MIGUEL CHECA', NULL, 158, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1573, '190606', 'QUERECOTILLO', NULL, 158, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1574, '190607', 'SALITRAL', NULL, 158, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1575, '190608', 'IGNACIO ESCUDERO', NULL, 158, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1576, '190701', 'PARINAS', NULL, 159, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1577, '190702', 'EL ALTO', NULL, 159, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1578, '190703', 'LA BREA', NULL, 159, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1579, '190704', 'LOBITOS', NULL, 159, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1580, '190705', 'MANCORA', NULL, 159, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1581, '190706', 'LOS ORGANOS', NULL, 159, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1582, '190801', 'SECHURA', NULL, 160, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1583, '190802', 'VICE', NULL, 160, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1584, '190803', 'BERNAL', NULL, 160, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1585, '190804', 'BELLAVISTA DE LA UNION', NULL, 160, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1586, '190805', 'CRISTO NOS VALGA', NULL, 160, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1587, '190806', 'RINCONADA LLICUAR', NULL, 160, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1588, '200101', 'PUNO', NULL, 161, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1589, '200102', 'ACORA', NULL, 161, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1590, '200103', 'ATUNCOLLA', NULL, 161, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1591, '200104', 'CAPACHICA', NULL, 161, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1592, '200105', 'COATA', NULL, 161, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1593, '200106', 'CHUCUITO', NULL, 161, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1594, '200107', 'HUATA', NULL, 161, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1595, '200108', 'MANAZO', NULL, 161, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1596, '200109', 'PAUCARCOLLA', NULL, 161, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1597, '200110', 'PICHACANI', NULL, 161, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1598, '200111', 'SAN ANTONIO', NULL, 161, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1599, '200112', 'TIQUILLACA', NULL, 161, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1600, '200113', 'VILQUE', NULL, 161, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1601, '200114', 'PLATERIA', NULL, 161, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1602, '200115', 'AMANTANI', NULL, 161, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1603, '200201', 'AZANGARO', NULL, 162, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1604, '200202', 'ACHAYA', NULL, 162, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1605, '200203', 'ARAPA', NULL, 162, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1606, '200204', 'ASILLO', NULL, 162, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1607, '200205', 'CAMINACA', NULL, 162, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1608, '200206', 'CHUPA', NULL, 162, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1609, '200207', 'JOSE DOMINGO CHOQUEHUANCA', NULL, 162, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1610, '200208', 'MUNANI', NULL, 162, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1611, '200210', 'POTONI', NULL, 162, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1612, '200212', 'SAMAN', NULL, 162, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1613, '200213', 'SAN ANTON', NULL, 162, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1614, '200214', 'SAN JOSE', NULL, 162, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1615, '200215', 'SAN JUAN DE SALINAS', NULL, 162, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1616, '200216', 'STGO DE PUPUJA', NULL, 162, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1617, '200217', 'TIRAPATA', NULL, 162, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1618, '200301', 'MACUSANI', NULL, 163, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1619, '200302', 'AJOYANI', NULL, 163, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1620, '200303', 'AYAPATA', NULL, 163, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1621, '200304', 'COASA', NULL, 163, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1622, '200305', 'CORANI', NULL, 163, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1623, '200306', 'CRUCERO', NULL, 163, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1624, '200307', 'ITUATA', NULL, 163, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1625, '200308', 'OLLACHEA', NULL, 163, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1626, '200309', 'SAN GABAN', NULL, 163, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1627, '200310', 'USICAYOS', NULL, 163, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1628, '200401', 'JULI', NULL, 164, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1629, '200402', 'DESAGUADERO', NULL, 164, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1630, '200403', 'HUACULLANI', NULL, 164, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1631, '200406', 'PISACOMA', NULL, 164, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1632, '200407', 'POMATA', NULL, 164, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1633, '200410', 'ZEPITA', NULL, 164, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1634, '200412', 'KELLUYO', NULL, 164, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1635, '200501', 'HUANCANE', NULL, 165, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1636, '200502', 'COJATA', NULL, 165, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1637, '200504', 'INCHUPALLA', NULL, 165, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1638, '200506', 'PUSI', NULL, 165, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1639, '200507', 'ROSASPATA', NULL, 165, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1640, '200508', 'TARACO', NULL, 165, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1641, '200509', 'VILQUE CHICO', NULL, 165, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1642, '200511', 'HUATASANI', NULL, 165, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1643, '200601', 'LAMPA', NULL, 166, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1644, '200602', 'CABANILLA', NULL, 166, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1645, '200603', 'CALAPUJA', NULL, 166, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1646, '200604', 'NICASIO', NULL, 166, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1647, '200605', 'OCUVIRI', NULL, 166, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1648, '200606', 'PALCA', NULL, 166, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1649, '200607', 'PARATIA', NULL, 166, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1650, '200608', 'PUCARA', NULL, 166, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1651, '200609', 'SANTA LUCIA', NULL, 166, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1652, '200610', 'VILAVILA', NULL, 166, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1653, '200701', 'AYAVIRI', NULL, 167, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1654, '200702', 'ANTAUTA', NULL, 167, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1655, '200703', 'CUPI', NULL, 167, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1656, '200704', 'LLALLI', NULL, 167, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1657, '200705', 'MACARI', NULL, 167, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1658, '200706', 'NUNOA', NULL, 167, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1659, '200707', 'ORURILLO', NULL, 167, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1660, '200708', 'SANTA ROSA', NULL, 167, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1661, '200709', 'UMACHIRI', NULL, 167, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1662, '200801', 'SANDIA', NULL, 168, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1663, '200803', 'CUYOCUYO', NULL, 168, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1664, '200804', 'LIMBANI', NULL, 168, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1665, '200805', 'PHARA', NULL, 168, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1666, '200806', 'PATAMBUCO', NULL, 168, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1667, '200807', 'QUIACA', NULL, 168, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1668, '200808', 'SAN JUAN DEL ORO', NULL, 168, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1669, '200810', 'YANAHUAYA', NULL, 168, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1670, '200811', 'ALTO INAMBARI', NULL, 168, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1671, '200812', 'SAN PEDRO DE PUTINA PUNCO', NULL, 168, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1672, '200901', 'JULIACA', NULL, 169, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1673, '200902', 'CABANA', NULL, 169, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1674, '200903', 'CABANILLAS', NULL, 169, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1675, '200904', 'CARACOTO', NULL, 169, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1676, '201001', 'YUNGUYO', NULL, 170, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1677, '201002', 'UNICACHI', NULL, 170, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1678, '201003', 'ANAPIA', NULL, 170, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1679, '201004', 'COPANI', NULL, 170, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1680, '201005', 'CUTURAPI', NULL, 170, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1681, '201006', 'OLLARAYA', NULL, 170, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1682, '201007', 'TINICACHI', NULL, 170, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1683, '201101', 'PUTINA', NULL, 171, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1684, '201102', 'PEDRO VILCA APAZA', NULL, 171, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1685, '201103', 'QUILCA PUNCU', NULL, 171, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1686, '201104', 'ANANEA', NULL, 171, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1687, '201105', 'SINA', NULL, 171, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1688, '201201', 'ILAVE', NULL, 172, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1689, '201202', 'PILCUYO', NULL, 172, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1690, '201203', 'SANTA ROSA', NULL, 172, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1691, '201204', 'CAPASO', NULL, 172, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1692, '201205', 'CONDURIRI', NULL, 172, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1693, '201301', 'MOHO', NULL, 173, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1694, '201302', 'CONIMA', NULL, 173, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1695, '201303', 'TILALI', NULL, 173, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1696, '201304', 'HUAYRAPATA', NULL, 173, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1697, '210101', 'MOYOBAMBA', NULL, 174, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1698, '210102', 'CALZADA', NULL, 174, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1699, '210103', 'HABANA', NULL, 174, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1700, '210104', 'JEPELACIO', NULL, 174, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1701, '210105', 'SORITOR', NULL, 174, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1702, '210106', 'YANTALO', NULL, 174, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1703, '210201', 'SAPOSOA', NULL, 175, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1704, '210202', 'PISCOYACU', NULL, 175, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1705, '210203', 'SACANCHE', NULL, 175, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1706, '210204', 'TINGO DE SAPOSOA', NULL, 175, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1707, '210205', 'ALTO SAPOSOA', NULL, 175, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1708, '210206', 'EL ESLABON', NULL, 175, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1709, '210301', 'LAMAS', NULL, 176, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1710, '210303', 'BARRANQUITA', NULL, 176, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1711, '210304', 'CAYNARACHI', NULL, 176, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1712, '210305', 'CUNUMBUQUI', NULL, 176, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1713, '210306', 'PINTO RECODO', NULL, 176, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1714, '210307', 'RUMISAPA', NULL, 176, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1715, '210311', 'SHANAO', NULL, 176, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1716, '210313', 'TABALOSOS', NULL, 176, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1717, '210314', 'ZAPATERO', NULL, 176, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1718, '210315', 'ALONSO DE ALVARADO', NULL, 176, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1719, '210316', 'SAN ROQUE DE CUMBAZA', NULL, 176, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1720, '210401', 'JUANJUI', NULL, 177, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1721, '210402', 'CAMPANILLA', NULL, 177, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1722, '210403', 'HUICUNGO', NULL, 177, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1723, '210404', 'PACHIZA', NULL, 177, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1724, '210405', 'PAJARILLO', NULL, 177, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1725, '210501', 'RIOJA', NULL, 178, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1726, '210502', 'POSIC', NULL, 178, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1727, '210503', 'YORONGOS', NULL, 178, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1728, '210504', 'YURACYACU', NULL, 178, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1729, '210505', 'NUEVA CAJAMARCA', NULL, 178, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1730, '210506', 'ELIAS SOPLIN', NULL, 178, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1731, '210507', 'SAN FERNANDO', NULL, 178, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1732, '210508', 'PARDO MIGUEL', NULL, 178, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1733, '210509', 'AWAJUN', NULL, 178, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1734, '210601', 'TARAPOTO', NULL, 179, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1735, '210602', 'ALBERTO LEVEAU', NULL, 179, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1736, '210604', 'CACATACHI', NULL, 179, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1737, '210606', 'CHAZUTA', NULL, 179, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1738, '210607', 'CHIPURANA', NULL, 179, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1739, '210608', 'EL PORVENIR', NULL, 179, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1740, '210609', 'HUIMBAYOC', NULL, 179, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1741, '210610', 'JUAN GUERRA', NULL, 179, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1742, '210611', 'MORALES', NULL, 179, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1743, '210612', 'PAPAPLAYA', NULL, 179, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1744, '210616', 'SAN ANTONIO', NULL, 179, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1745, '210619', 'SAUCE', NULL, 179, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1746, '210620', 'SHAPAJA', NULL, 179, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1747, '210621', 'LA BANDA DE SHILCAYO', NULL, 179, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1748, '210701', 'BELLAVISTA', NULL, 180, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1749, '210702', 'SAN RAFAEL', NULL, 180, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1750, '210703', 'SAN PABLO', NULL, 180, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1751, '210704', 'ALTO BIAVO', NULL, 180, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1752, '210705', 'HUALLAGA', NULL, 180, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1753, '210706', 'BAJO BIAVO', NULL, 180, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1754, '210801', 'TOCACHE', NULL, 181, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1755, '210802', 'NUEVO PROGRESO', NULL, 181, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1756, '210803', 'POLVORA', NULL, 181, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1757, '210804', 'SHUNTE', NULL, 181, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1758, '210805', 'UCHIZA', NULL, 181, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1759, '210901', 'PICOTA', NULL, 182, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1760, '210902', 'BUENOS AIRES', NULL, 182, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1761, '210903', 'CASPIZAPA', NULL, 182, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1762, '210904', 'PILLUANA', NULL, 182, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1763, '210905', 'PUCACACA', NULL, 182, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1764, '210906', 'SAN CRISTOBAL', NULL, 182, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1765, '210907', 'SAN HILARION', NULL, 182, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1766, '210908', 'TINGO DE PONASA', NULL, 182, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1767, '210909', 'TRES UNIDOS', NULL, 182, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1768, '210910', 'SHAMBOYACU', NULL, 182, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1769, '211001', 'SAN JOSE DE SISA', NULL, 183, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1770, '211002', 'AGUA BLANCA', NULL, 183, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1771, '211003', 'SHATOJA', NULL, 183, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1772, '211004', 'SAN MARTIN', NULL, 183, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1773, '211005', 'SANTA ROSA', NULL, 183, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1774, '220101', 'TACNA', NULL, 184, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1775, '220102', 'CALANA', NULL, 184, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1776, '220104', 'INCLAN', NULL, 184, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1777, '220107', 'PACHIA', NULL, 184, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1778, '220108', 'PALCA', NULL, 184, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1779, '220109', 'POCOLLAY', NULL, 184, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1780, '220110', 'SAMA', NULL, 184, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1781, '220111', 'ALTO DE LA ALIANZA', NULL, 184, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1782, '220112', 'CIUDAD NUEVA', NULL, 184, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1783, '220113', 'CORONEL GREGORIO ALBARRACIN L.ALFONSO UGARTE', NULL, 184, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1784, '220201', 'TARATA', NULL, 185, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1785, '220205', 'CHUCATAMANI', NULL, 185, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1786, '220206', 'ESTIQUE', NULL, 185, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1787, '220207', 'ESTIQUE PAMPA', NULL, 185, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1788, '220210', 'SITAJARA', NULL, 185, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1789, '220211', 'SUSAPAYA', NULL, 185, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1790, '220212', 'TARUCACHI', NULL, 185, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1791, '220213', 'TICACO', NULL, 185, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1792, '220301', 'LOCUMBA', NULL, 186, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1793, '220302', 'ITE', NULL, 186, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1794, '220303', 'ILABAYA', NULL, 186, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1795, '220401', 'CANDARAVE', NULL, 187, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1796, '220402', 'CAIRANI', NULL, 187, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1797, '220403', 'CURIBAYA', NULL, 187, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1798, '220404', 'HUANUARA', NULL, 187, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1799, '220405', 'QUILAHUANI', NULL, 187, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1800, '220406', 'CAMILACA', NULL, 187, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1801, '230101', 'TUMBES', NULL, 188, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1802, '230102', 'CORRALES', NULL, 188, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1803, '230103', 'LA CRUZ', NULL, 188, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1804, '230104', 'PAMPAS DE HOSPITAL', NULL, 188, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1805, '230105', 'SAN JACINTO', NULL, 188, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1806, '230106', 'SAN JUAN DE LA VIRGEN', NULL, 188, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1807, '230201', 'ZORRITOS', NULL, 189, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1808, '230202', 'CASITAS', NULL, 189, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1809, '230203', 'CANOAS DE PUNTA SAL', NULL, 189, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1810, '230301', 'ZARUMILLA', NULL, 190, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1811, '230302', 'MATAPALO', NULL, 190, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1812, '230303', 'PAPAYAL', NULL, 190, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1813, '230304', 'AGUAS VERDES', NULL, 190, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1814, '240101', 'CALLAO', NULL, 191, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1815, '240102', 'BELLAVISTA', NULL, 191, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1816, '240103', 'LA PUNTA', NULL, 191, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1817, '240104', 'CARMEN DE LA LEGUA-REYNOSO', NULL, 191, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1818, '240105', 'LA PERLA', NULL, 191, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1819, '240106', 'VENTANILLA', NULL, 191, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1820, '250101', 'CALLERIA', NULL, 192, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1821, '250102', 'YARINACOCHA', NULL, 192, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1822, '250103', 'MASISEA', NULL, 192, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1823, '250104', 'CAMPOVERDE', NULL, 192, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1824, '250105', 'IPARIA', NULL, 192, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1825, '250106', 'NUEVA REQUENA', NULL, 192, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1826, '250107', 'MANANTAY', NULL, 192, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1827, '250201', 'PADRE ABAD', NULL, 193, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1828, '250202', 'YRAZOLA', NULL, 193, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1829, '250203', 'CURIMANA', NULL, 193, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1830, '250301', 'RAIMONDI', NULL, 194, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1831, '250302', 'TAHUANIA', NULL, 194, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1832, '250303', 'YURUA', NULL, 194, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1833, '250304', 'SEPAHUA', NULL, 194, NULL);
INSERT INTO "param"."t28_distritos" VALUES (1834, '250401', 'PURUS', NULL, 195, NULL);

-- ----------------------------
-- Table structure for t28_provincias
-- ----------------------------
DROP TABLE IF EXISTS "param"."t28_provincias";
CREATE TABLE "param"."t28_provincias" (
  "id" int2 NOT NULL DEFAULT nextval('"param".t28_provincias_id_seq'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "departamento_id" int2 NOT NULL,
  "activo" bool
)
;

-- ----------------------------
-- Records of t28_provincias
-- ----------------------------
INSERT INTO "param"."t28_provincias" VALUES (2, '0102', 'BAGUA', NULL, 1, 't');
INSERT INTO "param"."t28_provincias" VALUES (3, '0103', 'BONGARA', NULL, 1, 't');
INSERT INTO "param"."t28_provincias" VALUES (4, '0104', 'LUYA', NULL, 1, 't');
INSERT INTO "param"."t28_provincias" VALUES (5, '0105', 'RODRIGUEZ DE MENDOZA', NULL, 1, 't');
INSERT INTO "param"."t28_provincias" VALUES (6, '0106', 'CONDORCANQUI', NULL, 1, 't');
INSERT INTO "param"."t28_provincias" VALUES (7, '0107', 'UTCUBAMBA', NULL, 1, 't');
INSERT INTO "param"."t28_provincias" VALUES (8, '0201', 'HUARAZ', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (10, '0203', 'BOLOGNESI', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (11, '0204', 'CARHUAZ', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (12, '0205', 'CASMA', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (13, '0206', 'CORONGO', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (14, '0207', 'HUAYLAS', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (15, '0208', 'HUARI', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (17, '0210', 'PALLASCA', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (18, '0211', 'POMABAMBA', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (19, '0212', 'RECUAY', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (20, '0213', 'SANTA', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (21, '0214', 'SIHUAS', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (22, '0215', 'YUNGAY', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (24, '0217', 'CARLOS FERMIN FITZCARRALD', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (25, '0218', 'ASUNCION', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (26, '0219', 'HUARMEY', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (27, '0220', 'OCROS', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (28, '0301', 'ABANCAY', NULL, 3, 't');
INSERT INTO "param"."t28_provincias" VALUES (29, '0302', 'AYMARAES', NULL, 3, 't');
INSERT INTO "param"."t28_provincias" VALUES (30, '0303', 'ANDAHUAYLAS', NULL, 3, 't');
INSERT INTO "param"."t28_provincias" VALUES (31, '0304', 'ANTABAMBA', NULL, 3, 't');
INSERT INTO "param"."t28_provincias" VALUES (32, '0305', 'COTABAMBAS', NULL, 3, 't');
INSERT INTO "param"."t28_provincias" VALUES (33, '0306', 'GRAU', NULL, 3, 't');
INSERT INTO "param"."t28_provincias" VALUES (35, '0401', 'AREQUIPA', NULL, 4, 't');
INSERT INTO "param"."t28_provincias" VALUES (36, '0402', 'CAYLLOMA', NULL, 4, 't');
INSERT INTO "param"."t28_provincias" VALUES (37, '0403', 'CAMANA', NULL, 4, 't');
INSERT INTO "param"."t28_provincias" VALUES (38, '0404', 'CARAVELI', NULL, 4, 't');
INSERT INTO "param"."t28_provincias" VALUES (39, '0405', 'CASTILLA', NULL, 4, 't');
INSERT INTO "param"."t28_provincias" VALUES (40, '0406', 'CONDESUYOS', NULL, 4, 't');
INSERT INTO "param"."t28_provincias" VALUES (41, '0407', 'ISLAY', NULL, 4, 't');
INSERT INTO "param"."t28_provincias" VALUES (42, '0408', 'LA UNION', NULL, 4, 't');
INSERT INTO "param"."t28_provincias" VALUES (44, '0502', 'CANGALLO', NULL, 5, 't');
INSERT INTO "param"."t28_provincias" VALUES (45, '0503', 'HUANTA', NULL, 5, 't');
INSERT INTO "param"."t28_provincias" VALUES (46, '0504', 'LA MAR', NULL, 5, 't');
INSERT INTO "param"."t28_provincias" VALUES (47, '0505', 'LUCANAS', NULL, 5, 't');
INSERT INTO "param"."t28_provincias" VALUES (48, '0506', 'PARINACOCHAS', NULL, 5, 't');
INSERT INTO "param"."t28_provincias" VALUES (49, '0507', 'VICTOR FAJARDO', NULL, 5, 't');
INSERT INTO "param"."t28_provincias" VALUES (51, '0509', 'VILCAS HUAMAN', NULL, 5, 't');
INSERT INTO "param"."t28_provincias" VALUES (52, '0510', 'PAUCAR DEL SARA SARA', NULL, 5, 't');
INSERT INTO "param"."t28_provincias" VALUES (53, '0511', 'SUCRE', NULL, 5, 't');
INSERT INTO "param"."t28_provincias" VALUES (54, '0601', 'CAJAMARCA', NULL, 6, 't');
INSERT INTO "param"."t28_provincias" VALUES (55, '0602', 'CAJABAMBA', NULL, 6, 't');
INSERT INTO "param"."t28_provincias" VALUES (56, '0603', 'CELENDIN', NULL, 6, 't');
INSERT INTO "param"."t28_provincias" VALUES (57, '0604', 'CONTUMAZA', NULL, 6, 't');
INSERT INTO "param"."t28_provincias" VALUES (58, '0605', 'CUTERVO', NULL, 6, 't');
INSERT INTO "param"."t28_provincias" VALUES (60, '0607', 'HUALGAYOC', NULL, 6, 't');
INSERT INTO "param"."t28_provincias" VALUES (61, '0608', 'JAEN', NULL, 6, 't');
INSERT INTO "param"."t28_provincias" VALUES (62, '0609', 'SANTA CRUZ', NULL, 6, 't');
INSERT INTO "param"."t28_provincias" VALUES (63, '0610', 'SAN MIGUEL', NULL, 6, 't');
INSERT INTO "param"."t28_provincias" VALUES (64, '0611', 'SAN IGNACIO', NULL, 6, 't');
INSERT INTO "param"."t28_provincias" VALUES (65, '0612', 'SAN MARCOS', NULL, 6, 't');
INSERT INTO "param"."t28_provincias" VALUES (66, '0613', 'SAN PABLO', NULL, 6, 't');
INSERT INTO "param"."t28_provincias" VALUES (67, '0701', 'CUSCO', NULL, 7, 't');
INSERT INTO "param"."t28_provincias" VALUES (69, '0703', 'ANTA', NULL, 7, 't');
INSERT INTO "param"."t28_provincias" VALUES (70, '0704', 'CALCA', NULL, 7, 't');
INSERT INTO "param"."t28_provincias" VALUES (71, '0705', 'CANAS', NULL, 7, 't');
INSERT INTO "param"."t28_provincias" VALUES (72, '0706', 'CANCHIS', NULL, 7, 't');
INSERT INTO "param"."t28_provincias" VALUES (73, '0707', 'CHUMBIVILCAS', NULL, 7, 't');
INSERT INTO "param"."t28_provincias" VALUES (74, '0708', 'ESPINAR', NULL, 7, 't');
INSERT INTO "param"."t28_provincias" VALUES (76, '0710', 'PARURO', NULL, 7, 't');
INSERT INTO "param"."t28_provincias" VALUES (77, '0711', 'PAUCARTAMBO', NULL, 7, 't');
INSERT INTO "param"."t28_provincias" VALUES (78, '0712', 'QUISPICANCHIS', NULL, 7, 't');
INSERT INTO "param"."t28_provincias" VALUES (79, '0713', 'URUBAMBA', NULL, 7, 't');
INSERT INTO "param"."t28_provincias" VALUES (80, '0801', 'HUANCAVELICA', NULL, 8, 't');
INSERT INTO "param"."t28_provincias" VALUES (81, '0802', 'ACOBAMBA', NULL, 8, 't');
INSERT INTO "param"."t28_provincias" VALUES (82, '0803', 'ANGARAES', NULL, 8, 't');
INSERT INTO "param"."t28_provincias" VALUES (83, '0804', 'CASTROVIRREYNA', NULL, 8, 't');
INSERT INTO "param"."t28_provincias" VALUES (85, '0806', 'HUAYTARA', NULL, 8, 't');
INSERT INTO "param"."t28_provincias" VALUES (86, '0807', 'CHURCAMPA', NULL, 8, 't');
INSERT INTO "param"."t28_provincias" VALUES (87, '0901', 'HUANUCO', NULL, 9, 't');
INSERT INTO "param"."t28_provincias" VALUES (88, '0902', 'AMBO', NULL, 9, 't');
INSERT INTO "param"."t28_provincias" VALUES (89, '0903', 'DOS DE MAYO', NULL, 9, 't');
INSERT INTO "param"."t28_provincias" VALUES (90, '0904', 'HUAMALIES', NULL, 9, 't');
INSERT INTO "param"."t28_provincias" VALUES (91, '0905', 'MARANON', NULL, 9, 't');
INSERT INTO "param"."t28_provincias" VALUES (92, '0906', 'LEONCIO PRADO', NULL, 9, 't');
INSERT INTO "param"."t28_provincias" VALUES (93, '0907', 'PACHITEA', NULL, 9, 't');
INSERT INTO "param"."t28_provincias" VALUES (94, '0908', 'PUERTO INCA', NULL, 9, 't');
INSERT INTO "param"."t28_provincias" VALUES (96, '0910', 'LAURICOCHA', NULL, 9, 't');
INSERT INTO "param"."t28_provincias" VALUES (97, '0911', 'YAROWILCA', NULL, 9, 't');
INSERT INTO "param"."t28_provincias" VALUES (98, '1001', 'ICA', NULL, 10, 't');
INSERT INTO "param"."t28_provincias" VALUES (99, '1002', 'CHINCHA', NULL, 10, 't');
INSERT INTO "param"."t28_provincias" VALUES (100, '1003', 'NAZCA', NULL, 10, 't');
INSERT INTO "param"."t28_provincias" VALUES (101, '1004', 'PISCO', NULL, 10, 't');
INSERT INTO "param"."t28_provincias" VALUES (102, '1005', 'PALPA', NULL, 10, 't');
INSERT INTO "param"."t28_provincias" VALUES (104, '1102', 'CONCEPCION', NULL, 11, 't');
INSERT INTO "param"."t28_provincias" VALUES (105, '1103', 'JAUJA', NULL, 11, 't');
INSERT INTO "param"."t28_provincias" VALUES (106, '1104', 'JUNIN', NULL, 11, 't');
INSERT INTO "param"."t28_provincias" VALUES (107, '1105', 'TARMA', NULL, 11, 't');
INSERT INTO "param"."t28_provincias" VALUES (108, '1106', 'YAULI', NULL, 11, 't');
INSERT INTO "param"."t28_provincias" VALUES (110, '1108', 'CHANCHAMAYO', NULL, 11, 't');
INSERT INTO "param"."t28_provincias" VALUES (111, '1109', 'CHUPACA', NULL, 11, 't');
INSERT INTO "param"."t28_provincias" VALUES (112, '1201', 'TRUJILLO', NULL, 12, 't');
INSERT INTO "param"."t28_provincias" VALUES (113, '1202', 'BOLIVAR', NULL, 12, 't');
INSERT INTO "param"."t28_provincias" VALUES (114, '1203', 'SANCHEZ CARRION', NULL, 12, 't');
INSERT INTO "param"."t28_provincias" VALUES (115, '1204', 'OTUZCO', NULL, 12, 't');
INSERT INTO "param"."t28_provincias" VALUES (117, '1206', 'PATAZ', NULL, 12, 't');
INSERT INTO "param"."t28_provincias" VALUES (118, '1207', 'SANTIAGO DE CHUCO', NULL, 12, 't');
INSERT INTO "param"."t28_provincias" VALUES (119, '1208', 'ASCOPE', NULL, 12, 't');
INSERT INTO "param"."t28_provincias" VALUES (120, '1209', 'CHEPEN', NULL, 12, 't');
INSERT INTO "param"."t28_provincias" VALUES (121, '1210', 'JULCAN', NULL, 12, 't');
INSERT INTO "param"."t28_provincias" VALUES (123, '1212', 'VIRU', NULL, 12, 't');
INSERT INTO "param"."t28_provincias" VALUES (124, '1301', 'CHICLAYO', NULL, 13, 't');
INSERT INTO "param"."t28_provincias" VALUES (125, '1302', 'FERRENAFE', NULL, 13, 't');
INSERT INTO "param"."t28_provincias" VALUES (126, '1303', 'LAMBAYEQUE', NULL, 13, 't');
INSERT INTO "param"."t28_provincias" VALUES (127, '1401', 'LIMA', NULL, 14, 't');
INSERT INTO "param"."t28_provincias" VALUES (128, '1402', 'CAJATAMBO', NULL, 14, 't');
INSERT INTO "param"."t28_provincias" VALUES (129, '1403', 'CANTA', NULL, 14, 't');
INSERT INTO "param"."t28_provincias" VALUES (130, '1404', 'CANETE', NULL, 14, 't');
INSERT INTO "param"."t28_provincias" VALUES (132, '1406', 'HUAROCHIRI', NULL, 14, 't');
INSERT INTO "param"."t28_provincias" VALUES (133, '1407', 'YAUYOS', NULL, 14, 't');
INSERT INTO "param"."t28_provincias" VALUES (134, '1408', 'HUARAL', NULL, 14, 't');
INSERT INTO "param"."t28_provincias" VALUES (135, '1409', 'BARRANCA', NULL, 14, 't');
INSERT INTO "param"."t28_provincias" VALUES (136, '1410', 'OYON', NULL, 14, 't');
INSERT INTO "param"."t28_provincias" VALUES (138, '1502', 'ALTO AMAZONAS', NULL, 15, 't');
INSERT INTO "param"."t28_provincias" VALUES (139, '1503', 'LORETO', NULL, 15, 't');
INSERT INTO "param"."t28_provincias" VALUES (140, '1504', 'REQUENA', NULL, 15, 't');
INSERT INTO "param"."t28_provincias" VALUES (141, '1505', 'UCAYALI', NULL, 15, 't');
INSERT INTO "param"."t28_provincias" VALUES (143, '1507', 'DATEM DEL MARAÑON', NULL, 15, 't');
INSERT INTO "param"."t28_provincias" VALUES (144, '1601', 'TAMBOPATA', NULL, 16, 't');
INSERT INTO "param"."t28_provincias" VALUES (145, '1602', 'MANU', NULL, 16, 't');
INSERT INTO "param"."t28_provincias" VALUES (146, '1603', 'TAHUAMANU', NULL, 16, 't');
INSERT INTO "param"."t28_provincias" VALUES (147, '1701', 'MARISCAL NIETO', NULL, 17, 't');
INSERT INTO "param"."t28_provincias" VALUES (1, '0101', 'CHACHAPOYAS', NULL, 1, 't');
INSERT INTO "param"."t28_provincias" VALUES (9, '0202', 'AIJA', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (16, '0209', 'MARISCAL LUZURIAGA', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (23, '0216', 'ANTONIO RAIMONDI', NULL, 2, 't');
INSERT INTO "param"."t28_provincias" VALUES (34, '0307', 'CHINCHEROS', NULL, 3, 't');
INSERT INTO "param"."t28_provincias" VALUES (43, '0501', 'HUAMANGA', NULL, 5, 't');
INSERT INTO "param"."t28_provincias" VALUES (50, '0508', 'HUANCA SANCOS', NULL, 5, 't');
INSERT INTO "param"."t28_provincias" VALUES (59, '0606', 'CHOTA', NULL, 6, 't');
INSERT INTO "param"."t28_provincias" VALUES (68, '0702', 'ACOMAYO', NULL, 7, 't');
INSERT INTO "param"."t28_provincias" VALUES (75, '0709', 'LA CONVENCION', NULL, 7, 't');
INSERT INTO "param"."t28_provincias" VALUES (84, '0805', 'TAYACAJA', NULL, 8, 't');
INSERT INTO "param"."t28_provincias" VALUES (95, '0909', 'HUACAYBAMBA', NULL, 9, 't');
INSERT INTO "param"."t28_provincias" VALUES (103, '1101', 'HUANCAYO', NULL, 11, 't');
INSERT INTO "param"."t28_provincias" VALUES (109, '1107', 'SATIPO', NULL, 11, 't');
INSERT INTO "param"."t28_provincias" VALUES (116, '1205', 'PACASMAYO', NULL, 12, 't');
INSERT INTO "param"."t28_provincias" VALUES (122, '1211', 'GRAN CHIMU', NULL, 12, 't');
INSERT INTO "param"."t28_provincias" VALUES (131, '1405', 'HUAURA', NULL, 14, 't');
INSERT INTO "param"."t28_provincias" VALUES (137, '1501', 'MAYNAS', NULL, 15, 't');
INSERT INTO "param"."t28_provincias" VALUES (142, '1506', 'MARISCAL RAMON CASTILLA', NULL, 15, 't');
INSERT INTO "param"."t28_provincias" VALUES (148, '1702', 'GENERAL SANCHEZ CERRO', NULL, 17, 't');
INSERT INTO "param"."t28_provincias" VALUES (149, '1703', 'ILO', NULL, 17, 't');
INSERT INTO "param"."t28_provincias" VALUES (150, '1801', 'PASCO', NULL, 18, 't');
INSERT INTO "param"."t28_provincias" VALUES (151, '1802', 'DANIEL ALCIDES CARRION', NULL, 18, 't');
INSERT INTO "param"."t28_provincias" VALUES (152, '1803', 'OXAPAMPA', NULL, 18, 't');
INSERT INTO "param"."t28_provincias" VALUES (153, '1901', 'PIURA', NULL, 19, 't');
INSERT INTO "param"."t28_provincias" VALUES (154, '1902', 'AYABACA', NULL, 19, 't');
INSERT INTO "param"."t28_provincias" VALUES (155, '1903', 'HUANCABAMBA', NULL, 19, 't');
INSERT INTO "param"."t28_provincias" VALUES (156, '1904', 'MORROPON', NULL, 19, 't');
INSERT INTO "param"."t28_provincias" VALUES (157, '1905', 'PAITA', NULL, 19, 't');
INSERT INTO "param"."t28_provincias" VALUES (158, '1906', 'SULLANA', NULL, 19, 't');
INSERT INTO "param"."t28_provincias" VALUES (159, '1907', 'TALARA', NULL, 19, 't');
INSERT INTO "param"."t28_provincias" VALUES (160, '1908', 'SECHURA', NULL, 19, 't');
INSERT INTO "param"."t28_provincias" VALUES (161, '2001', 'PUNO', NULL, 20, 't');
INSERT INTO "param"."t28_provincias" VALUES (162, '2002', 'AZANGARO', NULL, 20, 't');
INSERT INTO "param"."t28_provincias" VALUES (163, '2003', 'CARABAYA', NULL, 20, 't');
INSERT INTO "param"."t28_provincias" VALUES (164, '2004', 'CHUCUITO', NULL, 20, 't');
INSERT INTO "param"."t28_provincias" VALUES (165, '2005', 'HUANCANE', NULL, 20, 't');
INSERT INTO "param"."t28_provincias" VALUES (166, '2006', 'LAMPA', NULL, 20, 't');
INSERT INTO "param"."t28_provincias" VALUES (167, '2007', 'MELGAR', NULL, 20, 't');
INSERT INTO "param"."t28_provincias" VALUES (168, '2008', 'SANDIA', NULL, 20, 't');
INSERT INTO "param"."t28_provincias" VALUES (169, '2009', 'SAN ROMAN', NULL, 20, 't');
INSERT INTO "param"."t28_provincias" VALUES (170, '2010', 'YUNGUYO', NULL, 20, 't');
INSERT INTO "param"."t28_provincias" VALUES (171, '2011', 'SAN ANTONIO DE PUTINA', NULL, 20, 't');
INSERT INTO "param"."t28_provincias" VALUES (172, '2012', 'EL COLLAO', NULL, 20, 't');
INSERT INTO "param"."t28_provincias" VALUES (173, '2013', 'MOHO', NULL, 20, 't');
INSERT INTO "param"."t28_provincias" VALUES (174, '2101', 'MOYOBAMBA', NULL, 21, 't');
INSERT INTO "param"."t28_provincias" VALUES (175, '2102', 'HUALLAGA', NULL, 21, 't');
INSERT INTO "param"."t28_provincias" VALUES (176, '2103', 'LAMAS', NULL, 21, 't');
INSERT INTO "param"."t28_provincias" VALUES (177, '2104', 'MARISCAL CACERES', NULL, 21, 't');
INSERT INTO "param"."t28_provincias" VALUES (178, '2105', 'RIOJA', NULL, 21, 't');
INSERT INTO "param"."t28_provincias" VALUES (179, '2106', 'SAN MARTIN', NULL, 21, 't');
INSERT INTO "param"."t28_provincias" VALUES (180, '2107', 'BELLAVISTA', NULL, 21, 't');
INSERT INTO "param"."t28_provincias" VALUES (181, '2108', 'TOCACHE', NULL, 21, 't');
INSERT INTO "param"."t28_provincias" VALUES (182, '2109', 'PICOTA', NULL, 21, 't');
INSERT INTO "param"."t28_provincias" VALUES (183, '2110', 'EL DORADO', NULL, 21, 't');
INSERT INTO "param"."t28_provincias" VALUES (184, '2201', 'TACNA', NULL, 22, 't');
INSERT INTO "param"."t28_provincias" VALUES (185, '2202', 'TARATA', NULL, 22, 't');
INSERT INTO "param"."t28_provincias" VALUES (186, '2203', 'JORGE BASADRE', NULL, 22, 't');
INSERT INTO "param"."t28_provincias" VALUES (187, '2204', 'CANDARAVE', NULL, 22, 't');
INSERT INTO "param"."t28_provincias" VALUES (188, '2301', 'TUMBES', NULL, 23, 't');
INSERT INTO "param"."t28_provincias" VALUES (189, '2302', 'CONTRALMIRANTE VILLAR', NULL, 23, 't');
INSERT INTO "param"."t28_provincias" VALUES (190, '2303', 'ZARUMILLA', NULL, 23, 't');
INSERT INTO "param"."t28_provincias" VALUES (191, '2401', 'CALLAO', NULL, 24, 't');
INSERT INTO "param"."t28_provincias" VALUES (192, '2501', 'CORONEL PORTILLO', NULL, 25, 't');
INSERT INTO "param"."t28_provincias" VALUES (193, '2502', 'PADRE ABAD', NULL, 25, 't');
INSERT INTO "param"."t28_provincias" VALUES (194, '2503', 'ATALAYA', NULL, 25, 't');
INSERT INTO "param"."t28_provincias" VALUES (195, '2504', 'PURUS', NULL, 25, 't');

-- ----------------------------
-- Table structure for t33_regimenLaboral
-- ----------------------------
DROP TABLE IF EXISTS "param"."t33_regimenLaboral";
CREATE TABLE "param"."t33_regimenLaboral" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t33_regimenLaboral_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(150) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(150) COLLATE "pg_catalog"."default",
  "sectorPub" bool,
  "sectorPriv" bool,
  "sectorOtro" bool,
  "activo" bool
)
;

-- ----------------------------
-- Records of t33_regimenLaboral
-- ----------------------------
INSERT INTO "param"."t33_regimenLaboral" VALUES (1, '01', 'PRIVADO GENERAL -DECRETO LEGISLATIVO N.° 728', 'D LEG N.° 728', 't', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (2, '02', 'PÚBLICO GENERAL - DECRETO LEGISLATIVO N.° 276', 'D.LEG N.° 276', 'f', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (3, '03', 'PROFESORADO - LEY N.° 24029', 'PROFESORADO LEY 24029', 'f', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (4, '04', 'MAGISTERIO - LEY N.° 29062', 'MAGISTERIO  LEY 29062', 'f', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (5, '05', 'DOCENTES UNIVERSITARIOS - LEY N.° 23733', 'DOC UNIVERS LEY 23733', 'f', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (6, '06', 'PROFESIONALES DE LA SALUD LEY N.° 23536', 'PROFES SALUD LEY 23536', 'f', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (7, '07', 'TECNICOS Y AUXILIARES ASIST. DE LA SALUD - LEY N.° 28561', 'TECN Y AUX ASIST SALUD LEY 28561', 'f', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (8, '08', 'SERUM - LEY N.° 23330', 'SERUM LEY 23330', 'f', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (9, '09', 'JUECES - CARRERA JUDICIAL - LEY N.° 29277', 'JUECES LEY 29277', 'f', 't', 'f', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (10, '10', 'FISCALES - D. LEG.  N.° 052', 'FISCALES D.LEG 052', 'f', 't', 'f', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (11, '11', 'SERVICIO DIPLOMÁTICO DE LA REPÚBLICA - LEY N.° 28091', 'SERVICIO DIPLOM. REPÚBLICA LEY 28091', 'f', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (12, '12', 'MILITARES', 'MILITARES', 'f', 't', 'f', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (13, '13', 'POLICIA NACIONAL DEL PERÚ - LEY N.° 27238', 'POLICIAS LEY 27238', 'f', 't', 'f', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (14, '14', 'ESPECIAL GER. PÚBLICOS DECRETO LEGISLATIVO N.° 1024 (2)', 'ESPECIAL GER. PÚBL D LEG 1024', 'f', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (15, '15', 'CONTRATO ADMINISTRATIVO DE SERVICIOS - D.LEG. N.° 1057', 'CAS D.LEG 1057', 'f', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (16, '16', 'MICROEMPRESA D. LEG. 1086 (1)', 'MICROEMPRESA', 't', 'f', 'f', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (17, '17', 'PEQUEÑA EMPRESA D. LEG. 1086 (1)', 'PEQUEÑA EMPRESA', 't', 'f', 'f', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (18, '18', 'AGRARIO LEY 27360', 'AGRARIO', 't', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (19, '19', 'EXPORTACION NO TRADICIONAL D. LEY 22342', 'EXPORTACION NO TRADICIONAL', 't', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (20, '20', 'MINEROS', 'MINEROS', 't', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (21, '21', 'CONSTRUCCION CIVIL', 'CONSTRUCCION CIVIL', 't', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (22, '22', 'PÚBLICO GENERAL SERVICIO CIVIL - LEY 30057', 'SERVICIO CIVIL - LEY 30057', 'f', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (23, '23', 'MAGISTERIO - LEY 29944', NULL, 'f', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (24, '24', 'POLICÍA NACIONAL DEL PERÚ - D.LEG.1149', NULL, 'f', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (25, '25', 'SERVIDORES PENITENCIARIOS - LEY 29709', NULL, 'f', 't', 't', 't');
INSERT INTO "param"."t33_regimenLaboral" VALUES (26, '99', 'OTROS NO PREVISTOS', 'OTROS', 't', 't', 't', 't');

-- ----------------------------
-- Table structure for t34_modalidadesForm
-- ----------------------------
DROP TABLE IF EXISTS "param"."t34_modalidadesForm";
CREATE TABLE "param"."t34_modalidadesForm" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t34_modalidadesForm_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t34_modalidadesForm
-- ----------------------------
INSERT INTO "param"."t34_modalidadesForm" VALUES (1, '1', 'EDUCACION BASICA REGULAR', 'EBR', 't');
INSERT INTO "param"."t34_modalidadesForm" VALUES (2, '2', 'EDUCACION BASICA ALTERNATIVA', 'EBA', 't');
INSERT INTO "param"."t34_modalidadesForm" VALUES (3, '3', 'EDUCACION BASICA ESPECIAL', 'EBE', 't');
INSERT INTO "param"."t34_modalidadesForm" VALUES (4, '4', 'EDUCACION SUPERIOR', 'ESU', 't');

-- ----------------------------
-- Table structure for t34_nivelesCiclo
-- ----------------------------
DROP TABLE IF EXISTS "param"."t34_nivelesCiclo";
CREATE TABLE "param"."t34_nivelesCiclo" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t34_nivelesCiclo_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t34_nivelesCiclo
-- ----------------------------
INSERT INTO "param"."t34_nivelesCiclo" VALUES (1, '1', 'INICIAL', 'INICIAL', 't');
INSERT INTO "param"."t34_nivelesCiclo" VALUES (2, '2', 'PRIMARIA', 'PRIMARIA', 't');
INSERT INTO "param"."t34_nivelesCiclo" VALUES (3, '3', 'SECUNDARIA', 'SECUNDARIA', 't');
INSERT INTO "param"."t34_nivelesCiclo" VALUES (4, '4', 'SUPERIOR', 'SUPERIOR', 't');

-- ----------------------------
-- Table structure for t34_regimenEduc
-- ----------------------------
DROP TABLE IF EXISTS "param"."t34_regimenEduc";
CREATE TABLE "param"."t34_regimenEduc" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t34_regimenEduc_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t34_regimenEduc
-- ----------------------------
INSERT INTO "param"."t34_regimenEduc" VALUES (1, '1', 'PUBLICA DE GESTION DIRECTA', 'PUB-GDIR', 't');
INSERT INTO "param"."t34_regimenEduc" VALUES (2, '2', 'PUBLICA DE GESTION PRIVADA', 'PUB-GPRIV', 't');
INSERT INTO "param"."t34_regimenEduc" VALUES (3, '3', 'PRIVADA', 'PRIV', 't');

-- ----------------------------
-- Table structure for t34_tipoInstEduc
-- ----------------------------
DROP TABLE IF EXISTS "param"."t34_tipoInstEduc";
CREATE TABLE "param"."t34_tipoInstEduc" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t34_tipoInstEduc_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t34_tipoInstEduc
-- ----------------------------
INSERT INTO "param"."t34_tipoInstEduc" VALUES (1, '1', 'UNIDOCENTE', 'UNIDOCENTE', 't');
INSERT INTO "param"."t34_tipoInstEduc" VALUES (2, '2', 'MULTIGRADO', 'MULTIGRADO', 't');

-- ----------------------------
-- Table structure for t3_tipoDocIdentidad
-- ----------------------------
DROP TABLE IF EXISTS "param"."t3_tipoDocIdentidad";
CREATE TABLE "param"."t3_tipoDocIdentidad" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t3_tipoDocIdentidad_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t3_tipoDocIdentidad
-- ----------------------------
INSERT INTO "param"."t3_tipoDocIdentidad" VALUES (1, '01', 'DOCUMENTO NACIONAL DE IDENTIDAD', 'DNI', 't');
INSERT INTO "param"."t3_tipoDocIdentidad" VALUES (2, '04', 'CARNÉ DE EXTRANJERÍA', 'CARNÉ EXT.', 't');
INSERT INTO "param"."t3_tipoDocIdentidad" VALUES (3, '06', 'REG. ÚNICO DE CONTRIBUYENTES (1)', 'RUC', 't');
INSERT INTO "param"."t3_tipoDocIdentidad" VALUES (4, '07', 'PASAPORTE', 'PASAPORTE', 't');
INSERT INTO "param"."t3_tipoDocIdentidad" VALUES (5, '09', 'CARNÉ DE SOLICIT DE REFUGIO', 'CARNÉ SOLIC REFUGIO', 't');
INSERT INTO "param"."t3_tipoDocIdentidad" VALUES (6, '11', 'PARTIDA DE NACIMIENTO (2)', 'PART. NAC.', 't');
INSERT INTO "param"."t3_tipoDocIdentidad" VALUES (7, '22', 'CARNÉ DE IDENTIDAD - RELACIONES EXTERIORES', 'C.IDENT.-RREE', 't');
INSERT INTO "param"."t3_tipoDocIdentidad" VALUES (8, '23', 'PERM.TEMP.PERMANENCIA', 'PTP', 't');
INSERT INTO "param"."t3_tipoDocIdentidad" VALUES (9, '24', 'DOC. DE IDENTIDAD EXTRANJERO (3)', 'DOC.ID.EXTR.', 't');
INSERT INTO "param"."t3_tipoDocIdentidad" VALUES (10, '26', 'CARNÉ DE PERMISO TEMP DE PERMANENCIA', 'CPP', 't');

-- ----------------------------
-- Table structure for t6_tiposZona
-- ----------------------------
DROP TABLE IF EXISTS "param"."t6_tiposZona";
CREATE TABLE "param"."t6_tiposZona" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t6_tiposZona_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "activo" bool
)
;

-- ----------------------------
-- Records of t6_tiposZona
-- ----------------------------
INSERT INTO "param"."t6_tiposZona" VALUES (10, '10', 'CAS. CASERÍO', 'CAS.', 't');
INSERT INTO "param"."t6_tiposZona" VALUES (11, '11', 'FND. FUNDO', 'FND.', 't');
INSERT INTO "param"."t6_tiposZona" VALUES (12, '99', 'OTROS', 'OTROS', 't');
INSERT INTO "param"."t6_tiposZona" VALUES (1, '01', 'URB. URBANIZACIÓN', 'URB.', 't');
INSERT INTO "param"."t6_tiposZona" VALUES (2, '02', 'P.J. PUEBLO JOVEN', 'P.J.', 't');
INSERT INTO "param"."t6_tiposZona" VALUES (3, '03', 'U.V. UNIDAD VECINAL', 'U.V.', 't');
INSERT INTO "param"."t6_tiposZona" VALUES (4, '04', 'C.H. CONJUNTO HABITACIONAL', 'C.H.', 't');
INSERT INTO "param"."t6_tiposZona" VALUES (5, '05', 'A.H. ASENTAMIENTO HUMANO', 'A.H.', 't');
INSERT INTO "param"."t6_tiposZona" VALUES (6, '06', 'COO. COOPERATIVA', 'COO.', 't');
INSERT INTO "param"."t6_tiposZona" VALUES (7, '07', 'RES. RESIDENCIAL', 'RES.', 't');
INSERT INTO "param"."t6_tiposZona" VALUES (8, '08', 'Z.I. ZONA INDUSTRIAL', 'Z.I.', 't');
INSERT INTO "param"."t6_tiposZona" VALUES (9, '09', 'GRU. GRUPO', 'GRU.', 't');

-- ----------------------------
-- Table structure for t8_tipoTrabajador
-- ----------------------------
DROP TABLE IF EXISTS "param"."t8_tipoTrabajador";
CREATE TABLE "param"."t8_tipoTrabajador" (
  "id" int2 NOT NULL DEFAULT nextval('"param"."t8_tipoTrabajador_id_seq"'::regclass),
  "codigo" varchar(20) COLLATE "pg_catalog"."default",
  "nombre" varchar(100) COLLATE "pg_catalog"."default",
  "abreviatura" varchar(100) COLLATE "pg_catalog"."default",
  "sectorPub" bool,
  "sectorPriv" bool,
  "sectorOtro" bool,
  "activo" bool
)
;

-- ----------------------------
-- Records of t8_tipoTrabajador
-- ----------------------------
INSERT INTO "param"."t8_tipoTrabajador" VALUES (28, '84', 'SERVIDOR PÚBLICO - DIRECTIVO  SUPERIOR', 'SERVIDOR PÚB - DIRECT SUPERIOR', 'f', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (29, '85', 'SERVIDOR PÚBLICO - EJECUTIVO', 'SERVIDOR PÚB - EJECUTIVO', 'f', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (30, '86', 'SERVIDOR PÚBLICO - ESPECIALISTA', 'SERVIDOR PÚB - ESPECIALISTA', 'f', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (31, '87', 'SERVIDOR PÚBLICO - DE APOYO', 'SERVIDOR PÚB - DE APOYO', 'f', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (32, '88', 'PERSONAL DE LA ADMIN. PÚBLICA - ASIGNACIÓN ESPECIAL - D.U. 126-2001', 'PERS ADM PÚB - ASIG ESP DU 126-2001', 'f', 't', 'f', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (33, '89', 'PERSONAL DE LAS FUERZAS ARMADAS Y POLICIALES (1)', 'PERS DE LAS FFAA Y POLICIALES', 'f', 't', 'f', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (34, '90', 'GERENTES PÚBLICOS  - D. LEG. 1024', 'GERENTES PÚB.  - D.LEG 1024', 'f', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (35, '91', 'MIIEMBROS DE OTROS REG. ESPECIALES DEL SECTOR PÚBLICO', 'MIIEMBROS DE OTROS REG. ESPEC S.PUBLICO', 'f', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (36, '92', 'FUNCIONARIO PUBLICO - LEY 30057', 'FUNCIONARIO PÚBLICO - LEY 30057', 'f', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (37, '93', 'DIRECTIVO PÚBLICO - LEY 30057', 'DIRECTIVO PÚBLICO - LEY 30057', 'f', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (38, '94', 'SERVIDOR CIVIL DE CARRERA - LEY 30057', 'SERVIDOR CIVIL DE CARRERA - LEY 30057', 'f', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (39, '95', 'SERVIDOR DE ACTIVIDADES COMPLEMENTARIAS - LEY 30057', 'SERVIDOR DE ACT. COMPLEM. - LEY 30057', 'f', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (40, '96', 'MAGISTERIO - LEY 29944', 'MAGISTERIO - LEY 29944', 'f', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (41, '98', 'PERSONA QUE GENERA INGRESOS DE CUARTA - QUINTA CATEGORÍA', 'CUARTA - QUINTA CATEGORÍA', 't', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (1, '19', 'EJECUTIVO', 'EJECUTIVO', 't', 'f', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (2, '20', 'OBRERO', 'OBRERO', 't', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (3, '21', 'EMPLEADO', 'EMPLEADO', 't', 'f', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (4, '22', 'TRABAJADOR PORTUARIO - LEY 27866', 'TRAB.PORTUARIO', 't', 'f', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (5, '23', 'PRACTICANTE SENATI - DEC. LEY 20151', 'PRACT. SENATI', 't', 'f', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (6, '24', 'PENSIONISTA O CESANTE', 'PENSIONISTA O CESANTE', 't', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (7, '25', 'BENEFICIARIO DE TRANSF DIRECTA EX PESCADPRES', 'BENEFICIARIO DE TDEP', 'f', 't', 'f', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (8, '26', 'PENSIONISTA - LEY 28320', 'PENSIONISTA - LEY 28320', 't', 'f', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (9, '27', 'CONSTRUCCIÓN CIVIL', 'CONSTRUCCIÓN CIVIL', 't', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (10, '28', 'PILOTO Y COPILOTO DE AVIACIÓN COMERCIAL', 'PILOTO Y COPIL DE AVIA. COM.', 't', 'f', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (11, '29', 'MARÍTIMO, FLUVIAL O LACUSTRE', 'MARÍT, FLUVIAL O LACUSTRE', 't', 'f', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (12, '30', 'PERIODISTA', 'PERIODISTA', 't', 'f', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (13, '31', 'TRABAJADOR DE LA INDUSTRIA DE CUERO', 'TRAB. DE LA IND. DE CUERO', 't', 'f', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (14, '32', 'MINERO DE MINA DE SOCAVÓN', 'MINERO DE SOCAVÓN', 't', 'f', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (15, '36', 'TRABAJADOR PESQUERO ', 'TRABAJADOR PESQUERO', 't', 'f', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (16, '37', 'MINERO DE TAJO ABIERTO', 'MINERO DE TAJO ABIERTO', 't', 'f', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (17, '38', 'MINERO DE INDUSTRIA MINERA METALÚRGICA Y/O SIDERÚRGICA', 'MINERO IND. MINERA METAL. Y/O SIDERUR', 't', 'f', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (18, '39', 'TRABAJADOR PESQUERO – LEY 30003', 'TRAB. PESQUEROS – LEY 28320', 't', 'f', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (19, '56', 'ARTISTA -  LEY 28131', 'ARTISTA -  LEY 28131', 't', 'f', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (20, '64', 'AGRARIO DEPENDIENTE - LEY 27360', 'AGRARIO DEPEND.- LEY 27360', 't', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (21, '65', 'TRABAJADOR ACTIVIDAD ACUÍCOLA - LEY 27460', 'TRAB. ACTIV.ACUÍCOLA LEY 27460', 't', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (22, '66', 'PESCADOR Y PROCESADOR ARTESANAL INDEPENDIENTE  - LEY 27177 ', 'PESC.Y PROC.ARTES.INDEP.', 't', 'f', 'f', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (23, '67', 'REGIMEN  ESPECIAL D. LEG.1057 - CAS', 'REG. ESPECIAL D. LEG.1057 - CAS', 'f', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (24, '71', 'CONDUCTOR DE MICROEMPRESA REMYPE - D.LEG.1086', 'CONDUCT MICROEMP.REMYPE D.L.1086', 't', 'f', 'f', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (25, '73', 'SOCIO DE COOPERATIVA AGRARIA – LEY N.° 29972', 'SOCIO COOPER. AGRAR. – LEY N.° 29972', 't', 'f', 'f', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (26, '82', 'FUNCIONARIO PÚBLICO', 'FUNCIONARIO PÚBLICO', 'f', 't', 't', 't');
INSERT INTO "param"."t8_tipoTrabajador" VALUES (27, '83', 'EMPLEADO DE CONFIANZA', 'EMPLEADO DE CONFIANZA', 'f', 't', 't', 't');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t00_documentos_id_seq"
OWNED BY "param"."t00_documentos"."id";
SELECT setval('"param"."t00_documentos_id_seq"', 51, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t00_estadosAsis_id_seq"
OWNED BY "param"."t00_estadosAsis"."id";
SELECT setval('"param"."t00_estadosAsis_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t00_estadosTram_id_seq"
OWNED BY "param"."t00_estadosTram"."id";
SELECT setval('"param"."t00_estadosTram_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t00_feriados_id_seq"
OWNED BY "param"."t00_feriados"."id";
SELECT setval('"param"."t00_feriados_id_seq"', 16, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t00_motivosSuspLab_id_seq"
OWNED BY "param"."t00_motivosSuspLab"."id";
SELECT setval('"param"."t00_motivosSuspLab_id_seq"', 22, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t00_operadores_id_seq"
OWNED BY "param"."t00_operadores"."id";
SELECT setval('"param"."t00_operadores_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t00_rolTrabajador_id_seq"
OWNED BY "param"."t00_rolTrabajador"."id";
SELECT setval('"param"."t00_rolTrabajador_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t00_sexos_id_seq"
OWNED BY "param"."t00_sexos"."id";
SELECT setval('"param"."t00_sexos_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t00_tipoEntidad_id_seq"
OWNED BY "param"."t00_tipoEntidad"."id";
SELECT setval('"param"."t00_tipoEntidad_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t00_turnos_id_seq"
OWNED BY "param"."t00_turnos"."id";
SELECT setval('"param"."t00_turnos_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t12_tipoContrato_id_seq"
OWNED BY "param"."t12_tipoContrato"."id";
SELECT setval('"param"."t12_tipoContrato_id_seq"', 26, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t15_situacionLaboral_id_seq"
OWNED BY "param"."t15_situacionLaboral"."id";
SELECT setval('"param"."t15_situacionLaboral_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t17_motivoDeBajas_id_seq"
OWNED BY "param"."t17_motivoDeBajas"."id";
SELECT setval('"param"."t17_motivoDeBajas_id_seq"', 21, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t21_tipoSuspensionLaboral_id_seq"
OWNED BY "param"."t21_tipoSuspensionLaboral"."id";
SELECT setval('"param"."t21_tipoSuspensionLaboral_id_seq"', 28, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t26_pais_id_seq"
OWNED BY "param"."t26_pais"."id";
SELECT setval('"param"."t26_pais_id_seq"', 273, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t28_departamento_id_seq"
OWNED BY "param"."t28_departamento"."id";
SELECT setval('"param"."t28_departamento_id_seq"', 25, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t28_distritos_id_seq"
OWNED BY "param"."t28_distritos"."id";
SELECT setval('"param"."t28_distritos_id_seq"', 1834, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t28_provincias_id_seq"
OWNED BY "param"."t28_provincias"."id";
SELECT setval('"param"."t28_provincias_id_seq"', 195, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t33_regimenLaboral_id_seq"
OWNED BY "param"."t33_regimenLaboral"."id";
SELECT setval('"param"."t33_regimenLaboral_id_seq"', 26, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t34_modalidadesForm_id_seq"
OWNED BY "param"."t34_modalidadesForm"."id";
SELECT setval('"param"."t34_modalidadesForm_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t34_nivelesCiclo_id_seq"
OWNED BY "param"."t34_nivelesCiclo"."id";
SELECT setval('"param"."t34_nivelesCiclo_id_seq"', 9, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t34_regimenEduc_id_seq"
OWNED BY "param"."t34_regimenEduc"."id";
SELECT setval('"param"."t34_regimenEduc_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t34_tipoInstEduc_id_seq"
OWNED BY "param"."t34_tipoInstEduc"."id";
SELECT setval('"param"."t34_tipoInstEduc_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t3_tipoDocIdentidad_id_seq"
OWNED BY "param"."t3_tipoDocIdentidad"."id";
SELECT setval('"param"."t3_tipoDocIdentidad_id_seq"', 10, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t6_tiposZona_id_seq"
OWNED BY "param"."t6_tiposZona"."id";
SELECT setval('"param"."t6_tiposZona_id_seq"', 12, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "param"."t8_tipoTrabajador_id_seq"
OWNED BY "param"."t8_tipoTrabajador"."id";
SELECT setval('"param"."t8_tipoTrabajador_id_seq"', 41, true);

-- ----------------------------
-- Primary Key structure for table t00_documentos
-- ----------------------------
ALTER TABLE "param"."t00_documentos" ADD CONSTRAINT "t00_documentos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t00_estadosAsis
-- ----------------------------
ALTER TABLE "param"."t00_estadosAsis" ADD CONSTRAINT "t00_estadosAsis_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t00_estadosTram
-- ----------------------------
ALTER TABLE "param"."t00_estadosTram" ADD CONSTRAINT "t00_estadosTram_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t00_feriados
-- ----------------------------
ALTER TABLE "param"."t00_feriados" ADD CONSTRAINT "t00_feriados_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t00_motivosSuspLab
-- ----------------------------
ALTER TABLE "param"."t00_motivosSuspLab" ADD CONSTRAINT "t00_motivosSuspLab_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t00_operadores
-- ----------------------------
ALTER TABLE "param"."t00_operadores" ADD CONSTRAINT "t00_operadores_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t00_rolTrabajador
-- ----------------------------
ALTER TABLE "param"."t00_rolTrabajador" ADD CONSTRAINT "t00_rolTrabajador_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t00_sexos
-- ----------------------------
ALTER TABLE "param"."t00_sexos" ADD CONSTRAINT "t00_sexos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t00_tipoEntidad
-- ----------------------------
ALTER TABLE "param"."t00_tipoEntidad" ADD CONSTRAINT "t00_tipoEntidad_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t00_turnos
-- ----------------------------
ALTER TABLE "param"."t00_turnos" ADD CONSTRAINT "t00_turnos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t12_tipoContrato
-- ----------------------------
ALTER TABLE "param"."t12_tipoContrato" ADD CONSTRAINT "t12_tipoContrato_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t15_situacionLaboral
-- ----------------------------
ALTER TABLE "param"."t15_situacionLaboral" ADD CONSTRAINT "t15_situacionLaboral_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t17_motivoDeBajas
-- ----------------------------
ALTER TABLE "param"."t17_motivoDeBajas" ADD CONSTRAINT "t17_motivoDeBajas_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t21_tipoSuspensionLaboral
-- ----------------------------
ALTER TABLE "param"."t21_tipoSuspensionLaboral" ADD CONSTRAINT "t21_tipoSuspensionLaboral_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t26_pais
-- ----------------------------
ALTER TABLE "param"."t26_pais" ADD CONSTRAINT "t26_pais_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t28_departamento
-- ----------------------------
ALTER TABLE "param"."t28_departamento" ADD CONSTRAINT "t28_departamento_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t28_distritos
-- ----------------------------
ALTER TABLE "param"."t28_distritos" ADD CONSTRAINT "t28_distritos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t28_provincias
-- ----------------------------
ALTER TABLE "param"."t28_provincias" ADD CONSTRAINT "t28_provincias_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t33_regimenLaboral
-- ----------------------------
ALTER TABLE "param"."t33_regimenLaboral" ADD CONSTRAINT "t33_regimenLaboral_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t34_modalidadesForm
-- ----------------------------
ALTER TABLE "param"."t34_modalidadesForm" ADD CONSTRAINT "t34_modalidadesForm_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t34_nivelesCiclo
-- ----------------------------
ALTER TABLE "param"."t34_nivelesCiclo" ADD CONSTRAINT "t34_nivelesCiclo_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t34_regimenEduc
-- ----------------------------
ALTER TABLE "param"."t34_regimenEduc" ADD CONSTRAINT "t34_regimenEduc_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t34_tipoInstEduc
-- ----------------------------
ALTER TABLE "param"."t34_tipoInstEduc" ADD CONSTRAINT "t34_tipoInstEduc_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t3_tipoDocIdentidad
-- ----------------------------
ALTER TABLE "param"."t3_tipoDocIdentidad" ADD CONSTRAINT "t3_tipoDocIdentidad_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t6_tiposZona
-- ----------------------------
ALTER TABLE "param"."t6_tiposZona" ADD CONSTRAINT "t6_tiposZona_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t8_tipoTrabajador
-- ----------------------------
ALTER TABLE "param"."t8_tipoTrabajador" ADD CONSTRAINT "t8_tipoTrabajador_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table t00_motivosSuspLab
-- ----------------------------
ALTER TABLE "param"."t00_motivosSuspLab" ADD CONSTRAINT "fk_t00_motivosSuspLab_t21_tipoSuspensionLaboral_1" FOREIGN KEY ("tipoSuspensionLaboral_id") REFERENCES "param"."t21_tipoSuspensionLaboral" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t28_departamento
-- ----------------------------
ALTER TABLE "param"."t28_departamento" ADD CONSTRAINT "fk_t28_departamento_t26_pais_1" FOREIGN KEY ("pais_id") REFERENCES "param"."t26_pais" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t28_distritos
-- ----------------------------
ALTER TABLE "param"."t28_distritos" ADD CONSTRAINT "fk_t28_distritos_t28_provincias_1" FOREIGN KEY ("provincia_id") REFERENCES "param"."t28_provincias" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t28_provincias
-- ----------------------------
ALTER TABLE "param"."t28_provincias" ADD CONSTRAINT "fk_t28_provincias_t28_departamento_1" FOREIGN KEY ("departamento_id") REFERENCES "param"."t28_departamento" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
