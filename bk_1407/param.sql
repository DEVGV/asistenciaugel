--
-- PostgreSQL database dump
--

\restrict ke9CrRiJaSSXm28BeEV0C3OynsE2hSKXyNBK2mQTgxCPzkNDUm09WzIGDJSQrfw

-- Dumped from database version 15.17 (Debian 15.17-1.pgdg13+1)
-- Dumped by pg_dump version 15.17 (Debian 15.17-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: param; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA param;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: t00_documentos; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param.t00_documentos (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(50),
    activo boolean
);


--
-- Name: t00_documentos_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param.t00_documentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t00_documentos_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param.t00_documentos_id_seq OWNED BY param.t00_documentos.id;


--
-- Name: t00_estadosAsis; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t00_estadosAsis" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(50),
    activo boolean
);


--
-- Name: t00_estadosAsis_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t00_estadosAsis_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t00_estadosAsis_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t00_estadosAsis_id_seq" OWNED BY param."t00_estadosAsis".id;


--
-- Name: t00_estadosTram; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t00_estadosTram" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(50),
    activo boolean
);


--
-- Name: t00_estadosTram_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t00_estadosTram_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t00_estadosTram_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t00_estadosTram_id_seq" OWNED BY param."t00_estadosTram".id;


--
-- Name: t00_feriados; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param.t00_feriados (
    id smallint NOT NULL,
    codigo character varying(20),
    descripcion character varying(100),
    "diaMesDefault" character varying(20),
    "programaDefault" boolean,
    activo boolean
);


--
-- Name: t00_feriados_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param.t00_feriados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t00_feriados_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param.t00_feriados_id_seq OWNED BY param.t00_feriados.id;


--
-- Name: t00_motivosSuspLab; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t00_motivosSuspLab" (
    id smallint NOT NULL,
    codigo character varying(10),
    "tipoSuspensionLaboral_id" smallint,
    descripcion character varying(200),
    abreviatura character varying(10),
    "conGoceHaber" boolean,
    asusfal character varying(1),
    "diasMaxCiclo" numeric,
    "codigoProg" character varying(20),
    created_at timestamp(6) without time zone,
    created_by bigint,
    activo boolean,
    "autorizadoPor" character varying(1) DEFAULT 'D'::character varying NOT NULL,
    "descripcionPers" character varying(200),
    "abreviaturaPers" character varying(10)
);


--
-- Name: t00_motivosSuspLab_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t00_motivosSuspLab_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t00_motivosSuspLab_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t00_motivosSuspLab_id_seq" OWNED BY param."t00_motivosSuspLab".id;


--
-- Name: t00_operadores; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param.t00_operadores (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(50),
    activo boolean
);


--
-- Name: t00_operadores_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param.t00_operadores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t00_operadores_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param.t00_operadores_id_seq OWNED BY param.t00_operadores.id;


--
-- Name: t00_rolTrabajador; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t00_rolTrabajador" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    descripcion character varying(100),
    activo boolean
);


--
-- Name: t00_rolTrabajador_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t00_rolTrabajador_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t00_rolTrabajador_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t00_rolTrabajador_id_seq" OWNED BY param."t00_rolTrabajador".id;


--
-- Name: t00_sexos; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param.t00_sexos (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(50),
    activo boolean
);


--
-- Name: t00_sexos_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param.t00_sexos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t00_sexos_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param.t00_sexos_id_seq OWNED BY param.t00_sexos.id;


--
-- Name: t00_tipoEntidad; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t00_tipoEntidad" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(100),
    activo boolean
);


--
-- Name: t00_tipoEntidad_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t00_tipoEntidad_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t00_tipoEntidad_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t00_tipoEntidad_id_seq" OWNED BY param."t00_tipoEntidad".id;


--
-- Name: t00_turnos; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param.t00_turnos (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(50),
    activo boolean
);


--
-- Name: t00_turnos_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param.t00_turnos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t00_turnos_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param.t00_turnos_id_seq OWNED BY param.t00_turnos.id;


--
-- Name: t12_tipoContrato; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t12_tipoContrato" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(100),
    activo boolean
);


--
-- Name: t12_tipoContrato_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t12_tipoContrato_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t12_tipoContrato_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t12_tipoContrato_id_seq" OWNED BY param."t12_tipoContrato".id;


--
-- Name: t15_situacionLaboral; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t15_situacionLaboral" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(100),
    activo boolean
);


--
-- Name: t15_situacionLaboral_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t15_situacionLaboral_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t15_situacionLaboral_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t15_situacionLaboral_id_seq" OWNED BY param."t15_situacionLaboral".id;


--
-- Name: t17_motivoDeBajas; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t17_motivoDeBajas" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(150),
    abreviatura character varying(150),
    activo boolean
);


--
-- Name: t17_motivoDeBajas_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t17_motivoDeBajas_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t17_motivoDeBajas_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t17_motivoDeBajas_id_seq" OWNED BY param."t17_motivoDeBajas".id;


--
-- Name: t21_tipoSuspensionLaboral; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t21_tipoSuspensionLaboral" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(200),
    abreviatura character varying(200),
    "perfeImperfe" character varying(1),
    activo boolean
);


--
-- Name: t21_tipoSuspensionLaboral_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t21_tipoSuspensionLaboral_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t21_tipoSuspensionLaboral_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t21_tipoSuspensionLaboral_id_seq" OWNED BY param."t21_tipoSuspensionLaboral".id;


--
-- Name: t26_pais; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param.t26_pais (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(100),
    activo boolean
);


--
-- Name: t26_pais_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param.t26_pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t26_pais_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param.t26_pais_id_seq OWNED BY param.t26_pais.id;


--
-- Name: t28_departamento; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param.t28_departamento (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(100),
    pais_id smallint NOT NULL,
    activo boolean
);


--
-- Name: t28_departamento_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param.t28_departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t28_departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param.t28_departamento_id_seq OWNED BY param.t28_departamento.id;


--
-- Name: t28_distritos; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param.t28_distritos (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(100),
    provincia_id smallint NOT NULL,
    activo boolean
);


--
-- Name: t28_distritos_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param.t28_distritos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t28_distritos_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param.t28_distritos_id_seq OWNED BY param.t28_distritos.id;


--
-- Name: t28_provincias; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param.t28_provincias (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(100),
    departamento_id smallint NOT NULL,
    activo boolean
);


--
-- Name: t28_provincias_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param.t28_provincias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t28_provincias_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param.t28_provincias_id_seq OWNED BY param.t28_provincias.id;


--
-- Name: t33_regimenLaboral; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t33_regimenLaboral" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(150),
    abreviatura character varying(150),
    "sectorPub" boolean,
    "sectorPriv" boolean,
    "sectorOtro" boolean,
    activo boolean
);


--
-- Name: t33_regimenLaboral_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t33_regimenLaboral_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t33_regimenLaboral_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t33_regimenLaboral_id_seq" OWNED BY param."t33_regimenLaboral".id;


--
-- Name: t34_modalidadesForm; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t34_modalidadesForm" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(100),
    activo boolean
);


--
-- Name: t34_modalidadesForm_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t34_modalidadesForm_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t34_modalidadesForm_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t34_modalidadesForm_id_seq" OWNED BY param."t34_modalidadesForm".id;


--
-- Name: t34_nivelesCiclo; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t34_nivelesCiclo" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(100),
    activo boolean
);


--
-- Name: t34_nivelesCiclo_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t34_nivelesCiclo_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t34_nivelesCiclo_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t34_nivelesCiclo_id_seq" OWNED BY param."t34_nivelesCiclo".id;


--
-- Name: t34_regimenEduc; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t34_regimenEduc" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(100),
    activo boolean
);


--
-- Name: t34_regimenEduc_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t34_regimenEduc_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t34_regimenEduc_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t34_regimenEduc_id_seq" OWNED BY param."t34_regimenEduc".id;


--
-- Name: t34_tipoInstEduc; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t34_tipoInstEduc" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(100),
    activo boolean
);


--
-- Name: t34_tipoInstEduc_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t34_tipoInstEduc_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t34_tipoInstEduc_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t34_tipoInstEduc_id_seq" OWNED BY param."t34_tipoInstEduc".id;


--
-- Name: t3_tipoDocIdentidad; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t3_tipoDocIdentidad" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(100),
    activo boolean
);


--
-- Name: t3_tipoDocIdentidad_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t3_tipoDocIdentidad_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t3_tipoDocIdentidad_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t3_tipoDocIdentidad_id_seq" OWNED BY param."t3_tipoDocIdentidad".id;


--
-- Name: t6_tiposZona; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t6_tiposZona" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(100),
    activo boolean
);


--
-- Name: t6_tiposZona_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t6_tiposZona_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t6_tiposZona_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t6_tiposZona_id_seq" OWNED BY param."t6_tiposZona".id;


--
-- Name: t8_tipoTrabajador; Type: TABLE; Schema: param; Owner: -
--

CREATE TABLE param."t8_tipoTrabajador" (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(100),
    "sectorPub" boolean,
    "sectorPriv" boolean,
    "sectorOtro" boolean,
    activo boolean
);


--
-- Name: t8_tipoTrabajador_id_seq; Type: SEQUENCE; Schema: param; Owner: -
--

CREATE SEQUENCE param."t8_tipoTrabajador_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t8_tipoTrabajador_id_seq; Type: SEQUENCE OWNED BY; Schema: param; Owner: -
--

ALTER SEQUENCE param."t8_tipoTrabajador_id_seq" OWNED BY param."t8_tipoTrabajador".id;


--
-- Name: t00_documentos id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t00_documentos ALTER COLUMN id SET DEFAULT nextval('param.t00_documentos_id_seq'::regclass);


--
-- Name: t00_estadosAsis id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t00_estadosAsis" ALTER COLUMN id SET DEFAULT nextval('param."t00_estadosAsis_id_seq"'::regclass);


--
-- Name: t00_estadosTram id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t00_estadosTram" ALTER COLUMN id SET DEFAULT nextval('param."t00_estadosTram_id_seq"'::regclass);


--
-- Name: t00_feriados id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t00_feriados ALTER COLUMN id SET DEFAULT nextval('param.t00_feriados_id_seq'::regclass);


--
-- Name: t00_motivosSuspLab id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t00_motivosSuspLab" ALTER COLUMN id SET DEFAULT nextval('param."t00_motivosSuspLab_id_seq"'::regclass);


--
-- Name: t00_operadores id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t00_operadores ALTER COLUMN id SET DEFAULT nextval('param.t00_operadores_id_seq'::regclass);


--
-- Name: t00_rolTrabajador id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t00_rolTrabajador" ALTER COLUMN id SET DEFAULT nextval('param."t00_rolTrabajador_id_seq"'::regclass);


--
-- Name: t00_sexos id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t00_sexos ALTER COLUMN id SET DEFAULT nextval('param.t00_sexos_id_seq'::regclass);


--
-- Name: t00_tipoEntidad id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t00_tipoEntidad" ALTER COLUMN id SET DEFAULT nextval('param."t00_tipoEntidad_id_seq"'::regclass);


--
-- Name: t00_turnos id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t00_turnos ALTER COLUMN id SET DEFAULT nextval('param.t00_turnos_id_seq'::regclass);


--
-- Name: t12_tipoContrato id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t12_tipoContrato" ALTER COLUMN id SET DEFAULT nextval('param."t12_tipoContrato_id_seq"'::regclass);


--
-- Name: t15_situacionLaboral id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t15_situacionLaboral" ALTER COLUMN id SET DEFAULT nextval('param."t15_situacionLaboral_id_seq"'::regclass);


--
-- Name: t17_motivoDeBajas id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t17_motivoDeBajas" ALTER COLUMN id SET DEFAULT nextval('param."t17_motivoDeBajas_id_seq"'::regclass);


--
-- Name: t21_tipoSuspensionLaboral id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t21_tipoSuspensionLaboral" ALTER COLUMN id SET DEFAULT nextval('param."t21_tipoSuspensionLaboral_id_seq"'::regclass);


--
-- Name: t26_pais id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t26_pais ALTER COLUMN id SET DEFAULT nextval('param.t26_pais_id_seq'::regclass);


--
-- Name: t28_departamento id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t28_departamento ALTER COLUMN id SET DEFAULT nextval('param.t28_departamento_id_seq'::regclass);


--
-- Name: t28_distritos id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t28_distritos ALTER COLUMN id SET DEFAULT nextval('param.t28_distritos_id_seq'::regclass);


--
-- Name: t28_provincias id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t28_provincias ALTER COLUMN id SET DEFAULT nextval('param.t28_provincias_id_seq'::regclass);


--
-- Name: t33_regimenLaboral id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t33_regimenLaboral" ALTER COLUMN id SET DEFAULT nextval('param."t33_regimenLaboral_id_seq"'::regclass);


--
-- Name: t34_modalidadesForm id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t34_modalidadesForm" ALTER COLUMN id SET DEFAULT nextval('param."t34_modalidadesForm_id_seq"'::regclass);


--
-- Name: t34_nivelesCiclo id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t34_nivelesCiclo" ALTER COLUMN id SET DEFAULT nextval('param."t34_nivelesCiclo_id_seq"'::regclass);


--
-- Name: t34_regimenEduc id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t34_regimenEduc" ALTER COLUMN id SET DEFAULT nextval('param."t34_regimenEduc_id_seq"'::regclass);


--
-- Name: t34_tipoInstEduc id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t34_tipoInstEduc" ALTER COLUMN id SET DEFAULT nextval('param."t34_tipoInstEduc_id_seq"'::regclass);


--
-- Name: t3_tipoDocIdentidad id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t3_tipoDocIdentidad" ALTER COLUMN id SET DEFAULT nextval('param."t3_tipoDocIdentidad_id_seq"'::regclass);


--
-- Name: t6_tiposZona id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t6_tiposZona" ALTER COLUMN id SET DEFAULT nextval('param."t6_tiposZona_id_seq"'::regclass);


--
-- Name: t8_tipoTrabajador id; Type: DEFAULT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t8_tipoTrabajador" ALTER COLUMN id SET DEFAULT nextval('param."t8_tipoTrabajador_id_seq"'::regclass);


--
-- Data for Name: t00_documentos; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param.t00_documentos (id, codigo, nombre, abreviatura, activo) FROM stdin;
1	00	(FUT) FORMULARIO UNICO DE TRAMITE	\N	t
2	01	ACTA	\N	t
3	02	ACUERDO	\N	t
4	03	AUTORIZACION	\N	t
5	04	AVISO	\N	t
6	05	CARTA	\N	t
7	06	CARTA MULTIPLE	\N	t
8	07	CARTA NOTARIAL	\N	t
9	08	CEDULA DE NOTIFICACION	\N	t
10	09	CERTIFICADO	\N	t
11	10	CITACION	\N	t
12	11	CONFORMIDAD	\N	t
13	12	CONSTANCIA	\N	t
14	13	CONTRATO	\N	t
15	14	COTIZACION	\N	t
16	15	CREDENCIAL	\N	t
17	16	CURRICULUM VITAE	\N	t
18	17	DECLARACION JURADA	\N	t
19	18	DECRETO	\N	t
20	19	DESCARGO	\N	t
21	20	DICTAMEN	\N	t
22	21	DIRECTIVA	\N	t
23	22	ESCRITO	\N	t
24	23	FE DE ERRATAS	\N	t
25	24	HOJA DE ENVIO	\N	t
26	25	INFORME	\N	t
27	26	INFORME DE PRECALIFICACIÓN	\N	t
28	27	INFORME DE ÓRGANO INSTRUCTOR	\N	t
29	28	INFORME LEGAL	\N	t
30	29	INFORME MULTIPLE	\N	t
31	30	INFORME TECNICO	\N	t
32	31	MEMORANDO	\N	t
33	32	MEMORANDO MULTIPLE	\N	t
34	33	NOTIFICACION	\N	t
35	34	OFICIO	\N	t
36	35	OFICIO CIRCULAR	\N	t
37	36	OFICIO MULTIPLE	\N	t
38	37	PAPELETA DE SALIDA	\N	t
39	38	PROVEIDO	\N	t
40	39	RECIBO	\N	t
41	40	RECURSO DE APELACION	\N	t
42	41	RECURSO DE RECONSIDERACION	\N	t
43	42	REQUERIMIENTO	\N	t
44	43	REQUERIMIENTO DE PAGO	\N	t
45	44	RESOLUCION	\N	t
46	45	RESOLUCION DE GERENCIA	\N	t
47	46	RESOLUCIÓN DE ÓRGANO INSTRUCTOR	\N	t
48	47	RESOLUCIÓN DE ÓRGANO SANCIONADOR	\N	t
49	48	SENTENCIA	\N	t
50	49	SOLICITUD	\N	t
51	50	VALE	\N	t
\.


--
-- Data for Name: t00_estadosAsis; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t00_estadosAsis" (id, codigo, nombre, abreviatura, activo) FROM stdin;
1	1	CREADO	CREADO	t
2	2	CONSOLIDADO	CONSOLIDADO	t
3	3	VALIDADO	VALIDADO	t
4	4	CERRADO	CERRADO	t
\.


--
-- Data for Name: t00_estadosTram; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t00_estadosTram" (id, codigo, nombre, abreviatura, activo) FROM stdin;
1	1	REGISTRADO	REGISTRADO	t
2	2	APROBADO	APROBADO	t
3	3	RECHAZADO	RECHAZADO	t
4	4	AUTORIZADO	AUTORIZADO	t
5	5	ANULADO	ANULADO	t
\.


--
-- Data for Name: t00_feriados; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param.t00_feriados (id, codigo, descripcion, "diaMesDefault", "programaDefault", activo) FROM stdin;
1	01	01 AÑO NUEVO (Dia: 01 Ene)	01-01	t	t
2	02	02 SEMANA SANTA (Dia: NoEsp)	17-04	t	t
3	03	03 DIA DEL TRABAJO (Dia: 01 May)	01-05	t	t
4	04	04 BATALLA DE ARICA Y DIA DE LA BANDERA (Dia: 07 Jun)	07-06	t	t
5	05	05 SAN PEDRO Y SAN PABLO (Dia: 29 Jun)	29-06	t	t
6	06	06 DIA DE LA FUERZA AEREA DEL PERU (Dia: 23 Jul)	23-07	t	t
7	07	07 FIESTAS PATRIAS (Dia: 28-29 Jul)	28-07	t	t
8	08	08 BATALLA DE JUNIN (Dia: 06 Ago)	06-08	t	t
9	09	09 SANTA ROSA DE LIMA (Dia: 30 Ago)	30-08	t	t
10	10	10 COMBATE DE ANGAMOS (Dia: 08 Oct)	08-10	t	t
11	11	11 DIA DE TODOS LOS SANTOS (Dia: 01 Nov)	01-11	t	t
12	12	12 INMACULADA CONCEPCION (Dia: 08 Dic)	08-12	t	t
13	13	13 BATALLA DE AYACUCHO (Dia: 09 Dic)	09-12	t	t
14	14	14 NAVIDAD (Dia: 25 Dic)	25-12	t	t
15	15	[OTROS DIAS FERIADO]	\N	t	t
16	16	[OTROS DIAS NO LABORABLES]	\N	t	t
\.


--
-- Data for Name: t00_motivosSuspLab; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t00_motivosSuspLab" (id, codigo, "tipoSuspensionLaboral_id", descripcion, abreviatura, "conGoceHaber", asusfal, "diasMaxCiclo", "codigoProg", created_at, created_by, activo, "autorizadoPor", "descripcionPers", "abreviaturaPers") FROM stdin;
20	20	1	SANCIÓN DISCIPLINARIA	SD	f	S	\N	SUSP	\N	\N	t	U	SANCION DICIPLINARIA	SD
6	06	19	FALTA JUSTIFICADA	FJ	t	A	\N	5_JUST	\N	\N	t	U	JUSTIFICACION	J
3	03	\N	DIA LIBRE NO LABORABLE	DL	t	A	\N	2_DIAL	\N	\N	t	U	 	 
1	01	\N	ASISTENCIA PRESENCIAL	A	t	A	\N	0_ASIS	\N	\N	t	U	DIA LABORADO	A
2	02	\N	ASISTENCIA NO PRESENCIAL	EXO	t	A	\N	1_EXO	\N	\N	t	U	DIA LABORADO	A
7	07	7	FALTA	F	f	F	\N	6_FALT	\N	\N	t	U	INASISTENCIA INJUSTIFICADA	I
4	04	\N	FERIADO	FER	t	A	\N	3_FER	\N	\N	t	U	INASISTENCIA JUSTIFICADA	J
5	05	\N	ONOMASTICO	O	t	A	\N	4_ONO	\N	\N	t	U	INASISTENCIA JUSTIFICADA	J
8	08	13	ENFERM/ACCIDENTE (20 PRIMEROS DÍAS)	EA	t	S	\N	7_CITT	\N	\N	t	U	INASISTENCIA JUSTIFICADA	J
9	09	15	MATERNIDAD -PRE Y POST NATAL	MAT	t	C	\N	7_CITT	\N	\N	t	U	INASISTENCIA JUSTIFICADA	J
10	10	14	ENFERM/ACCIDENTE (SUBSIDIADO)	EAS	t	C	\N	7_CITT	\N	\N	t	U	INASISTENCIA JUSTIFICADA	J
11	11	20	COMPENSACION POR HORAS TRABAJADAS EN SOBRETIEMPO	CHT	t	S	\N	SUSP	\N	\N	t	U	INASISTENCIA JUSTIFICADA	J
12	12	25	FALLECIMIENTO DE PADRES, CÓNYUGE O HIJOS	FFD	t	S	\N	SUSP	\N	\N	t	U	INASISTENCIA JUSTIFICADA	J
13	13	16	DESCANSO VACACIONAL	V	t	S	\N	SUSP	\N	\N	t	U	INASISTENCIA JUSTIFICADA	J
14	14	19	LICENCIA CON GOCE DE HABER	LCG	t	S	\N	SUSP	\N	\N	t	U	INASISTENCIA JUSTIFICADA	J
15	15	21	LICENCIA POR PATERNIDAD	LP	t	S	\N	SUSP	\N	\N	t	U	INASISTENCIA JUSTIFICADA	J
23	23	\N	INGRESO TARDE	T	t	A	\N	8_ASIS	\N	\N	t	D	TARDANZA	T
24	24	\N	INGRESO TERCERA TARDANZA	3T	f	F	\N	8_ASIS	\N	\N	t	D	TERCERA TARDANZA	3T
25	25	\N	EVASION LABORAL	E	t	A	\N	8_ASIS	\N	\N	t	D	EVASION LABORAL	E
26	26	\N	TERCERA EVASION LABORAL	3E	t	F	\N	8_ASIS	\N	\N	t	D	TERCERA EVASION LABORAL	3E
16	16	9	LICENCIA POR MATERNINAD	LM	t	S	\N	SUSP	\N	\N	t	U	INASISTENCIA JUSTIFICADA	J
17	17	18	LICENCIA SINDICAL	LS	t	S	\N	SUSP	\N	\N	t	U	INASISTENCIA JUSTIFICADA	J
18	18	28	LICENCIA POR ENFERMEDAD DE FAMILIAR DIRECTO	EF	t	S	\N	SUSP	\N	\N	t	U	INASISTENCIA JUSTIFICADA	J
19	19	19	COMPENSACION POR LABORAR EN ONOMASTICO	CON	t	S	\N	SUSP	\N	\N	t	U	INASISTENCIA JUSTIFICADA	J
21	21	19	CITA MEDICA	CM	t	S	\N	SUSP	\N	\N	t	U	INASISTENCIA JUSTIFICADA	J
22	22	5	LICENCIA SIN GOCE DE HABERES	LSG	f	S	\N	SUSP	\N	\N	t	U	PERMISO SIN GOCE DE REMUNERACION	P
\.


--
-- Data for Name: t00_operadores; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param.t00_operadores (id, codigo, nombre, abreviatura, activo) FROM stdin;
1	1	BITEL	BITEL	t
2	2	MOVISTAR	MOVISTAR	t
3	3	CLARO	CLARO	t
4	4	ENTEL	ENTEL	t
\.


--
-- Data for Name: t00_rolTrabajador; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t00_rolTrabajador" (id, codigo, nombre, descripcion, activo) FROM stdin;
1	1	ADMINISTRATIVO	ADMINISTRATIVO	t
2	2	DOCENTE	DOCENTE	t
3	3	DIRECTOR	DIRECTOR	t
4	4	AUXILIAR	AUXILIAR	t
\.


--
-- Data for Name: t00_sexos; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param.t00_sexos (id, codigo, nombre, abreviatura, activo) FROM stdin;
1	1	MASCULINO	M	t
2	2	FEMENINO	F	t
\.


--
-- Data for Name: t00_tipoEntidad; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t00_tipoEntidad" (id, codigo, nombre, abreviatura, activo) FROM stdin;
1	1	UNIDAD DE GESTION EDUCATIVA LOCAL	UGEL	t
2	2	DIRECCION REGIONAL DE EDUCACION	DRE	t
3	3	INSTITUCION EDUCATIVA	IE	t
\.


--
-- Data for Name: t00_turnos; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param.t00_turnos (id, codigo, nombre, abreviatura, activo) FROM stdin;
1	1	MAÑANA	MAÑANA	t
2	2	TARDE	TARDE	t
3	3	NOCHE	NOCHE	t
\.


--
-- Data for Name: t12_tipoContrato; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t12_tipoContrato" (id, codigo, nombre, abreviatura, activo) FROM stdin;
3	03	POR INICIO O INCREMENTO DE ACTIVIDAD	POR INICIO O INCREM DE ACTIV	t
4	04	POR NECESIDADES DEL MERCADO	POR NECES DEL MERCADO	t
5	05	POR RECONVERSIÓN EMPRESARIAL	POR RECONV EMPRESARIAL	t
6	06	OCASIONAL	OCASIONAL	t
7	07	DE SUPLENCIA	DE SUPLENCIA	t
8	08	DE EMERGENCIA	DE EMERGENCIA	t
9	09	PARA OBRA DETERMINADA O SERVICIO ESPECÍFICO	OBRA DETERM O SERV ESPEC	t
10	10	INTERMITENTE	INTERMITENTE	t
11	11	DE TEMPORADA	DE TEMPORADA	t
12	12	DE EXPORTACIÓN NO TRADICIONAL D.LEY 22342	DE EXPORT. NO TRADIC.	t
13	13	DE EXTRANJERO - D.LEG.689	DE EXTRANJERO - D.LEG. 689	t
14	14	ADMINISTRATIVO DE SERVICIOS - D.LEG 1057 (1)	CAS  - D.LEG 1057	t
15	15	NOMBRADO - D.LEG. N.° 276 (1)	NOMBRADO - D.LEG. N.° 276 (1)	t
16	16	SERVICIOS PERSONALES  - APLICABLES A LOS REGÍM. DE CARRERA (1)	SERV. PERS  - REGÍM. DE CARRERA (1)	t
17	17	GERENTE PÚBLICO - D.LEG. 1024 (1)	GERENTE PÚBLICO - DL 1024	t
18	18	A DOMICILIO	A DOMICILIO	t
19	19	FUTBOLISTAS PROFESIONALES	FUTBOLISTAS PROFESIONALES	t
20	20	AGRARIO - LEY 27360	AGRARIO - LEY 27360	t
21	21	MIGRANTE ANDINO DECISIÓN 545	MIGRANTE ANDINO 	t
22	22	A PLAZO INDETERMINADO - LEY 30057	A PLAZO INDETERMINADO - LEY 30057	t
23	23	A PLAZO FIJO - LEY 30057	A PLAZO FIJO - LEY 30057	t
24	24	NOMBRADO - CARRERAS ESPECIALES DEL SECTOR PÚBLICO	NOMBRADO CARRERAS ESPECIALES	t
25	25	CONTRATADO - CARRERAS ESPECIALES DEL SECTOR PÚBLICO 	CONTRATADO CARRERAS ESPECIALES	t
26	99	OTROS NO PREVISTOS	OTROS NO PREVISTOS	t
1	01	A PLAZO INDETERMINADO - D.LEG. 728	A PLAZO INDET - D.LEG. 728	t
2	02	A TIEMPO PARCIAL	A TIEMPO PARCIAL	t
\.


--
-- Data for Name: t15_situacionLaboral; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t15_situacionLaboral" (id, codigo, nombre, abreviatura, activo) FROM stdin;
1	0	BAJA (1)	BAJA	t
2	1	ACTIVO O SUBSIDIADO (1)	ACTIVO O SUBSIDIADO	t
3	2	SIN VÍNCULO LABORAL CON CONCEPTOS PENDIENTE DE LIQUIDAR  (2)	SIN VINC. LAB. CON CONC PEND POR LIQUIDAR	t
4	3	SUSPENSIÓN PERFECTA DE LABORES (3)	SUSPENSIÓN PERFECTA DE LABORES	t
\.


--
-- Data for Name: t17_motivoDeBajas; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t17_motivoDeBajas" (id, codigo, nombre, abreviatura, activo) FROM stdin;
1	01	RENUNCIA	RENUNCIA	t
2	02	RENUNCIA CON INCENTIVOS	RENUNCIA CON INCENTIVOS	t
3	03	DESPIDO O DESTITUCIÓN	DESPIDO O DESTITUCIÓN	t
4	04	CESE COLECTIVO	CESE COLECTIVO	t
5	05	JUBILACIÓN	JUBILACIÓN	t
6	06	INVALIDEZ ABSOLUTA PERMANENTE	INVALIDEZ ABSOLUTA PERMAN	t
7	07	TERMINACIÓN DE LA OBRA O SERVICIO, CUMPLIMIENTO CONDICIÓN RESOLUTORIA O VENCIMIENTO DEL PLAZO	TERMIN OBRA/SERV, CUMPLIM CONDIC RESOL. O VENC PLAZO	t
8	08	MUTUO DISENSO	MUTUO DISENSO	t
9	09	FALLECIMIENTO	FALLECIMIENTO	t
10	10	SUSPENSIÓN DE LA PENSIÓN (1)	SUSPENSIÓN DE LA PENSIÓN	t
11	11	REASIGNACIÓN SERVIDOR DE LA ADMINISTRACIÓN PÚBLICA(2)	REASIGNACIÓN	t
12	12	PERMUTA SERVIDOR DE LA ADMINISTRACIÓN PÚBLICA (2)	PERMUTA	t
13	13	TRANSFERENCIA SERVIDOR DE LA ADMINISTRACIÓN PÚBLICA (2)	TRANSFERENCIA	t
14	14	BAJA POR SUCESIÓN EN POSICIÓN DEL EMPLEADOR	BAJA POR SUC. EN POSIC DEL EMPLEADOR	t
15	15	EXTINCIÓN O LIQUIDACIÓN DEL EMPLEADOR	EXTINCIÓN O LIQUID. DEL EMPLEADOR	t
16	16	OTROS MOTIVOS DE CADUCIDAD DE LA PENSIÓN (1)	OTR MOTIV CADUC PENSIÓN 	t
17	17	NO SE INICIÓ LA RELACIÓN LABORAL O PRESTACIÓN EFECTIVA DE SERVICIOS	NO SE INICIÓ LA REL.  LABORAL O PREST. DE SERVICIOS	t
18	18	LÍMITE DE EDAD 70 AÑOS	LÍMITE DE EDAD 70 AÑOS	t
19	19	OTRAS CAUSALES RÉGIMEN PÚBLICO GENERAL SERVICIO CIVIL - LEY 30057	OTRAS CAUSALES - LEY 30057	t
20	20	INHABILITACIÓN PARA EL EJERCICIO PROFESIONAL O DE LA FUNCIÓN PÚBLICA POR MÁS DE TRES MESES - LEY 30057	INHABILITAC. PARA EJERC. PROF. O FUNC. PÚB. POR MÁS DE 3 MESES - LEY 30057	t
21	99	SIN VÍNCULO LABORAL - HABILITADO PARA PDT PLAME	SVL -HABILITADO PARA PDT PLAME (3)	t
\.


--
-- Data for Name: t21_tipoSuspensionLaboral; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t21_tipoSuspensionLaboral" (id, codigo, nombre, abreviatura, "perfeImperfe", activo) FROM stdin;
1	01	S.P. SANCIÓN DISCIPLINARIA	\N	P	t
2	02	S.P. EJERCICIO DEL DERECHO DE HUELGA	\N	P	t
3	03	S.P. DETENCIÓN DEL TRABAJADOR, SALVO EL CASO DE CONDENA PRIVATIVA DE LA LIBERTAD	\N	P	t
4	04	S.P. INHABILITACIÓN ADMINISTRATIVA, JUDICIAL  O PENA PRIVATIVA DE LA LIBERTAD EFECTIVA POR DELITO CULPOSO, POR PERIODO NO SUPERIOR A TRES MESES	\N	P	t
5	05	S.P. PERMISO, LICENCIA U OTROS MOTIVOS SIN GOCE DE HABER	\N	P	t
6	06	S.P. CASO FORTUITO O FUERZA MAYOR	\N	P	t
7	07	S.P. FALTA NO JUSTIFICADA	\N	P	t
8	08	S.P. POR TEMPORADA O INTERMITENTE	\N	P	t
9	09	'S.P. MATERNIDAD DURANTE EL DESCANSO PRE Y POST NATAL	\N	P	t
10	10	S.P. SENTENCIA DE PRIMERA INSTANCIA POR DELITOS DE TERRORISMO, NARCOTRÁFICO, CORRUPCIÓN O VIOLACIÓN DE LA LIBERTAD SEXUAL.	\N	P	t
11	11	S.P. IMPOSICIÓN DE MEDIDA CAUTELAR.	\N	P	t
12	12	S.P. ENFERMEDAD GRAVE DEL PADRE, CÓNYUGE, CONVIVIENTE RECONOCIDO JUDICIALMENTE O HIJOS.	\N	P	t
13	20	S.I. ENFERMEDAD O ACCIDENTE (PRIMEROS VEINTE DÍAS)	\N	I	t
14	21	S.I. INCAPACIDAD TEMPORAL (INVALIDEZ, ENFERMEDAD Y ACCIDENTES)	\N	I	t
15	22	S.I. MATERNIDAD DURANTE EL DESCANSO PRE Y POST NATAL	\N	I	t
16	23	S.I. DESCANSO VACACIONAL	\N	I	t
17	24	S.I. LICENCIA PARA DESEMPEÑAR CARGO CÍVICO Y PARA CUMPLIR CON EL SERVICIO MILITAR OBLIGATORIO	\N	I	t
18	25	S.I. PERMISO Y LICENCIA PARA EL DESEMPEÑO DE CARGOS SINDICALES	\N	I	t
19	26	S.I. LICENCIA U OTROS MOTIVOS CON GOCE DE HABER	\N	I	t
20	27	S.I. DÍAS COMPENSADOS POR HORAS TRABAJADAS EN SOBRETIEMPO	\N	I	t
21	28	S.I. DÍAS LICENCIA POR PATERNIDAD	\N	I	t
22	29	S.I. DIAS LICENCIA POR ADOPCIÓN 	\N	I	t
23	30	S.I. IMPOSICIÓN DE MEDIDA CAUTELAR	\N	I	t
24	31	S.I. CITACIÓN EXPRESA JUDICIAL, MILITAR, POLICIAL U OTRAS CITACIONES DERIVADAS DE ACTOS DE ADMINISTRACIÓN INTERNA	\N	I	t
25	32	S.I. FALLECIMIENTO DE PADRES, CÓNYUGE O HIJOS	\N	I	t
26	33	S.I. ASUMIR REPRESENTACIÓN OFICIAL DEL ESTADO PERUANO EN EVENTOS CIENTÍFICOS, EDUCATIVOS, CULTURALES Y DEPORTIVOS	\N	I	t
27	34	S.I. DESC VACACIONAL - LICENCIA ASIST MÉDICA O TERAPIA DE REHABIL DE DEPEND CON DISCAPACIDAD 	\N	I	t
28	35	S.I.ENFERMEDAD GRAVE O TERMINAL O ACCIDENTE GRAVE DE FAMILIARES DIRECTOS 	\N	I	t
\.


--
-- Data for Name: t26_pais; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param.t26_pais (id, codigo, nombre, abreviatura, activo) FROM stdin;
7	9007	MAYOTTE	\N	t
9	9009	SVALBARD AND JAN MAYEN ISLANDS	\N	t
10	9010	UNITED STATES MINOR OUTLYING ISLANDS	\N	t
11	9011	OTROS PAISES O LUGARES	\N	t
12	9013	AFGANISTAN	\N	t
13	9017	ALBANIA	\N	t
14	9019	ALDERNEY	\N	t
15	9023	ALEMANIA	\N	t
16	9026	ARMENIA	\N	t
17	9027	ARUBA	\N	t
18	9028	ASCENCION	\N	t
19	9029	BOSNIA-HERZEGOVINA	\N	t
20	9031	BURKINA FASO	\N	t
21	9037	ANDORRA	\N	t
22	9040	ANGOLA	\N	t
23	9041	ANGUILLA	\N	t
24	9043	ANTIGUA Y BARBUDA	\N	t
25	9047	ANTILLAS HOLANDESAS	\N	t
26	9053	ARABIA SAUDITA	\N	t
27	9059	ARGELIA	\N	t
28	9063	ARGENTINA	\N	t
29	9069	AUSTRALIA	\N	t
30	9072	AUSTRIA	\N	t
31	9074	AZERBAIJÁN	\N	t
32	9077	BAHAMAS	\N	t
33	9080	BAHREIN	\N	t
34	9081	BANGLA DESH	\N	t
35	9083	BARBADOS	\N	t
36	9087	BÉLGICA	\N	t
37	9088	BELICE	\N	t
38	9090	BERMUDAS	\N	t
39	9091	BELARUS	\N	t
40	9093	MYANMAR	\N	t
41	9097	BOLIVIA	\N	t
42	9101	BOTSWANA	\N	t
43	9105	BRASIL	\N	t
44	9108	BRUNEI DARUSSALAM	\N	t
45	9111	BULGARIA	\N	t
46	9115	BURUNDI	\N	t
47	9119	BUTÁN	\N	t
48	9127	CABO VERDE	\N	t
49	9137	CAIMÁN, ISLAS	\N	t
50	9141	CAMBOYA	\N	t
51	9145	CAMERÚN, REPUBLICA UNIDA DEL	\N	t
52	9147	CAMPIONE D TALIA	\N	t
53	9149	CANADÁ	\N	t
54	9155	CANAL (NORMANDAS), ISLAS	\N	t
55	9157	CANTÓN Y ENDERBURRY	\N	t
56	9159	SANTA SEDE	\N	t
57	9165	COCOS (KEELING),ISLAS	\N	t
58	9169	COLOMBIA	\N	t
59	9173	COMORAS	\N	t
60	9177	CONGO	\N	t
61	9183	COOK, ISLAS	\N	t
62	9187	COREA (NORTE), REPUBLICA POPULAR DEMOCRATICA DE	\N	t
63	9190	COREA (SUR), REPUBLICA DE	\N	t
64	9193	COSTA DE MARFIL	\N	t
65	9196	COSTA RICA	\N	t
66	9198	CROACIA	\N	t
67	9199	CUBA	\N	t
68	9203	CHAD	\N	t
69	9207	CHECOSLOVAQUIA	\N	t
70	9211	CHILE	\N	t
71	9215	CHINA	\N	t
72	9218	TAIWAN (FORMOSA)	\N	t
73	9221	CHIPRE	\N	t
74	9229	BENIN	\N	t
75	9232	DINAMARCA	\N	t
76	9235	DOMINICA	\N	t
77	9239	ECUADOR	\N	t
78	9240	EGIPTO	\N	t
79	9242	EL SALVADOR	\N	t
80	9243	ERITREA	\N	t
81	9244	EMIRATOS ARABES UNIDOS	\N	t
82	9245	ESPAÑA	\N	t
83	9246	ESLOVAQUIA	\N	t
84	9247	ESLOVENIA	\N	t
85	9249	ESTADOS UNIDOS	\N	t
86	9251	ESTONIA	\N	t
87	9253	ETIOPIA	\N	t
88	9259	FEROE, ISLAS	\N	t
89	9267	FILIPINAS	\N	t
90	9271	FINLANDIA	\N	t
91	9275	FRANCIA	\N	t
92	9281	GABON	\N	t
93	9285	GAMBIA	\N	t
94	9286	GAZA Y JERICO	\N	t
95	9287	GEORGIA	\N	t
96	9289	GHANA	\N	t
97	9293	GIBRALTAR	\N	t
98	9297	GRANADA	\N	t
99	9301	GRECIA	\N	t
100	9305	GROENLANDIA	\N	t
101	9309	GUADALUPE	\N	t
102	9313	GUAM	\N	t
103	9317	GUATEMALA	\N	t
104	9325	GUAYANA FRANCESA	\N	t
105	9327	GUERNSEY	\N	t
106	9329	GUINEA	\N	t
107	9331	GUINEA ECUATORIAL	\N	t
108	9334	GUINEA-BISSAU	\N	t
109	9337	GUYANA	\N	t
110	9341	HAITI	\N	t
111	9345	HONDURAS	\N	t
112	9348	HONDURAS BRITANICAS	\N	t
113	9351	HONG KONG	\N	t
114	9355	HUNGRIA	\N	t
115	9361	INDIA	\N	t
116	9365	INDONESIA	\N	t
117	9369	IRAK	\N	t
118	9372	IRAN, REPUBLICA ISLAMICA DEL	\N	t
119	9375	IRLANDA (EIRE)	\N	t
120	9377	ISLA AZORES	\N	t
121	9378	ISLA DEL MAN	\N	t
122	9379	ISLANDIA	\N	t
123	9380	ISLAS CANARIAS	\N	t
124	9381	ISLAS DE CHRISTMAS	\N	t
125	9382	ISLAS QESHM	\N	t
126	9383	ISRAEL	\N	t
127	9386	ITALIA	\N	t
128	9391	JAMAICA	\N	t
129	9395	JONSTON, ISLAS	\N	t
130	9399	JAPON	\N	t
131	9401	JERSEY	\N	t
132	9403	JORDANIA	\N	t
133	9406	KAZAJSTAN	\N	t
134	9410	KENIA	\N	t
135	9411	KIRIBATI	\N	t
136	9412	KIRGUIZISTAN	\N	t
137	9413	KUWAIT	\N	t
138	9418	LABUN	\N	t
139	9420	LAOS, REPUBLICA POPULAR DEMOCRATICA DE	\N	t
140	9426	LESOTHO	\N	t
141	9429	LETONIA	\N	t
142	9431	LIBANO	\N	t
143	9434	LIBERIA	\N	t
144	9438	LIBIA	\N	t
145	9440	LIECHTENSTEIN	\N	t
2	9002	COTE D IVOIRE	\N	t
3	9003	FALKLAND ISLANDS (MALVINAS)	\N	t
4	9004	FRANCE, METROPOLITAN	\N	t
6	9006	HEARD AND MC DONALD ISLANDS	\N	t
231	9756	SUDAFRICA, REPUBLICA DE	\N	t
232	9759	SUDAN	\N	t
233	9764	SUECIA	\N	t
149	9448	MACEDONIA	\N	t
150	9450	MADAGASCAR	\N	t
151	9453	MADEIRA	\N	t
180	9538	NORUEGA	\N	t
181	9542	NUEVA CALEDONIA	\N	t
182	9545	PAPUASIA NUEVA GUINEA	\N	t
183	9548	NUEVA ZELANDA	\N	t
184	9551	VANUATU	\N	t
185	9556	OMAN	\N	t
186	9566	PACIFICO, ISLAS DEL	\N	t
187	9573	PAISES BAJOS	\N	t
188	9576	PAKISTAN	\N	t
189	9578	PALAU, ISLAS	\N	t
190	9579	TERRITORIO AUTONOMO DE PALESTINA.	\N	t
191	9580	PANAMA	\N	t
192	9586	PARAGUAY	\N	t
193	9589	PERÚ	\N	t
194	9593	PITCAIRN, ISLA	\N	t
195	9599	POLINESIA FRANCESA	\N	t
196	9603	POLONIA	\N	t
197	9607	PORTUGAL	\N	t
198	9611	PUERTO RICO	\N	t
199	9618	QATAR	\N	t
200	9628	REINO UNIDO	\N	t
201	9629	ESCOCIA	\N	t
202	9633	REPUBLICA ARABE UNIDA	\N	t
203	9640	REPUBLICA CENTROAFRICANA	\N	t
204	9644	REPUBLICA CHECA	\N	t
205	9645	REPUBLICA DE SWAZILANDIA	\N	t
206	9646	REPUBLICA DE TUNEZ	\N	t
207	9647	REPUBLICA DOMINICANA	\N	t
208	9660	REUNION	\N	t
209	9665	ZIMBABWE	\N	t
210	9670	RUMANIA	\N	t
211	9675	RUANDA	\N	t
212	9676	RUSIA	\N	t
213	9677	SALOMON, ISLAS	\N	t
214	9685	SAHARA OCCIDENTAL	\N	t
215	9687	SAMOA OCCIDENTAL	\N	t
216	9690	SAMOA NORTEAMERICANA	\N	t
217	9695	SAN CRISTOBAL Y NIEVES	\N	t
218	9697	SAN MARINO	\N	t
219	9700	SAN PEDRO Y MIQUELON	\N	t
220	9705	SAN VICENTE Y LAS GRANADINAS	\N	t
221	9710	SANTA ELENA	\N	t
222	9715	SANTA LUCIA	\N	t
223	9720	SANTO TOME Y PRINCIPE	\N	t
224	9728	SENEGAL	\N	t
225	9731	SEYCHELLES	\N	t
226	9735	SIERRA LEONA	\N	t
227	9741	SINGAPUR	\N	t
228	9744	SIRIA, REPUBLICA ARABE DE	\N	t
229	9748	SOMALIA	\N	t
230	9750	SRI LANKA	\N	t
234	9767	SUIZA	\N	t
235	9770	SURINAM	\N	t
236	9773	SAWSILANDIA	\N	t
237	9774	TADJIKISTAN	\N	t
238	9776	TAILANDIA	\N	t
239	9780	TANZANIA, REPUBLICA UNIDA DE	\N	t
240	9783	DJIBOUTI	\N	t
241	9786	TERRITORIO ANTARTICO BRITANICO	\N	t
242	9787	TERRITORIO BRITANICO DEL OCEANO INDICO	\N	t
243	9788	TIMOR DEL ESTE	\N	t
244	9800	TOGO	\N	t
245	9805	TOKELAU	\N	t
246	9810	TONGA	\N	t
247	9815	TRINIDAD Y TOBAGO	\N	t
248	9816	TRISTAN DA CUNHA	\N	t
249	9820	TUNICIA	\N	t
250	9823	TURCAS Y CAICOS, ISLAS	\N	t
251	9825	TURKMENISTAN	\N	t
252	9827	TURQUIA	\N	t
253	9828	TUVALU	\N	t
254	9830	UCRANIA	\N	t
255	9833	UGANDA	\N	t
256	9840	URSS	\N	t
257	9845	URUGUAY	\N	t
258	9847	UZBEKISTAN	\N	t
259	9850	VENEZUELA	\N	t
260	9855	VIET NAM	\N	t
261	9858	VIETNAM (DEL NORTE)	\N	t
262	9863	VIRGENES, ISLAS (BRITANICAS)	\N	t
263	9866	VIRGENES, ISLAS (NORTEAMERICANAS)	\N	t
264	9870	FIJI	\N	t
265	9873	WAKE, ISLA	\N	t
266	9875	WALLIS Y FORTUNA, ISLAS	\N	t
267	9880	YEMEN	\N	t
268	9885	YUGOSLAVIA	\N	t
269	9888	ZAIRE	\N	t
270	9890	ZAMBIA	\N	t
271	9895	ZONA DEL CANAL DE PANAMA	\N	t
272	9896	ZONA LIBRE OSTRAVA	\N	t
273	9897	ZONA NEUTRAL (PALESTINA)	\N	t
1	9001	BOUVET ISLAND	\N	t
5	9005	FRENCH SOUTHERN TERRITORIES	\N	t
8	9008	SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS	\N	t
146	9443	LITUANIA	\N	t
147	9445	LUXEMBURGO	\N	t
148	9447	MACAO	\N	t
152	9455	MALAYSIA	\N	t
153	9458	MALAWI	\N	t
154	9461	MALDIVAS	\N	t
155	9464	MALI	\N	t
156	9467	MALTA	\N	t
157	9469	MARIANAS DEL NORTE, ISLAS	\N	t
158	9472	MARSHALL, ISLAS	\N	t
159	9474	MARRUECOS	\N	t
160	9477	MARTINICA	\N	t
161	9485	MAURICIO	\N	t
162	9488	MAURITANIA	\N	t
163	9493	MEXICO	\N	t
164	9494	MICRONESIA, ESTADOS FEDERADOS DE	\N	t
165	9495	MIDWAY ISLAS	\N	t
166	9496	MOLDAVIA	\N	t
167	9497	MONGOLIA	\N	t
168	9498	MONACO	\N	t
169	9501	MONTSERRAT, ISLA	\N	t
170	9505	MOZAMBIQUE	\N	t
171	9507	NAMIBIA	\N	t
172	9508	NAURU	\N	t
173	9511	NAVIDAD (CHRISTMAS), ISLA	\N	t
174	9517	NEPAL	\N	t
175	9521	NICARAGUA	\N	t
176	9525	NIGER	\N	t
177	9528	NIGERIA	\N	t
178	9531	NIUE, ISLA	\N	t
179	9535	NORFOLK, ISLA	\N	t
\.


--
-- Data for Name: t28_departamento; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param.t28_departamento (id, codigo, nombre, abreviatura, pais_id, activo) FROM stdin;
1	01	DEPARTAMENTO AMAZONAS	\N	193	t
2	02	DEPARTAMENTO ANCASH	\N	193	t
3	03	DEPARTAMENTO APURIMAC	\N	193	t
4	04	DEPARTAMENTO AREQUIPA	\N	193	t
5	05	DEPARTAMENTO AYACUCHO	\N	193	t
6	06	DEPARTAMENTO CAJAMARCA	\N	193	t
7	07	DEPARTAMENTO CUSCO	\N	193	t
8	08	DEPARTAMENTO HUANCAVELICA	\N	193	t
9	09	DEPARTAMENTO HUANUCO	\N	193	t
10	10	DEPARTAMENTO ICA	\N	193	t
11	11	DEPARTAMENTO JUNIN	\N	193	t
12	12	DEPARTAMENTO LA LIBERTAD	\N	193	t
13	13	DEPARTAMENTO LAMBAYEQUE	\N	193	t
14	14	DEPARTAMENTO LIMA	\N	193	t
15	15	DEPARTAMENTO LORETO	\N	193	t
16	16	DEPARTAMENTO MADRE DE DIOS	\N	193	t
17	17	DEPARTAMENTO MOQUEGUA	\N	193	t
18	18	DEPARTAMENTO PASCO	\N	193	t
19	19	DEPARTAMENTO PIURA	\N	193	t
20	20	DEPARTAMENTO PUNO	\N	193	t
21	21	DEPARTAMENTO SAN MARTIN	\N	193	t
22	22	DEPARTAMENTO TACNA	\N	193	t
23	23	DEPARTAMENTO TUMBES	\N	193	t
24	24	PROV. CONST. DEL CALLAO	\N	193	t
25	25	DEPARTAMENTO UCAYALI	\N	193	t
\.


--
-- Data for Name: t28_distritos; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param.t28_distritos (id, codigo, nombre, abreviatura, provincia_id, activo) FROM stdin;
1	010101	CHACHAPOYAS	\N	1	\N
2	010102	ASUNCION	\N	1	\N
3	010103	BALSAS	\N	1	\N
4	010104	CHETO	\N	1	\N
5	010105	CHILIQUIN	\N	1	\N
6	010106	CHUQUIBAMBA	\N	1	\N
7	010107	GRANADA	\N	1	\N
8	010108	HUANCAS	\N	1	\N
9	010109	LA JALCA	\N	1	\N
10	010110	LEIMEBAMBA	\N	1	\N
11	010111	LEVANTO	\N	1	\N
12	010112	MAGDALENA	\N	1	\N
13	010113	MARISCAL CASTILLA	\N	1	\N
14	010114	MOLINOPAMPA	\N	1	\N
15	010115	MONTEVIDEO	\N	1	\N
16	010116	OLLEROS	\N	1	\N
17	010117	QUINJALCA	\N	1	\N
18	010118	SAN FCO DE DAGUAS	\N	1	\N
19	010119	SAN ISIDRO DE MAINO	\N	1	\N
20	010120	SOLOCO	\N	1	\N
21	010121	SONCHE	\N	1	\N
22	010201	LA PECA	\N	2	\N
23	010202	ARAMANGO	\N	2	\N
24	010203	COPALLIN	\N	2	\N
25	010204	EL PARCO	\N	2	\N
26	010205	BAGUA	\N	2	\N
27	010206	IMAZA	\N	2	\N
28	010301	JUMBILLA	\N	3	\N
29	010302	COROSHA	\N	3	\N
30	010303	CUISPES	\N	3	\N
31	010304	CHISQUILLA	\N	3	\N
32	010305	CHURUJA	\N	3	\N
33	010306	FLORIDA	\N	3	\N
34	010307	RECTA	\N	3	\N
35	010308	SAN CARLOS	\N	3	\N
36	010309	SHIPASBAMBA	\N	3	\N
37	010310	VALERA	\N	3	\N
38	010311	YAMBRASBAMBA	\N	3	\N
39	010312	JAZAN	\N	3	\N
40	010401	LAMUD	\N	4	\N
41	010402	CAMPORREDONDO	\N	4	\N
42	010403	COCABAMBA	\N	4	\N
43	010404	COLCAMAR	\N	4	\N
44	010405	CONILA	\N	4	\N
45	010406	INGUILPATA	\N	4	\N
46	010407	LONGUITA	\N	4	\N
47	010408	LONYA CHICO	\N	4	\N
48	010409	LUYA	\N	4	\N
49	010410	LUYA VIEJO	\N	4	\N
50	010411	MARIA	\N	4	\N
51	010412	OCALLI	\N	4	\N
52	010413	OCUMAL	\N	4	\N
53	010414	PISUQUIA	\N	4	\N
54	010415	SAN CRISTOBAL	\N	4	\N
55	010416	SAN FRANCISCO DE YESO	\N	4	\N
56	010417	SAN JERONIMO	\N	4	\N
57	010418	SAN JUAN DE LOPECANCHA	\N	4	\N
58	010419	SANTA CATALINA	\N	4	\N
59	010420	SANTO TOMAS	\N	4	\N
60	010421	TINGO	\N	4	\N
61	010422	TRITA	\N	4	\N
62	010423	PROVIDENCIA	\N	4	\N
63	010501	SAN NICOLAS	\N	5	\N
64	010502	COCHAMAL	\N	5	\N
65	010503	CHIRIMOTO	\N	5	\N
66	010504	HUAMBO	\N	5	\N
67	010505	LIMABAMBA	\N	5	\N
68	010506	LONGAR	\N	5	\N
69	010507	MILPUC	\N	5	\N
70	010508	MCAL BENAVIDES	\N	5	\N
71	010509	OMIA	\N	5	\N
72	010510	SANTA ROSA	\N	5	\N
73	010511	TOTORA	\N	5	\N
74	010512	VISTA ALEGRE	\N	5	\N
75	010601	NIEVA	\N	6	\N
76	010602	RIO SANTIAGO	\N	6	\N
77	010603	EL CENEPA	\N	6	\N
78	010701	BAGUA GRANDE	\N	7	\N
79	010702	CAJARURO	\N	7	\N
80	010703	CUMBA	\N	7	\N
81	010704	EL MILAGRO	\N	7	\N
82	010705	JAMALCA	\N	7	\N
83	010706	LONYA GRANDE	\N	7	\N
84	010707	YAMON	\N	7	\N
85	020101	HUARAZ	\N	8	\N
86	020102	INDEPENDENCIA	\N	8	\N
87	020103	COCHABAMBA	\N	8	\N
88	020104	COLCABAMBA	\N	8	\N
89	020105	HUANCHAY	\N	8	\N
90	020106	JANGAS	\N	8	\N
91	020107	LA LIBERTAD	\N	8	\N
92	020108	OLLEROS	\N	8	\N
93	020109	PAMPAS	\N	8	\N
94	020110	PARIACOTO	\N	8	\N
95	020111	PIRA	\N	8	\N
96	020112	TARICA	\N	8	\N
97	020201	AIJA	\N	9	\N
98	020203	CORIS	\N	9	\N
99	020205	HUACLLAN	\N	9	\N
100	020206	LA MERCED	\N	9	\N
101	020208	SUCCHA	\N	9	\N
102	020301	CHIQUIAN	\N	10	\N
103	020302	A PARDO LEZAMETA	\N	10	\N
104	020304	AQUIA	\N	10	\N
105	020305	CAJACAY	\N	10	\N
106	020310	HUAYLLACAYAN	\N	10	\N
107	020311	HUASTA	\N	10	\N
108	020313	MANGAS	\N	10	\N
109	020315	PACLLON	\N	10	\N
110	020317	SAN MIGUEL DE CORPANQUI	\N	10	\N
111	020320	TICLLOS	\N	10	\N
112	020321	ANTONIO RAIMONDI	\N	10	\N
113	020322	CANIS	\N	10	\N
114	020323	COLQUIOC	\N	10	\N
115	020324	LA PRIMAVERA	\N	10	\N
116	020325	HUALLANCA	\N	10	\N
117	020401	CARHUAZ	\N	11	\N
118	020402	ACOPAMPA	\N	11	\N
119	020403	AMASHCA	\N	11	\N
120	020404	ANTA	\N	11	\N
121	020405	ATAQUERO	\N	11	\N
122	020406	MARCARA	\N	11	\N
123	020407	PARIAHUANCA	\N	11	\N
124	020408	SAN MIGUEL DE ACO	\N	11	\N
125	020409	SHILLA	\N	11	\N
126	020410	TINCO	\N	11	\N
127	020411	YUNGAR	\N	11	\N
128	020501	CASMA	\N	12	\N
129	020502	BUENA VISTA ALTA	\N	12	\N
130	020503	COMANDANTE NOEL	\N	12	\N
131	020505	YAUTAN	\N	12	\N
132	020601	CORONGO	\N	13	\N
133	020602	ACO	\N	13	\N
134	020603	BAMBAS	\N	13	\N
135	020604	CUSCA	\N	13	\N
136	020605	LA PAMPA	\N	13	\N
137	020606	YANAC	\N	13	\N
138	020607	YUPAN	\N	13	\N
139	020701	CARAZ	\N	14	\N
140	020702	HUALLANCA	\N	14	\N
141	020703	HUATA	\N	14	\N
142	020704	HUAYLAS	\N	14	\N
143	020705	MATO	\N	14	\N
144	020706	PAMPAROMAS	\N	14	\N
145	020707	PUEBLO LIBRE	\N	14	\N
146	020708	SANTA CRUZ	\N	14	\N
147	020709	YURACMARCA	\N	14	\N
148	020710	SANTO TORIBIO	\N	14	\N
149	020801	HUARI	\N	15	\N
150	020802	CAJAY	\N	15	\N
151	020803	CHAVIN DE HUANTAR	\N	15	\N
152	020804	HUACACHI	\N	15	\N
153	020805	HUACHIS	\N	15	\N
154	020806	HUACCHIS	\N	15	\N
155	020807	HUANTAR	\N	15	\N
156	020808	MASIN	\N	15	\N
157	020809	PAUCAS	\N	15	\N
158	020810	PONTO	\N	15	\N
159	020811	RAHUAPAMPA	\N	15	\N
160	020812	RAPAYAN	\N	15	\N
161	020813	SAN MARCOS	\N	15	\N
162	020814	SAN PEDRO DE CHANA	\N	15	\N
163	020815	UCO	\N	15	\N
164	020816	ANRA	\N	15	\N
165	020901	PISCOBAMBA	\N	16	\N
166	020902	CASCA	\N	16	\N
167	020903	LUCMA	\N	16	\N
168	020904	FIDEL OLIVAS ESCUDERO	\N	16	\N
169	020905	LLAMA	\N	16	\N
170	020906	LLUMPA	\N	16	\N
171	020907	MUSGA	\N	16	\N
172	020908	ELEAZAR GUZMAN BARRON	\N	16	\N
173	021001	CABANA	\N	17	\N
174	021002	BOLOGNESI	\N	17	\N
175	021003	CONCHUCOS	\N	17	\N
176	021004	HUACASCHUQUE	\N	17	\N
177	021005	HUANDOVAL	\N	17	\N
178	021006	LACABAMBA	\N	17	\N
179	021007	LLAPO	\N	17	\N
180	021008	PALLASCA	\N	17	\N
181	021009	PAMPAS	\N	17	\N
182	021010	SANTA ROSA	\N	17	\N
183	021011	TAUCA	\N	17	\N
184	021101	POMABAMBA	\N	18	\N
185	021102	HUAYLLAN	\N	18	\N
186	021103	PAROBAMBA	\N	18	\N
187	021104	QUINUABAMBA	\N	18	\N
188	021201	RECUAY	\N	19	\N
189	021202	COTAPARACO	\N	19	\N
190	021203	HUAYLLAPAMPA	\N	19	\N
191	021204	MARCA	\N	19	\N
192	021205	PAMPAS CHICO	\N	19	\N
193	021206	PARARIN	\N	19	\N
194	021207	TAPACOCHA	\N	19	\N
195	021208	TICAPAMPA	\N	19	\N
196	021209	LLACLLIN	\N	19	\N
197	021210	CATAC	\N	19	\N
198	021301	CHIMBOTE	\N	20	\N
199	021302	CACERES DEL PERU	\N	20	\N
200	021303	MACATE	\N	20	\N
201	021304	MORO	\N	20	\N
202	021305	NEPENA	\N	20	\N
203	021306	SAMANCO	\N	20	\N
204	021307	SANTA	\N	20	\N
205	021308	COISHCO	\N	20	\N
206	021309	NUEVO CHIMBOTE	\N	20	\N
207	021401	SIHUAS	\N	21	\N
208	021402	ALFONSO UGARTE	\N	21	\N
209	021403	CHINGALPO	\N	21	\N
210	021404	HUAYLLABAMBA	\N	21	\N
211	021405	QUICHES	\N	21	\N
212	021406	SICSIBAMBA	\N	21	\N
213	021407	ACOBAMBA	\N	21	\N
214	021408	CASHAPAMPA	\N	21	\N
215	021409	RAGASH	\N	21	\N
216	021410	SAN JUAN	\N	21	\N
217	021501	YUNGAY	\N	22	\N
218	021502	CASCAPARA	\N	22	\N
219	021503	MANCOS	\N	22	\N
220	021504	MATACOTO	\N	22	\N
221	021505	QUILLO	\N	22	\N
222	021506	RANRAHIRCA	\N	22	\N
223	021507	SHUPLUY	\N	22	\N
224	021508	YANAMA	\N	22	\N
225	021601	LLAMELLIN	\N	23	\N
226	021602	ACZO	\N	23	\N
227	021603	CHACCHO	\N	23	\N
228	021604	CHINGAS	\N	23	\N
229	021605	MIRGAS	\N	23	\N
230	021606	SAN JUAN DE RONTOY	\N	23	\N
231	021701	SAN LUIS	\N	24	\N
232	021702	YAUYA	\N	24	\N
233	021703	SAN NICOLAS	\N	24	\N
234	021801	CHACAS	\N	25	\N
235	021802	ACOCHACA	\N	25	\N
236	021901	HUARMEY	\N	26	\N
237	021902	COCHAPETI	\N	26	\N
238	021903	HUAYAN	\N	26	\N
239	021904	MALVAS	\N	26	\N
240	021905	CULEBRAS	\N	26	\N
241	022001	ACAS	\N	27	\N
242	022002	CAJAMARQUILLA	\N	27	\N
243	022003	CARHUAPAMPA	\N	27	\N
244	022004	COCHAS	\N	27	\N
245	022005	CONGAS	\N	27	\N
246	022006	LLIPA	\N	27	\N
247	022007	OCROS	\N	27	\N
248	022008	SAN CRISTOBAL DE RAJAN	\N	27	\N
249	022009	SAN PEDRO	\N	27	\N
250	022010	SANTIAGO DE CHILCAS	\N	27	\N
251	030101	ABANCAY	\N	28	\N
252	030102	CIRCA	\N	28	\N
253	030103	CURAHUASI	\N	28	\N
254	030104	CHACOCHE	\N	28	\N
255	030105	HUANIPACA	\N	28	\N
256	030106	LAMBRAMA	\N	28	\N
257	030107	PICHIRHUA	\N	28	\N
258	030108	SAN PEDRO DE CACHORA	\N	28	\N
259	030109	TAMBURCO	\N	28	\N
260	030201	CHALHUANCA	\N	29	\N
261	030202	CAPAYA	\N	29	\N
262	030203	CARAYBAMBA	\N	29	\N
263	030204	COLCABAMBA	\N	29	\N
264	030205	COTARUSE	\N	29	\N
265	030206	CHAPIMARCA	\N	29	\N
266	030207	IHUAYLLO	\N	29	\N
267	030208	LUCRE	\N	29	\N
268	030209	POCOHUANCA	\N	29	\N
269	030210	SANAICA	\N	29	\N
270	030211	SORAYA	\N	29	\N
271	030212	TAPAIRIHUA	\N	29	\N
272	030213	TINTAY	\N	29	\N
273	030214	TORAYA	\N	29	\N
274	030215	YANACA	\N	29	\N
275	030216	SAN JUAN DE CHACNA	\N	29	\N
276	030217	JUSTO APU SAHUARAURA	\N	29	\N
277	030301	ANDAHUAYLAS	\N	30	\N
278	030302	ANDARAPA	\N	30	\N
279	030303	CHIARA	\N	30	\N
280	030304	HUANCARAMA	\N	30	\N
281	030305	HUANCARAY	\N	30	\N
282	030306	KISHUARA	\N	30	\N
283	030307	PACOBAMBA	\N	30	\N
284	030308	PAMPACHIRI	\N	30	\N
285	030309	SAN ANTONIO DE CACHI	\N	30	\N
286	030310	SAN JERONIMO	\N	30	\N
287	030311	TALAVERA	\N	30	\N
288	030312	TURPO	\N	30	\N
289	030313	PACUCHA	\N	30	\N
290	030314	POMACOCHA	\N	30	\N
291	030315	STA MARIA DE CHICMO	\N	30	\N
292	030316	TUMAY HUARACA	\N	30	\N
293	030317	HUAYANA	\N	30	\N
294	030318	SAN MIGUEL DE CHACCRAMPA	\N	30	\N
295	030319	KAQUIABAMBA	\N	30	\N
296	030401	ANTABAMBA	\N	31	\N
297	030402	EL ORO	\N	31	\N
298	030403	HUAQUIRCA	\N	31	\N
299	030404	JUAN ESPINOZA MEDRANO	\N	31	\N
300	030405	OROPESA	\N	31	\N
301	030406	PACHACONAS	\N	31	\N
302	030407	SABAINO	\N	31	\N
303	030501	TAMBOBAMBA	\N	32	\N
304	030502	COYLLURQUI	\N	32	\N
305	030503	COTABAMBAS	\N	32	\N
306	030504	HAQUIRA	\N	32	\N
307	030505	MARA	\N	32	\N
308	030506	CHALLHUAHUACHO	\N	32	\N
309	030601	CHUQUIBAMBILLA	\N	33	\N
310	030602	CURPAHUASI	\N	33	\N
311	030603	HUAILLATI	\N	33	\N
312	030604	MAMARA	\N	33	\N
313	030605	MARISCAL GAMARRA	\N	33	\N
314	030606	MICAELA BASTIDAS	\N	33	\N
315	030607	PROGRESO	\N	33	\N
316	030608	PATAYPAMPA	\N	33	\N
317	030609	SAN ANTONIO	\N	33	\N
318	030610	TURPAY	\N	33	\N
319	030611	VILCABAMBA	\N	33	\N
320	030612	VIRUNDO	\N	33	\N
321	030613	SANTA ROSA	\N	33	\N
322	030614	CURASCO	\N	33	\N
323	030701	CHINCHEROS	\N	34	\N
324	030702	ONGOY	\N	34	\N
325	030703	OCOBAMBA	\N	34	\N
326	030704	COCHARCAS	\N	34	\N
327	030705	ANCO HUALLO	\N	34	\N
328	030706	HUACCANA	\N	34	\N
329	030707	URANMARCA	\N	34	\N
330	030708	RANRACANCHA	\N	34	\N
331	040101	AREQUIPA	\N	35	\N
332	040102	CAYMA	\N	35	\N
333	040103	CERRO COLORADO	\N	35	\N
334	040104	CHARACATO	\N	35	\N
335	040105	CHIGUATA	\N	35	\N
336	040106	LA JOYA	\N	35	\N
337	040107	MIRAFLORES	\N	35	\N
338	040108	MOLLEBAYA	\N	35	\N
339	040109	PAUCARPATA	\N	35	\N
340	040110	POCSI	\N	35	\N
341	040111	POLOBAYA	\N	35	\N
342	040112	QUEQUENA	\N	35	\N
343	040113	SABANDIA	\N	35	\N
344	040114	SACHACA	\N	35	\N
345	040115	SAN JUAN DE SIGUAS	\N	35	\N
346	040116	SAN JUAN DE TARUCANI	\N	35	\N
347	040117	SANTA ISABEL DE SIGUAS	\N	35	\N
348	040118	STA RITA DE SIGUAS	\N	35	\N
349	040119	SOCABAYA	\N	35	\N
350	040120	TIABAYA	\N	35	\N
351	040121	UCHUMAYO	\N	35	\N
352	040122	VITOR	\N	35	\N
353	040123	YANAHUARA	\N	35	\N
354	040124	YARABAMBA	\N	35	\N
355	040125	YURA	\N	35	\N
356	040126	MARIANO MELGAR	\N	35	\N
357	040127	JACOBO HUNTER	\N	35	\N
358	040128	ALTO SELVA ALEGRE	\N	35	\N
359	040129	JOSE LUIS BUSTAMANTE Y RIVERO	\N	35	\N
360	040201	CHIVAY	\N	36	\N
361	040202	ACHOMA	\N	36	\N
362	040203	CABANACONDE	\N	36	\N
363	040204	CAYLLOMA	\N	36	\N
364	040205	CALLALLI	\N	36	\N
365	040206	COPORAQUE	\N	36	\N
366	040207	HUAMBO	\N	36	\N
367	040208	HUANCA	\N	36	\N
368	040209	ICHUPAMPA	\N	36	\N
369	040210	LARI	\N	36	\N
370	040211	LLUTA	\N	36	\N
371	040212	MACA	\N	36	\N
372	040213	MADRIGAL	\N	36	\N
373	040214	SAN ANTONIO DE CHUCA	\N	36	\N
374	040215	SIBAYO	\N	36	\N
375	040216	TAPAY	\N	36	\N
376	040217	TISCO	\N	36	\N
377	040218	TUTI	\N	36	\N
378	040219	YANQUE	\N	36	\N
379	040220	MAJES	\N	36	\N
380	040301	CAMANA	\N	37	\N
381	040302	JOSE MARIA QUIMPER	\N	37	\N
382	040303	MARIANO N VALCARCEL	\N	37	\N
383	040304	MARISCAL CACERES	\N	37	\N
384	040305	NICOLAS DE PIEROLA	\N	37	\N
385	040306	OCONA	\N	37	\N
386	040307	QUILCA	\N	37	\N
387	040308	SAMUEL PASTOR	\N	37	\N
388	040401	CARAVELI	\N	38	\N
389	040402	ACARI	\N	38	\N
390	040403	ATICO	\N	38	\N
391	040404	ATIQUIPA	\N	38	\N
392	040405	BELLA UNION	\N	38	\N
393	040406	CAHUACHO	\N	38	\N
394	040407	CHALA	\N	38	\N
395	040408	CHAPARRA	\N	38	\N
396	040409	HUANUHUANU	\N	38	\N
397	040410	JAQUI	\N	38	\N
398	040411	LOMAS	\N	38	\N
399	040412	QUICACHA	\N	38	\N
400	040413	YAUCA	\N	38	\N
401	040501	APLAO	\N	39	\N
402	040502	ANDAGUA	\N	39	\N
403	040503	AYO	\N	39	\N
404	040504	CHACHAS	\N	39	\N
405	040505	CHILCAYMARCA	\N	39	\N
406	040506	CHOCO	\N	39	\N
407	040507	HUANCARQUI	\N	39	\N
408	040508	MACHAGUAY	\N	39	\N
409	040509	ORCOPAMPA	\N	39	\N
410	040510	PAMPACOLCA	\N	39	\N
411	040511	TIPAN	\N	39	\N
412	040512	URACA	\N	39	\N
413	040513	UNON	\N	39	\N
414	040514	VIRACO	\N	39	\N
415	040601	CHUQUIBAMBA	\N	40	\N
416	040602	ANDARAY	\N	40	\N
417	040603	CAYARANI	\N	40	\N
418	040604	CHICHAS	\N	40	\N
419	040605	IRAY	\N	40	\N
420	040606	SALAMANCA	\N	40	\N
421	040607	YANAQUIHUA	\N	40	\N
422	040608	RIO GRANDE	\N	40	\N
423	040701	MOLLENDO	\N	41	\N
424	040702	COCACHACRA	\N	41	\N
425	040703	DEAN VALDIVIA	\N	41	\N
426	040704	ISLAY	\N	41	\N
427	040705	MEJIA	\N	41	\N
428	040706	PUNTA DE BOMBON	\N	41	\N
429	040801	COTAHUASI	\N	42	\N
430	040802	ALCA	\N	42	\N
431	040803	CHARCANA	\N	42	\N
432	040804	HUAYNACOTAS	\N	42	\N
433	040805	PAMPAMARCA	\N	42	\N
434	040806	PUYCA	\N	42	\N
435	040807	QUECHUALLA	\N	42	\N
436	040808	SAYLA	\N	42	\N
437	040809	TAURIA	\N	42	\N
438	040810	TOMEPAMPA	\N	42	\N
439	040811	TORO	\N	42	\N
440	050101	AYACUCHO	\N	43	\N
441	050102	ACOS VINCHOS	\N	43	\N
442	050103	CARMEN ALTO	\N	43	\N
443	050104	CHIARA	\N	43	\N
444	050105	QUINUA	\N	43	\N
445	050106	SAN JOSE DE TICLLAS	\N	43	\N
446	050107	SAN JUAN BAUTISTA	\N	43	\N
447	050108	SANTIAGO DE PISCHA	\N	43	\N
448	050109	VINCHOS	\N	43	\N
449	050110	TAMBILLO	\N	43	\N
450	050111	ACOCRO	\N	43	\N
451	050112	SOCOS	\N	43	\N
452	050113	OCROS	\N	43	\N
453	050114	PACAYCASA	\N	43	\N
454	050115	JESUS NAZARENO	\N	43	\N
455	050201	CANGALLO	\N	44	\N
456	050204	CHUSCHI	\N	44	\N
457	050206	LOS MOROCHUCOS	\N	44	\N
458	050207	PARAS	\N	44	\N
459	050208	TOTOS	\N	44	\N
460	050211	MARIA PARADO DE BELLIDO	\N	44	\N
461	050301	HUANTA	\N	45	\N
462	050302	AYAHUANCO	\N	45	\N
463	050303	HUAMANGUILLA	\N	45	\N
464	050304	IGUAIN	\N	45	\N
465	050305	LURICOCHA	\N	45	\N
466	050307	SANTILLANA	\N	45	\N
467	050308	SIVIA	\N	45	\N
468	050309	LLOCHEGUA	\N	45	\N
469	050401	SAN MIGUEL	\N	46	\N
470	050402	ANCO	\N	46	\N
471	050403	AYNA	\N	46	\N
472	050404	CHILCAS	\N	46	\N
473	050405	CHUNGUI	\N	46	\N
474	050406	TAMBO	\N	46	\N
475	050407	LUIS CARRANZA	\N	46	\N
476	050408	SANTA ROSA	\N	46	\N
477	050501	PUQUIO	\N	47	\N
478	050502	AUCARA	\N	47	\N
479	050503	CABANA	\N	47	\N
480	050504	CARMEN SALCEDO	\N	47	\N
481	050506	CHAVINA	\N	47	\N
482	050508	CHIPAO	\N	47	\N
483	050510	HUAC-HUAS	\N	47	\N
484	050511	LARAMATE	\N	47	\N
485	050512	LEONCIO PRADO	\N	47	\N
486	050513	LUCANAS	\N	47	\N
487	050514	LLAUTA	\N	47	\N
488	050516	OCANA	\N	47	\N
489	050517	OTOCA	\N	47	\N
490	050520	SANCOS	\N	47	\N
491	050521	SAN JUAN	\N	47	\N
492	050522	SAN PEDRO	\N	47	\N
493	050524	STA ANA DE HUAYCAHUACHO	\N	47	\N
494	050525	SANTA LUCIA	\N	47	\N
495	050529	SAISA	\N	47	\N
496	050531	SAN PEDRO DE PALCO	\N	47	\N
497	050532	SAN CRISTOBAL	\N	47	\N
498	050601	CORACORA	\N	48	\N
499	050604	CORONEL CASTANEDA	\N	48	\N
500	050605	CHUMPI	\N	48	\N
501	050608	PACAPAUSA	\N	48	\N
502	050611	PULLO	\N	48	\N
503	050612	PUYUSCA	\N	48	\N
504	050615	SAN FCO DE RAVACAYCO	\N	48	\N
505	050616	UPAHUACHO	\N	48	\N
506	050701	HUANCAPI	\N	49	\N
507	050702	ALCAMENCA	\N	49	\N
508	050703	APONGO	\N	49	\N
509	050704	CANARIA	\N	49	\N
510	050706	CAYARA	\N	49	\N
511	050707	COLCA	\N	49	\N
512	050708	HUAYA	\N	49	\N
513	050709	HUAMANQUIQUIA	\N	49	\N
514	050710	HUANCARAYLLA	\N	49	\N
515	050713	SARHUA	\N	49	\N
516	050714	VILCANCHOS	\N	49	\N
517	050715	ASQUIPATA	\N	49	\N
518	050801	SANCOS	\N	50	\N
519	050802	SACSAMARCA	\N	50	\N
520	050803	SANTIAGO DE LUCANAMARCA	\N	50	\N
521	050804	CARAPO	\N	50	\N
522	050901	VILCAS HUAMAN	\N	51	\N
523	050902	VISCHONGO	\N	51	\N
524	050903	ACCOMARCA	\N	51	\N
525	050904	CARHUANCA	\N	51	\N
526	050905	CONCEPCION	\N	51	\N
527	050906	HUAMBALPA	\N	51	\N
528	050907	SAURAMA	\N	51	\N
529	050908	INDEPENDENCIA	\N	51	\N
530	051001	PAUSA	\N	52	\N
531	051002	COLTA	\N	52	\N
532	051003	CORCULLA	\N	52	\N
533	051004	LAMPA	\N	52	\N
534	051005	MARCABAMBA	\N	52	\N
535	051006	OYOLO	\N	52	\N
536	051007	PARARCA	\N	52	\N
537	051008	SAN JAVIER DE ALPABAMBA	\N	52	\N
538	051009	SAN JOSE DE USHUA	\N	52	\N
539	051010	SARA SARA	\N	52	\N
540	051101	QUEROBAMBA	\N	53	\N
541	051102	BELEN	\N	53	\N
542	051103	CHALCOS	\N	53	\N
543	051104	SAN SALVADOR DE QUIJE	\N	53	\N
544	051105	PAICO	\N	53	\N
545	051106	SANTIAGO DE PAUCARAY	\N	53	\N
546	051107	SAN PEDRO DE LARCAY	\N	53	\N
547	051108	SORAS	\N	53	\N
548	051109	HUACANA	\N	53	\N
549	051110	CHILCAYOC	\N	53	\N
550	051111	MORCOLLA	\N	53	\N
551	060101	CAJAMARCA	\N	54	\N
552	060102	ASUNCION	\N	54	\N
553	060103	COSPAN	\N	54	\N
554	060104	CHETILLA	\N	54	\N
555	060105	ENCANADA	\N	54	\N
556	060106	JESUS	\N	54	\N
557	060107	LOS BANOS DEL INCA	\N	54	\N
558	060108	LLACANORA	\N	54	\N
559	060109	MAGDALENA	\N	54	\N
560	060110	MATARA	\N	54	\N
561	060111	NAMORA	\N	54	\N
562	060112	SAN JUAN	\N	54	\N
563	060201	CAJABAMBA	\N	55	\N
564	060202	CACHACHI	\N	55	\N
565	060203	CONDEBAMBA	\N	55	\N
566	060205	SITACOCHA	\N	55	\N
567	060301	CELENDIN	\N	56	\N
568	060302	CORTEGANA	\N	56	\N
569	060303	CHUMUCH	\N	56	\N
570	060304	HUASMIN	\N	56	\N
571	060305	JORGE CHAVEZ	\N	56	\N
572	060306	JOSE GALVEZ	\N	56	\N
573	060307	MIGUEL IGLESIAS	\N	56	\N
574	060308	OXAMARCA	\N	56	\N
575	060309	SOROCHUCO	\N	56	\N
576	060310	SUCRE	\N	56	\N
577	060311	UTCO	\N	56	\N
578	060312	LA LIBERTAD DE PALLAN	\N	56	\N
579	060401	CONTUMAZA	\N	57	\N
580	060403	CHILETE	\N	57	\N
581	060404	GUZMANGO	\N	57	\N
582	060405	SAN BENITO	\N	57	\N
583	060406	CUPISNIQUE	\N	57	\N
584	060407	TANTARICA	\N	57	\N
585	060408	YONAN	\N	57	\N
586	060409	STA CRUZ DE TOLEDO	\N	57	\N
587	060501	CUTERVO	\N	58	\N
588	060502	CALLAYUC	\N	58	\N
589	060503	CUJILLO	\N	58	\N
590	060504	CHOROS	\N	58	\N
591	060505	LA RAMADA	\N	58	\N
592	060506	PIMPINGOS	\N	58	\N
593	060507	QUEROCOTILLO	\N	58	\N
594	060508	SAN ANDRES DE CUTERVO	\N	58	\N
595	060509	SAN JUAN DE CUTERVO	\N	58	\N
596	060510	SAN LUIS DE LUCMA	\N	58	\N
597	060511	SANTA CRUZ	\N	58	\N
598	060512	SANTO DOMINGO DE LA CAPILLA	\N	58	\N
599	060513	SANTO TOMAS	\N	58	\N
600	060514	SOCOTA	\N	58	\N
601	060515	TORIBIO CASANOVA	\N	58	\N
602	060601	CHOTA	\N	59	\N
603	060602	ANGUIA	\N	59	\N
604	060603	COCHABAMBA	\N	59	\N
605	060604	CONCHAN	\N	59	\N
606	060605	CHADIN	\N	59	\N
607	060606	CHIGUIRIP	\N	59	\N
608	060607	CHIMBAN	\N	59	\N
609	060608	HUAMBOS	\N	59	\N
610	060609	LAJAS	\N	59	\N
611	060610	LLAMA	\N	59	\N
612	060611	MIRACOSTA	\N	59	\N
613	060612	PACCHA	\N	59	\N
614	060613	PION	\N	59	\N
615	060614	QUEROCOTO	\N	59	\N
616	060615	TACABAMBA	\N	59	\N
617	060616	TOCMOCHE	\N	59	\N
618	060617	SAN JUAN DE LICUPIS	\N	59	\N
619	060618	CHOROPAMPA	\N	59	\N
620	060619	CHALAMARCA	\N	59	\N
621	060701	BAMBAMARCA	\N	60	\N
622	060702	CHUGUR	\N	60	\N
623	060703	HUALGAYOC	\N	60	\N
624	060801	JAEN	\N	61	\N
625	060802	BELLAVISTA	\N	61	\N
626	060803	COLASAY	\N	61	\N
627	060804	CHONTALI	\N	61	\N
628	060805	POMAHUACA	\N	61	\N
629	060806	PUCARA	\N	61	\N
630	060807	SALLIQUE	\N	61	\N
631	060808	SAN FELIPE	\N	61	\N
632	060809	SAN JOSE DEL ALTO	\N	61	\N
633	060810	SANTA ROSA	\N	61	\N
634	060811	LAS PIRIAS	\N	61	\N
635	060812	HUABAL	\N	61	\N
636	060901	SANTA CRUZ	\N	62	\N
637	060902	CATACHE	\N	62	\N
638	060903	CHANCAIBANOS	\N	62	\N
639	060904	LA ESPERANZA	\N	62	\N
640	060905	NINABAMBA	\N	62	\N
641	060906	PULAN	\N	62	\N
642	060907	SEXI	\N	62	\N
643	060908	UTICYACU	\N	62	\N
644	060909	YAUYUCAN	\N	62	\N
645	060910	ANDABAMBA	\N	62	\N
646	060911	SAUCEPAMPA	\N	62	\N
647	061001	SAN MIGUEL	\N	63	\N
648	061002	CALQUIS	\N	63	\N
649	061003	LA FLORIDA	\N	63	\N
650	061004	LLAPA	\N	63	\N
651	061005	NANCHOC	\N	63	\N
652	061006	NIEPOS	\N	63	\N
653	061007	SAN GREGORIO	\N	63	\N
654	061008	SAN SILVESTRE DE COCHAN	\N	63	\N
655	061009	EL PRADO	\N	63	\N
656	061010	UNION AGUA BLANCA	\N	63	\N
657	061011	TONGOD	\N	63	\N
658	061012	CATILLUC	\N	63	\N
659	061013	BOLIVAR	\N	63	\N
660	061101	SAN IGNACIO	\N	64	\N
661	061102	CHIRINOS	\N	64	\N
662	061103	HUARANGO	\N	64	\N
663	061104	NAMBALLE	\N	64	\N
664	061105	LA COIPA	\N	64	\N
665	061106	SAN JOSE DE LOURDES	\N	64	\N
666	061107	TABACONAS	\N	64	\N
667	061201	PEDRO GALVEZ	\N	65	\N
668	061202	ICHOCAN	\N	65	\N
669	061203	GREGORIO PITA	\N	65	\N
670	061204	JOSE MANUEL QUIROZ	\N	65	\N
671	061205	EDUARDO VILLANUEVA	\N	65	\N
672	061206	JOSE SABOGAL	\N	65	\N
673	061207	CHANCAY	\N	65	\N
674	061301	SAN PABLO	\N	66	\N
675	061302	SAN BERNARDINO	\N	66	\N
676	061303	SAN LUIS	\N	66	\N
677	061304	TUMBADEN	\N	66	\N
678	070101	CUSCO	\N	67	\N
679	070102	CCORCA	\N	67	\N
680	070103	POROY	\N	67	\N
681	070104	SAN JERONIMO	\N	67	\N
682	070105	SAN SEBASTIAN	\N	67	\N
683	070106	SANTIAGO	\N	67	\N
684	070107	SAYLLA	\N	67	\N
685	070108	WANCHAQ	\N	67	\N
686	070201	ACOMAYO	\N	68	\N
687	070202	ACOPIA	\N	68	\N
688	070203	ACOS	\N	68	\N
689	070204	POMACANCHI	\N	68	\N
690	070205	RONDOCAN	\N	68	\N
691	070206	SANGARARA	\N	68	\N
692	070207	MOSOC LLACTA	\N	68	\N
693	070301	ANTA	\N	69	\N
694	070302	CHINCHAYPUJIO	\N	69	\N
695	070303	HUAROCONDO	\N	69	\N
696	070304	LIMATAMBO	\N	69	\N
697	070305	MOLLEPATA	\N	69	\N
698	070306	PUCYURA	\N	69	\N
699	070307	ZURITE	\N	69	\N
700	070308	CACHIMAYO	\N	69	\N
701	070309	ANCAHUASI	\N	69	\N
702	070401	CALCA	\N	70	\N
703	070402	COYA	\N	70	\N
704	070403	LAMAY	\N	70	\N
705	070404	LARES	\N	70	\N
706	070405	PISAC	\N	70	\N
707	070406	SAN SALVADOR	\N	70	\N
708	070407	TARAY	\N	70	\N
709	070408	YANATILE	\N	70	\N
710	070501	YANAOCA	\N	71	\N
711	070502	CHECCA	\N	71	\N
712	070503	KUNTURKANKI	\N	71	\N
713	070504	LANGUI	\N	71	\N
714	070505	LAYO	\N	71	\N
715	070506	PAMPAMARCA	\N	71	\N
716	070507	QUEHUE	\N	71	\N
717	070508	TUPAC AMARU	\N	71	\N
718	070601	SICUANI	\N	72	\N
719	070602	COMBAPATA	\N	72	\N
720	070603	CHECACUPE	\N	72	\N
721	070604	MARANGANI	\N	72	\N
722	070605	PITUMARCA	\N	72	\N
723	070606	SAN PABLO	\N	72	\N
724	070607	SAN PEDRO	\N	72	\N
725	070608	TINTA	\N	72	\N
726	070701	SANTO TOMAS	\N	73	\N
727	070702	CAPACMARCA	\N	73	\N
728	070703	COLQUEMARCA	\N	73	\N
729	070704	CHAMACA	\N	73	\N
730	070705	LIVITACA	\N	73	\N
731	070706	LLUSCO	\N	73	\N
732	070707	QUINOTA	\N	73	\N
733	070708	VELILLE	\N	73	\N
734	070801	ESPINAR	\N	74	\N
735	070802	CONDOROMA	\N	74	\N
736	070803	COPORAQUE	\N	74	\N
737	070804	OCORURO	\N	74	\N
738	070805	PALLPATA	\N	74	\N
739	070806	PICHIGUA	\N	74	\N
740	070807	SUYKUTAMBO	\N	74	\N
741	070808	ALTO PICHIGUA	\N	74	\N
742	070901	SANTA ANA	\N	75	\N
743	070902	ECHARATE	\N	75	\N
744	070903	HUAYOPATA	\N	75	\N
745	070904	MARANURA	\N	75	\N
746	070905	OCOBAMBA	\N	75	\N
747	070906	SANTA TERESA	\N	75	\N
748	070907	VILCABAMBA	\N	75	\N
749	070908	QUELLOUNO	\N	75	\N
750	070909	KIMBIRI	\N	75	\N
751	070910	PICHARI	\N	75	\N
752	071001	PARURO	\N	76	\N
753	071002	ACCHA	\N	76	\N
754	071003	CCAPI	\N	76	\N
755	071004	COLCHA	\N	76	\N
756	071005	HUANOQUITE	\N	76	\N
757	071006	OMACHA	\N	76	\N
758	071007	YAURISQUE	\N	76	\N
759	071008	PACCARITAMBO	\N	76	\N
760	071009	PILLPINTO	\N	76	\N
761	071101	PAUCARTAMBO	\N	77	\N
762	071102	CAICAY	\N	77	\N
763	071103	COLQUEPATA	\N	77	\N
764	071104	CHALLABAMBA	\N	77	\N
765	071105	COSNIPATA	\N	77	\N
766	071106	HUANCARANI	\N	77	\N
767	071201	URCOS	\N	78	\N
768	071202	ANDAHUAYLILLAS	\N	78	\N
769	071203	CAMANTI	\N	78	\N
770	071204	CCARHUAYO	\N	78	\N
771	071205	CCATCA	\N	78	\N
772	071206	CUSIPATA	\N	78	\N
773	071207	HUARO	\N	78	\N
774	071208	LUCRE	\N	78	\N
775	071209	MARCAPATA	\N	78	\N
776	071210	OCONGATE	\N	78	\N
777	071211	OROPESA	\N	78	\N
778	071212	QUIQUIJANA	\N	78	\N
779	071301	URUBAMBA	\N	79	\N
780	071302	CHINCHERO	\N	79	\N
781	071303	HUAYLLABAMBA	\N	79	\N
782	071304	MACHUPICCHU	\N	79	\N
783	071305	MARAS	\N	79	\N
784	071306	OLLANTAYTAMBO	\N	79	\N
785	071307	YUCAY	\N	79	\N
786	080101	HUANCAVELICA	\N	80	\N
787	080102	ACOBAMBILLA	\N	80	\N
788	080103	ACORIA	\N	80	\N
789	080104	CONAYCA	\N	80	\N
790	080105	CUENCA	\N	80	\N
791	080106	HUACHOCOLPA	\N	80	\N
792	080108	HUAYLLAHUARA	\N	80	\N
793	080109	IZCUCHACA	\N	80	\N
794	080110	LARIA	\N	80	\N
795	080111	MANTA	\N	80	\N
796	080112	MARISCAL CACERES	\N	80	\N
797	080113	MOYA	\N	80	\N
798	080114	NUEVO OCCORO	\N	80	\N
799	080115	PALCA	\N	80	\N
800	080116	PILCHACA	\N	80	\N
801	080117	VILCA	\N	80	\N
802	080118	YAULI	\N	80	\N
803	080119	ASCENCION	\N	80	\N
804	080120	HUANDO	\N	80	\N
805	080201	ACOBAMBA	\N	81	\N
806	080202	ANTA	\N	81	\N
807	080203	ANDABAMBA	\N	81	\N
808	080204	CAJA	\N	81	\N
809	080205	MARCAS	\N	81	\N
810	080206	PAUCARA	\N	81	\N
811	080207	POMACOCHA	\N	81	\N
812	080208	ROSARIO	\N	81	\N
813	080301	LIRCAY	\N	82	\N
814	080302	ANCHONGA	\N	82	\N
815	080303	CALLANMARCA	\N	82	\N
816	080304	CONGALLA	\N	82	\N
817	080305	CHINCHO	\N	82	\N
818	080306	HUAYLLAY GRANDE	\N	82	\N
819	080307	HUANCA HUANCA	\N	82	\N
820	080308	JULCAMARCA	\N	82	\N
821	080309	SAN ANTONIO DE ANTAPARCO	\N	82	\N
822	080310	STO TOMAS DE PATA	\N	82	\N
823	080311	SECCLLA	\N	82	\N
824	080312	CCOCHACCASA	\N	82	\N
825	080401	CASTROVIRREYNA	\N	83	\N
826	080402	ARMA	\N	83	\N
827	080403	AURAHUA	\N	83	\N
828	080405	CAPILLAS	\N	83	\N
829	080406	COCAS	\N	83	\N
830	080408	CHUPAMARCA	\N	83	\N
831	080409	HUACHOS	\N	83	\N
832	080410	HUAMATAMBO	\N	83	\N
833	080414	MOLLEPAMPA	\N	83	\N
834	080422	SAN JUAN	\N	83	\N
835	080427	TANTARA	\N	83	\N
836	080428	TICRAPO	\N	83	\N
837	080429	SANTA ANA	\N	83	\N
838	080501	PAMPAS	\N	84	\N
839	080502	ACOSTAMBO	\N	84	\N
840	080503	ACRAQUIA	\N	84	\N
841	080504	AHUAYCHA	\N	84	\N
842	080506	COLCABAMBA	\N	84	\N
843	080509	DANIEL HERNANDEZ	\N	84	\N
844	080511	HUACHOCOLPA	\N	84	\N
845	080512	HUARIBAMBA	\N	84	\N
846	080515	NAHUIMPUQUIO	\N	84	\N
847	080517	PAZOS	\N	84	\N
848	080518	QUISHUAR	\N	84	\N
849	080519	SALCABAMBA	\N	84	\N
850	080520	SAN MARCOS DE ROCCHAC	\N	84	\N
851	080523	SURCUBAMBA	\N	84	\N
852	080525	TINTAY PUNCU	\N	84	\N
853	080526	SALCAHUASI	\N	84	\N
854	080601	AYAVI	\N	85	\N
855	080602	CORDOVA	\N	85	\N
856	080603	HUAYACUNDO ARMA	\N	85	\N
857	080604	HUAYTARA	\N	85	\N
858	080605	LARAMARCA	\N	85	\N
859	080606	OCOYO	\N	85	\N
860	080607	PILPICHACA	\N	85	\N
861	080608	QUERCO	\N	85	\N
862	080609	QUITO ARMA	\N	85	\N
863	080610	SAN ANTONIO DE CUSICANCHA	\N	85	\N
864	080611	SAN FRANCISCO DE SANGAYAICO	\N	85	\N
865	080612	SAN ISIDRO	\N	85	\N
866	080613	SANTIAGO DE CHOCORVOS	\N	85	\N
867	080614	SANTIAGO DE QUIRAHUARA	\N	85	\N
868	080615	SANTO DOMINGO DE CAPILLA	\N	85	\N
869	080616	TAMBO	\N	85	\N
870	080701	CHURCAMPA	\N	86	\N
871	080702	ANCO	\N	86	\N
872	080703	CHINCHIHUASI	\N	86	\N
873	080704	EL CARMEN	\N	86	\N
874	080705	LA MERCED	\N	86	\N
875	080706	LOCROJA	\N	86	\N
876	080707	PAUCARBAMBA	\N	86	\N
877	080708	SAN MIGUEL DE MAYOC	\N	86	\N
878	080709	SAN PEDRO DE CORIS	\N	86	\N
879	080710	PACHAMARCA	\N	86	\N
880	090101	HUANUCO	\N	87	\N
881	090102	CHINCHAO	\N	87	\N
882	090103	CHURUBAMBA	\N	87	\N
883	090104	MARGOS	\N	87	\N
884	090105	QUISQUI	\N	87	\N
885	090106	SAN FCO DE CAYRAN	\N	87	\N
886	090107	SAN PEDRO DE CHAULAN	\N	87	\N
887	090108	STA MARIA DEL VALLE	\N	87	\N
888	090109	YARUMAYO	\N	87	\N
889	090110	AMARILIS	\N	87	\N
890	090111	PILLCO MARCA	\N	87	\N
891	090201	AMBO	\N	88	\N
892	090202	CAYNA	\N	88	\N
893	090203	COLPAS	\N	88	\N
894	090204	CONCHAMARCA	\N	88	\N
895	090205	HUACAR	\N	88	\N
896	090206	SAN FRANCISCO	\N	88	\N
897	090207	SAN RAFAEL	\N	88	\N
898	090208	TOMAY KICHWA	\N	88	\N
899	090301	LA UNION	\N	89	\N
900	090307	CHUQUIS	\N	89	\N
901	090312	MARIAS	\N	89	\N
902	090314	PACHAS	\N	89	\N
903	090316	QUIVILLA	\N	89	\N
904	090317	RIPAN	\N	89	\N
905	090321	SHUNQUI	\N	89	\N
906	090322	SILLAPATA	\N	89	\N
907	090323	YANAS	\N	89	\N
908	090401	LLATA	\N	90	\N
909	090402	ARANCAY	\N	90	\N
910	090403	CHAVIN DE PARIARCA	\N	90	\N
911	090404	JACAS GRANDE	\N	90	\N
912	090405	JIRCAN	\N	90	\N
913	090406	MIRAFLORES	\N	90	\N
914	090407	MONZON	\N	90	\N
915	090408	PUNCHAO	\N	90	\N
916	090409	PUNOS	\N	90	\N
917	090410	SINGA	\N	90	\N
918	090411	TANTAMAYO	\N	90	\N
919	090501	HUACRACHUCO	\N	91	\N
920	090502	CHOLON	\N	91	\N
921	090505	SAN BUENAVENTURA	\N	91	\N
922	090601	RUPA RUPA	\N	92	\N
923	090602	DANIEL ALOMIA ROBLES	\N	92	\N
924	090603	HERMILIO VALDIZAN	\N	92	\N
925	090604	LUYANDO	\N	92	\N
926	090605	MARIANO DAMASO BERAUN	\N	92	\N
927	090606	JOSE CRESPO Y CASTILLO	\N	92	\N
928	090701	PANAO	\N	93	\N
929	090702	CHAGLLA	\N	93	\N
930	090704	MOLINO	\N	93	\N
931	090706	UMARI	\N	93	\N
932	090801	HONORIA	\N	94	\N
933	090802	PUERTO INCA	\N	94	\N
934	090803	CODO DEL POZUZO	\N	94	\N
935	090804	TOURNAVISTA	\N	94	\N
936	090805	YUYAPICHIS	\N	94	\N
937	090901	HUACAYBAMBA	\N	95	\N
938	090902	PINRA	\N	95	\N
939	090903	CANCHABAMBA	\N	95	\N
940	090904	COCHABAMBA	\N	95	\N
941	091001	JESUS	\N	96	\N
942	091002	BANOS	\N	96	\N
943	091003	SAN FRANCISCO DE ASIS	\N	96	\N
944	091004	QUEROPALCA	\N	96	\N
945	091005	SAN MIGUEL DE CAURI	\N	96	\N
946	091006	RONDOS	\N	96	\N
947	091007	JIVIA	\N	96	\N
948	091101	CHAVINILLO	\N	97	\N
949	091102	APARICIO POMARES (CHUPAN)	\N	97	\N
950	091103	CAHUAC	\N	97	\N
951	091104	CHACABAMBA	\N	97	\N
952	091105	JACAS CHICO	\N	97	\N
953	091106	OBAS	\N	97	\N
954	091107	PAMPAMARCA	\N	97	\N
955	091108	CHORAS                   	\N	97	\N
956	100101	ICA	\N	98	\N
957	100102	LA TINGUINA	\N	98	\N
958	100103	LOS AQUIJES	\N	98	\N
959	100104	PARCONA	\N	98	\N
960	100105	PUEBLO NUEVO	\N	98	\N
961	100106	SALAS	\N	98	\N
962	100107	SAN JOSE DE LOS MOLINOS	\N	98	\N
963	100108	SAN JUAN BAUTISTA	\N	98	\N
964	100109	SANTIAGO	\N	98	\N
965	100110	SUBTANJALLA	\N	98	\N
966	100111	YAUCA DEL ROSARIO	\N	98	\N
967	100112	TATE	\N	98	\N
968	100113	PACHACUTEC	\N	98	\N
969	100114	OCUCAJE	\N	98	\N
970	100201	CHINCHA ALTA	\N	99	\N
971	100202	CHAVIN	\N	99	\N
972	100203	CHINCHA BAJA	\N	99	\N
973	100204	EL CARMEN	\N	99	\N
974	100205	GROCIO PRADO	\N	99	\N
975	100206	SAN PEDRO DE HUACARPANA	\N	99	\N
976	100207	SUNAMPE	\N	99	\N
977	100208	TAMBO DE MORA	\N	99	\N
978	100209	ALTO LARAN	\N	99	\N
979	100210	PUEBLO NUEVO	\N	99	\N
980	100211	SAN JUAN DE YANAC	\N	99	\N
981	100301	NAZCA	\N	100	\N
982	100302	CHANGUILLO	\N	100	\N
983	100303	EL INGENIO	\N	100	\N
984	100304	MARCONA	\N	100	\N
985	100305	VISTA ALEGRE	\N	100	\N
986	100401	PISCO	\N	101	\N
987	100402	HUANCANO	\N	101	\N
988	100403	HUMAY	\N	101	\N
989	100404	INDEPENDENCIA	\N	101	\N
990	100405	PARACAS	\N	101	\N
991	100406	SAN ANDRES	\N	101	\N
992	100407	SAN CLEMENTE	\N	101	\N
993	100408	TUPAC AMARU INCA	\N	101	\N
994	100501	PALPA	\N	102	\N
995	100502	LLIPATA	\N	102	\N
996	100503	RIO GRANDE	\N	102	\N
997	100504	SANTA CRUZ	\N	102	\N
998	100505	TIBILLO	\N	102	\N
999	110101	HUANCAYO	\N	103	\N
1000	110103	CARHUACALLANGA	\N	103	\N
1001	110104	COLCA	\N	103	\N
1002	110105	CULLHUAS	\N	103	\N
1003	110106	CHACAPAMPA	\N	103	\N
1004	110107	CHICCHE	\N	103	\N
1005	110108	CHILCA	\N	103	\N
1006	110109	CHONGOS ALTO	\N	103	\N
1007	110112	CHUPURO	\N	103	\N
1008	110113	EL TAMBO	\N	103	\N
1009	110114	HUACRAPUQUIO	\N	103	\N
1010	110116	HUALHUAS	\N	103	\N
1011	110118	HUANCAN	\N	103	\N
1012	110119	HUASICANCHA	\N	103	\N
1013	110120	HUAYUCACHI	\N	103	\N
1014	110121	INGENIO	\N	103	\N
1015	110122	PARIAHUANCA	\N	103	\N
1016	110123	PILCOMAYO	\N	103	\N
1017	110124	PUCARA	\N	103	\N
1018	110125	QUICHUAY	\N	103	\N
1019	110126	QUILCAS	\N	103	\N
1020	110127	SAN AGUSTIN	\N	103	\N
1021	110128	SAN JERONIMO DE TUNAN	\N	103	\N
1022	110131	STO DOMINGO DE ACOBAMBA	\N	103	\N
1023	110132	SANO	\N	103	\N
1024	110133	SAPALLANGA	\N	103	\N
1025	110134	SICAYA	\N	103	\N
1026	110136	VIQUES	\N	103	\N
1027	110201	CONCEPCION	\N	104	\N
1028	110202	ACO	\N	104	\N
1029	110203	ANDAMARCA	\N	104	\N
1030	110204	COMAS	\N	104	\N
1031	110205	COCHAS	\N	104	\N
1032	110206	CHAMBARA	\N	104	\N
1033	110207	HEROINAS TOLEDO	\N	104	\N
1034	110208	MANZANARES	\N	104	\N
1035	110209	MCAL CASTILLA	\N	104	\N
1036	110210	MATAHUASI	\N	104	\N
1037	110211	MITO	\N	104	\N
1038	110212	NUEVE DE JULIO	\N	104	\N
1039	110213	ORCOTUNA	\N	104	\N
1040	110214	STA ROSA DE OCOPA	\N	104	\N
1041	110215	SAN JOSE DE QUERO	\N	104	\N
1042	110301	JAUJA	\N	105	\N
1043	110302	ACOLLA	\N	105	\N
1044	110303	APATA	\N	105	\N
1045	110304	ATAURA	\N	105	\N
1046	110305	CANCHAILLO	\N	105	\N
1047	110306	EL MANTARO	\N	105	\N
1048	110307	HUAMALI	\N	105	\N
1049	110308	HUARIPAMPA	\N	105	\N
1050	110309	HUERTAS	\N	105	\N
1051	110310	JANJAILLO	\N	105	\N
1052	110311	JULCAN	\N	105	\N
1053	110312	LEONOR ORDONEZ	\N	105	\N
1054	110313	LLOCLLAPAMPA	\N	105	\N
1055	110314	MARCO	\N	105	\N
1056	110315	MASMA	\N	105	\N
1057	110316	MOLINOS	\N	105	\N
1058	110317	MONOBAMBA	\N	105	\N
1059	110318	MUQUI	\N	105	\N
1060	110319	MUQUIYAUYO	\N	105	\N
1061	110320	PACA	\N	105	\N
1062	110321	PACCHA	\N	105	\N
1063	110322	PANCAN	\N	105	\N
1064	110323	PARCO	\N	105	\N
1065	110324	POMACANCHA	\N	105	\N
1066	110325	RICRAN	\N	105	\N
1067	110326	SAN LORENZO	\N	105	\N
1068	110327	SAN PEDRO DE CHUNAN	\N	105	\N
1069	110328	SINCOS	\N	105	\N
1070	110329	TUNAN MARCA	\N	105	\N
1071	110330	YAULI	\N	105	\N
1072	110331	CURICACA	\N	105	\N
1073	110332	MASMA CHICCHE	\N	105	\N
1074	110333	SAUSA	\N	105	\N
1075	110334	YAUYOS	\N	105	\N
1076	110401	JUNIN	\N	106	\N
1077	110402	CARHUAMAYO	\N	106	\N
1078	110403	ONDORES	\N	106	\N
1079	110404	ULCUMAYO	\N	106	\N
1080	110501	TARMA	\N	107	\N
1081	110502	ACOBAMBA	\N	107	\N
1082	110503	HUARICOLCA	\N	107	\N
1083	110504	HUASAHUASI	\N	107	\N
1084	110505	LA UNION	\N	107	\N
1085	110506	PALCA	\N	107	\N
1086	110507	PALCAMAYO	\N	107	\N
1087	110508	SAN PEDRO DE CAJAS	\N	107	\N
1088	110509	TAPO	\N	107	\N
1089	110601	LA OROYA	\N	108	\N
1090	110602	CHACAPALPA	\N	108	\N
1091	110603	HUAY HUAY	\N	108	\N
1092	110604	MARCAPOMACOCHA	\N	108	\N
1093	110605	MOROCOCHA	\N	108	\N
1094	110606	PACCHA	\N	108	\N
1095	110607	STA BARBARA DE CARHUACAYAN	\N	108	\N
1096	110608	SUITUCANCHA	\N	108	\N
1097	110609	YAULI	\N	108	\N
1098	110610	STA ROSA DE SACCO	\N	108	\N
1099	110701	SATIPO	\N	109	\N
1100	110702	COVIRIALI	\N	109	\N
1101	110703	LLAYLLA	\N	109	\N
1102	110704	MAZAMARI	\N	109	\N
1103	110705	PAMPA HERMOSA	\N	109	\N
1104	110706	PANGOA	\N	109	\N
1105	110707	RIO NEGRO	\N	109	\N
1106	110708	RIO TAMBO	\N	109	\N
1107	110801	CHANCHAMAYO	\N	110	\N
1108	110802	SAN RAMON	\N	110	\N
1109	110803	VITOC	\N	110	\N
1110	110804	SAN LUIS DE SHUARO	\N	110	\N
1111	110805	PICHANAQUI	\N	110	\N
1112	110806	PERENE	\N	110	\N
1113	110901	CHUPACA	\N	111	\N
1114	110902	AHUAC	\N	111	\N
1115	110903	CHONGOS BAJO	\N	111	\N
1116	110904	HUACHAC	\N	111	\N
1117	110905	HUAMANCACA CHICO	\N	111	\N
1118	110906	SAN JUAN DE ISCOS	\N	111	\N
1119	110907	SAN JUAN DE JARPA	\N	111	\N
1120	110908	TRES DE DICIEMBRE	\N	111	\N
1121	110909	YANACANCHA	\N	111	\N
1122	120101	TRUJILLO	\N	112	\N
1123	120102	HUANCHACO	\N	112	\N
1124	120103	LAREDO	\N	112	\N
1125	120104	MOCHE	\N	112	\N
1126	120105	SALAVERRY	\N	112	\N
1127	120106	SIMBAL	\N	112	\N
1128	120107	VICTOR LARCO HERRERA	\N	112	\N
1129	120109	POROTO	\N	112	\N
1130	120110	EL PORVENIR	\N	112	\N
1131	120111	LA ESPERANZA	\N	112	\N
1132	120112	FLORENCIA DE MORA	\N	112	\N
1133	120201	BOLIVAR	\N	113	\N
1134	120202	BAMBAMARCA	\N	113	\N
1135	120203	CONDORMARCA	\N	113	\N
1136	120204	LONGOTEA	\N	113	\N
1137	120205	UCUNCHA	\N	113	\N
1138	120206	UCHUMARCA	\N	113	\N
1139	120301	HUAMACHUCO	\N	114	\N
1140	120302	COCHORCO	\N	114	\N
1141	120303	CURGOS	\N	114	\N
1142	120304	CHUGAY	\N	114	\N
1143	120305	MARCABAL	\N	114	\N
1144	120306	SANAGORAN	\N	114	\N
1145	120307	SARIN	\N	114	\N
1146	120308	SARTIMBAMBA	\N	114	\N
1147	120401	OTUZCO	\N	115	\N
1148	120402	AGALLPAMPA	\N	115	\N
1149	120403	CHARAT	\N	115	\N
1150	120404	HUARANCHAL	\N	115	\N
1151	120405	LA CUESTA	\N	115	\N
1152	120408	PARANDAY	\N	115	\N
1153	120409	SALPO	\N	115	\N
1154	120410	SINSICAP	\N	115	\N
1155	120411	USQUIL	\N	115	\N
1156	120413	MACHE	\N	115	\N
1157	120501	SAN PEDRO DE LLOC	\N	116	\N
1158	120503	GUADALUPE	\N	116	\N
1159	120504	JEQUETEPEQUE	\N	116	\N
1160	120506	PACASMAYO	\N	116	\N
1161	120508	SAN JOSE	\N	116	\N
1162	120601	TAYABAMBA	\N	117	\N
1163	120602	BULDIBUYO	\N	117	\N
1164	120603	CHILLIA	\N	117	\N
1165	120604	HUAYLILLAS	\N	117	\N
1166	120605	HUANCASPATA	\N	117	\N
1167	120606	HUAYO	\N	117	\N
1168	120607	ONGON	\N	117	\N
1169	120608	PARCOY	\N	117	\N
1170	120609	PATAZ	\N	117	\N
1171	120610	PIAS	\N	117	\N
1172	120611	TAURIJA	\N	117	\N
1173	120612	URPAY	\N	117	\N
1174	120613	SANTIAGO DE CHALLAS	\N	117	\N
1175	120701	SANTIAGO DE CHUCO	\N	118	\N
1176	120702	CACHICADAN	\N	118	\N
1177	120703	MOLLEBAMBA	\N	118	\N
1178	120704	MOLLEPATA	\N	118	\N
1179	120705	QUIRUVILCA	\N	118	\N
1180	120706	SANTA CRUZ DE CHUCA	\N	118	\N
1181	120707	SITABAMBA	\N	118	\N
1182	120708	ANGASMARCA	\N	118	\N
1183	120801	ASCOPE	\N	119	\N
1184	120802	CHICAMA	\N	119	\N
1185	120803	CHOCOPE	\N	119	\N
1186	120804	SANTIAGO DE CAO	\N	119	\N
1187	120805	MAGDALENA DE CAO	\N	119	\N
1188	120806	PAIJAN	\N	119	\N
1189	120807	RAZURI	\N	119	\N
1190	120808	CASA GRANDE	\N	119	\N
1191	120901	CHEPEN	\N	120	\N
1192	120902	PACANGA	\N	120	\N
1193	120903	PUEBLO NUEVO	\N	120	\N
1194	121001	JULCAN	\N	121	\N
1195	121002	CARABAMBA	\N	121	\N
1196	121003	CALAMARCA	\N	121	\N
1197	121004	HUASO	\N	121	\N
1198	121101	CASCAS	\N	122	\N
1199	121102	LUCMA	\N	122	\N
1200	121103	MARMOT	\N	122	\N
1201	121104	SAYAPULLO	\N	122	\N
1202	121201	VIRU	\N	123	\N
1203	121202	CHAO	\N	123	\N
1204	121203	GUADALUPITO	\N	123	\N
1205	130101	CHICLAYO	\N	124	\N
1206	130102	CHONGOYAPE	\N	124	\N
1207	130103	ETEN	\N	124	\N
1208	130104	ETEN PUERTO	\N	124	\N
1209	130105	LAGUNAS	\N	124	\N
1210	130106	MONSEFU	\N	124	\N
1211	130107	NUEVA ARICA	\N	124	\N
1212	130108	OYOTUN	\N	124	\N
1213	130109	PICSI	\N	124	\N
1214	130110	PIMENTEL	\N	124	\N
1215	130111	REQUE	\N	124	\N
1216	130112	JOSE LEONARDO ORTIZ	\N	124	\N
1217	130113	SANTA ROSA	\N	124	\N
1218	130114	SANA	\N	124	\N
1219	130115	LA VICTORIA	\N	124	\N
1220	130116	CAYALTI	\N	124	\N
1221	130117	PATAPO	\N	124	\N
1222	130118	POMALCA	\N	124	\N
1223	130119	PUCALA	\N	124	\N
1224	130120	TUMAN	\N	124	\N
1225	130201	FERRENAFE	\N	125	\N
1226	130202	INCAHUASI	\N	125	\N
1227	130203	CANARIS	\N	125	\N
1228	130204	PITIPO	\N	125	\N
1229	130205	PUEBLO NUEVO	\N	125	\N
1230	130206	MANUEL ANTONIO MESONES MURO	\N	125	\N
1231	130301	LAMBAYEQUE	\N	126	\N
1232	130302	CHOCHOPE	\N	126	\N
1233	130303	ILLIMO	\N	126	\N
1234	130304	JAYANCA	\N	126	\N
1235	130305	MOCHUMI	\N	126	\N
1236	130306	MORROPE	\N	126	\N
1237	130307	MOTUPE	\N	126	\N
1238	130308	OLMOS	\N	126	\N
1239	130309	PACORA	\N	126	\N
1240	130310	SALAS	\N	126	\N
1241	130311	SAN JOSE	\N	126	\N
1242	130312	TUCUME	\N	126	\N
1243	140101	LIMA	\N	127	\N
1244	140102	ANCON	\N	127	\N
1245	140103	ATE	\N	127	\N
1246	140104	BRENA	\N	127	\N
1247	140105	CARABAYLLO	\N	127	\N
1248	140106	COMAS	\N	127	\N
1249	140107	CHACLACAYO	\N	127	\N
1250	140108	CHORRILLOS	\N	127	\N
1251	140109	LA VICTORIA	\N	127	\N
1252	140110	LA MOLINA	\N	127	\N
1253	140111	LINCE	\N	127	\N
1254	140112	LURIGANCHO	\N	127	\N
1255	140113	LURIN	\N	127	\N
1256	140114	MAGDALENA DEL MAR	\N	127	\N
1257	140115	MIRAFLORES	\N	127	\N
1258	140116	PACHACAMAC	\N	127	\N
1259	140117	PUEBLO LIBRE	\N	127	\N
1260	140118	PUCUSANA	\N	127	\N
1261	140119	PUENTE PIEDRA	\N	127	\N
1262	140120	PUNTA HERMOSA	\N	127	\N
1263	140121	PUNTA NEGRA	\N	127	\N
1264	140122	RIMAC	\N	127	\N
1265	140123	SAN BARTOLO	\N	127	\N
1266	140124	SAN ISIDRO	\N	127	\N
1267	140125	BARRANCO	\N	127	\N
1268	140126	SAN MARTIN DE PORRES	\N	127	\N
1269	140127	SAN MIGUEL	\N	127	\N
1270	140128	STA MARIA DEL MAR	\N	127	\N
1271	140129	SANTA ROSA	\N	127	\N
1272	140130	SANTIAGO DE SURCO	\N	127	\N
1273	140131	SURQUILLO	\N	127	\N
1274	140132	VILLA MARIA DEL TRIUNFO	\N	127	\N
1275	140133	JESUS MARIA	\N	127	\N
1276	140134	INDEPENDENCIA	\N	127	\N
1277	140135	EL AGUSTINO	\N	127	\N
1278	140136	SAN JUAN DE MIRAFLORES	\N	127	\N
1279	140137	SAN JUAN DE LURIGANCHO	\N	127	\N
1280	140138	SAN LUIS	\N	127	\N
1281	140139	CIENEGUILLA	\N	127	\N
1282	140140	SAN BORJA	\N	127	\N
1283	140141	VILLA EL SALVADOR	\N	127	\N
1284	140142	LOS OLIVOS	\N	127	\N
1285	140143	SANTA ANITA	\N	127	\N
1286	140201	CAJATAMBO	\N	128	\N
1287	140205	COPA	\N	128	\N
1288	140206	GORGOR	\N	128	\N
1289	140207	HUANCAPON	\N	128	\N
1290	140208	MANAS	\N	128	\N
1291	140301	CANTA	\N	129	\N
1292	140302	ARAHUAY	\N	129	\N
1293	140303	HUAMANTANGA	\N	129	\N
1294	140304	HUAROS	\N	129	\N
1295	140305	LACHAQUI	\N	129	\N
1296	140306	SAN BUENAVENTURA	\N	129	\N
1297	140307	SANTA ROSA DE QUIVES	\N	129	\N
1298	140401	SAN VICENTE DE CANETE	\N	130	\N
1299	140402	CALANGO	\N	130	\N
1300	140403	CERRO AZUL	\N	130	\N
1301	140404	COAYLLO	\N	130	\N
1302	140405	CHILCA	\N	130	\N
1303	140406	IMPERIAL	\N	130	\N
1304	140407	LUNAHUANA	\N	130	\N
1305	140408	MALA	\N	130	\N
1306	140409	NUEVO IMPERIAL	\N	130	\N
1307	140410	PACARAN	\N	130	\N
1308	140411	QUILMANA	\N	130	\N
1309	140412	SAN ANTONIO	\N	130	\N
1310	140413	SAN LUIS	\N	130	\N
1311	140414	SANTA CRUZ DE FLORES	\N	130	\N
1312	140415	ZUNIGA	\N	130	\N
1313	140416	ASIA	\N	130	\N
1314	140501	HUACHO	\N	131	\N
1315	140502	AMBAR	\N	131	\N
1316	140504	CALETA DE CARQUIN	\N	131	\N
1317	140505	CHECRAS	\N	131	\N
1318	140506	HUALMAY	\N	131	\N
1319	140507	HUAURA	\N	131	\N
1320	140508	LEONCIO PRADO	\N	131	\N
1321	140509	PACCHO	\N	131	\N
1322	140511	SANTA LEONOR	\N	131	\N
1323	140512	SANTA MARIA	\N	131	\N
1324	140513	SAYAN	\N	131	\N
1325	140516	VEGUETA	\N	131	\N
1326	140601	MATUCANA	\N	132	\N
1327	140602	ANTIOQUIA	\N	132	\N
1328	140603	CALLAHUANCA	\N	132	\N
1329	140604	CARAMPOMA	\N	132	\N
1330	140605	CASTA	\N	132	\N
1331	140606	CUENCA	\N	132	\N
1332	140607	CHICLA	\N	132	\N
1333	140608	HUANZA	\N	132	\N
1334	140609	HUAROCHIRI	\N	132	\N
1335	140610	LAHUAYTAMBO	\N	132	\N
1336	140611	LANGA	\N	132	\N
1337	140612	MARIATANA	\N	132	\N
1338	140613	RICARDO PALMA	\N	132	\N
1339	140614	SAN ANDRES DE TUPICOCHA	\N	132	\N
1340	140615	SAN ANTONIO	\N	132	\N
1341	140616	SAN BARTOLOME	\N	132	\N
1342	140617	SAN DAMIAN	\N	132	\N
1343	140618	SANGALLAYA	\N	132	\N
1344	140619	SAN JUAN DE TANTARANCHE	\N	132	\N
1345	140620	SAN LORENZO DE QUINTI	\N	132	\N
1346	140621	SAN MATEO	\N	132	\N
1347	140622	SAN MATEO DE OTAO	\N	132	\N
1348	140623	SAN PEDRO DE HUANCAYRE	\N	132	\N
1349	140624	SANTA CRUZ DE COCACHACRA	\N	132	\N
1350	140625	SANTA EULALIA	\N	132	\N
1351	140626	SANTIAGO DE ANCHUCAYA	\N	132	\N
1352	140627	SANTIAGO DE TUNA	\N	132	\N
1353	140628	SANTO DOMINGO DE LOS OLLEROS	\N	132	\N
1354	140629	SURCO	\N	132	\N
1355	140630	HUACHUPAMPA	\N	132	\N
1356	140631	LARAOS	\N	132	\N
1357	140632	SAN JUAN DE IRIS	\N	132	\N
1358	140701	YAUYOS	\N	133	\N
1359	140702	ALIS	\N	133	\N
1360	140703	AYAUCA	\N	133	\N
1361	140704	AYAVIRI	\N	133	\N
1362	140705	AZANGARO	\N	133	\N
1363	140706	CACRA	\N	133	\N
1364	140707	CARANIA	\N	133	\N
1365	140708	COCHAS	\N	133	\N
1366	140709	COLONIA	\N	133	\N
1367	140710	CHOCOS	\N	133	\N
1368	140711	HUAMPARA	\N	133	\N
1369	140712	HUANCAYA	\N	133	\N
1370	140713	HUANGASCAR	\N	133	\N
1371	140714	HUANTAN	\N	133	\N
1372	140715	HUANEC	\N	133	\N
1373	140716	LARAOS	\N	133	\N
1374	140717	LINCHA	\N	133	\N
1375	140718	MIRAFLORES	\N	133	\N
1376	140719	OMAS	\N	133	\N
1377	140720	QUINCHES	\N	133	\N
1378	140721	QUINOCAY	\N	133	\N
1379	140722	SAN JOAQUIN	\N	133	\N
1380	140723	SAN PEDRO DE PILAS	\N	133	\N
1381	140724	TANTA	\N	133	\N
1382	140725	TAURIPAMPA	\N	133	\N
1383	140726	TUPE	\N	133	\N
1384	140727	TOMAS	\N	133	\N
1385	140728	VINAC	\N	133	\N
1386	140729	VITIS	\N	133	\N
1387	140730	HONGOS	\N	133	\N
1388	140731	MADEAN	\N	133	\N
1389	140732	PUTINZA	\N	133	\N
1390	140733	CATAHUASI	\N	133	\N
1391	140801	HUARAL	\N	134	\N
1392	140802	ATAVILLOS ALTO	\N	134	\N
1393	140803	ATAVILLOS BAJO	\N	134	\N
1394	140804	AUCALLAMA	\N	134	\N
1395	140805	CHANCAY	\N	134	\N
1396	140806	IHUARI	\N	134	\N
1397	140807	LAMPIAN	\N	134	\N
1398	140808	PACARAOS	\N	134	\N
1399	140809	SAN MIGUEL DE ACOS	\N	134	\N
1400	140810	VEINTISIETE DE NOVIEMBRE	\N	134	\N
1401	140811	STA CRUZ DE ANDAMARCA	\N	134	\N
1402	140812	SUMBILCA	\N	134	\N
1403	140901	BARRANCA	\N	135	\N
1404	140902	PARAMONGA	\N	135	\N
1405	140903	PATIVILCA	\N	135	\N
1406	140904	SUPE	\N	135	\N
1407	140905	SUPE PUERTO	\N	135	\N
1408	141001	OYON	\N	136	\N
1409	141002	NAVAN	\N	136	\N
1410	141003	CAUJUL	\N	136	\N
1411	141004	ANDAJES	\N	136	\N
1412	141005	PACHANGARA	\N	136	\N
1413	141006	COCHAMARCA	\N	136	\N
1414	150101	IQUITOS	\N	137	\N
1415	150102	ALTO NANAY	\N	137	\N
1416	150103	FERNANDO LORES	\N	137	\N
1417	150104	LAS AMAZONAS	\N	137	\N
1418	150105	MAZAN	\N	137	\N
1419	150106	NAPO	\N	137	\N
1420	150107	PUTUMAYO	\N	137	\N
1421	150108	TORRES CAUSANA	\N	137	\N
1422	150110	INDIANA	\N	137	\N
1423	150111	PUNCHANA	\N	137	\N
1424	150112	BELEN	\N	137	\N
1425	150113	SAN JUAN BAUTISTA	\N	137	\N
1426	150114	TNTE MANUEL CLAVERO	\N	137	\N
1427	150201	YURIMAGUAS	\N	138	\N
1428	150202	BALSAPUERTO	\N	138	\N
1429	150205	JEBEROS	\N	138	\N
1430	150206	LAGUNAS	\N	138	\N
1431	150210	SANTA CRUZ	\N	138	\N
1432	150211	TNTE CESAR LOPEZ ROJAS	\N	138	\N
1433	150301	NAUTA	\N	139	\N
1434	150302	PARINARI	\N	139	\N
1435	150303	TIGRE	\N	139	\N
1436	150304	URARINAS	\N	139	\N
1437	150305	TROMPETEROS	\N	139	\N
1438	150401	REQUENA	\N	140	\N
1439	150402	ALTO TAPICHE	\N	140	\N
1440	150403	CAPELO	\N	140	\N
1441	150404	EMILIO SAN MARTIN	\N	140	\N
1442	150405	MAQUIA	\N	140	\N
1443	150406	PUINAHUA	\N	140	\N
1444	150407	SAQUENA	\N	140	\N
1445	150408	SOPLIN	\N	140	\N
1446	150409	TAPICHE	\N	140	\N
1447	150410	JENARO HERRERA	\N	140	\N
1448	150411	YAQUERANA	\N	140	\N
1449	150501	CONTAMANA	\N	141	\N
1450	150502	VARGAS GUERRA	\N	141	\N
1451	150503	PADRE MARQUEZ	\N	141	\N
1452	150504	PAMPA HERMOZA	\N	141	\N
1453	150505	SARAYACU	\N	141	\N
1454	150506	INAHUAYA	\N	141	\N
1455	150601	MARISCAL RAMON CASTILLA	\N	142	\N
1456	150602	PEBAS	\N	142	\N
1457	150603	YAVARI	\N	142	\N
1458	150604	SAN PABLO	\N	142	\N
1459	150701	BARRANCA	\N	143	\N
1460	150702	ANDOAS	\N	143	\N
1461	150703	CAHUAPANAS	\N	143	\N
1462	150704	MANSERICHE	\N	143	\N
1463	150705	MORONA	\N	143	\N
1464	150706	PASTAZA	\N	143	\N
1465	160101	TAMBOPATA	\N	144	\N
1466	160102	INAMBARI	\N	144	\N
1467	160103	LAS PIEDRAS	\N	144	\N
1468	160104	LABERINTO	\N	144	\N
1469	160201	MANU	\N	145	\N
1470	160202	FITZCARRALD	\N	145	\N
1471	160203	MADRE DE DIOS	\N	145	\N
1472	160204	HUEPETUHE	\N	145	\N
1473	160301	INAPARI	\N	146	\N
1474	160302	IBERIA	\N	146	\N
1475	160303	TAHUAMANU	\N	146	\N
1476	170101	MOQUEGUA	\N	147	\N
1477	170102	CARUMAS	\N	147	\N
1478	170103	CUCHUMBAYA	\N	147	\N
1479	170104	SAN CRISTOBAL	\N	147	\N
1480	170105	TORATA	\N	147	\N
1481	170106	SAMEGUA	\N	147	\N
1482	170201	OMATE	\N	148	\N
1483	170202	COALAQUE	\N	148	\N
1484	170203	CHOJATA	\N	148	\N
1485	170204	ICHUNA	\N	148	\N
1486	170205	LA CAPILLA	\N	148	\N
1487	170206	LLOQUE	\N	148	\N
1488	170207	MATALAQUE	\N	148	\N
1489	170208	PUQUINA	\N	148	\N
1490	170209	QUINISTAQUILLAS	\N	148	\N
1491	170210	UBINAS	\N	148	\N
1492	170211	YUNGA	\N	148	\N
1493	170301	ILO	\N	149	\N
1494	170302	EL ALGARROBAL	\N	149	\N
1495	170303	PACOCHA	\N	149	\N
1496	180101	CHAUPIMARCA	\N	150	\N
1497	180103	HUACHON	\N	150	\N
1498	180104	HUARIACA	\N	150	\N
1499	180105	HUAYLLAY	\N	150	\N
1500	180106	NINACACA	\N	150	\N
1501	180107	PALLANCHACRA	\N	150	\N
1502	180108	PAUCARTAMBO	\N	150	\N
1503	180109	SAN FCO DE ASIS DE YARUSYACAN	\N	150	\N
1504	180110	SIMON BOLIVAR	\N	150	\N
1505	180111	TICLACAYAN	\N	150	\N
1506	180112	TINYAHUARCO	\N	150	\N
1507	180113	VICCO	\N	150	\N
1508	180114	YANACANCHA	\N	150	\N
1509	180201	YANAHUANCA	\N	151	\N
1510	180202	CHACAYAN	\N	151	\N
1511	180203	GOYLLARISQUIZGA	\N	151	\N
1512	180204	PAUCAR	\N	151	\N
1513	180205	SAN PEDRO DE PILLAO	\N	151	\N
1514	180206	SANTA ANA DE TUSI	\N	151	\N
1515	180207	TAPUC	\N	151	\N
1516	180208	VILCABAMBA	\N	151	\N
1517	180301	OXAPAMPA	\N	152	\N
1518	180302	CHONTABAMBA	\N	152	\N
1519	180303	HUANCABAMBA	\N	152	\N
1520	180304	PUERTO BERMUDEZ	\N	152	\N
1521	180305	VILLA RICA	\N	152	\N
1522	180306	POZUZO	\N	152	\N
1523	180307	PALCAZU	\N	152	\N
1524	190101	PIURA	\N	153	\N
1525	190103	CASTILLA	\N	153	\N
1526	190104	CATACAOS	\N	153	\N
1527	190105	LA ARENA	\N	153	\N
1528	190106	LA UNION	\N	153	\N
1529	190107	LAS LOMAS	\N	153	\N
1530	190109	TAMBO GRANDE	\N	153	\N
1531	190113	CURA MORI	\N	153	\N
1532	190114	EL TALLAN	\N	153	\N
1533	190201	AYABACA	\N	154	\N
1534	190202	FRIAS	\N	154	\N
1535	190203	LAGUNAS	\N	154	\N
1536	190204	MONTERO	\N	154	\N
1537	190205	PACAIPAMPA	\N	154	\N
1538	190206	SAPILLICA	\N	154	\N
1539	190207	SICCHEZ	\N	154	\N
1540	190208	SUYO	\N	154	\N
1541	190209	JILILI	\N	154	\N
1542	190210	PAIMAS	\N	154	\N
1543	190301	HUANCABAMBA	\N	155	\N
1544	190302	CANCHAQUE	\N	155	\N
1545	190303	HUARMACA	\N	155	\N
1546	190304	SONDOR	\N	155	\N
1547	190305	SONDORILLO	\N	155	\N
1548	190306	EL CARMEN DE LA FRONTERA	\N	155	\N
1549	190307	SAN MIGUEL DE EL FAIQUE	\N	155	\N
1550	190308	LALAQUIZ	\N	155	\N
1551	190401	CHULUCANAS	\N	156	\N
1552	190402	BUENOS AIRES	\N	156	\N
1553	190403	CHALACO	\N	156	\N
1554	190404	MORROPON	\N	156	\N
1555	190405	SALITRAL	\N	156	\N
1556	190406	SANTA CATALINA DE MOSSA	\N	156	\N
1557	190407	SANTO DOMINGO	\N	156	\N
1558	190408	LA MATANZA	\N	156	\N
1559	190409	YAMANGO	\N	156	\N
1560	190410	SAN JUAN DE BIGOTE	\N	156	\N
1561	190501	PAITA	\N	157	\N
1562	190502	AMOTAPE	\N	157	\N
1563	190503	ARENAL	\N	157	\N
1564	190504	LA HUACA	\N	157	\N
1565	190505	PUEBLO NUEVO DE COLAN	\N	157	\N
1566	190506	TAMARINDO	\N	157	\N
1567	190507	VICHAYAL	\N	157	\N
1568	190601	SULLANA	\N	158	\N
1569	190602	BELLAVISTA	\N	158	\N
1570	190603	LANCONES	\N	158	\N
1571	190604	MARCAVELICA	\N	158	\N
1572	190605	MIGUEL CHECA	\N	158	\N
1573	190606	QUERECOTILLO	\N	158	\N
1574	190607	SALITRAL	\N	158	\N
1575	190608	IGNACIO ESCUDERO	\N	158	\N
1576	190701	PARINAS	\N	159	\N
1577	190702	EL ALTO	\N	159	\N
1578	190703	LA BREA	\N	159	\N
1579	190704	LOBITOS	\N	159	\N
1580	190705	MANCORA	\N	159	\N
1581	190706	LOS ORGANOS	\N	159	\N
1582	190801	SECHURA	\N	160	\N
1583	190802	VICE	\N	160	\N
1584	190803	BERNAL	\N	160	\N
1585	190804	BELLAVISTA DE LA UNION	\N	160	\N
1586	190805	CRISTO NOS VALGA	\N	160	\N
1587	190806	RINCONADA LLICUAR	\N	160	\N
1588	200101	PUNO	\N	161	\N
1589	200102	ACORA	\N	161	\N
1590	200103	ATUNCOLLA	\N	161	\N
1591	200104	CAPACHICA	\N	161	\N
1592	200105	COATA	\N	161	\N
1593	200106	CHUCUITO	\N	161	\N
1594	200107	HUATA	\N	161	\N
1595	200108	MANAZO	\N	161	\N
1596	200109	PAUCARCOLLA	\N	161	\N
1597	200110	PICHACANI	\N	161	\N
1598	200111	SAN ANTONIO	\N	161	\N
1599	200112	TIQUILLACA	\N	161	\N
1600	200113	VILQUE	\N	161	\N
1601	200114	PLATERIA	\N	161	\N
1602	200115	AMANTANI	\N	161	\N
1603	200201	AZANGARO	\N	162	\N
1604	200202	ACHAYA	\N	162	\N
1605	200203	ARAPA	\N	162	\N
1606	200204	ASILLO	\N	162	\N
1607	200205	CAMINACA	\N	162	\N
1608	200206	CHUPA	\N	162	\N
1609	200207	JOSE DOMINGO CHOQUEHUANCA	\N	162	\N
1610	200208	MUNANI	\N	162	\N
1611	200210	POTONI	\N	162	\N
1612	200212	SAMAN	\N	162	\N
1613	200213	SAN ANTON	\N	162	\N
1614	200214	SAN JOSE	\N	162	\N
1615	200215	SAN JUAN DE SALINAS	\N	162	\N
1616	200216	STGO DE PUPUJA	\N	162	\N
1617	200217	TIRAPATA	\N	162	\N
1618	200301	MACUSANI	\N	163	\N
1619	200302	AJOYANI	\N	163	\N
1620	200303	AYAPATA	\N	163	\N
1621	200304	COASA	\N	163	\N
1622	200305	CORANI	\N	163	\N
1623	200306	CRUCERO	\N	163	\N
1624	200307	ITUATA	\N	163	\N
1625	200308	OLLACHEA	\N	163	\N
1626	200309	SAN GABAN	\N	163	\N
1627	200310	USICAYOS	\N	163	\N
1628	200401	JULI	\N	164	\N
1629	200402	DESAGUADERO	\N	164	\N
1630	200403	HUACULLANI	\N	164	\N
1631	200406	PISACOMA	\N	164	\N
1632	200407	POMATA	\N	164	\N
1633	200410	ZEPITA	\N	164	\N
1634	200412	KELLUYO	\N	164	\N
1635	200501	HUANCANE	\N	165	\N
1636	200502	COJATA	\N	165	\N
1637	200504	INCHUPALLA	\N	165	\N
1638	200506	PUSI	\N	165	\N
1639	200507	ROSASPATA	\N	165	\N
1640	200508	TARACO	\N	165	\N
1641	200509	VILQUE CHICO	\N	165	\N
1642	200511	HUATASANI	\N	165	\N
1643	200601	LAMPA	\N	166	\N
1644	200602	CABANILLA	\N	166	\N
1645	200603	CALAPUJA	\N	166	\N
1646	200604	NICASIO	\N	166	\N
1647	200605	OCUVIRI	\N	166	\N
1648	200606	PALCA	\N	166	\N
1649	200607	PARATIA	\N	166	\N
1650	200608	PUCARA	\N	166	\N
1651	200609	SANTA LUCIA	\N	166	\N
1652	200610	VILAVILA	\N	166	\N
1653	200701	AYAVIRI	\N	167	\N
1654	200702	ANTAUTA	\N	167	\N
1655	200703	CUPI	\N	167	\N
1656	200704	LLALLI	\N	167	\N
1657	200705	MACARI	\N	167	\N
1658	200706	NUNOA	\N	167	\N
1659	200707	ORURILLO	\N	167	\N
1660	200708	SANTA ROSA	\N	167	\N
1661	200709	UMACHIRI	\N	167	\N
1662	200801	SANDIA	\N	168	\N
1663	200803	CUYOCUYO	\N	168	\N
1664	200804	LIMBANI	\N	168	\N
1665	200805	PHARA	\N	168	\N
1666	200806	PATAMBUCO	\N	168	\N
1667	200807	QUIACA	\N	168	\N
1668	200808	SAN JUAN DEL ORO	\N	168	\N
1669	200810	YANAHUAYA	\N	168	\N
1670	200811	ALTO INAMBARI	\N	168	\N
1671	200812	SAN PEDRO DE PUTINA PUNCO	\N	168	\N
1672	200901	JULIACA	\N	169	\N
1673	200902	CABANA	\N	169	\N
1674	200903	CABANILLAS	\N	169	\N
1675	200904	CARACOTO	\N	169	\N
1676	201001	YUNGUYO	\N	170	\N
1677	201002	UNICACHI	\N	170	\N
1678	201003	ANAPIA	\N	170	\N
1679	201004	COPANI	\N	170	\N
1680	201005	CUTURAPI	\N	170	\N
1681	201006	OLLARAYA	\N	170	\N
1682	201007	TINICACHI	\N	170	\N
1683	201101	PUTINA	\N	171	\N
1684	201102	PEDRO VILCA APAZA	\N	171	\N
1685	201103	QUILCA PUNCU	\N	171	\N
1686	201104	ANANEA	\N	171	\N
1687	201105	SINA	\N	171	\N
1688	201201	ILAVE	\N	172	\N
1689	201202	PILCUYO	\N	172	\N
1690	201203	SANTA ROSA	\N	172	\N
1691	201204	CAPASO	\N	172	\N
1692	201205	CONDURIRI	\N	172	\N
1693	201301	MOHO	\N	173	\N
1694	201302	CONIMA	\N	173	\N
1695	201303	TILALI	\N	173	\N
1696	201304	HUAYRAPATA	\N	173	\N
1697	210101	MOYOBAMBA	\N	174	\N
1698	210102	CALZADA	\N	174	\N
1699	210103	HABANA	\N	174	\N
1700	210104	JEPELACIO	\N	174	\N
1701	210105	SORITOR	\N	174	\N
1702	210106	YANTALO	\N	174	\N
1703	210201	SAPOSOA	\N	175	\N
1704	210202	PISCOYACU	\N	175	\N
1705	210203	SACANCHE	\N	175	\N
1706	210204	TINGO DE SAPOSOA	\N	175	\N
1707	210205	ALTO SAPOSOA	\N	175	\N
1708	210206	EL ESLABON	\N	175	\N
1709	210301	LAMAS	\N	176	\N
1710	210303	BARRANQUITA	\N	176	\N
1711	210304	CAYNARACHI	\N	176	\N
1712	210305	CUNUMBUQUI	\N	176	\N
1713	210306	PINTO RECODO	\N	176	\N
1714	210307	RUMISAPA	\N	176	\N
1715	210311	SHANAO	\N	176	\N
1716	210313	TABALOSOS	\N	176	\N
1717	210314	ZAPATERO	\N	176	\N
1718	210315	ALONSO DE ALVARADO	\N	176	\N
1719	210316	SAN ROQUE DE CUMBAZA	\N	176	\N
1720	210401	JUANJUI	\N	177	\N
1721	210402	CAMPANILLA	\N	177	\N
1722	210403	HUICUNGO	\N	177	\N
1723	210404	PACHIZA	\N	177	\N
1724	210405	PAJARILLO	\N	177	\N
1725	210501	RIOJA	\N	178	\N
1726	210502	POSIC	\N	178	\N
1727	210503	YORONGOS	\N	178	\N
1728	210504	YURACYACU	\N	178	\N
1729	210505	NUEVA CAJAMARCA	\N	178	\N
1730	210506	ELIAS SOPLIN	\N	178	\N
1731	210507	SAN FERNANDO	\N	178	\N
1732	210508	PARDO MIGUEL	\N	178	\N
1733	210509	AWAJUN	\N	178	\N
1734	210601	TARAPOTO	\N	179	\N
1735	210602	ALBERTO LEVEAU	\N	179	\N
1736	210604	CACATACHI	\N	179	\N
1737	210606	CHAZUTA	\N	179	\N
1738	210607	CHIPURANA	\N	179	\N
1739	210608	EL PORVENIR	\N	179	\N
1740	210609	HUIMBAYOC	\N	179	\N
1741	210610	JUAN GUERRA	\N	179	\N
1742	210611	MORALES	\N	179	\N
1743	210612	PAPAPLAYA	\N	179	\N
1744	210616	SAN ANTONIO	\N	179	\N
1745	210619	SAUCE	\N	179	\N
1746	210620	SHAPAJA	\N	179	\N
1747	210621	LA BANDA DE SHILCAYO	\N	179	\N
1748	210701	BELLAVISTA	\N	180	\N
1749	210702	SAN RAFAEL	\N	180	\N
1750	210703	SAN PABLO	\N	180	\N
1751	210704	ALTO BIAVO	\N	180	\N
1752	210705	HUALLAGA	\N	180	\N
1753	210706	BAJO BIAVO	\N	180	\N
1754	210801	TOCACHE	\N	181	\N
1755	210802	NUEVO PROGRESO	\N	181	\N
1756	210803	POLVORA	\N	181	\N
1757	210804	SHUNTE	\N	181	\N
1758	210805	UCHIZA	\N	181	\N
1759	210901	PICOTA	\N	182	\N
1760	210902	BUENOS AIRES	\N	182	\N
1761	210903	CASPIZAPA	\N	182	\N
1762	210904	PILLUANA	\N	182	\N
1763	210905	PUCACACA	\N	182	\N
1764	210906	SAN CRISTOBAL	\N	182	\N
1765	210907	SAN HILARION	\N	182	\N
1766	210908	TINGO DE PONASA	\N	182	\N
1767	210909	TRES UNIDOS	\N	182	\N
1768	210910	SHAMBOYACU	\N	182	\N
1769	211001	SAN JOSE DE SISA	\N	183	\N
1770	211002	AGUA BLANCA	\N	183	\N
1771	211003	SHATOJA	\N	183	\N
1772	211004	SAN MARTIN	\N	183	\N
1773	211005	SANTA ROSA	\N	183	\N
1774	220101	TACNA	\N	184	\N
1775	220102	CALANA	\N	184	\N
1776	220104	INCLAN	\N	184	\N
1777	220107	PACHIA	\N	184	\N
1778	220108	PALCA	\N	184	\N
1779	220109	POCOLLAY	\N	184	\N
1780	220110	SAMA	\N	184	\N
1781	220111	ALTO DE LA ALIANZA	\N	184	\N
1782	220112	CIUDAD NUEVA	\N	184	\N
1783	220113	CORONEL GREGORIO ALBARRACIN L.ALFONSO UGARTE	\N	184	\N
1784	220201	TARATA	\N	185	\N
1785	220205	CHUCATAMANI	\N	185	\N
1786	220206	ESTIQUE	\N	185	\N
1787	220207	ESTIQUE PAMPA	\N	185	\N
1788	220210	SITAJARA	\N	185	\N
1789	220211	SUSAPAYA	\N	185	\N
1790	220212	TARUCACHI	\N	185	\N
1791	220213	TICACO	\N	185	\N
1792	220301	LOCUMBA	\N	186	\N
1793	220302	ITE	\N	186	\N
1794	220303	ILABAYA	\N	186	\N
1795	220401	CANDARAVE	\N	187	\N
1796	220402	CAIRANI	\N	187	\N
1797	220403	CURIBAYA	\N	187	\N
1798	220404	HUANUARA	\N	187	\N
1799	220405	QUILAHUANI	\N	187	\N
1800	220406	CAMILACA	\N	187	\N
1801	230101	TUMBES	\N	188	\N
1802	230102	CORRALES	\N	188	\N
1803	230103	LA CRUZ	\N	188	\N
1804	230104	PAMPAS DE HOSPITAL	\N	188	\N
1805	230105	SAN JACINTO	\N	188	\N
1806	230106	SAN JUAN DE LA VIRGEN	\N	188	\N
1807	230201	ZORRITOS	\N	189	\N
1808	230202	CASITAS	\N	189	\N
1809	230203	CANOAS DE PUNTA SAL	\N	189	\N
1810	230301	ZARUMILLA	\N	190	\N
1811	230302	MATAPALO	\N	190	\N
1812	230303	PAPAYAL	\N	190	\N
1813	230304	AGUAS VERDES	\N	190	\N
1814	240101	CALLAO	\N	191	\N
1815	240102	BELLAVISTA	\N	191	\N
1816	240103	LA PUNTA	\N	191	\N
1817	240104	CARMEN DE LA LEGUA-REYNOSO	\N	191	\N
1818	240105	LA PERLA	\N	191	\N
1819	240106	VENTANILLA	\N	191	\N
1820	250101	CALLERIA	\N	192	\N
1821	250102	YARINACOCHA	\N	192	\N
1822	250103	MASISEA	\N	192	\N
1823	250104	CAMPOVERDE	\N	192	\N
1824	250105	IPARIA	\N	192	\N
1825	250106	NUEVA REQUENA	\N	192	\N
1826	250107	MANANTAY	\N	192	\N
1827	250201	PADRE ABAD	\N	193	\N
1828	250202	YRAZOLA	\N	193	\N
1829	250203	CURIMANA	\N	193	\N
1830	250301	RAIMONDI	\N	194	\N
1831	250302	TAHUANIA	\N	194	\N
1832	250303	YURUA	\N	194	\N
1833	250304	SEPAHUA	\N	194	\N
1834	250401	PURUS	\N	195	\N
\.


--
-- Data for Name: t28_provincias; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param.t28_provincias (id, codigo, nombre, abreviatura, departamento_id, activo) FROM stdin;
2	0102	BAGUA	\N	1	t
3	0103	BONGARA	\N	1	t
4	0104	LUYA	\N	1	t
5	0105	RODRIGUEZ DE MENDOZA	\N	1	t
6	0106	CONDORCANQUI	\N	1	t
7	0107	UTCUBAMBA	\N	1	t
8	0201	HUARAZ	\N	2	t
10	0203	BOLOGNESI	\N	2	t
11	0204	CARHUAZ	\N	2	t
12	0205	CASMA	\N	2	t
13	0206	CORONGO	\N	2	t
14	0207	HUAYLAS	\N	2	t
15	0208	HUARI	\N	2	t
17	0210	PALLASCA	\N	2	t
18	0211	POMABAMBA	\N	2	t
19	0212	RECUAY	\N	2	t
20	0213	SANTA	\N	2	t
21	0214	SIHUAS	\N	2	t
22	0215	YUNGAY	\N	2	t
24	0217	CARLOS FERMIN FITZCARRALD	\N	2	t
25	0218	ASUNCION	\N	2	t
26	0219	HUARMEY	\N	2	t
27	0220	OCROS	\N	2	t
28	0301	ABANCAY	\N	3	t
29	0302	AYMARAES	\N	3	t
30	0303	ANDAHUAYLAS	\N	3	t
31	0304	ANTABAMBA	\N	3	t
32	0305	COTABAMBAS	\N	3	t
33	0306	GRAU	\N	3	t
35	0401	AREQUIPA	\N	4	t
36	0402	CAYLLOMA	\N	4	t
37	0403	CAMANA	\N	4	t
38	0404	CARAVELI	\N	4	t
39	0405	CASTILLA	\N	4	t
40	0406	CONDESUYOS	\N	4	t
41	0407	ISLAY	\N	4	t
42	0408	LA UNION	\N	4	t
44	0502	CANGALLO	\N	5	t
45	0503	HUANTA	\N	5	t
46	0504	LA MAR	\N	5	t
47	0505	LUCANAS	\N	5	t
48	0506	PARINACOCHAS	\N	5	t
49	0507	VICTOR FAJARDO	\N	5	t
51	0509	VILCAS HUAMAN	\N	5	t
52	0510	PAUCAR DEL SARA SARA	\N	5	t
53	0511	SUCRE	\N	5	t
54	0601	CAJAMARCA	\N	6	t
55	0602	CAJABAMBA	\N	6	t
56	0603	CELENDIN	\N	6	t
57	0604	CONTUMAZA	\N	6	t
58	0605	CUTERVO	\N	6	t
60	0607	HUALGAYOC	\N	6	t
61	0608	JAEN	\N	6	t
62	0609	SANTA CRUZ	\N	6	t
63	0610	SAN MIGUEL	\N	6	t
64	0611	SAN IGNACIO	\N	6	t
65	0612	SAN MARCOS	\N	6	t
66	0613	SAN PABLO	\N	6	t
67	0701	CUSCO	\N	7	t
69	0703	ANTA	\N	7	t
70	0704	CALCA	\N	7	t
71	0705	CANAS	\N	7	t
72	0706	CANCHIS	\N	7	t
73	0707	CHUMBIVILCAS	\N	7	t
74	0708	ESPINAR	\N	7	t
76	0710	PARURO	\N	7	t
77	0711	PAUCARTAMBO	\N	7	t
78	0712	QUISPICANCHIS	\N	7	t
79	0713	URUBAMBA	\N	7	t
80	0801	HUANCAVELICA	\N	8	t
81	0802	ACOBAMBA	\N	8	t
82	0803	ANGARAES	\N	8	t
83	0804	CASTROVIRREYNA	\N	8	t
85	0806	HUAYTARA	\N	8	t
86	0807	CHURCAMPA	\N	8	t
87	0901	HUANUCO	\N	9	t
88	0902	AMBO	\N	9	t
89	0903	DOS DE MAYO	\N	9	t
90	0904	HUAMALIES	\N	9	t
91	0905	MARANON	\N	9	t
92	0906	LEONCIO PRADO	\N	9	t
93	0907	PACHITEA	\N	9	t
94	0908	PUERTO INCA	\N	9	t
96	0910	LAURICOCHA	\N	9	t
97	0911	YAROWILCA	\N	9	t
98	1001	ICA	\N	10	t
99	1002	CHINCHA	\N	10	t
100	1003	NAZCA	\N	10	t
101	1004	PISCO	\N	10	t
102	1005	PALPA	\N	10	t
104	1102	CONCEPCION	\N	11	t
105	1103	JAUJA	\N	11	t
106	1104	JUNIN	\N	11	t
107	1105	TARMA	\N	11	t
108	1106	YAULI	\N	11	t
110	1108	CHANCHAMAYO	\N	11	t
111	1109	CHUPACA	\N	11	t
112	1201	TRUJILLO	\N	12	t
113	1202	BOLIVAR	\N	12	t
114	1203	SANCHEZ CARRION	\N	12	t
115	1204	OTUZCO	\N	12	t
117	1206	PATAZ	\N	12	t
118	1207	SANTIAGO DE CHUCO	\N	12	t
119	1208	ASCOPE	\N	12	t
120	1209	CHEPEN	\N	12	t
121	1210	JULCAN	\N	12	t
123	1212	VIRU	\N	12	t
124	1301	CHICLAYO	\N	13	t
125	1302	FERRENAFE	\N	13	t
126	1303	LAMBAYEQUE	\N	13	t
127	1401	LIMA	\N	14	t
128	1402	CAJATAMBO	\N	14	t
129	1403	CANTA	\N	14	t
130	1404	CANETE	\N	14	t
132	1406	HUAROCHIRI	\N	14	t
133	1407	YAUYOS	\N	14	t
134	1408	HUARAL	\N	14	t
135	1409	BARRANCA	\N	14	t
136	1410	OYON	\N	14	t
138	1502	ALTO AMAZONAS	\N	15	t
139	1503	LORETO	\N	15	t
140	1504	REQUENA	\N	15	t
141	1505	UCAYALI	\N	15	t
143	1507	DATEM DEL MARAÑON	\N	15	t
144	1601	TAMBOPATA	\N	16	t
145	1602	MANU	\N	16	t
146	1603	TAHUAMANU	\N	16	t
147	1701	MARISCAL NIETO	\N	17	t
1	0101	CHACHAPOYAS	\N	1	t
9	0202	AIJA	\N	2	t
16	0209	MARISCAL LUZURIAGA	\N	2	t
23	0216	ANTONIO RAIMONDI	\N	2	t
34	0307	CHINCHEROS	\N	3	t
43	0501	HUAMANGA	\N	5	t
50	0508	HUANCA SANCOS	\N	5	t
59	0606	CHOTA	\N	6	t
68	0702	ACOMAYO	\N	7	t
75	0709	LA CONVENCION	\N	7	t
84	0805	TAYACAJA	\N	8	t
95	0909	HUACAYBAMBA	\N	9	t
103	1101	HUANCAYO	\N	11	t
109	1107	SATIPO	\N	11	t
116	1205	PACASMAYO	\N	12	t
122	1211	GRAN CHIMU	\N	12	t
131	1405	HUAURA	\N	14	t
137	1501	MAYNAS	\N	15	t
142	1506	MARISCAL RAMON CASTILLA	\N	15	t
148	1702	GENERAL SANCHEZ CERRO	\N	17	t
149	1703	ILO	\N	17	t
150	1801	PASCO	\N	18	t
151	1802	DANIEL ALCIDES CARRION	\N	18	t
152	1803	OXAPAMPA	\N	18	t
153	1901	PIURA	\N	19	t
154	1902	AYABACA	\N	19	t
155	1903	HUANCABAMBA	\N	19	t
156	1904	MORROPON	\N	19	t
157	1905	PAITA	\N	19	t
158	1906	SULLANA	\N	19	t
159	1907	TALARA	\N	19	t
160	1908	SECHURA	\N	19	t
161	2001	PUNO	\N	20	t
162	2002	AZANGARO	\N	20	t
163	2003	CARABAYA	\N	20	t
164	2004	CHUCUITO	\N	20	t
165	2005	HUANCANE	\N	20	t
166	2006	LAMPA	\N	20	t
167	2007	MELGAR	\N	20	t
168	2008	SANDIA	\N	20	t
169	2009	SAN ROMAN	\N	20	t
170	2010	YUNGUYO	\N	20	t
171	2011	SAN ANTONIO DE PUTINA	\N	20	t
172	2012	EL COLLAO	\N	20	t
173	2013	MOHO	\N	20	t
174	2101	MOYOBAMBA	\N	21	t
175	2102	HUALLAGA	\N	21	t
176	2103	LAMAS	\N	21	t
177	2104	MARISCAL CACERES	\N	21	t
178	2105	RIOJA	\N	21	t
179	2106	SAN MARTIN	\N	21	t
180	2107	BELLAVISTA	\N	21	t
181	2108	TOCACHE	\N	21	t
182	2109	PICOTA	\N	21	t
183	2110	EL DORADO	\N	21	t
184	2201	TACNA	\N	22	t
185	2202	TARATA	\N	22	t
186	2203	JORGE BASADRE	\N	22	t
187	2204	CANDARAVE	\N	22	t
188	2301	TUMBES	\N	23	t
189	2302	CONTRALMIRANTE VILLAR	\N	23	t
190	2303	ZARUMILLA	\N	23	t
191	2401	CALLAO	\N	24	t
192	2501	CORONEL PORTILLO	\N	25	t
193	2502	PADRE ABAD	\N	25	t
194	2503	ATALAYA	\N	25	t
195	2504	PURUS	\N	25	t
\.


--
-- Data for Name: t33_regimenLaboral; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t33_regimenLaboral" (id, codigo, nombre, abreviatura, "sectorPub", "sectorPriv", "sectorOtro", activo) FROM stdin;
1	01	PRIVADO GENERAL -DECRETO LEGISLATIVO N.° 728	D LEG N.° 728	t	t	t	t
2	02	PÚBLICO GENERAL - DECRETO LEGISLATIVO N.° 276	D.LEG N.° 276	f	t	t	t
3	03	PROFESORADO - LEY N.° 24029	PROFESORADO LEY 24029	f	t	t	t
4	04	MAGISTERIO - LEY N.° 29062	MAGISTERIO  LEY 29062	f	t	t	t
5	05	DOCENTES UNIVERSITARIOS - LEY N.° 23733	DOC UNIVERS LEY 23733	f	t	t	t
6	06	PROFESIONALES DE LA SALUD LEY N.° 23536	PROFES SALUD LEY 23536	f	t	t	t
7	07	TECNICOS Y AUXILIARES ASIST. DE LA SALUD - LEY N.° 28561	TECN Y AUX ASIST SALUD LEY 28561	f	t	t	t
8	08	SERUM - LEY N.° 23330	SERUM LEY 23330	f	t	t	t
9	09	JUECES - CARRERA JUDICIAL - LEY N.° 29277	JUECES LEY 29277	f	t	f	t
10	10	FISCALES - D. LEG.  N.° 052	FISCALES D.LEG 052	f	t	f	t
11	11	SERVICIO DIPLOMÁTICO DE LA REPÚBLICA - LEY N.° 28091	SERVICIO DIPLOM. REPÚBLICA LEY 28091	f	t	t	t
12	12	MILITARES	MILITARES	f	t	f	t
13	13	POLICIA NACIONAL DEL PERÚ - LEY N.° 27238	POLICIAS LEY 27238	f	t	f	t
14	14	ESPECIAL GER. PÚBLICOS DECRETO LEGISLATIVO N.° 1024 (2)	ESPECIAL GER. PÚBL D LEG 1024	f	t	t	t
15	15	CONTRATO ADMINISTRATIVO DE SERVICIOS - D.LEG. N.° 1057	CAS D.LEG 1057	f	t	t	t
16	16	MICROEMPRESA D. LEG. 1086 (1)	MICROEMPRESA	t	f	f	t
17	17	PEQUEÑA EMPRESA D. LEG. 1086 (1)	PEQUEÑA EMPRESA	t	f	f	t
18	18	AGRARIO LEY 27360	AGRARIO	t	t	t	t
19	19	EXPORTACION NO TRADICIONAL D. LEY 22342	EXPORTACION NO TRADICIONAL	t	t	t	t
20	20	MINEROS	MINEROS	t	t	t	t
21	21	CONSTRUCCION CIVIL	CONSTRUCCION CIVIL	t	t	t	t
22	22	PÚBLICO GENERAL SERVICIO CIVIL - LEY 30057	SERVICIO CIVIL - LEY 30057	f	t	t	t
23	23	MAGISTERIO - LEY 29944	\N	f	t	t	t
24	24	POLICÍA NACIONAL DEL PERÚ - D.LEG.1149	\N	f	t	t	t
25	25	SERVIDORES PENITENCIARIOS - LEY 29709	\N	f	t	t	t
26	99	OTROS NO PREVISTOS	OTROS	t	t	t	t
\.


--
-- Data for Name: t34_modalidadesForm; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t34_modalidadesForm" (id, codigo, nombre, abreviatura, activo) FROM stdin;
1	1	EDUCACION BASICA REGULAR	EBR	t
2	2	EDUCACION BASICA ALTERNATIVA	EBA	t
3	3	EDUCACION BASICA ESPECIAL	EBE	t
4	4	EDUCACION SUPERIOR	ESU	t
\.


--
-- Data for Name: t34_nivelesCiclo; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t34_nivelesCiclo" (id, codigo, nombre, abreviatura, activo) FROM stdin;
1	1	INICIAL	INICIAL	t
2	2	PRIMARIA	PRIMARIA	t
3	3	SECUNDARIA	SECUNDARIA	t
4	4	SUPERIOR	SUPERIOR	t
\.


--
-- Data for Name: t34_regimenEduc; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t34_regimenEduc" (id, codigo, nombre, abreviatura, activo) FROM stdin;
1	1	PUBLICA DE GESTION DIRECTA	PUB-GDIR	t
2	2	PUBLICA DE GESTION PRIVADA	PUB-GPRIV	t
3	3	PRIVADA	PRIV	t
\.


--
-- Data for Name: t34_tipoInstEduc; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t34_tipoInstEduc" (id, codigo, nombre, abreviatura, activo) FROM stdin;
1	1	UNIDOCENTE	UNIDOCENTE	t
2	2	MULTIGRADO	MULTIGRADO	t
\.


--
-- Data for Name: t3_tipoDocIdentidad; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t3_tipoDocIdentidad" (id, codigo, nombre, abreviatura, activo) FROM stdin;
1	01	DOCUMENTO NACIONAL DE IDENTIDAD	DNI	t
2	04	CARNÉ DE EXTRANJERÍA	CARNÉ EXT.	t
3	06	REG. ÚNICO DE CONTRIBUYENTES (1)	RUC	t
4	07	PASAPORTE	PASAPORTE	t
5	09	CARNÉ DE SOLICIT DE REFUGIO	CARNÉ SOLIC REFUGIO	t
6	11	PARTIDA DE NACIMIENTO (2)	PART. NAC.	t
7	22	CARNÉ DE IDENTIDAD - RELACIONES EXTERIORES	C.IDENT.-RREE	t
8	23	PERM.TEMP.PERMANENCIA	PTP	t
9	24	DOC. DE IDENTIDAD EXTRANJERO (3)	DOC.ID.EXTR.	t
10	26	CARNÉ DE PERMISO TEMP DE PERMANENCIA	CPP	t
\.


--
-- Data for Name: t6_tiposZona; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t6_tiposZona" (id, codigo, nombre, abreviatura, activo) FROM stdin;
10	10	CAS. CASERÍO	CAS.	t
11	11	FND. FUNDO	FND.	t
12	99	OTROS	OTROS	t
1	01	URB. URBANIZACIÓN	URB.	t
2	02	P.J. PUEBLO JOVEN	P.J.	t
3	03	U.V. UNIDAD VECINAL	U.V.	t
4	04	C.H. CONJUNTO HABITACIONAL	C.H.	t
5	05	A.H. ASENTAMIENTO HUMANO	A.H.	t
6	06	COO. COOPERATIVA	COO.	t
7	07	RES. RESIDENCIAL	RES.	t
8	08	Z.I. ZONA INDUSTRIAL	Z.I.	t
9	09	GRU. GRUPO	GRU.	t
\.


--
-- Data for Name: t8_tipoTrabajador; Type: TABLE DATA; Schema: param; Owner: -
--

COPY param."t8_tipoTrabajador" (id, codigo, nombre, abreviatura, "sectorPub", "sectorPriv", "sectorOtro", activo) FROM stdin;
28	84	SERVIDOR PÚBLICO - DIRECTIVO  SUPERIOR	SERVIDOR PÚB - DIRECT SUPERIOR	f	t	t	t
29	85	SERVIDOR PÚBLICO - EJECUTIVO	SERVIDOR PÚB - EJECUTIVO	f	t	t	t
30	86	SERVIDOR PÚBLICO - ESPECIALISTA	SERVIDOR PÚB - ESPECIALISTA	f	t	t	t
31	87	SERVIDOR PÚBLICO - DE APOYO	SERVIDOR PÚB - DE APOYO	f	t	t	t
32	88	PERSONAL DE LA ADMIN. PÚBLICA - ASIGNACIÓN ESPECIAL - D.U. 126-2001	PERS ADM PÚB - ASIG ESP DU 126-2001	f	t	f	t
33	89	PERSONAL DE LAS FUERZAS ARMADAS Y POLICIALES (1)	PERS DE LAS FFAA Y POLICIALES	f	t	f	t
34	90	GERENTES PÚBLICOS  - D. LEG. 1024	GERENTES PÚB.  - D.LEG 1024	f	t	t	t
35	91	MIIEMBROS DE OTROS REG. ESPECIALES DEL SECTOR PÚBLICO	MIIEMBROS DE OTROS REG. ESPEC S.PUBLICO	f	t	t	t
36	92	FUNCIONARIO PUBLICO - LEY 30057	FUNCIONARIO PÚBLICO - LEY 30057	f	t	t	t
37	93	DIRECTIVO PÚBLICO - LEY 30057	DIRECTIVO PÚBLICO - LEY 30057	f	t	t	t
38	94	SERVIDOR CIVIL DE CARRERA - LEY 30057	SERVIDOR CIVIL DE CARRERA - LEY 30057	f	t	t	t
39	95	SERVIDOR DE ACTIVIDADES COMPLEMENTARIAS - LEY 30057	SERVIDOR DE ACT. COMPLEM. - LEY 30057	f	t	t	t
40	96	MAGISTERIO - LEY 29944	MAGISTERIO - LEY 29944	f	t	t	t
41	98	PERSONA QUE GENERA INGRESOS DE CUARTA - QUINTA CATEGORÍA	CUARTA - QUINTA CATEGORÍA	t	t	t	t
1	19	EJECUTIVO	EJECUTIVO	t	f	t	t
2	20	OBRERO	OBRERO	t	t	t	t
3	21	EMPLEADO	EMPLEADO	t	f	t	t
4	22	TRABAJADOR PORTUARIO - LEY 27866	TRAB.PORTUARIO	t	f	t	t
5	23	PRACTICANTE SENATI - DEC. LEY 20151	PRACT. SENATI	t	f	t	t
6	24	PENSIONISTA O CESANTE	PENSIONISTA O CESANTE	t	t	t	t
7	25	BENEFICIARIO DE TRANSF DIRECTA EX PESCADPRES	BENEFICIARIO DE TDEP	f	t	f	t
8	26	PENSIONISTA - LEY 28320	PENSIONISTA - LEY 28320	t	f	t	t
9	27	CONSTRUCCIÓN CIVIL	CONSTRUCCIÓN CIVIL	t	t	t	t
10	28	PILOTO Y COPILOTO DE AVIACIÓN COMERCIAL	PILOTO Y COPIL DE AVIA. COM.	t	f	t	t
11	29	MARÍTIMO, FLUVIAL O LACUSTRE	MARÍT, FLUVIAL O LACUSTRE	t	f	t	t
12	30	PERIODISTA	PERIODISTA	t	f	t	t
13	31	TRABAJADOR DE LA INDUSTRIA DE CUERO	TRAB. DE LA IND. DE CUERO	t	f	t	t
14	32	MINERO DE MINA DE SOCAVÓN	MINERO DE SOCAVÓN	t	f	t	t
15	36	TRABAJADOR PESQUERO 	TRABAJADOR PESQUERO	t	f	t	t
16	37	MINERO DE TAJO ABIERTO	MINERO DE TAJO ABIERTO	t	f	t	t
17	38	MINERO DE INDUSTRIA MINERA METALÚRGICA Y/O SIDERÚRGICA	MINERO IND. MINERA METAL. Y/O SIDERUR	t	f	t	t
18	39	TRABAJADOR PESQUERO – LEY 30003	TRAB. PESQUEROS – LEY 28320	t	f	t	t
19	56	ARTISTA -  LEY 28131	ARTISTA -  LEY 28131	t	f	t	t
20	64	AGRARIO DEPENDIENTE - LEY 27360	AGRARIO DEPEND.- LEY 27360	t	t	t	t
21	65	TRABAJADOR ACTIVIDAD ACUÍCOLA - LEY 27460	TRAB. ACTIV.ACUÍCOLA LEY 27460	t	t	t	t
22	66	PESCADOR Y PROCESADOR ARTESANAL INDEPENDIENTE  - LEY 27177 	PESC.Y PROC.ARTES.INDEP.	t	f	f	t
23	67	REGIMEN  ESPECIAL D. LEG.1057 - CAS	REG. ESPECIAL D. LEG.1057 - CAS	f	t	t	t
24	71	CONDUCTOR DE MICROEMPRESA REMYPE - D.LEG.1086	CONDUCT MICROEMP.REMYPE D.L.1086	t	f	f	t
25	73	SOCIO DE COOPERATIVA AGRARIA – LEY N.° 29972	SOCIO COOPER. AGRAR. – LEY N.° 29972	t	f	f	t
26	82	FUNCIONARIO PÚBLICO	FUNCIONARIO PÚBLICO	f	t	t	t
27	83	EMPLEADO DE CONFIANZA	EMPLEADO DE CONFIANZA	f	t	t	t
\.


--
-- Name: t00_documentos_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param.t00_documentos_id_seq', 161, true);


--
-- Name: t00_estadosAsis_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t00_estadosAsis_id_seq"', 4, true);


--
-- Name: t00_estadosTram_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t00_estadosTram_id_seq"', 49, true);


--
-- Name: t00_feriados_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param.t00_feriados_id_seq', 16, true);


--
-- Name: t00_motivosSuspLab_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t00_motivosSuspLab_id_seq"', 26, true);


--
-- Name: t00_operadores_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param.t00_operadores_id_seq', 4, true);


--
-- Name: t00_rolTrabajador_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t00_rolTrabajador_id_seq"', 4, true);


--
-- Name: t00_sexos_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param.t00_sexos_id_seq', 2, true);


--
-- Name: t00_tipoEntidad_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t00_tipoEntidad_id_seq"', 3, true);


--
-- Name: t00_turnos_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param.t00_turnos_id_seq', 3, true);


--
-- Name: t12_tipoContrato_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t12_tipoContrato_id_seq"', 26, true);


--
-- Name: t15_situacionLaboral_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t15_situacionLaboral_id_seq"', 4, true);


--
-- Name: t17_motivoDeBajas_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t17_motivoDeBajas_id_seq"', 21, true);


--
-- Name: t21_tipoSuspensionLaboral_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t21_tipoSuspensionLaboral_id_seq"', 28, true);


--
-- Name: t26_pais_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param.t26_pais_id_seq', 273, true);


--
-- Name: t28_departamento_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param.t28_departamento_id_seq', 25, true);


--
-- Name: t28_distritos_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param.t28_distritos_id_seq', 1834, true);


--
-- Name: t28_provincias_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param.t28_provincias_id_seq', 195, true);


--
-- Name: t33_regimenLaboral_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t33_regimenLaboral_id_seq"', 26, true);


--
-- Name: t34_modalidadesForm_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t34_modalidadesForm_id_seq"', 4, true);


--
-- Name: t34_nivelesCiclo_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t34_nivelesCiclo_id_seq"', 4, true);


--
-- Name: t34_regimenEduc_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t34_regimenEduc_id_seq"', 3, true);


--
-- Name: t34_tipoInstEduc_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t34_tipoInstEduc_id_seq"', 2, true);


--
-- Name: t3_tipoDocIdentidad_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t3_tipoDocIdentidad_id_seq"', 10, true);


--
-- Name: t6_tiposZona_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t6_tiposZona_id_seq"', 12, true);


--
-- Name: t8_tipoTrabajador_id_seq; Type: SEQUENCE SET; Schema: param; Owner: -
--

SELECT pg_catalog.setval('param."t8_tipoTrabajador_id_seq"', 41, true);


--
-- Name: t00_documentos t00_documentos_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t00_documentos
    ADD CONSTRAINT t00_documentos_pkey PRIMARY KEY (id);


--
-- Name: t00_estadosAsis t00_estadosAsis_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t00_estadosAsis"
    ADD CONSTRAINT "t00_estadosAsis_pkey" PRIMARY KEY (id);


--
-- Name: t00_estadosTram t00_estadosTram_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t00_estadosTram"
    ADD CONSTRAINT "t00_estadosTram_pkey" PRIMARY KEY (id);


--
-- Name: t00_feriados t00_feriados_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t00_feriados
    ADD CONSTRAINT t00_feriados_pkey PRIMARY KEY (id);


--
-- Name: t00_motivosSuspLab t00_motivosSuspLab_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t00_motivosSuspLab"
    ADD CONSTRAINT "t00_motivosSuspLab_pkey" PRIMARY KEY (id);


--
-- Name: t00_operadores t00_operadores_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t00_operadores
    ADD CONSTRAINT t00_operadores_pkey PRIMARY KEY (id);


--
-- Name: t00_rolTrabajador t00_rolTrabajador_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t00_rolTrabajador"
    ADD CONSTRAINT "t00_rolTrabajador_pkey" PRIMARY KEY (id);


--
-- Name: t00_sexos t00_sexos_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t00_sexos
    ADD CONSTRAINT t00_sexos_pkey PRIMARY KEY (id);


--
-- Name: t00_tipoEntidad t00_tipoEntidad_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t00_tipoEntidad"
    ADD CONSTRAINT "t00_tipoEntidad_pkey" PRIMARY KEY (id);


--
-- Name: t00_turnos t00_turnos_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t00_turnos
    ADD CONSTRAINT t00_turnos_pkey PRIMARY KEY (id);


--
-- Name: t12_tipoContrato t12_tipoContrato_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t12_tipoContrato"
    ADD CONSTRAINT "t12_tipoContrato_pkey" PRIMARY KEY (id);


--
-- Name: t15_situacionLaboral t15_situacionLaboral_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t15_situacionLaboral"
    ADD CONSTRAINT "t15_situacionLaboral_pkey" PRIMARY KEY (id);


--
-- Name: t17_motivoDeBajas t17_motivoDeBajas_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t17_motivoDeBajas"
    ADD CONSTRAINT "t17_motivoDeBajas_pkey" PRIMARY KEY (id);


--
-- Name: t21_tipoSuspensionLaboral t21_tipoSuspensionLaboral_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t21_tipoSuspensionLaboral"
    ADD CONSTRAINT "t21_tipoSuspensionLaboral_pkey" PRIMARY KEY (id);


--
-- Name: t26_pais t26_pais_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t26_pais
    ADD CONSTRAINT t26_pais_pkey PRIMARY KEY (id);


--
-- Name: t28_departamento t28_departamento_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t28_departamento
    ADD CONSTRAINT t28_departamento_pkey PRIMARY KEY (id);


--
-- Name: t28_distritos t28_distritos_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t28_distritos
    ADD CONSTRAINT t28_distritos_pkey PRIMARY KEY (id);


--
-- Name: t28_provincias t28_provincias_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t28_provincias
    ADD CONSTRAINT t28_provincias_pkey PRIMARY KEY (id);


--
-- Name: t33_regimenLaboral t33_regimenLaboral_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t33_regimenLaboral"
    ADD CONSTRAINT "t33_regimenLaboral_pkey" PRIMARY KEY (id);


--
-- Name: t34_modalidadesForm t34_modalidadesForm_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t34_modalidadesForm"
    ADD CONSTRAINT "t34_modalidadesForm_pkey" PRIMARY KEY (id);


--
-- Name: t34_nivelesCiclo t34_nivelesCiclo_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t34_nivelesCiclo"
    ADD CONSTRAINT "t34_nivelesCiclo_pkey" PRIMARY KEY (id);


--
-- Name: t34_regimenEduc t34_regimenEduc_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t34_regimenEduc"
    ADD CONSTRAINT "t34_regimenEduc_pkey" PRIMARY KEY (id);


--
-- Name: t34_tipoInstEduc t34_tipoInstEduc_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t34_tipoInstEduc"
    ADD CONSTRAINT "t34_tipoInstEduc_pkey" PRIMARY KEY (id);


--
-- Name: t3_tipoDocIdentidad t3_tipoDocIdentidad_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t3_tipoDocIdentidad"
    ADD CONSTRAINT "t3_tipoDocIdentidad_pkey" PRIMARY KEY (id);


--
-- Name: t6_tiposZona t6_tiposZona_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t6_tiposZona"
    ADD CONSTRAINT "t6_tiposZona_pkey" PRIMARY KEY (id);


--
-- Name: t8_tipoTrabajador t8_tipoTrabajador_pkey; Type: CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t8_tipoTrabajador"
    ADD CONSTRAINT "t8_tipoTrabajador_pkey" PRIMARY KEY (id);


--
-- Name: t00_motivosSuspLab fk_t00_motivosSuspLab_t21_tipoSuspensionLaboral_1; Type: FK CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param."t00_motivosSuspLab"
    ADD CONSTRAINT "fk_t00_motivosSuspLab_t21_tipoSuspensionLaboral_1" FOREIGN KEY ("tipoSuspensionLaboral_id") REFERENCES param."t21_tipoSuspensionLaboral"(id);


--
-- Name: t28_departamento fk_t28_departamento_t26_pais_1; Type: FK CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t28_departamento
    ADD CONSTRAINT fk_t28_departamento_t26_pais_1 FOREIGN KEY (pais_id) REFERENCES param.t26_pais(id);


--
-- Name: t28_distritos fk_t28_distritos_t28_provincias_1; Type: FK CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t28_distritos
    ADD CONSTRAINT fk_t28_distritos_t28_provincias_1 FOREIGN KEY (provincia_id) REFERENCES param.t28_provincias(id);


--
-- Name: t28_provincias fk_t28_provincias_t28_departamento_1; Type: FK CONSTRAINT; Schema: param; Owner: -
--

ALTER TABLE ONLY param.t28_provincias
    ADD CONSTRAINT fk_t28_provincias_t28_departamento_1 FOREIGN KEY (departamento_id) REFERENCES param.t28_departamento(id);


--
-- PostgreSQL database dump complete
--

\unrestrict ke9CrRiJaSSXm28BeEV0C3OynsE2hSKXyNBK2mQTgxCPzkNDUm09WzIGDJSQrfw

