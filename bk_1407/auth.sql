--
-- PostgreSQL database dump
--

\restrict wgbkWJeSfV8zUYuvuHSpZZ72EMvveM4fpClrSn0jqBZiaBP4QlGMGI9K7xJJKbb

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
-- Name: auth; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA auth;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: password_reset_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


--
-- Name: perfil_permisos; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.perfil_permisos (
    perfil_id smallint NOT NULL,
    permiso_id smallint NOT NULL
);


--
-- Name: perfiles; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.perfiles (
    id smallint NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(255),
    activo boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone
);


--
-- Name: perfiles_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.perfiles_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: perfiles_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.perfiles_id_seq OWNED BY auth.perfiles.id;


--
-- Name: permisos; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.permisos (
    id smallint NOT NULL,
    codigo character varying(80) NOT NULL,
    modulo character varying(60) NOT NULL,
    descripcion character varying(255),
    activo boolean DEFAULT true NOT NULL
);


--
-- Name: permisos_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.permisos_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permisos_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.permisos_id_seq OWNED BY auth.permisos.id;


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.users (
    id bigint NOT NULL,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    two_factor_secret text,
    two_factor_recovery_codes text,
    two_factor_confirmed_at timestamp(0) without time zone,
    trabajador_id bigint,
    login character varying(20) NOT NULL,
    activo boolean DEFAULT true NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.users_id_seq OWNED BY auth.users.id;


--
-- Name: usuario_perfil_ie; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.usuario_perfil_ie (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    perfil_id smallint NOT NULL,
    "institucionEducativa_id" bigint,
    activo boolean DEFAULT true NOT NULL,
    created_by bigint,
    created_at timestamp(0) without time zone,
    "entidadUgel_id" bigint
);


--
-- Name: usuario_perfil_ie_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.usuario_perfil_ie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuario_perfil_ie_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.usuario_perfil_ie_id_seq OWNED BY auth.usuario_perfil_ie.id;


--
-- Name: usuario_permisos_ie; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.usuario_permisos_ie (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permiso_id smallint NOT NULL,
    "institucionEducativa_id" bigint,
    created_by bigint,
    created_at timestamp(0) without time zone
);


--
-- Name: usuario_permisos_ie_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.usuario_permisos_ie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuario_permisos_ie_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.usuario_permisos_ie_id_seq OWNED BY auth.usuario_permisos_ie.id;


--
-- Name: perfiles id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.perfiles ALTER COLUMN id SET DEFAULT nextval('auth.perfiles_id_seq'::regclass);


--
-- Name: permisos id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.permisos ALTER COLUMN id SET DEFAULT nextval('auth.permisos_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users ALTER COLUMN id SET DEFAULT nextval('auth.users_id_seq'::regclass);


--
-- Name: usuario_perfil_ie id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.usuario_perfil_ie ALTER COLUMN id SET DEFAULT nextval('auth.usuario_perfil_ie_id_seq'::regclass);


--
-- Name: usuario_permisos_ie id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.usuario_permisos_ie ALTER COLUMN id SET DEFAULT nextval('auth.usuario_permisos_ie_id_seq'::regclass);


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.password_reset_tokens (email, token, created_at) FROM stdin;
jayne.wilkinson@example.org	$2y$04$KRZWiQvgMULRoW4o52IJ9eDnq6fFEAn6h2W8Y6Pk.QsqfG5OlI1ce	2026-06-03 17:40:16
mariane05@example.com	$2y$04$crC5ypVI.fQ.ZUQTvVweKeyVE8ASn7WwLl6nAUWn5rlALiLHb08L6	2026-06-03 17:40:17
edythe.ullrich@example.org	$2y$04$Zs/PgQ54pUaplSuWXFX1Ueht6RoGZKQekLjLI8l7IFlcIqGxSCPU6	2026-06-22 15:43:23
elbert.swift@example.org	$2y$04$du3ApFg2dUDvTLilmblKLe41R4Wt2fRUe7NUwDsi4SNj4gx2n560G	2026-06-22 15:43:23
rigoberto50@example.org	$2y$04$AycRXubAwVEM2Xlkx5ET7eIzM.5S.a66tQq3xjcXPO1bgKNwoVvde	2026-06-24 13:46:08
mayert.mervin@example.com	$2y$04$jPxvaC4nQqSnVPRSdBZDleRiChK1n4vagwCRqT6N/Tz2RQnKLeh9S	2026-06-24 13:46:08
jennifer92@example.org	$2y$04$AHec8pgoF9ZCZBNeiyr9XOzEA9qfW78ySW9LmvF0zmsf1Bd/NCLrO	2026-06-24 13:46:40
atillman@example.net	$2y$04$uJK0CZxCa0ao0qCz9MG5yOsB4of..kd7hwNJ/RsBMthS.anbLYQlO	2026-06-24 13:46:40
alysha79@example.org	$2y$04$7rSxlbAwuYCts/4tpoJDZu.eIakByxeGrML9ChcJNNviplOuucftS	2026-06-26 16:09:37
keagan.wolff@example.org	$2y$04$vcAwiYR3Q9shbxo0MwN3sec.lTsOWvYKDSfR..INFyQXcuNHSy1d2	2026-06-26 16:09:37
\.


--
-- Data for Name: perfil_permisos; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.perfil_permisos (perfil_id, permiso_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
1	19
1	20
1	21
1	22
1	23
1	24
1	25
1	26
1	27
1	28
1	29
1	30
1	31
1	32
1	33
1	34
1	35
1	36
1	37
1	38
2	1
2	3
2	5
2	7
2	9
2	11
2	17
2	18
2	19
2	21
2	25
2	26
2	27
2	28
2	29
2	30
2	31
2	33
2	37
3	17
3	25
3	29
3	37
3	1
3	5
3	30
\.


--
-- Data for Name: perfiles; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.perfiles (id, nombre, descripcion, activo, created_at) FROM stdin;
1	Admin UGEL	Administrador global del sistema UGEL	t	\N
2	Director IE	Director de Institución Educativa	t	\N
3	Docente	Docente o Personal de IE	t	\N
\.


--
-- Data for Name: permisos; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.permisos (id, codigo, modulo, descripcion, activo) FROM stdin;
4	personas.eliminar	personas	Desactivar personas	t
5	trabajadores.ver	trabajadores	Ver listado y detalle de trabajadores	t
6	trabajadores.crear	trabajadores	Crear nuevos trabajadores y altas	t
1	personas.ver	personas	Ver listado y detalle de personas	t
2	personas.crear	personas	Crear nuevas personas	t
3	personas.editar	personas	Editar personas existentes	t
7	trabajadores.editar	trabajadores	Editar trabajadores y altas	t
8	trabajadores.eliminar	trabajadores	Desactivar trabajadores	t
9	instituciones.ver	instituciones	Ver listado y detalle de IEs	t
10	instituciones.crear	instituciones	Crear nuevas IEs y subrecursos	t
11	instituciones.editar	instituciones	Editar IEs y subrecursos	t
12	instituciones.eliminar	instituciones	Desactivar IEs	t
13	entidades.ver	entidades	Ver listado y detalle de entidades	t
14	entidades.crear	entidades	Crear nuevas entidades	t
15	entidades.editar	entidades	Editar entidades existentes	t
16	entidades.eliminar	entidades	Desactivar entidades	t
17	horarios.ver	horarios	Ver horarios de cursos y trabajadores	t
18	horarios.crear	horarios	Crear y asignar horarios	t
19	horarios.editar	horarios	Editar horarios existentes	t
20	horarios.eliminar	horarios	Eliminar horarios	t
21	infraestructura.ver	infraestructura	Ver locales, relojes y dispositivos de marca	t
22	infraestructura.crear	infraestructura	Crear locales, relojes y dispositivos	t
23	infraestructura.editar	infraestructura	Editar locales y relojes	t
24	infraestructura.eliminar	infraestructura	Eliminar locales y relojes	t
25	asistencia.ver	asistencia	Ver reporte de asistencia y marcaciones	t
26	asistencia.crear	asistencia	Registrar/Importar marcaciones	t
27	asistencia.editar	asistencia	Editar o justificar asistencia	t
28	asistencia.consolidar	asistencia	Consolidar asistencia mensual	t
29	tramites.ver	tramites	Ver expedientes y trámites	t
30	tramites.crear	tramites	Crear expedientes y documentos de trámite	t
31	tramites.editar	tramites	Editar expedientes y trámites	t
32	tramites.anular	tramites	Anular expedientes registrados	t
33	reportes.ver	reportes	Ver y descargar reportes del sistema	t
34	configuracion.ver	configuracion	Ver áreas, cargos, condiciones y zonas	t
35	configuracion.editar	configuracion	Gestionar áreas, cargos, condiciones y zonas	t
36	usuarios.gestionar	configuracion	Gestionar usuarios, perfiles y permisos	t
37	dashboard.ver	dashboard	Ver panel de control	t
38	dashboard.admin	dashboard	Ver estadísticas globales de todas las IEs	t
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
h24O1CR7J3ypiHlgS22tORPeLpvZ5p04APH5SRrq	\N	172.16.0.1	Mozilla/5.0 (compatible; FlowIQLabsBot/1.0; +https://flowiq-labs.com/scanning-info)	eyJfdG9rZW4iOiJVTGN1aTJmUlpWSm5oS09icUR2YkxDSnJlaGg4S0MwQ0k4WXYycENqIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzM4LjI1MC4xNzYuMjQ0Iiwicm91dGUiOiJob21lIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=	1783961089
ITOs7dYYTUbrsIkLt29Z3WCXVmWLyyxfnhsLegcA	\N	172.16.0.1	Mozilla/5.0 (compatible; FlowIQLabsBot/1.0; +https://flowiq-labs.com/scanning-info)	eyJfdG9rZW4iOiJteXhlYndMekpQTnZIUEo2R0NsUTBKZ0swOHM5VmVZOGw4bXp0MUtuIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzM4LjI1MC4xNzYuMjQ0Iiwicm91dGUiOiJob21lIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=	1783966143
AHp4dWtj54nQyY0iaueKPq4wR2HaFF1MULTna2Ld	\N	172.16.0.1	Mozilla/5.0 zgrab/0.x	eyJfdG9rZW4iOiJqbzBPT2NxQnBLNGE2cFJYd0FRbDg4Q3c3RFYxdTNtcENkakFUSGFVIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzM4LjI1MC4xNzYuMjQ0Iiwicm91dGUiOiJob21lIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=	1783963583
131zyGCGKa04bMgvPMO8pvfjpnbPlKDLfP40kuO9	\N	172.16.0.1	Go-http-client/1.1	eyJfdG9rZW4iOiJyTzhUS25LbjNBYWdDaklMQkRaeHJHeUdNUkw4eGNpOWk2S21MbE9mIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzM4LjI1MC4xNzYuMjQ0XC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==	1783966410
Vv73QH6qpENpyd0X0pJmowfyuzoYzEQoFM8qdM41	\N	172.16.0.1	libredtail-http	eyJfdG9rZW4iOiJUNEVLSHY2WGVhVDl1OWhWUmFWSk9vT0FTZGVPSFllNTNWcURzellTIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzM4LjI1MC4xNzYuMjQ0XC9pbmRleC5waHA/ZnVuY3Rpb249Y2FsbF91c2VyX2Z1bmNfYXJyYXkmcz0lMkZpbmRleCUyRiU1Q3RoaW5rJTVDYXBwJTJGaW52b2tlZnVuY3Rpb24mdmFycyU1QjAlNUQ9bWQ1JnZhcnMlNUIxJTVEJTVCMCU1RD1IZWxsbyIsInJvdXRlIjoiaG9tZSJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19	1783964551
HMdoQ1SyKPQEAnwA2CmmPaBgXvU2WsNwTv5Ck29G	\N	172.16.0.1	Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity	eyJfdG9rZW4iOiJ3cnFIam5vRXV1NDFERjdrUXBCMnZXMlEzTTBwOEJHUXFBVWF3aENOIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL18iLCJyb3V0ZSI6ImhvbWUifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==	1783970321
MDkylBX5yEcprqBs71xSPgH05J0x9YrADGZJXe2m	\N	172.16.0.1	libredtail-http	eyJfdG9rZW4iOiJxR25YdTBtRXZtOVdNRlBlUWhaNkdqMURUOW9NVmlIVUhLc3VLVU5mIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzM4LjI1MC4xNzYuMjQ0XC9pbmRleC5waHA/JTJGJTNDJTNGZWNobyUyOG1kNSUyOCUyMmhpJTIyJTI5JTI5JTNCJTNGJTNFJTIwJTJGdG1wJTJGaW5kZXgxLnBocD0mY29uZmlnLWNyZWF0ZSUyMCUyRj0mbGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGdXNyJTJGbG9jYWwlMkZsaWIlMkZwaHAlMkZwZWFyY21kIiwicm91dGUiOiJob21lIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=	1783964552
V1dKF03cyY7nzKlYT61P6mUSi0EnQmUmQSYtbZOc	\N	172.16.0.1	Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)	eyJfdG9rZW4iOiJSWWg3dnB5SzJhcTBDMENaZGVyMk9pSGl5Z2tlZVBhb01sQkhyQm9sIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzM4LjI1MC4xNzYuMjQ0Iiwicm91dGUiOiJob21lIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=	1783972265
xGqLfBNVy1Fn0hoz2utXj7NAV7YsSRmXhAjRzCE3	\N	172.16.0.1	libredtail-http	eyJfdG9rZW4iOiJUenAxbnF5WlVPRmQ3ZHFYUzkxYVZqY0o5UWdZWHg4SjZETU82QXJqIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzM4LjI1MC4xNzYuMjQ0XC9pbmRleC5waHA/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGdG1wJTJGaW5kZXgxIiwicm91dGUiOiJob21lIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=	1783964552
do2tCOxsOGT3WA5WZeNiim2AMeig9wrJxR3UFeTa	\N	172.16.0.1	Linux Gnu (cow)	eyJfdG9rZW4iOiIxQjlrSWh4Q2FqUnRQUEtwcVdOeFY5cVQ1cHlVYWR5eUJKMzRHNEVOIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzM4LjI1MC4xNzYuMjQ0Iiwicm91dGUiOiJob21lIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=	1783974229
cKu1gV92Nn7kpyMJu7mUi7oYkn2qg721cj1vwRqO	\N	172.16.0.1	ivre-masscan/1.3 https://github.com/robertdavidgraham/	eyJfdG9rZW4iOiI4SFNjeGxOMUpkdmIzSGhUaGxzNEtDOW9yU2ZtNHFOaGhlOGNMODgzIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL18iLCJyb3V0ZSI6ImhvbWUifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==	1783964589
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.users (id, password, remember_token, created_at, updated_at, two_factor_secret, two_factor_recovery_codes, two_factor_confirmed_at, trabajador_id, login, activo) FROM stdin;
2	$2y$12$WKX7C4PAbhSTGyIfymir/OzVkLFPTmzN8wjMvh5yR6IRAuhsjzNp6	\N	2026-06-29 19:41:33	2026-06-29 19:41:33	\N	\N	\N	2	76955032	t
1	$2y$12$7oXYSjxxAWdF9BV6Pkf9A.ebYZ.QS1iIiyQGWi55Pvyjsg7bV9/jq	\N	2026-06-28 00:07:35	2026-06-30 18:36:19	\N	\N	\N	1	76955033	t
3	$2y$12$8WcnEwZj/RScDTj7QUC9suiIAv0wHoLOU/qprpi9.84mLOguIoF..	j4ls3Egjaos7cdlDqlm9BTmClN4NltsbQPmJoODOQIAjWOzIqj4WwebSNi2P	2026-06-30 18:28:05	2026-06-30 18:28:05	\N	\N	\N	3	76955065	t
4	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	ZSOalDI0hu	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	11	38049740	t
5	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	BLflSlI51x	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	12	27418782	t
6	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	ysUUkbzBLF	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	13	80915841	t
7	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	foTlLx2bWQ	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	14	85449243	t
8	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	PfmAfwi1RM	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	15	66390721	t
9	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	coOrnG3RVR	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	16	54935425	t
10	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	7SEXbylzf4	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	17	13131639	t
11	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	BSsuORW02M	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	18	24458438	t
12	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	68gWgCHpDM	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	19	62555362	t
13	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	eKqGMzvDSN	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	20	03673254	t
14	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	UUDcSBnSeb	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	21	43171144	t
15	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	YQ3WEJk091	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	22	40890842	t
16	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	ePW44GfI0O	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	23	79662117	t
17	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	bY1ajbpnLm	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	24	78271060	t
18	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	dlVt4N867C	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	25	15758100	t
19	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	HPAu3FiWWF	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	26	24708715	t
20	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	1crDQRmbF3	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	27	60923710	t
21	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	MzTnlfGCNu	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	28	26326549	t
22	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	t29Mrd5tos	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	29	89930621	t
23	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	y2nwYOav99	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	30	37997938	t
24	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	hVrJKaq72v	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	31	73987965	t
25	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	jlcbtgDUSS	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	32	10731578	t
26	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	HFG3imDw8j	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	33	66604903	t
27	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	uCqJ9SnPQq	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	34	57366891	t
28	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	ykWwTDVx5n	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	35	74399722	t
29	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	zK8viURwXX	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	36	58328713	t
30	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	lA8BleJDSb	2026-07-13 16:22:53	2026-07-13 16:22:53	\N	\N	\N	37	90982487	t
31	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	cni77BDjtO	2026-07-13 16:22:54	2026-07-13 16:22:54	\N	\N	\N	38	42290734	t
32	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	LtK2h3mdzs	2026-07-13 16:22:54	2026-07-13 16:22:54	\N	\N	\N	39	95026784	t
33	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	7cGzW37Bpw	2026-07-13 16:22:54	2026-07-13 16:22:54	\N	\N	\N	40	69677548	t
34	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	0VBOa1nQhm	2026-07-13 16:22:54	2026-07-13 16:22:54	\N	\N	\N	41	75408373	t
35	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	TAzI6D3Zdl	2026-07-13 16:22:54	2026-07-13 16:22:54	\N	\N	\N	42	75216459	t
44	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	bPY5PKwqDk	2026-07-13 16:22:54	2026-07-13 16:22:54	\N	\N	\N	51	58036780	t
45	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	XL89Aa6xIy	2026-07-13 16:22:54	2026-07-13 16:22:54	\N	\N	\N	52	95108538	t
46	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	CnvzCpp2Ri	2026-07-13 16:22:54	2026-07-13 16:22:54	\N	\N	\N	53	77925242	t
47	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	CRdGdZnucZ	2026-07-13 16:22:54	2026-07-13 16:22:54	\N	\N	\N	54	66961525	t
48	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	kvRAcegwIi	2026-07-13 16:22:54	2026-07-13 16:22:54	\N	\N	\N	55	05196065	t
49	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	oZonCynirF	2026-07-13 16:22:54	2026-07-13 16:22:54	\N	\N	\N	56	61328423	t
71	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	TZaUSyIl3U	2026-07-13 16:22:55	2026-07-13 16:22:55	\N	\N	\N	78	77972052	t
72	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	4ALLPWeDTL	2026-07-13 16:22:55	2026-07-13 16:22:55	\N	\N	\N	79	78878227	t
73	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	tdMzXPWoDV	2026-07-13 16:22:55	2026-07-13 16:22:55	\N	\N	\N	80	18105549	t
74	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	aUsIQFuDzJ	2026-07-13 16:22:55	2026-07-13 16:22:55	\N	\N	\N	81	69886811	t
75	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	OYg5XLybgk	2026-07-13 16:22:55	2026-07-13 16:22:55	\N	\N	\N	82	11528294	t
76	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	3yHW4cPXWK	2026-07-13 16:22:55	2026-07-13 16:22:55	\N	\N	\N	83	69314970	t
77	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	jL5ddlIfJq	2026-07-13 16:22:55	2026-07-13 16:22:55	\N	\N	\N	84	35906336	t
78	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	WeQoSMijDB	2026-07-13 16:22:55	2026-07-13 16:22:55	\N	\N	\N	85	64882428	t
79	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	DpPSLfU5qc	2026-07-13 16:22:55	2026-07-13 16:22:55	\N	\N	\N	86	04363647	t
119	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	SUTolsLsTx	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	134	41353671	t
120	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	RrWWt40rS4	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	135	75478646	t
121	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	QbyAWhdqre	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	136	26519866	t
122	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	OnBeCE2AWV	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	137	54757252	t
123	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	eyF2hTvHD9	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	138	54750272	t
124	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	LqaWrmSsFf	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	139	84175620	t
125	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	oWpcDHKWwR	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	140	79987990	t
126	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	Y6nismrnuM	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	141	48183363	t
127	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	eEAqrxzU1p	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	142	07860247	t
128	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	XKxURor72k	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	143	25171255	t
129	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	YUELZd9i5Q	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	144	72531441	t
130	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	SDZ8rFnfKN	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	145	92923552	t
131	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	lXOLvV0f34	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	146	50619360	t
132	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	gKzDOeMipP	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	147	14384990	t
133	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	3rqVDdx3fI	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	148	29871545	t
134	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	QeghIQfhAb	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	149	42151063	t
135	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	IqFFuCqx3u	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	150	89752014	t
136	$2y$04$7Tg4gu3iOuZFI9QNVgM8wu5Pcz7Vl3NoOEowYVImmEXxXetsYqsK6	by8KzrNNhd	2026-07-13 16:22:56	2026-07-13 16:22:56	\N	\N	\N	151	27808429	t
\.


--
-- Data for Name: usuario_perfil_ie; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.usuario_perfil_ie (id, user_id, perfil_id, "institucionEducativa_id", activo, created_by, created_at, "entidadUgel_id") FROM stdin;
2	2	2	1	t	1	\N	\N
3	3	3	1	t	1	\N	1
1	1	1	\N	t	1	2026-06-30 18:36:19	1
4	3	3	2	t	1	\N	\N
\.


--
-- Data for Name: usuario_permisos_ie; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.usuario_permisos_ie (id, user_id, permiso_id, "institucionEducativa_id", created_by, created_at) FROM stdin;
34	1	34	\N	1	2026-06-30 18:36:19
35	1	35	\N	1	2026-06-30 18:36:19
36	1	36	\N	1	2026-06-30 18:36:19
37	1	37	\N	1	2026-06-30 18:36:19
38	1	38	\N	1	2026-06-30 18:36:19
4	1	4	\N	1	2026-06-30 18:36:19
5	1	5	\N	1	2026-06-30 18:36:19
6	1	6	\N	1	2026-06-30 18:36:19
1	1	1	\N	1	2026-06-30 18:36:19
2	1	2	\N	1	2026-06-30 18:36:19
3	1	3	\N	1	2026-06-30 18:36:19
7	1	7	\N	1	2026-06-30 18:36:19
8	1	8	\N	1	2026-06-30 18:36:19
9	1	9	\N	1	2026-06-30 18:36:19
10	1	10	\N	1	2026-06-30 18:36:19
11	1	11	\N	1	2026-06-30 18:36:19
12	1	12	\N	1	2026-06-30 18:36:19
13	1	13	\N	1	2026-06-30 18:36:19
14	1	14	\N	1	2026-06-30 18:36:19
15	1	15	\N	1	2026-06-30 18:36:19
16	1	16	\N	1	2026-06-30 18:36:19
17	1	17	\N	1	2026-06-30 18:36:19
18	1	18	\N	1	2026-06-30 18:36:19
19	1	19	\N	1	2026-06-30 18:36:19
20	1	20	\N	1	2026-06-30 18:36:19
21	1	21	\N	1	2026-06-30 18:36:19
22	1	22	\N	1	2026-06-30 18:36:19
23	1	23	\N	1	2026-06-30 18:36:19
24	1	24	\N	1	2026-06-30 18:36:19
25	1	25	\N	1	2026-06-30 18:36:19
26	1	26	\N	1	2026-06-30 18:36:19
27	1	27	\N	1	2026-06-30 18:36:19
28	1	28	\N	1	2026-06-30 18:36:19
29	1	29	\N	1	2026-06-30 18:36:19
30	1	30	\N	1	2026-06-30 18:36:19
31	1	31	\N	1	2026-06-30 18:36:19
32	1	32	\N	1	2026-06-30 18:36:19
33	1	33	\N	1	2026-06-30 18:36:19
\.


--
-- Name: perfiles_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.perfiles_id_seq', 10, true);


--
-- Name: permisos_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.permisos_id_seq', 38, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.users_id_seq', 171, true);


--
-- Name: usuario_perfil_ie_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.usuario_perfil_ie_id_seq', 16, true);


--
-- Name: usuario_permisos_ie_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.usuario_permisos_ie_id_seq', 38, true);


--
-- Name: permisos auth_permisos_codigo_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.permisos
    ADD CONSTRAINT auth_permisos_codigo_unique UNIQUE (codigo);


--
-- Name: users auth_users_login_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT auth_users_login_unique UNIQUE (login);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: perfil_permisos perfil_permisos_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.perfil_permisos
    ADD CONSTRAINT perfil_permisos_pkey PRIMARY KEY (perfil_id, permiso_id);


--
-- Name: perfiles perfiles_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.perfiles
    ADD CONSTRAINT perfiles_pkey PRIMARY KEY (id);


--
-- Name: permisos permisos_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.permisos
    ADD CONSTRAINT permisos_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: usuario_permisos_ie uq_usuario_permiso_ie; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.usuario_permisos_ie
    ADD CONSTRAINT uq_usuario_permiso_ie UNIQUE (user_id, permiso_id, "institucionEducativa_id");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: usuario_perfil_ie usuario_perfil_ie_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.usuario_perfil_ie
    ADD CONSTRAINT usuario_perfil_ie_pkey PRIMARY KEY (id);


--
-- Name: usuario_permisos_ie usuario_permisos_ie_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.usuario_permisos_ie
    ADD CONSTRAINT usuario_permisos_ie_pkey PRIMARY KEY (id);


--
-- Name: auth_sessions_last_activity_index; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX auth_sessions_last_activity_index ON auth.sessions USING btree (last_activity);


--
-- Name: auth_sessions_user_id_index; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX auth_sessions_user_id_index ON auth.sessions USING btree (user_id);


--
-- Name: uq_usuario_ie; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX uq_usuario_ie ON auth.usuario_perfil_ie USING btree (user_id, "institucionEducativa_id") WHERE ("institucionEducativa_id" IS NOT NULL);


--
-- Name: uq_usuario_ugel; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX uq_usuario_ugel ON auth.usuario_perfil_ie USING btree (user_id, "entidadUgel_id") WHERE (("institucionEducativa_id" IS NULL) AND ("entidadUgel_id" IS NOT NULL));


--
-- Name: perfil_permisos auth_perfil_permisos_perfil_id_foreign; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.perfil_permisos
    ADD CONSTRAINT auth_perfil_permisos_perfil_id_foreign FOREIGN KEY (perfil_id) REFERENCES auth.perfiles(id) ON DELETE CASCADE;


--
-- Name: perfil_permisos auth_perfil_permisos_permiso_id_foreign; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.perfil_permisos
    ADD CONSTRAINT auth_perfil_permisos_permiso_id_foreign FOREIGN KEY (permiso_id) REFERENCES auth.permisos(id) ON DELETE CASCADE;


--
-- Name: users auth_users_trabajador_id_foreign; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT auth_users_trabajador_id_foreign FOREIGN KEY (trabajador_id) REFERENCES public.t_trabajador(id);


--
-- Name: usuario_perfil_ie auth_usuario_perfil_ie_entidadugel_id_foreign; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.usuario_perfil_ie
    ADD CONSTRAINT auth_usuario_perfil_ie_entidadugel_id_foreign FOREIGN KEY ("entidadUgel_id") REFERENCES public.t_entidades(id);


--
-- Name: usuario_perfil_ie auth_usuario_perfil_ie_institucioneducativa_id_foreign; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.usuario_perfil_ie
    ADD CONSTRAINT auth_usuario_perfil_ie_institucioneducativa_id_foreign FOREIGN KEY ("institucionEducativa_id") REFERENCES public."t_institucionesEduc"(id);


--
-- Name: usuario_perfil_ie auth_usuario_perfil_ie_perfil_id_foreign; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.usuario_perfil_ie
    ADD CONSTRAINT auth_usuario_perfil_ie_perfil_id_foreign FOREIGN KEY (perfil_id) REFERENCES auth.perfiles(id);


--
-- Name: usuario_perfil_ie auth_usuario_perfil_ie_user_id_foreign; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.usuario_perfil_ie
    ADD CONSTRAINT auth_usuario_perfil_ie_user_id_foreign FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: usuario_permisos_ie auth_usuario_permisos_ie_institucioneducativa_id_foreign; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.usuario_permisos_ie
    ADD CONSTRAINT auth_usuario_permisos_ie_institucioneducativa_id_foreign FOREIGN KEY ("institucionEducativa_id") REFERENCES public."t_institucionesEduc"(id) ON DELETE CASCADE;


--
-- Name: usuario_permisos_ie auth_usuario_permisos_ie_permiso_id_foreign; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.usuario_permisos_ie
    ADD CONSTRAINT auth_usuario_permisos_ie_permiso_id_foreign FOREIGN KEY (permiso_id) REFERENCES auth.permisos(id) ON DELETE CASCADE;


--
-- Name: usuario_permisos_ie auth_usuario_permisos_ie_user_id_foreign; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.usuario_permisos_ie
    ADD CONSTRAINT auth_usuario_permisos_ie_user_id_foreign FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict wgbkWJeSfV8zUYuvuHSpZZ72EMvveM4fpClrSn0jqBZiaBP4QlGMGI9K7xJJKbb

