--
-- PostgreSQL database dump
--

\restrict JF0qlnB06zspQ5amQmNuXJNu5mr57mlm9gefiyZLrjZ87bGhnIAnPIZMqwBfYWe

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: t_altasTrabajadores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."t_altasTrabajadores" (
    id bigint NOT NULL,
    "codigoAirsp" character varying(20),
    trabajador_id bigint NOT NULL,
    "fechaInicio" date NOT NULL,
    "fechaFin" date,
    "fechaAlta" date NOT NULL,
    "condicionLaboral_id" smallint NOT NULL,
    "tipoContrato_id" smallint NOT NULL,
    "institucionEducativa_id" bigint NOT NULL,
    "rolTrabajador_id" smallint,
    area_id smallint NOT NULL,
    cargo_id integer NOT NULL,
    "situacionLaboral_id" smallint NOT NULL,
    observacion character varying(200),
    "fechaBaja" date,
    "motivoBaja_id" smallint,
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_altasTrabajadores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."t_altasTrabajadores_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_altasTrabajadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."t_altasTrabajadores_id_seq" OWNED BY public."t_altasTrabajadores".id;


--
-- Name: t_areas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_areas (
    id smallint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    sigla character varying(20),
    descripcion character varying(100),
    "rolTrabajador_id" smallint,
    activo boolean
);


--
-- Name: t_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


--
-- Name: t_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.t_areas_id_seq OWNED BY public.t_areas.id;


--
-- Name: t_cargos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_cargos (
    id integer NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    abreviatura character varying(100),
    "rolTrabajador_id" smallint,
    created_at timestamp(6) without time zone,
    created_by bigint,
    activo boolean
);


--
-- Name: t_cargos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_cargos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


--
-- Name: t_cargos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.t_cargos_id_seq OWNED BY public.t_cargos.id;


--
-- Name: t_condicionesLaborales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."t_condicionesLaborales" (
    id integer NOT NULL,
    codigo character varying(20),
    "regimenLaboral_id" smallint NOT NULL,
    "tipoTrabajador_id" smallint NOT NULL,
    nombre character varying(100),
    abreviatura character varying(100),
    descripcion character varying(200),
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_condicionesLaborales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."t_condicionesLaborales_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


--
-- Name: t_condicionesLaborales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."t_condicionesLaborales_id_seq" OWNED BY public."t_condicionesLaborales".id;


--
-- Name: t_cursosIE; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."t_cursosIE" (
    id bigint NOT NULL,
    "institucionEduc_id" bigint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    sigla character varying(50),
    created_at timestamp(6) without time zone,
    created_by bigint,
    activo boolean
);


--
-- Name: t_cursosIE_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."t_cursosIE_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_cursosIE_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."t_cursosIE_id_seq" OWNED BY public."t_cursosIE".id;


--
-- Name: t_domicilios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_domicilios (
    id bigint NOT NULL,
    persona_id bigint,
    entidad_id bigint,
    "institucionEduc_id" bigint,
    domicilio character varying(200),
    zona_id bigint,
    ubigeo character varying(20),
    "fechaInicio" date,
    "fechaFin" date,
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_domicilios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_domicilios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_domicilios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.t_domicilios_id_seq OWNED BY public.t_domicilios.id;


--
-- Name: t_emails; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_emails (
    id bigint NOT NULL,
    persona_id bigint NOT NULL,
    entidad_id bigint,
    "institucionEduc_id" bigint,
    email character varying(200),
    "personalInst" character varying(1),
    "fechaInicio" date,
    "fechaFin" date,
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.t_emails_id_seq OWNED BY public.t_emails.id;


--
-- Name: t_entidades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_entidades (
    id bigint NOT NULL,
    "tipoEntidad_id" smallint,
    ruc character varying(20),
    "razonSocial" character varying(200),
    "razonComercial" character varying(200),
    "personaRepLegal_id" bigint,
    created_at timestamp(6) without time zone,
    created_by bigint,
    activo boolean
);


--
-- Name: t_entidades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_entidades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_entidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.t_entidades_id_seq OWNED BY public.t_entidades.id;


--
-- Name: t_gradosIE; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."t_gradosIE" (
    id bigint NOT NULL,
    "institucionEduc_id" bigint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    sigla character varying(50),
    created_at timestamp(6) without time zone,
    created_by bigint,
    activo boolean
);


--
-- Name: t_gradosIE_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."t_gradosIE_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_gradosIE_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."t_gradosIE_id_seq" OWNED BY public."t_gradosIE".id;


--
-- Name: t_historialCambios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."t_historialCambios" (
    id bigint NOT NULL,
    esquema character varying(20),
    tabla character varying(50),
    registro_id bigint,
    accion character varying(20),
    dato_old character varying(300),
    dato_new character varying(300),
    accion_at timestamp(6) without time zone,
    accion_by bigint
);


--
-- Name: t_historialCambios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."t_historialCambios_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_historialCambios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."t_historialCambios_id_seq" OWNED BY public."t_historialCambios".id;


--
-- Name: t_institucionesEduc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."t_institucionesEduc" (
    id bigint NOT NULL,
    "entidadUgel_id" bigint,
    "entidadAdmin_id" bigint,
    "codigoInstitucion" character varying(30),
    "codigoModular" character varying(30),
    "nombreLegal" character varying(200),
    "regimenEduc_id" smallint,
    "tipoInstEduc_id" smallint,
    "modalidadFormativa_id" smallint NOT NULL,
    "nivelCiclo_id" smallint NOT NULL,
    "fechaInicio" date,
    "fechaFin" date,
    created_at timestamp(6) without time zone,
    created_by smallint
);


--
-- Name: t_institucionesEduc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."t_institucionesEduc_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_institucionesEduc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."t_institucionesEduc_id_seq" OWNED BY public."t_institucionesEduc".id;


--
-- Name: t_personas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_personas (
    id bigint NOT NULL,
    pais_id smallint NOT NULL,
    "tipoDocIdentidad_id" smallint NOT NULL,
    "docIdentidad" character varying(20),
    paterno character varying(100) NOT NULL,
    materno character varying(100) NOT NULL,
    nombre character varying(150),
    sexo_id smallint NOT NULL,
    "fechaNac" date,
    ubigeo character varying(20),
    foto character varying(200),
    created_at timestamp(6) without time zone,
    created_by bigint,
    activo boolean
);


--
-- Name: t_personas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_personas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.t_personas_id_seq OWNED BY public.t_personas.id;


--
-- Name: t_seccionesIE; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."t_seccionesIE" (
    id bigint NOT NULL,
    grado_id bigint NOT NULL,
    codigo character varying(20),
    nombre character varying(100),
    sigla character varying(50),
    created_at timestamp(6) without time zone,
    created_by bigint,
    activo boolean
);


--
-- Name: t_seccionesIE_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."t_seccionesIE_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_seccionesIE_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."t_seccionesIE_id_seq" OWNED BY public."t_seccionesIE".id;


--
-- Name: t_telefonos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_telefonos (
    id bigint NOT NULL,
    persona_id bigint,
    entidad_id bigint,
    "institucionEduc_id" bigint,
    operador_id smallint NOT NULL,
    "movilFijo" character varying(1),
    "codigoPais" character varying(10),
    numero character varying(30),
    imei character varying(50),
    "fechaInicio" date,
    "fechaFin" date,
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_telefonos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_telefonos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_telefonos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.t_telefonos_id_seq OWNED BY public.t_telefonos.id;


--
-- Name: t_trabajador; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_trabajador (
    id bigint NOT NULL,
    codigo character varying(30),
    persona_id bigint,
    created_at timestamp(6) without time zone,
    created_by bigint,
    activo boolean
);


--
-- Name: t_trabajador_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_trabajador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_trabajador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.t_trabajador_id_seq OWNED BY public.t_trabajador.id;


--
-- Name: t_zonas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_zonas (
    id bigint NOT NULL,
    "tipoZona_id" smallint NOT NULL,
    distrito_id smallint,
    nombre character varying(100),
    abreviatura character varying(50),
    created_at timestamp(6) without time zone,
    created_by bigint,
    activo boolean
);


--
-- Name: t_zonas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_zonas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_zonas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.t_zonas_id_seq OWNED BY public.t_zonas.id;


--
-- Name: t_altasTrabajadores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_altasTrabajadores" ALTER COLUMN id SET DEFAULT nextval('public."t_altasTrabajadores_id_seq"'::regclass);


--
-- Name: t_areas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_areas ALTER COLUMN id SET DEFAULT nextval('public.t_areas_id_seq'::regclass);


--
-- Name: t_cargos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_cargos ALTER COLUMN id SET DEFAULT nextval('public.t_cargos_id_seq'::regclass);


--
-- Name: t_condicionesLaborales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_condicionesLaborales" ALTER COLUMN id SET DEFAULT nextval('public."t_condicionesLaborales_id_seq"'::regclass);


--
-- Name: t_cursosIE id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_cursosIE" ALTER COLUMN id SET DEFAULT nextval('public."t_cursosIE_id_seq"'::regclass);


--
-- Name: t_domicilios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_domicilios ALTER COLUMN id SET DEFAULT nextval('public.t_domicilios_id_seq'::regclass);


--
-- Name: t_emails id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_emails ALTER COLUMN id SET DEFAULT nextval('public.t_emails_id_seq'::regclass);


--
-- Name: t_entidades id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_entidades ALTER COLUMN id SET DEFAULT nextval('public.t_entidades_id_seq'::regclass);


--
-- Name: t_gradosIE id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_gradosIE" ALTER COLUMN id SET DEFAULT nextval('public."t_gradosIE_id_seq"'::regclass);


--
-- Name: t_historialCambios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_historialCambios" ALTER COLUMN id SET DEFAULT nextval('public."t_historialCambios_id_seq"'::regclass);


--
-- Name: t_institucionesEduc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_institucionesEduc" ALTER COLUMN id SET DEFAULT nextval('public."t_institucionesEduc_id_seq"'::regclass);


--
-- Name: t_personas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_personas ALTER COLUMN id SET DEFAULT nextval('public.t_personas_id_seq'::regclass);


--
-- Name: t_seccionesIE id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_seccionesIE" ALTER COLUMN id SET DEFAULT nextval('public."t_seccionesIE_id_seq"'::regclass);


--
-- Name: t_telefonos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_telefonos ALTER COLUMN id SET DEFAULT nextval('public.t_telefonos_id_seq'::regclass);


--
-- Name: t_trabajador id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_trabajador ALTER COLUMN id SET DEFAULT nextval('public.t_trabajador_id_seq'::regclass);


--
-- Name: t_zonas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_zonas ALTER COLUMN id SET DEFAULT nextval('public.t_zonas_id_seq'::regclass);


--
-- Data for Name: t_altasTrabajadores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."t_altasTrabajadores" (id, "codigoAirsp", trabajador_id, "fechaInicio", "fechaFin", "fechaAlta", "condicionLaboral_id", "tipoContrato_id", "institucionEducativa_id", "rolTrabajador_id", area_id, cargo_id, "situacionLaboral_id", observacion, "fechaBaja", "motivoBaja_id", created_at, created_by) FROM stdin;
1	2026	2	2026-06-01	2026-07-31	2026-06-01	1	14	1	3	1	1	2	\N	\N	\N	\N	1
2	20855	3	2026-06-01	\N	2026-06-01	1	1	1	2	1	2	2	\N	\N	\N	\N	1
3	333155	3	2026-01-01	2026-12-31	2026-01-01	2	11	1	2	1	1	2	\N	2026-12-31	\N	2026-05-05 00:00:00	1
4	333155	4	2026-01-01	2026-12-31	2026-01-01	3	7	1	3	2	3	2	\N	2026-12-31	\N	2026-05-05 00:00:00	1
5	451555	5	2026-01-01	\N	2026-01-01	1	24	1	2	1	4	2	\N	\N	\N	2026-05-05 00:00:00	1
7	\N	3	2026-01-01	\N	2026-01-01	1	1	1	2	1	1	2	\N	\N	\N	\N	1
8	123456	3	2026-07-01	2026-07-31	2026-07-12	1	14	2	2	1	2	2	\N	\N	\N	\N	1
\.


--
-- Data for Name: t_areas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.t_areas (id, codigo, nombre, sigla, descripcion, "rolTrabajador_id", activo) FROM stdin;
1	ARE00001	GENERAL	GN	ND	\N	t
2	2	DIRECCION DE LA I.E.	DIRECCION	\N	3	t
3	3	ADMINISTRACION	ADMINISTRACION	\N	1	t
\.


--
-- Data for Name: t_cargos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.t_cargos (id, codigo, nombre, abreviatura, "rolTrabajador_id", created_at, created_by, activo) FROM stdin;
1	CAR00001	DIRECTOR	DIR	3	\N	1	t
2	CAR00002	DOCENTE	DOC	2	\N	1	t
3	00003	DIRECTOR	\N	3	2026-05-05 00:00:00	1	t
4	00004	DOCENTE DE MATEMATICA	\N	2	2026-05-05 00:00:00	1	t
\.


--
-- Data for Name: t_condicionesLaborales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."t_condicionesLaborales" (id, codigo, "regimenLaboral_id", "tipoTrabajador_id", nombre, abreviatura, descripcion, created_at, created_by) FROM stdin;
1	CLA00001	18	20	ACTIVO	AC	ND	\N	1
3	239603	23	40	MAGISTERIO DL 29944 | DIRECTIVO	\N	\N	2026-05-05 00:00:00	1
4	239604	23	40	MAGISTERIO DL 29944 | ESPECIALISTA EN EDUCACION	\N	\N	2026-05-05 00:00:00	1
2	239602	23	40	MAGISTERIO DL 29944 | DOCENTE CONTRATADO	\N	\N	2026-05-05 00:00:00	1
5	239605	23	40	MAGISTERIO DL 29944 | ACT. DE INVESTIGACION	\N	\N	2026-05-05 00:00:00	1
\.


--
-- Data for Name: t_cursosIE; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."t_cursosIE" (id, "institucionEduc_id", codigo, nombre, sigla, created_at, created_by, activo) FROM stdin;
1	1	CUR00001	MATEMATICA	\N	\N	2	t
2	1	CUR00002	COMUNICACION	\N	\N	2	t
3	1	CUR00003	INGLES	\N	\N	2	t
6	1	IE00001M06	TUTORIA	TUTO	2026-05-05 00:00:00	1	t
5	1	IE00001M05	LITERATURA	LITE	2026-05-05 00:00:00	1	t
4	1	IE00001M04	FISICA	FISI	2026-05-05 00:00:00	1	t
7	2	CUR00004	MAT	MAT	\N	1	t
31	43	CUR00005	Matemática	MAT	\N	1	t
32	43	CUR00006	Comunicación	COM	\N	1	t
33	43	CUR00007	Ciencia y Tecnología	CYT	\N	1	t
34	43	CUR00008	Ciencias Sociales	CCSS	\N	1	t
35	43	CUR00009	Desarrollo Personal, Ciudadanía y Cívica	DPCC	\N	1	t
36	43	CUR00010	Educación para el Trabajo	EPT	\N	1	t
37	43	CUR00011	Educación Física	EDFI	\N	1	t
38	43	CUR00012	Arte y Cultura	ARTE	\N	1	t
39	43	CUR00013	Inglés	ING	\N	1	t
40	43	CUR00014	Educación Religiosa	REL	\N	1	t
\.


--
-- Data for Name: t_domicilios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.t_domicilios (id, persona_id, entidad_id, "institucionEduc_id", domicilio, zona_id, ubigeo, "fechaInicio", "fechaFin", created_at, created_by) FROM stdin;
1	\N	1	\N	JR. AMALIA PUGA N° 123	1	060101	2026-05-05	\N	2026-05-05 00:00:00	1
2	1	\N	\N	JR. REVILLA PEREZ N° 845	2	060101	2026-05-05	\N	2026-05-05 00:00:00	1
3	2	\N	\N	AV. HOYOS RUBIO	3	060101	2026-05-05	\N	2026-05-05 00:00:00	1
4	137	\N	\N	Jr. Cusco 456	6	\N	\N	\N	\N	120
\.


--
-- Data for Name: t_emails; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.t_emails (id, persona_id, entidad_id, "institucionEduc_id", email, "personalInst", "fechaInicio", "fechaFin", created_at, created_by) FROM stdin;
1	1	\N	\N	johan.rojas@gmail.com	P	2026-01-01	\N	2026-06-30 18:36:18	1
2	1	\N	\N	persona1@gmail.com	P	2026-05-05	\N	2026-05-05 00:00:00	1
3	2	\N	\N	persona2@gmail.com	P	2026-05-05	\N	2026-05-05 00:00:00	1
4	3	\N	\N	persona3@hotmail.com	P	2026-05-05	\N	2026-05-05 00:00:00	1
5	4	\N	\N	persona4@minedu.gob.pe	I	2026-05-05	\N	2026-05-05 00:00:00	1
6	11	\N	\N	jedidiah.hand@example.com	P	\N	\N	2026-07-13 16:22:53	\N
7	12	\N	\N	nienow.dagmar@example.net	P	\N	\N	2026-07-13 16:22:53	\N
8	13	\N	\N	cole.brionna@example.net	P	\N	\N	2026-07-13 16:22:53	\N
9	14	\N	\N	fredy87@example.org	P	\N	\N	2026-07-13 16:22:53	\N
10	15	\N	\N	fthompson@example.org	P	\N	\N	2026-07-13 16:22:53	\N
11	16	\N	\N	cordelia49@example.com	P	\N	\N	2026-07-13 16:22:53	\N
12	17	\N	\N	ledner.etha@example.net	P	\N	\N	2026-07-13 16:22:53	\N
13	18	\N	\N	lonie.kuhn@example.com	P	\N	\N	2026-07-13 16:22:53	\N
14	19	\N	\N	jconnelly@example.com	P	\N	\N	2026-07-13 16:22:53	\N
15	20	\N	\N	phuel@example.org	P	\N	\N	2026-07-13 16:22:53	\N
16	21	\N	\N	schaefer.antonia@example.org	P	\N	\N	2026-07-13 16:22:53	\N
17	22	\N	\N	bmurray@example.org	P	\N	\N	2026-07-13 16:22:53	\N
18	23	\N	\N	walsh.merle@example.net	P	\N	\N	2026-07-13 16:22:53	\N
19	24	\N	\N	carley78@example.net	P	\N	\N	2026-07-13 16:22:53	\N
20	25	\N	\N	lockman.lois@example.com	P	\N	\N	2026-07-13 16:22:53	\N
21	26	\N	\N	wuckert.tierra@example.com	P	\N	\N	2026-07-13 16:22:53	\N
22	27	\N	\N	gabbott@example.net	P	\N	\N	2026-07-13 16:22:53	\N
23	28	\N	\N	margarett64@example.net	P	\N	\N	2026-07-13 16:22:53	\N
24	29	\N	\N	goodwin.orie@example.net	P	\N	\N	2026-07-13 16:22:53	\N
25	30	\N	\N	lucile.moore@example.org	P	\N	\N	2026-07-13 16:22:53	\N
26	31	\N	\N	qblanda@example.org	P	\N	\N	2026-07-13 16:22:53	\N
27	32	\N	\N	mertz.rebekah@example.net	P	\N	\N	2026-07-13 16:22:53	\N
28	33	\N	\N	carolanne31@example.net	P	\N	\N	2026-07-13 16:22:53	\N
29	34	\N	\N	leffler.clementina@example.net	P	\N	\N	2026-07-13 16:22:53	\N
30	35	\N	\N	mateo.beahan@example.net	P	\N	\N	2026-07-13 16:22:53	\N
31	36	\N	\N	andreane.aufderhar@example.net	P	\N	\N	2026-07-13 16:22:53	\N
32	37	\N	\N	klubowitz@example.com	P	\N	\N	2026-07-13 16:22:53	\N
33	38	\N	\N	aadams@example.com	P	\N	\N	2026-07-13 16:22:54	\N
34	39	\N	\N	carmel47@example.org	P	\N	\N	2026-07-13 16:22:54	\N
35	40	\N	\N	goyette.ila@example.org	P	\N	\N	2026-07-13 16:22:54	\N
36	41	\N	\N	geffertz@example.net	P	\N	\N	2026-07-13 16:22:54	\N
37	42	\N	\N	mccullough.piper@example.net	P	\N	\N	2026-07-13 16:22:54	\N
46	51	\N	\N	callie.walker@example.com	P	\N	\N	2026-07-13 16:22:54	\N
47	52	\N	\N	herzog.amir@example.com	P	\N	\N	2026-07-13 16:22:54	\N
48	53	\N	\N	stephania.welch@example.org	P	\N	\N	2026-07-13 16:22:54	\N
49	54	\N	\N	gmiller@example.net	P	\N	\N	2026-07-13 16:22:54	\N
50	55	\N	\N	wisozk.mackenzie@example.net	P	\N	\N	2026-07-13 16:22:54	\N
51	56	\N	\N	hayley60@example.net	P	\N	\N	2026-07-13 16:22:54	\N
73	78	\N	\N	rhamill@example.org	P	\N	\N	2026-07-13 16:22:55	\N
74	79	\N	\N	connelly.brisa@example.org	P	\N	\N	2026-07-13 16:22:55	\N
75	80	\N	\N	pwest@example.com	P	\N	\N	2026-07-13 16:22:55	\N
76	81	\N	\N	mossie.price@example.net	P	\N	\N	2026-07-13 16:22:55	\N
77	82	\N	\N	stephanie.rosenbaum@example.org	P	\N	\N	2026-07-13 16:22:55	\N
78	83	\N	\N	eldred42@example.com	P	\N	\N	2026-07-13 16:22:55	\N
79	84	\N	\N	wreinger@example.com	P	\N	\N	2026-07-13 16:22:55	\N
80	85	\N	\N	judd.mitchell@example.com	P	\N	\N	2026-07-13 16:22:55	\N
81	86	\N	\N	bertha.mante@example.net	P	\N	\N	2026-07-13 16:22:55	\N
121	134	\N	\N	iheidenreich@example.org	P	\N	\N	2026-07-13 16:22:56	\N
122	136	\N	\N	raina.treutel@example.org	P	\N	\N	2026-07-13 16:22:56	\N
123	138	\N	\N	abby26@example.org	P	\N	\N	2026-07-13 16:22:56	\N
124	140	\N	\N	mohr.gilbert@example.net	P	\N	\N	2026-07-13 16:22:56	\N
125	141	\N	\N	delete@example.com	P	\N	\N	\N	122
126	142	\N	\N	vheathcote@example.net	P	\N	\N	2026-07-13 16:22:56	\N
127	143	\N	\N	bailee.bauch@example.net	P	\N	\N	2026-07-13 16:22:56	\N
128	144	\N	\N	murazik.tanner@example.org	P	\N	\N	2026-07-13 16:22:56	\N
129	146	\N	\N	boyer.edward@example.com	P	\N	\N	2026-07-13 16:22:56	\N
130	148	\N	\N	hyatt.gabriel@example.org	P	\N	\N	2026-07-13 16:22:56	\N
131	150	\N	\N	gmacejkovic@example.org	P	\N	\N	2026-07-13 16:22:56	\N
132	151	\N	\N	edison.rolfson@example.org	P	\N	\N	2026-07-13 16:22:56	\N
133	153	\N	\N	kayleigh81@example.org	P	\N	\N	2026-07-13 16:22:56	\N
134	154	\N	\N	astanton@example.com	P	\N	\N	2026-07-13 16:22:56	\N
135	155	\N	\N	thurman64@example.com	P	\N	\N	2026-07-13 16:22:56	\N
136	157	\N	\N	ndaugherty@example.org	P	\N	\N	2026-07-13 16:22:56	\N
137	158	\N	\N	kenya.heathcote@example.net	P	\N	\N	2026-07-13 16:22:56	\N
138	159	\N	\N	dina.satterfield@example.com	P	\N	\N	2026-07-13 16:22:56	\N
139	161	\N	\N	tracy.runolfsdottir@example.org	P	\N	\N	2026-07-13 16:22:56	\N
\.


--
-- Data for Name: t_entidades; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.t_entidades (id, "tipoEntidad_id", ruc, "razonSocial", "razonComercial", "personaRepLegal_id", created_at, created_by, activo) FROM stdin;
1	1	20453420520	UGEL CAJAMARCA	UGEL CAJAMARCA	\N	2026-06-30 18:36:18	1	t
2	1	20142584516	COLEGIO SAN FERNANDO	COLEGIO SAN FERNADO	1	2026-05-05 00:00:00	1	t
12	1	11175653468	Old Name SAC	\N	\N	\N	74	t
13	1	16692370194	To Delete SAC	\N	\N	\N	75	t
14	1	73445147083	EXISTING COMPANY S.A.C.	EXISTING	\N	\N	77	t
\.


--
-- Data for Name: t_gradosIE; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."t_gradosIE" (id, "institucionEduc_id", codigo, nombre, sigla, created_at, created_by, activo) FROM stdin;
1	1	GRA00001	PRIMERO	1	\N	2	t
2	1	GRA00002	SEGUNDO	2	\N	2	t
3	1	IE0000103	TERCER GRADO	3G	2026-05-05 00:00:00	1	t
4	1	IE0000104	CUARTO GRADO	4G	2026-05-05 00:00:00	1	t
5	1	IE0000105	QUINTO GRADO	5G	2026-05-05 00:00:00	1	t
6	2	IE0000201	PRIMER GRADO	1G	2026-05-05 00:00:00	1	t
7	2	IE0000202	SEGUNDO GRADO	2G	2026-05-05 00:00:00	1	t
8	2	IE0000203	TERCER GRADO	3G	2026-05-05 00:00:00	1	t
9	2	IE0000204	CUARTO GRADO	4G	2026-05-05 00:00:00	1	t
10	2	IE0000205	QUINTO GRADO	5G	2026-05-05 00:00:00	1	t
11	3	IE0000301	3 AÑITOS	3A	2026-05-05 00:00:00	1	t
12	3	IE0000302	4 AÑITOS	4A	2026-05-05 00:00:00	1	t
13	3	IE0000303	5 AÑITOS	5A	2026-05-05 00:00:00	1	t
14	4	IE0000401	PRIMER GRADO	1G	2026-05-05 00:00:00	1	t
15	4	IE0000402	SEGUNDO GRADO	2G	2026-05-05 00:00:00	1	t
16	4	IE0000403	TERCER GRADO	3G	2026-05-05 00:00:00	1	t
17	4	IE0000404	CUARTO GRADO	4G	2026-05-05 00:00:00	1	t
18	4	IE0000405	QUINTO GRADO	5G	2026-05-05 00:00:00	1	t
19	4	IE0000406	SEXTO GRADO	5G	2026-05-05 00:00:00	1	t
\.


--
-- Data for Name: t_historialCambios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."t_historialCambios" (id, esquema, tabla, registro_id, accion, dato_old, dato_new, accion_at, accion_by) FROM stdin;
\.


--
-- Data for Name: t_institucionesEduc; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."t_institucionesEduc" (id, "entidadUgel_id", "entidadAdmin_id", "codigoInstitucion", "codigoModular", "nombreLegal", "regimenEduc_id", "tipoInstEduc_id", "modalidadFormativa_id", "nivelCiclo_id", "fechaInicio", "fechaFin", created_at, created_by) FROM stdin;
1	1	1	1213	1213	GPCB	1	2	2	1	2026-06-29	\N	\N	1
2	1	1	IE00002	58821554	COLEGIO SANTA TERESITA	1	2	1	3	2026-01-01	\N	2026-05-05 00:00:00	1
4	1	1	IE00004	12313155	I.E. CARDUCI	1	2	1	3	2026-01-01	\N	2026-05-05 00:00:00	1
5	1	2	IE00005	24518745	COLEGIO SAN FERNANDO	3	2	1	3	2026-01-01	\N	2026-05-05 00:00:00	1
3	1	1	IE00003	36546256	I.E. 82023 INICIAL	1	1	1	1	2026-01-01	\N	2026-05-05 00:00:00	1
43	1	1	48654485	4654564	COLEGIO SANTA ROSA	1	2	1	3	2026-01-01	\N	\N	1
\.


--
-- Data for Name: t_personas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.t_personas (id, pais_id, "tipoDocIdentidad_id", "docIdentidad", paterno, materno, nombre, sexo_id, "fechaNac", ubigeo, foto, created_at, created_by, activo) FROM stdin;
2	193	1	76955032	ROJAS	SOLIS	KEYLA LISBETH	1	2005-02-14	\N	\N	\N	1	t
3	193	1	76955065	TORRES	MAMANI	BELGICA YOISE	2	2000-02-01	\N	\N	\N	1	t
1	193	1	76955033	ROJAS	SOLIS	JOHAN ALEXANDER	1	\N	\N	\N	2026-06-30 18:36:18	1	t
4	193	1	44444444	appaterno4	apmaterno4	nombre4	2	2008-01-01	\N	\N	2026-05-05 00:00:00	1	t
5	193	1	55555555	appaterno5	apmaterno5	nombre5	1	1995-01-01	\N	\N	2026-05-05 00:00:00	1	t
6	193	1	66666666	appaterno6	apmaterno6	nombre6	1	1998-01-01	\N	\N	2026-05-05 00:00:00	1	t
7	193	1	77777777	appaterno7	apmaterno7	nombre7	2	2001-01-01	\N	\N	2026-05-05 00:00:00	1	t
8	193	1	88888888	appaterno8	apmaterno8	nombre8	1	1999-01-01	\N	\N	2026-05-05 00:00:00	1	t
9	193	1	99999999	appaterno9	apmaterno9	nombre9	2	2005-01-01	\N	\N	2026-05-05 00:00:00	1	t
10	193	2	1010101099	appaterno10	apmaterno10	nombre10	1	2004-01-01	\N	\N	2026-05-05 00:00:00	1	t
11	7	1	38049740	Denesik	Zboncak	Jennie	1	\N	\N	\N	\N	\N	t
12	7	1	27418782	Feil	Nicolas	Baron	1	\N	\N	\N	\N	\N	t
13	7	1	80915841	Durgan	Shields	Alexzander	1	\N	\N	\N	\N	\N	t
14	7	1	85449243	Runte	Morissette	Magnolia	1	\N	\N	\N	\N	\N	t
15	7	1	66390721	Gerhold	Armstrong	Doyle	1	\N	\N	\N	\N	\N	t
16	7	1	54935425	Smitham	Luettgen	Katharina	1	\N	\N	\N	\N	\N	t
17	7	1	13131639	Ullrich	Tremblay	Lavinia	1	\N	\N	\N	\N	\N	t
18	7	1	24458438	Boyer	Wisozk	Oren	1	\N	\N	\N	\N	\N	t
19	7	1	62555362	Rice	Sawayn	Cleo	1	\N	\N	\N	\N	\N	t
20	7	1	03673254	Schmidt	Wiegand	Jody	1	\N	\N	\N	\N	\N	t
21	7	1	43171144	Hill	Zieme	Durward	1	\N	\N	\N	\N	\N	t
22	7	1	40890842	Leffler	Kulas	Woodrow	1	\N	\N	\N	\N	\N	t
23	7	1	79662117	Morar	Weber	Mohammad	1	\N	\N	\N	\N	\N	t
24	7	1	78271060	Dare	Murray	Dee	1	\N	\N	\N	\N	\N	t
25	7	1	15758100	Wehner	Mayer	Marlon	1	\N	\N	\N	\N	\N	t
26	7	1	24708715	Sawayn	Douglas	Layne	1	\N	\N	\N	\N	\N	t
27	7	1	60923710	Hand	Franecki	Lydia	1	\N	\N	\N	\N	\N	t
28	7	1	26326549	Roob	Pollich	Sydnie	1	\N	\N	\N	\N	\N	t
29	7	1	89930621	Zboncak	Langosh	Velda	1	\N	\N	\N	\N	\N	t
30	7	1	37997938	Weimann	Johnson	Derrick	1	\N	\N	\N	\N	\N	t
31	7	1	73987965	Nikolaus	Bergnaum	Dawn	1	\N	\N	\N	\N	\N	t
32	7	1	10731578	Gibson	Olson	Lauretta	1	\N	\N	\N	\N	\N	t
33	7	1	66604903	Franecki	Dicki	Mckenzie	1	\N	\N	\N	\N	\N	t
34	7	1	57366891	Jenkins	O'Connell	Cleora	1	\N	\N	\N	\N	\N	t
35	7	1	74399722	Stanton	Kuvalis	Belle	1	\N	\N	\N	\N	\N	t
36	7	1	58328713	Halvorson	Orn	Reese	1	\N	\N	\N	\N	\N	t
37	7	1	90982487	Grady	Muller	Malachi	1	\N	\N	\N	\N	\N	t
38	7	1	42290734	Stanton	Raynor	Alene	1	\N	\N	\N	\N	\N	t
39	7	1	95026784	Reinger	Orn	Concepcion	1	\N	\N	\N	\N	\N	t
40	7	1	69677548	Dietrich	Schaefer	Yolanda	1	\N	\N	\N	\N	\N	t
41	7	1	75408373	Mraz	Lueilwitz	Eudora	1	\N	\N	\N	\N	\N	t
42	7	1	75216459	Moen	Smith	Gertrude	1	\N	\N	\N	\N	\N	t
51	7	1	58036780	Fritsch	Lemke	Gerard	1	\N	\N	\N	\N	\N	t
52	7	1	95108538	Wisoky	Stanton	Ramiro	1	\N	\N	\N	\N	\N	t
53	7	1	77925242	Marquardt	Ritchie	Tamia	1	\N	\N	\N	\N	\N	t
54	7	1	66961525	Pagac	Erdman	Brittany	1	\N	\N	\N	\N	\N	t
55	7	1	05196065	Connelly	Walter	Elisha	1	\N	\N	\N	\N	\N	t
56	7	1	61328423	Shanahan	Streich	Lauren	1	\N	\N	\N	\N	\N	t
78	7	1	77972052	Hammes	Vandervort	Sophia	1	\N	\N	\N	\N	\N	t
79	7	1	78878227	Mante	Stokes	Caden	1	\N	\N	\N	\N	\N	t
80	7	1	18105549	Jones	Von	Tatum	1	\N	\N	\N	\N	\N	t
81	7	1	69886811	Powlowski	Marvin	Veronica	1	\N	\N	\N	\N	\N	t
82	7	1	11528294	Harber	Mayert	Violet	1	\N	\N	\N	\N	\N	t
83	7	1	69314970	Hoeger	Quigley	Philip	1	\N	\N	\N	\N	\N	t
84	7	1	35906336	Sanford	Franecki	Aletha	1	\N	\N	\N	\N	\N	t
85	7	1	64882428	Ruecker	Koepp	Brain	1	\N	\N	\N	\N	\N	t
86	7	1	04363647	Erdman	Quitzon	Lessie	1	\N	\N	\N	\N	\N	t
134	7	1	41353671	Dibbert	Kerluke	Hailey	1	\N	\N	\N	\N	\N	t
135	1	1	82882935	DOM	TEST	USER	1	\N	\N	\N	\N	119	t
136	7	1	75478646	Daniel	Schumm	Khalil	1	\N	\N	\N	\N	\N	t
137	1	1	34099944	DOM	DEL	TEST	1	\N	\N	\N	\N	120	t
138	7	1	26519866	Heathcote	Deckow	Alford	1	\N	\N	\N	\N	\N	t
139	1	1	27511610	EMAIL	TEST	USER	1	\N	\N	\N	\N	121	t
140	7	1	54757252	Daugherty	Wilderman	Josue	1	\N	\N	\N	\N	\N	t
141	1	1	42857487	EMAIL	DEL	TEST	1	\N	\N	\N	\N	122	t
142	7	1	54750272	Harvey	Roberts	Haleigh	1	\N	\N	\N	\N	\N	t
143	7	1	84175620	Miller	Jerde	Lora	1	\N	\N	\N	\N	\N	t
144	7	1	79987990	Rowe	Murazik	Selmer	1	\N	\N	\N	\N	\N	t
145	1	1	10375297	OLD	OLD	OLD	1	\N	\N	\N	\N	125	t
146	7	1	48183363	Corwin	Baumbach	Verna	1	\N	\N	\N	\N	\N	t
147	1	1	57559550	DELETE	TEST	ME	1	\N	\N	\N	\N	126	t
148	7	1	07860247	Jast	Cummings	Edwardo	1	\N	\N	\N	\N	\N	t
149	1	1	33483345	SHOW	TEST	DETAIL	1	\N	\N	\N	\N	127	t
150	7	1	25171255	Powlowski	Bernhard	Hailee	1	\N	\N	\N	\N	\N	t
151	7	1	72531441	Wisozk	Schimmel	Martin	1	\N	\N	\N	\N	\N	t
152	1	1	25306825	TO_CONVERT	TEST	JUAN	1	\N	\N	\N	\N	129	t
153	7	1	92923552	Gerhold	Carroll	Isadore	1	\N	\N	\N	\N	\N	t
154	7	1	50619360	Pfeffer	Vandervort	Dina	1	\N	\N	\N	\N	\N	t
155	7	1	14384990	Schaefer	Waelchi	Ilene	1	\N	\N	\N	\N	\N	t
156	1	1	51827913	EXISTING	TEST	PERSONA	1	\N	\N	\N	\N	132	t
157	7	1	29871545	Rice	Collier	Madaline	1	\N	\N	\N	\N	\N	t
158	7	1	42151063	Fay	Sipes	Vince	1	\N	\N	\N	\N	\N	t
159	7	1	89752014	Rutherford	Ledner	Brooklyn	1	\N	\N	\N	\N	\N	t
160	1	1	48999619	TEL	TEST	USER	1	\N	\N	\N	\N	135	t
161	7	1	27808429	Balistreri	Collier	Madeline	1	\N	\N	\N	\N	\N	t
162	1	1	26436835	TEL	DEL	TEST	1	\N	\N	\N	\N	136	t
\.


--
-- Data for Name: t_seccionesIE; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."t_seccionesIE" (id, grado_id, codigo, nombre, sigla, created_at, created_by, activo) FROM stdin;
1	1	SEC00001	A	\N	\N	2	t
2	1	SEC00002	B	\N	\N	2	t
3	1	SEC00003	C	\N	\N	2	t
4	2	SEC00004	A	\N	\N	2	t
5	2	SEC00005	B	\N	\N	2	t
6	3	IE000010301	SECCION A	3GA	2026-05-05 00:00:00	1	t
7	4	IE000010401	SECCION A	4GA	2026-05-05 00:00:00	1	t
8	5	IE000010501	SECCION A	5GA	2026-05-05 00:00:00	1	t
9	6	SEC00006	A	A	\N	1	t
\.


--
-- Data for Name: t_telefonos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.t_telefonos (id, persona_id, entidad_id, "institucionEduc_id", operador_id, "movilFijo", "codigoPais", numero, imei, "fechaInicio", "fechaFin", created_at, created_by) FROM stdin;
1	3	\N	\N	1	M	+51	9677771034	\N	2026-07-01	\N	\N	3
2	\N	\N	1	1	F	51	78445415	\N	2026-05-05	\N	2026-05-05 00:00:00	1
3	1	\N	\N	2	M	51	95494555	\N	2026-05-05	\N	2026-05-05 00:00:00	1
4	2	\N	\N	3	M	51	65499474	\N	2026-05-05	\N	2026-05-05 00:00:00	1
5	3	\N	\N	2	M	51	48845645	\N	2026-05-05	\N	2026-05-05 00:00:00	1
6	162	\N	\N	1	M	\N	111222333	\N	\N	\N	\N	136
\.


--
-- Data for Name: t_trabajador; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.t_trabajador (id, codigo, persona_id, created_at, created_by, activo) FROM stdin;
2	TRA76955034	2	\N	1	t
3	TRA76955035	3	\N	1	t
1	TRAB-76955033	1	2026-06-30 18:36:18	\N	t
4	0000004	4	2026-05-05 00:00:00	1	t
5	0000005	5	2026-05-05 00:00:00	1	t
6	0000006	6	2026-05-05 00:00:00	1	t
7	0000007	7	2026-05-05 00:00:00	1	t
8	0000008	8	2026-05-05 00:00:00	1	t
9	0000009	9	2026-05-05 00:00:00	1	t
10	0000010	10	2026-05-05 00:00:00	1	t
11	TRAB-84476	11	2026-07-13 16:22:53	\N	t
12	TRAB-38044	12	2026-07-13 16:22:53	\N	t
13	TRAB-05668	13	2026-07-13 16:22:53	\N	t
14	TRAB-16829	14	2026-07-13 16:22:53	\N	t
15	TRAB-87930	15	2026-07-13 16:22:53	\N	t
16	TRAB-46543	16	2026-07-13 16:22:53	\N	t
17	TRAB-03495	17	2026-07-13 16:22:53	\N	t
18	TRAB-63877	18	2026-07-13 16:22:53	\N	t
19	TRAB-73366	19	2026-07-13 16:22:53	\N	t
20	TRAB-58121	20	2026-07-13 16:22:53	\N	t
21	TRAB-66074	21	2026-07-13 16:22:53	\N	t
22	TRAB-80120	22	2026-07-13 16:22:53	\N	t
23	TRAB-46618	23	2026-07-13 16:22:53	\N	t
24	TRAB-33168	24	2026-07-13 16:22:53	\N	t
25	TRAB-82338	25	2026-07-13 16:22:53	\N	t
26	TRAB-39987	26	2026-07-13 16:22:53	\N	t
27	TRAB-34133	27	2026-07-13 16:22:53	\N	t
28	TRAB-61416	28	2026-07-13 16:22:53	\N	t
29	TRAB-67236	29	2026-07-13 16:22:53	\N	t
30	TRAB-23832	30	2026-07-13 16:22:53	\N	t
31	TRAB-24350	31	2026-07-13 16:22:53	\N	t
32	TRAB-21037	32	2026-07-13 16:22:53	\N	t
33	TRAB-59613	33	2026-07-13 16:22:53	\N	t
34	TRAB-32127	34	2026-07-13 16:22:53	\N	t
35	TRAB-78651	35	2026-07-13 16:22:53	\N	t
36	TRAB-27829	36	2026-07-13 16:22:53	\N	t
37	TRAB-25615	37	2026-07-13 16:22:53	\N	t
38	TRAB-04165	38	2026-07-13 16:22:54	\N	t
39	TRAB-81511	39	2026-07-13 16:22:54	\N	t
40	TRAB-96082	40	2026-07-13 16:22:54	\N	t
41	TRAB-83487	41	2026-07-13 16:22:54	\N	t
42	TRAB-45756	42	2026-07-13 16:22:54	\N	t
51	TRAB-23372	51	2026-07-13 16:22:54	\N	t
52	TRAB-37206	52	2026-07-13 16:22:54	\N	t
53	TRAB-45040	53	2026-07-13 16:22:54	\N	t
54	TRAB-91078	54	2026-07-13 16:22:54	\N	t
55	TRAB-69488	55	2026-07-13 16:22:54	\N	t
56	TRAB-87250	56	2026-07-13 16:22:54	\N	t
78	TRAB-95673	78	2026-07-13 16:22:55	\N	t
79	TRAB-94318	79	2026-07-13 16:22:55	\N	t
80	TRAB-38230	80	2026-07-13 16:22:55	\N	t
81	TRAB-74315	81	2026-07-13 16:22:55	\N	t
82	TRAB-42416	82	2026-07-13 16:22:55	\N	t
83	TRAB-35574	83	2026-07-13 16:22:55	\N	t
84	TRAB-61394	84	2026-07-13 16:22:55	\N	t
85	TRAB-72103	85	2026-07-13 16:22:55	\N	t
86	TRAB-76953	86	2026-07-13 16:22:55	\N	t
134	TRAB-10045	134	2026-07-13 16:22:56	\N	t
135	TRAB-50657	136	2026-07-13 16:22:56	\N	t
136	TRAB-76221	138	2026-07-13 16:22:56	\N	t
137	TRAB-63907	140	2026-07-13 16:22:56	\N	t
138	TRAB-33943	142	2026-07-13 16:22:56	\N	t
139	TRAB-42114	143	2026-07-13 16:22:56	\N	t
140	TRAB-12139	144	2026-07-13 16:22:56	\N	t
141	TRAB-97855	146	2026-07-13 16:22:56	\N	t
142	TRAB-19027	148	2026-07-13 16:22:56	\N	t
143	TRAB-96056	150	2026-07-13 16:22:56	\N	t
144	TRAB-76445	151	2026-07-13 16:22:56	\N	t
145	TRAB-23014	153	2026-07-13 16:22:56	\N	t
146	TRAB-02310	154	2026-07-13 16:22:56	\N	t
147	TRAB-86824	155	2026-07-13 16:22:56	\N	t
148	TRAB-13010	157	2026-07-13 16:22:56	\N	t
149	TRAB-48332	158	2026-07-13 16:22:56	\N	t
150	TRAB-37752	159	2026-07-13 16:22:56	\N	t
151	TRAB-72290	161	2026-07-13 16:22:56	\N	t
\.


--
-- Data for Name: t_zonas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.t_zonas (id, "tipoZona_id", distrito_id, nombre, abreviatura, created_at, created_by, activo) FROM stdin;
1	12	551	CAJAMARCA	\N	2026-05-05 00:00:00	1	t
2	1	551	MOLLEPAMPA	\N	2026-05-05 00:00:00	1	t
3	1	551	FONAVI II	\N	2026-05-05 00:00:00	1	t
6	1	1	Zona Test	\N	\N	1	t
\.


--
-- Name: t_altasTrabajadores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."t_altasTrabajadores_id_seq"', 31, true);


--
-- Name: t_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_areas_id_seq', 22, true);


--
-- Name: t_cargos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_cargos_id_seq', 16, true);


--
-- Name: t_condicionesLaborales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."t_condicionesLaborales_id_seq"', 15, true);


--
-- Name: t_cursosIE_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."t_cursosIE_id_seq"', 40, true);


--
-- Name: t_domicilios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_domicilios_id_seq', 4, true);


--
-- Name: t_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_emails_id_seq', 174, true);


--
-- Name: t_entidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_entidades_id_seq', 14, true);


--
-- Name: t_gradosIE_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."t_gradosIE_id_seq"', 32, true);


--
-- Name: t_historialCambios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."t_historialCambios_id_seq"', 1, false);


--
-- Name: t_institucionesEduc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."t_institucionesEduc_id_seq"', 43, true);


--
-- Name: t_personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_personas_id_seq', 221, true);


--
-- Name: t_seccionesIE_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."t_seccionesIE_id_seq"', 32, true);


--
-- Name: t_telefonos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_telefonos_id_seq', 6, true);


--
-- Name: t_trabajador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_trabajador_id_seq', 209, true);


--
-- Name: t_zonas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_zonas_id_seq', 6, true);


--
-- Name: t_altasTrabajadores t_altasTrabajadores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_altasTrabajadores"
    ADD CONSTRAINT "t_altasTrabajadores_pkey" PRIMARY KEY (id);


--
-- Name: t_areas t_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_areas
    ADD CONSTRAINT t_areas_pkey PRIMARY KEY (id);


--
-- Name: t_cargos t_cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_cargos
    ADD CONSTRAINT t_cargos_pkey PRIMARY KEY (id);


--
-- Name: t_condicionesLaborales t_condicionesLaborales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_condicionesLaborales"
    ADD CONSTRAINT "t_condicionesLaborales_pkey" PRIMARY KEY (id);


--
-- Name: t_cursosIE t_cursosIE_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_cursosIE"
    ADD CONSTRAINT "t_cursosIE_pkey" PRIMARY KEY (id);


--
-- Name: t_domicilios t_domicilios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_domicilios
    ADD CONSTRAINT t_domicilios_pkey PRIMARY KEY (id);


--
-- Name: t_emails t_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_emails
    ADD CONSTRAINT t_emails_pkey PRIMARY KEY (id);


--
-- Name: t_entidades t_entidades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_entidades
    ADD CONSTRAINT t_entidades_pkey PRIMARY KEY (id);


--
-- Name: t_gradosIE t_gradosIE_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_gradosIE"
    ADD CONSTRAINT "t_gradosIE_pkey" PRIMARY KEY (id);


--
-- Name: t_historialCambios t_historialCambios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_historialCambios"
    ADD CONSTRAINT "t_historialCambios_pkey" PRIMARY KEY (id);


--
-- Name: t_institucionesEduc t_institucionesEduc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_institucionesEduc"
    ADD CONSTRAINT "t_institucionesEduc_pkey" PRIMARY KEY (id);


--
-- Name: t_personas t_personas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_personas
    ADD CONSTRAINT t_personas_pkey PRIMARY KEY (id);


--
-- Name: t_seccionesIE t_seccionesIE_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_seccionesIE"
    ADD CONSTRAINT "t_seccionesIE_pkey" PRIMARY KEY (id);


--
-- Name: t_telefonos t_telefonos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_telefonos
    ADD CONSTRAINT t_telefonos_pkey PRIMARY KEY (id);


--
-- Name: t_trabajador t_trabajador_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_trabajador
    ADD CONSTRAINT t_trabajador_pkey PRIMARY KEY (id);


--
-- Name: t_zonas t_zonas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_zonas
    ADD CONSTRAINT t_zonas_pkey PRIMARY KEY (id);


--
-- Name: t_emails fk_emails_t_entidades_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_emails
    ADD CONSTRAINT fk_emails_t_entidades_1 FOREIGN KEY (entidad_id) REFERENCES public.t_entidades(id);


--
-- Name: t_emails fk_emails_t_institucionesEduc_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_emails
    ADD CONSTRAINT "fk_emails_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES public."t_institucionesEduc"(id);


--
-- Name: t_emails fk_emails_t_personas_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_emails
    ADD CONSTRAINT fk_emails_t_personas_1 FOREIGN KEY (persona_id) REFERENCES public.t_personas(id);


--
-- Name: t_altasTrabajadores fk_t_altasTrabajadores_t00_rolTrabajador_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_altasTrabajadores"
    ADD CONSTRAINT "fk_t_altasTrabajadores_t00_rolTrabajador_1" FOREIGN KEY ("rolTrabajador_id") REFERENCES param."t00_rolTrabajador"(id);


--
-- Name: t_altasTrabajadores fk_t_altasTrabajadores_t12_tipoContrato_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_altasTrabajadores"
    ADD CONSTRAINT "fk_t_altasTrabajadores_t12_tipoContrato_1" FOREIGN KEY ("tipoContrato_id") REFERENCES param."t12_tipoContrato"(id);


--
-- Name: t_altasTrabajadores fk_t_altasTrabajadores_t15_situacionLaboral_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_altasTrabajadores"
    ADD CONSTRAINT "fk_t_altasTrabajadores_t15_situacionLaboral_1" FOREIGN KEY ("situacionLaboral_id") REFERENCES param."t15_situacionLaboral"(id);


--
-- Name: t_altasTrabajadores fk_t_altasTrabajadores_t17_motivoDeBajas_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_altasTrabajadores"
    ADD CONSTRAINT "fk_t_altasTrabajadores_t17_motivoDeBajas_1" FOREIGN KEY ("motivoBaja_id") REFERENCES param."t17_motivoDeBajas"(id);


--
-- Name: t_altasTrabajadores fk_t_altasTrabajadores_t_areas_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_altasTrabajadores"
    ADD CONSTRAINT "fk_t_altasTrabajadores_t_areas_1" FOREIGN KEY (area_id) REFERENCES public.t_areas(id);


--
-- Name: t_altasTrabajadores fk_t_altasTrabajadores_t_cargos_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_altasTrabajadores"
    ADD CONSTRAINT "fk_t_altasTrabajadores_t_cargos_1" FOREIGN KEY (cargo_id) REFERENCES public.t_cargos(id);


--
-- Name: t_altasTrabajadores fk_t_altasTrabajadores_t_condicionesLaborales_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_altasTrabajadores"
    ADD CONSTRAINT "fk_t_altasTrabajadores_t_condicionesLaborales_1" FOREIGN KEY ("condicionLaboral_id") REFERENCES public."t_condicionesLaborales"(id);


--
-- Name: t_altasTrabajadores fk_t_altasTrabajadores_t_institucionesEduc_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_altasTrabajadores"
    ADD CONSTRAINT "fk_t_altasTrabajadores_t_institucionesEduc_1" FOREIGN KEY ("institucionEducativa_id") REFERENCES public."t_institucionesEduc"(id);


--
-- Name: t_altasTrabajadores fk_t_altasTrabajadores_t_trabajador_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_altasTrabajadores"
    ADD CONSTRAINT "fk_t_altasTrabajadores_t_trabajador_1" FOREIGN KEY (trabajador_id) REFERENCES public.t_trabajador(id);


--
-- Name: t_areas fk_t_areas_t00_rolTrabajador_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_areas
    ADD CONSTRAINT "fk_t_areas_t00_rolTrabajador_1" FOREIGN KEY ("rolTrabajador_id") REFERENCES param."t00_rolTrabajador"(id);


--
-- Name: t_cargos fk_t_cargos_t00_rolTrabajador_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_cargos
    ADD CONSTRAINT "fk_t_cargos_t00_rolTrabajador_1" FOREIGN KEY ("rolTrabajador_id") REFERENCES param."t00_rolTrabajador"(id);


--
-- Name: t_condicionesLaborales fk_t_condicionesLaborales_t33_regimenLaboral_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_condicionesLaborales"
    ADD CONSTRAINT "fk_t_condicionesLaborales_t33_regimenLaboral_1" FOREIGN KEY ("regimenLaboral_id") REFERENCES param."t33_regimenLaboral"(id);


--
-- Name: t_condicionesLaborales fk_t_condicionesLaborales_t8_tipoTrabajador_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_condicionesLaborales"
    ADD CONSTRAINT "fk_t_condicionesLaborales_t8_tipoTrabajador_1" FOREIGN KEY ("tipoTrabajador_id") REFERENCES param."t8_tipoTrabajador"(id);


--
-- Name: t_cursosIE fk_t_cursosIE_t_institucionesEduc_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_cursosIE"
    ADD CONSTRAINT "fk_t_cursosIE_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES public."t_institucionesEduc"(id);


--
-- Name: t_domicilios fk_t_domicilios_t_entidades_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_domicilios
    ADD CONSTRAINT fk_t_domicilios_t_entidades_1 FOREIGN KEY (entidad_id) REFERENCES public.t_entidades(id);


--
-- Name: t_domicilios fk_t_domicilios_t_institucionesEduc_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_domicilios
    ADD CONSTRAINT "fk_t_domicilios_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES public."t_institucionesEduc"(id);


--
-- Name: t_domicilios fk_t_domicilios_t_personas_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_domicilios
    ADD CONSTRAINT fk_t_domicilios_t_personas_1 FOREIGN KEY (persona_id) REFERENCES public.t_personas(id);


--
-- Name: t_domicilios fk_t_domicilios_t_zonas_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_domicilios
    ADD CONSTRAINT fk_t_domicilios_t_zonas_1 FOREIGN KEY (zona_id) REFERENCES public.t_zonas(id);


--
-- Name: t_entidades fk_t_entidades_t00_tipoEntidad_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_entidades
    ADD CONSTRAINT "fk_t_entidades_t00_tipoEntidad_1" FOREIGN KEY ("tipoEntidad_id") REFERENCES param."t00_tipoEntidad"(id);


--
-- Name: t_gradosIE fk_t_gradosIE_t_institucionesEduc_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_gradosIE"
    ADD CONSTRAINT "fk_t_gradosIE_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES public."t_institucionesEduc"(id);


--
-- Name: t_institucionesEduc fk_t_institucionesEduc_t34_modalidadesForm_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_institucionesEduc"
    ADD CONSTRAINT "fk_t_institucionesEduc_t34_modalidadesForm_1" FOREIGN KEY ("modalidadFormativa_id") REFERENCES param."t34_modalidadesForm"(id);


--
-- Name: t_institucionesEduc fk_t_institucionesEduc_t34_nivelesCiclo_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_institucionesEduc"
    ADD CONSTRAINT "fk_t_institucionesEduc_t34_nivelesCiclo_1" FOREIGN KEY ("nivelCiclo_id") REFERENCES param."t34_nivelesCiclo"(id);


--
-- Name: t_institucionesEduc fk_t_institucionesEduc_t34_regimenEduc_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_institucionesEduc"
    ADD CONSTRAINT "fk_t_institucionesEduc_t34_regimenEduc_1" FOREIGN KEY ("regimenEduc_id") REFERENCES param."t34_regimenEduc"(id);


--
-- Name: t_institucionesEduc fk_t_institucionesEduc_t34_tipoInstEduc_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_institucionesEduc"
    ADD CONSTRAINT "fk_t_institucionesEduc_t34_tipoInstEduc_1" FOREIGN KEY ("tipoInstEduc_id") REFERENCES param."t34_tipoInstEduc"(id);


--
-- Name: t_institucionesEduc fk_t_institucionesEduc_t_entidades_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_institucionesEduc"
    ADD CONSTRAINT "fk_t_institucionesEduc_t_entidades_1" FOREIGN KEY ("entidadUgel_id") REFERENCES public.t_entidades(id);


--
-- Name: t_institucionesEduc fk_t_institucionesEduc_t_entidades_2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_institucionesEduc"
    ADD CONSTRAINT "fk_t_institucionesEduc_t_entidades_2" FOREIGN KEY ("entidadAdmin_id") REFERENCES public.t_entidades(id);


--
-- Name: t_personas fk_t_personas_t00_sexos_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_personas
    ADD CONSTRAINT fk_t_personas_t00_sexos_1 FOREIGN KEY (sexo_id) REFERENCES param.t00_sexos(id);


--
-- Name: t_personas fk_t_personas_t3_tipoDocIdentidad_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_personas
    ADD CONSTRAINT "fk_t_personas_t3_tipoDocIdentidad_1" FOREIGN KEY ("tipoDocIdentidad_id") REFERENCES param."t3_tipoDocIdentidad"(id);


--
-- Name: t_seccionesIE fk_t_seccionesIE_t_gradosIE_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."t_seccionesIE"
    ADD CONSTRAINT "fk_t_seccionesIE_t_gradosIE_1" FOREIGN KEY (grado_id) REFERENCES public."t_gradosIE"(id);


--
-- Name: t_telefonos fk_t_telefonos_t00_operadores_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_telefonos
    ADD CONSTRAINT fk_t_telefonos_t00_operadores_1 FOREIGN KEY (operador_id) REFERENCES param.t00_operadores(id);


--
-- Name: t_telefonos fk_t_telefonos_t_entidades_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_telefonos
    ADD CONSTRAINT fk_t_telefonos_t_entidades_1 FOREIGN KEY (entidad_id) REFERENCES public.t_entidades(id);


--
-- Name: t_telefonos fk_t_telefonos_t_institucionesEduc_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_telefonos
    ADD CONSTRAINT "fk_t_telefonos_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES public."t_institucionesEduc"(id);


--
-- Name: t_telefonos fk_t_telefonos_t_personas_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_telefonos
    ADD CONSTRAINT fk_t_telefonos_t_personas_1 FOREIGN KEY (persona_id) REFERENCES public.t_personas(id);


--
-- Name: t_trabajador fk_t_trabajador_t_personas_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_trabajador
    ADD CONSTRAINT fk_t_trabajador_t_personas_1 FOREIGN KEY (persona_id) REFERENCES public.t_personas(id);


--
-- Name: t_zonas fk_t_zonas_t28_distritos_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_zonas
    ADD CONSTRAINT fk_t_zonas_t28_distritos_1 FOREIGN KEY (distrito_id) REFERENCES param.t28_distritos(id);


--
-- Name: t_zonas fk_t_zonas_t6_tiposZona_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_zonas
    ADD CONSTRAINT "fk_t_zonas_t6_tiposZona_1" FOREIGN KEY ("tipoZona_id") REFERENCES param."t6_tiposZona"(id);


--
-- PostgreSQL database dump complete
--

\unrestrict JF0qlnB06zspQ5amQmNuXJNu5mr57mlm9gefiyZLrjZ87bGhnIAnPIZMqwBfYWe

