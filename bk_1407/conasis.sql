--
-- PostgreSQL database dump
--

\restrict k2QeovP8L8O3ZSfslH4jActu1hYfstsvRMgGX4Tp7K92iQLEQkJHX9UTcifeppZ

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
-- Name: conasis; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA conasis;


--
-- Name: f_procesa_asismes_v1(bigint, bigint, smallint, smallint, date, date, bigint); Type: FUNCTION; Schema: conasis; Owner: -
--

CREATE FUNCTION conasis.f_procesa_asismes_v1(p_ve_1 bigint, p_ve_2 bigint, p_ve_3 smallint, p_ve_4 smallint, p_ve_5 date, p_ve_6 date, p_ve_7 bigint) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
	DECLARE
       vi_01 DATE;
			 vi_02 DATE;
			 vi_03 DATE;
			 vi_04 DATE;
			 vi_05 DATE;
			 vi_06 INTEGER;
			 vi_07 INTEGER;
			 vi_08 INTEGER;
			 vi_09 TEXT;
			 vi_10 VARCHAR(1);
			 vi_11 INTEGER;
			 vi_12 INTEGER;
			 vi_13 INTEGER;
			 vi_14 INTEGER;
			 vi_15 INTEGER;
			 vi_16 VARCHAR(2);
			 vi_17 VARCHAR(50);			 
			 vi_18 INTEGER;
			 vi_19 INTEGER;
			 vi_20 INTEGER;			 
			 vi_21 VARCHAR(30);
			 vi_22 VARCHAR(30);
			 vi_23 VARCHAR(30);
			 vi_24 INTEGER;
			 vi_25 INTEGER;			 
			 vi_26 TEXT;
			 vi_27 TEXT;
			 vi_28 TEXT;			 
			 vi_29 INTEGER;
			 vi_30 VARCHAR(2);
			 vi_31 INTEGER;
			 vi_32 VARCHAR(5);
			 vi_33 VARCHAR(5);
			 vi_34 BOOLEAN;
			 vi_35 VARCHAR(1);
			 vi_36 VARCHAR(30);
			 vi_37 VARCHAR(30);
			 vi_38 TEXT;				
			 vi_39 TIME;
			 vi_40 TIME;
			 vi_41 TIME;
			 vi_42 TIME;
			 vi_43 VARCHAR(10);
			 vi_44 VARCHAR(10);
			 vi_45 INTEGER;
			 vi_46 INTEGER=0;
			 vi_47 INTEGER=0;			 
BEGIN
DROP TABLE IF EXISTS "tb_temp_group1";
CREATE TEMPORARY TABLE "tb_temp_group1" ON COMMIT DROP AS select ROW_NUMBER() OVER (ORDER BY tmp1."nroTurno",tmp1.fechaini) AS n,(select string_agg(dh2."nroDia"::text, ',') from conasis."t_detalleHorarios" as dh2 where dh2."horarioTrabajador_id"=tmp1.id and dh2.turno_id=tmp1.turno_id and dh2."nroTurno"=tmp1."nroTurno") as seriedia,* from (select distinct ht1.id,(case when ht1."fechaInicio"<=p_ve_5 then p_ve_5 else ht1."fechaInicio" end) as fechaini,(case when (ht1."fechaFin" is null or ht1."fechaFin">=p_ve_6) then p_ve_6 else ht1."fechaFin" end) as fechafin,ht1."altaTrabajador_id",dh1.turno_id,dh1."nroTurno",dh1."diaSemana" from conasis."t_horariosTrabajador" as ht1,conasis."t_detalleHorarios" as dh1 where dh1."horarioTrabajador_id"=ht1.id and ht1."institucionEduc_id"=p_ve_1 and ht1.trabajador_id=p_ve_2 and ht1."fechaInicio"<=p_ve_6 and (ht1."fechaFin" is null or ht1."fechaFin">=p_ve_5) ) as tmp1 ORDER BY tmp1."nroTurno",tmp1.fechaini;
select count(*) into vi_12 from tb_temp_group1;
IF vi_12>0 THEN
select li.id into vi_19 from conasis."t_localesMarcacion" as lm,conasis."t_localesInstEduc" as li where lm."localInstEduc_id"=li.id and lm.trabajador_id=p_ve_2 and li."institucionEduc_id"=p_ve_1 and lm."fechaInicio"<=p_ve_6 and (lm."fechaFin" is null or lm."fechaFin">=p_ve_5) ORDER BY lm."fechaInicio" desc limit 1;
select "altaTrabajador_id" into vi_08 from tb_temp_group1 where n=1;
if not EXISTS(select * from conasis.t_asistencia where trabajador_id=p_ve_2 and "institucionEduc_id"=p_ve_1 and anio=p_ve_3 and mes=p_ve_4 and ((p_ve_6>="fechaDesde" and p_ve_6<="fechaHasta") or (p_ve_5>="fechaDesde" and p_ve_5<="fechaHasta") or (p_ve_5<"fechaDesde" and "fechaHasta"<p_ve_6))) THEN
insert into conasis.t_asistencia ("institucionEduc_id",trabajador_id,"altaTrabajador_id",anio,mes,"estadoUltim_id",created_at,created_by,"fechaDesde","fechaHasta") values (p_ve_1,p_ve_2,vi_08,p_ve_3,p_ve_4,1,CURRENT_TIMESTAMP,p_ve_7,p_ve_5,p_ve_6);
end if;
select asi.id into vi_18 from conasis.t_asistencia as asi where asi."institucionEduc_id"=p_ve_1 and asi.trabajador_id=p_ve_2 and asi."fechaDesde"=p_ve_5 and asi."fechaHasta"=p_ve_6;
delete from conasis."t_asistenciaMesTrabajador" where asistencia_id=vi_18;
delete from conasis."t_consolAsistMesTrab" where asistencia_id=vi_18;
select pest.id into vi_45 from param."t00_estadosAsis" as pest where pest.codigo='1' and pest.activo='t';
INSERT into conasis."t_estadosAsistencia" (asistencia_id,"estadoAsis_id",observacion,created_at,created_by) VALUES (vi_18,vi_45,'Planilla de asistencia creada',CURRENT_TIMESTAMP,p_ve_7);
select cest.id into vi_45 from conasis."t_estadosAsistencia" cest where cest.asistencia_id=vi_18 and cest."estadoAsis_id"=vi_45 ORDER BY cest.id desc limit 1;
UPDATE conasis."t_asistencia" set "estadoUltim_id"=vi_45 where id=vi_18;
FOR i IN 1..vi_12 LOOP
select fechaini,fechafin,"altaTrabajador_id",turno_id,"nroTurno",id,seriedia,"diaSemana" into vi_01,vi_02,vi_08,vi_07,vi_06,vi_11,vi_09,vi_10 from tb_temp_group1 where n=i;
if not EXISTS(select * from conasis."t_asistenciaMesTrabajador" as amt where amt.asistencia_id=vi_18 and amt.turno_id=vi_07 and amt."nroTurno"=vi_06) THEN
insert into conasis."t_asistenciaMesTrabajador" (asistencia_id,"localInstEduc_id",turno_id,"nroTurno",created_at,created_by) values (vi_18,vi_19,vi_07,vi_06,CURRENT_TIMESTAMP,p_ve_7);
end if;
select amtt.id into vi_20 from conasis."t_asistenciaMesTrabajador" as amtt where amtt.asistencia_id=vi_18 and amtt.turno_id=vi_07 and amtt."nroTurno"=vi_06;
DROP TABLE IF EXISTS "tb_temp_group2";
CREATE TEMPORARY TABLE "tb_temp_group2" ON COMMIT DROP AS	
select DISTINCT tmp2.trabajador_id,tmp2."nroTurno",tmp2."tipoHorario",tmp2."horaAcumula",tmp2."diasal",tmp2.h_entrada_hor,tmp2.h_salida_hor,tmp2.fechamarca,tmp2."diaSemana",tmp2.c_entrada,tmp2.c_salida,tmp2.h_entrada,tmp2.h_salida from (select *,(FIRST_VALUE(tmp.condicion_entrada) OVER ( PARTITION BY tmp.trabajador_id,tmp.fechamarca,tmp."nroTurno" ORDER BY tmp.condicion_entrada,tmp."fechaMarcacion") ) AS c_entrada,(FIRST_VALUE(tmp.condicion_salida) OVER ( PARTITION BY tmp.trabajador_id,tmp.fechamarca,tmp."nroTurno" ORDER BY tmp.condicion_salida asc,tmp."fechaMarcacion" desc) ) AS c_salida,(FIRST_VALUE(tmp.hora_entrada) OVER ( PARTITION BY tmp.trabajador_id,tmp.fechamarca,tmp."nroTurno" ORDER BY tmp.condicion_entrada,tmp."fechaMarcacion") ) AS h_entrada,(FIRST_VALUE(tmp.hora_salida) OVER ( PARTITION BY tmp.trabajador_id,tmp.fechamarca,tmp."nroTurno" ORDER BY tmp.condicion_salida asc,tmp."fechaMarcacion" desc) ) AS h_salida from (select ROW_NUMBER() OVER (ORDER BY ht."fechaInicio") AS n,ht.trabajador_id,ma."fechaMarcacion",date(ma."fechaMarcacion") as fechamarca,dh."nroTurno",ht."tipoHorario",(dh."salDiaFin" - dh."entDiaInicio") as diasal,dh."entHoraFin" as h_entrada_hor,dh."salHoraInicio" as h_salida_hor,dh."diaSemana",dh."horaAcumula",(case when dh."entDiaInicio"=dh."salDiaFin" then (case when "time"(ma."fechaMarcacion")<=(dh."entHoraFin" + interval '1 MINUTE' * (dh."entTolerancia" + 1)) then "time"(ma."fechaMarcacion") when "time"(ma."fechaMarcacion")<dh."salHoraInicio" and "time"(ma."fechaMarcacion")>(dh."entHoraFin" + interval '1 MINUTE' * (dh."entTolerancia" + 1)) then "time"(ma."fechaMarcacion") else NULL end) else NULL END) as hora_entrada,(case when dh."entDiaInicio"=dh."salDiaFin" then (case when "time"(ma."fechaMarcacion")<=(dh."entHoraFin" + interval '1 MINUTE' * (dh."entTolerancia" + 1)) then 'A' when "time"(ma."fechaMarcacion")<dh."salHoraInicio" and "time"(ma."fechaMarcacion")>(dh."entHoraFin" + interval '1 MINUTE' * (dh."entTolerancia" + 1)) then 'T' else 'X' end) else 'X' END) as condicion_entrada,(case when dh."entDiaInicio"=dh."salDiaFin" then (case when "time"(ma."fechaMarcacion")>dh."salHoraInicio" and ("time"(ma."fechaMarcacion")<=(dh."salHoraFin" + interval '0 MINUTE')) then "time"(ma."fechaMarcacion") when "time"(ma."fechaMarcacion")<=dh."salHoraInicio" and "time"(ma."fechaMarcacion")>(dh."entHoraFin" + interval '1 MINUTE' * (dh."entTolerancia" + 1)) then "time"(ma."fechaMarcacion") else NULL end) else null end) as hora_salida,(case when dh."entDiaInicio"=dh."salDiaFin" then (case when "time"(ma."fechaMarcacion")>dh."salHoraInicio" and ("time"(ma."fechaMarcacion")<=(dh."salHoraFin" + interval '0 MINUTE')) then 'A' when "time"(ma."fechaMarcacion")<=dh."salHoraInicio" and "time"(ma."fechaMarcacion")>(dh."entHoraFin" + interval '1 MINUTE' * (dh."entTolerancia" + 1)) then 'E' else 'X' end) else 'X' end) as condicion_salida from conasis.t_marcaciones as ma,conasis."t_localesMarcacion" as lm,conasis."t_localesInstEduc" as lie,conasis."t_horariosTrabajador" as ht,conasis."t_detalleHorarios" as dh where dh.turno_id=vi_07 and dh."nroTurno"=vi_06 and dh."horarioTrabajador_id"=ht.id and ht."institucionEduc_id"=p_ve_1 and ht.trabajador_id=p_ve_2 and lie."institucionEduc_id"=p_ve_1 and lm.trabajador_id=p_ve_2 and ma.trabajador_id=p_ve_2 and lm."localInstEduc_id"=lie.id and lm.trabajador_id=ma.trabajador_id  and ma."localMarcacion_id"=lm.id  and ma.tipo='A' and date(ma."fechaMarcacion")>=vi_01 and date(ma."fechaMarcacion")<=vi_02 and dh.aplicar='t' and (dh."diaSemana"='S' and (date_part('dow',ma."fechaMarcacion")=dh."nroDia") or (dh."diaSemana"='D' and EXTRACT(DAY from ma."fechaMarcacion")=dh."nroDia")) and (("time"(ma."fechaMarcacion")>=dh."entHoraInicio" and "time"(ma."fechaMarcacion")<=(dh."salHoraFin" + interval '0 MINUTE') and dh."entDiaInicio"=dh."salDiaFin")) ORDER BY ma."fechaMarcacion" ) as tmp) as tmp2 ORDER BY tmp2.trabajador_id,tmp2."nroTurno",tmp2.fechamarca;
vi_14=(vi_02 - vi_01) + 1;
vi_05=vi_01;
select count(*) into vi_13 from tb_temp_group2;
IF vi_13>=0 THEN
FOR x IN 1..vi_14 LOOP
vi_24=EXTRACT(DAY from vi_05);
if vi_10='S' THEN
vi_25=EXTRACT(DOW FROM vi_05);
ELSE
vi_25=vi_24;
end if;
if STRPOS(vi_09, vi_25::text)>0 THEN
select h_entrada_hor,h_salida_hor,h_entrada,h_salida,c_entrada,c_salida into vi_39,vi_40,vi_41,vi_42,vi_43,vi_44 from tb_temp_group2 where fechamarca=vi_05;
if not vi_41 is null THEN
vi_21=concat(vi_41::TEXT,' (',vi_43,')',' I',vi_06::TEXT);
ELSE
vi_21='SinMarca (F)';
end if;
if not vi_42 is null THEN
vi_22=concat(vi_42::TEXT,' (',vi_44,')',' S',vi_06::TEXT);
ELSE
vi_22='SinMarca (F)';
end if;
if vi_43='A' and vi_44='A' THEN
vi_23='A';
elsif vi_43='T' and vi_44='A' THEN
vi_23='T';
elsif vi_43='A' and vi_44='E' THEN
vi_23='E';
ELSE
vi_23='F';
end if;
ELSE
vi_21='';
vi_22='';
vi_23='DL';
end if;
vi_26=concat('e',vi_24::TEXT);
vi_27=concat('s',vi_24::TEXT);
vi_28=concat('c',vi_24::TEXT);							
execute format('UPDATE conasis."t_asistenciaMesTrabajador" SET %I = %L, %I = %L, %I = %L WHERE id = %s;',vi_26,vi_21,vi_27,vi_22,vi_28,vi_23,vi_20);
vi_05=vi_05 + INTERVAL '1 DAY';
END LOOP;
end if;
DROP TABLE IF EXISTS "tb_temp_group2";
DROP TABLE IF EXISTS "tb_temp_group3";
CREATE TEMPORARY TABLE "tb_temp_group3" ON COMMIT DROP AS select ROW_NUMBER() OVER (ORDER BY tmpz.s_fechaini) AS n,* from (select sl.trabajador_id,'SuspLaboral' as tiposusp,(case when date(sl."fechaHoraInicio")<p_ve_5 then p_ve_5 else date(sl."fechaHoraInicio") end) as s_fechaini,(case when sl."fechaHoraFin" is null or date(sl."fechaHoraFin")>p_ve_6 then p_ve_6 else date(sl."fechaHoraFin") end) as s_fechafin,sl.turno,sl."marcaApli",msl.id as motivosusp_id,msl.abreviatura as codsusp,msl."conGoceHaber" as congoce,msl.asusfal,msl."abreviaturaPers" as codsusppers from conasis."t_suspLabTrabajador" as sl,param."t00_motivosSuspLab" as msl,public."t_altasTrabajadores" as ats where sl."altaTrabajador_id"=ats.id and sl."motivoSuspLab_id"=msl.id and sl.trabajador_id=p_ve_2 and ats."institucionEducativa_id"=p_ve_1 and date(sl."fechaHoraInicio")<=p_ve_6 and (sl."fechaHoraFin" is null or date(sl."fechaHoraFin")>=p_ve_5) and sl.turno=vi_06 UNION select inc.trabajador_id,'SuspLabCITT' as tiposusp,(case when date(inc."fechaInicio")<p_ve_5 then p_ve_5 else date(inc."fechaInicio") end) as s_fechaini,(case when inc."fechaFin" is null or date(inc."fechaFin")>p_ve_6 then p_ve_6 else date(inc."fechaFin") end) as s_fechafin,inc.turno,inc."marcaApli",msl.id as motivosusp_id,msl.abreviatura as codsusp,msl."conGoceHaber" as congoce,msl.asusfal,msl."abreviaturaPers" as codsusppers from conasis."t_incapsTempTrab" as inc,param."t00_motivosSuspLab" as msl,public."t_altasTrabajadores" as ats where inc."altaTrabajador_id"=ats.id and inc."motivoSuspLab_id"=msl.id and inc.trabajador_id=p_ve_2 and ats."institucionEducativa_id"=p_ve_1 and date(inc."fechaInicio")<=p_ve_6 and (inc."fechaFin" is null or date(inc."fechaFin")>=p_ve_5) and inc.turno=vi_06 UNION select jus.trabajador_id,'Justificado' as tiposusp,(case when date(jus."fechaInicio")<p_ve_5 then p_ve_5 else date(jus."fechaInicio") end) as s_fechaini,(case when jus."fechaFin" is null or date(jus."fechaFin")>p_ve_6 then p_ve_6 else date(jus."fechaFin") end) as s_fechafin,jus.turno,jus."marcaApli",msl.id as motivosusp_id,msl.abreviatura as codsusp,msl."conGoceHaber" as congoce,msl.asusfal,msl."abreviaturaPers" as codsusppers from conasis.t_justificaciones as jus,param."t00_motivosSuspLab" as msl,public."t_altasTrabajadores" as ats where jus."altaTrabajador_id"=ats.id and jus."motivoSuspLab_id"=msl.id and jus.trabajador_id=p_ve_2 and ats."institucionEducativa_id"=p_ve_1 and date(jus."fechaInicio")<=p_ve_6 and (jus."fechaFin" is null or date(jus."fechaFin")>=p_ve_5) and jus.turno=vi_06 UNION select exo.trabajador_id,'Exonerado' as tiposusp,(case when date(exo."fechaInicio")<p_ve_5 then p_ve_5 else date(exo."fechaInicio") end) as s_fechaini,(case when exo."fechaFin" is null or date(exo."fechaFin")>p_ve_6 then p_ve_6 else date(exo."fechaFin") end) as s_fechafin,exo.turno,exo."marcaApli",msl.id as motivosusp_id,msl.abreviatura as codsusp,msl."conGoceHaber" as congoce,msl.asusfal,msl."abreviaturaPers" as codsusppers from conasis."t_exoneracionesMarcacion" as exo,param."t00_motivosSuspLab" as msl,public."t_altasTrabajadores" as ats where exo."altaTrabajador_id"=ats.id and exo."motivoSuspLab_id"=msl.id and exo.trabajador_id=p_ve_2 and ats."institucionEducativa_id"=p_ve_1 and date(exo."fechaInicio")<=p_ve_6 and (exo."fechaFin" is null or date(exo."fechaFin")>=p_ve_5) and exo.turno=vi_06 UNION select ats.trabajador_id,'Feriado' as tiposusp,dnl.fecha as s_fechaini, dnl.fecha as s_fechafin,0 as turno,'ES' as "marcaApli",(select msl.id from param."t00_motivosSuspLab" as msl where msl.abreviatura='FER' and msl.activo='t' ORDER BY msl.id desc limit 1) as motivosusp_id,'FER' as codsusp,'t' as congoce,'A' as asusfal,(select msl."abreviaturaPers" from param."t00_motivosSuspLab" as msl where msl.abreviatura='FER' and msl.activo='t' ORDER BY msl.id desc limit 1) as codsusppers from public."t_altasTrabajadores" as ats,conasis."t_diasNoLaborables" as dnl where dnl."institucionEduc_id"=ats."institucionEducativa_id" and ats.trabajador_id=p_ve_2 and ats."institucionEducativa_id"=p_ve_1 and dnl.fecha<=p_ve_6 and dnl.fecha>=p_ve_5 and not EXISTS (select * from conasis."t_feriadoLabTrabajador" as fl where fl.trabajador_id=ats.trabajador_id and fl."altaTrabajador_id"=ats.id and fl."diaNoLaborable_id"=dnl.id) UNION select ats.trabajador_id,'Onomastico' as tiposusp,p."fechaNac" as s_fechaini, p."fechaNac" as s_fechafin,0 as turno,'ES' as "marcaApli",(select msl.id from param."t00_motivosSuspLab" as msl where msl.abreviatura='O' and msl.activo='t' ORDER BY msl.id desc limit 1) as motivosusp_id,'O' as codsusp,'t' as congoce,'A' as asusfal,(select msl."abreviaturaPers" from param."t00_motivosSuspLab" as msl where msl.abreviatura='O' and msl.activo='t' ORDER BY msl.id desc limit 1) as codsusppers from public."t_altasTrabajadores" as ats,public.t_trabajador as t, public.t_personas as p where ats.trabajador_id=p_ve_2 and ats."institucionEducativa_id"=p_ve_1 and ats.trabajador_id=t.id and t.persona_id=p.id and p."fechaNac" IS NOT NULL and concat(trim(to_char(extract(MONTH from p."fechaNac"),'00')),trim(to_char(extract(DAY from p."fechaNac"),'00')))::NUMERIC<=concat(trim(to_char(extract(MONTH from p_ve_6),'00')),trim(to_char(extract(DAY from p_ve_6),'00')))::NUMERIC and concat(trim(to_char(extract(MONTH from p."fechaNac"),'00')),trim(to_char(extract(DAY from p."fechaNac"),'00')))::NUMERIC>=concat(trim(to_char(extract(MONTH from p_ve_5),'00')),trim(to_char(extract(DAY from p_ve_5),'00')))::NUMERIC ORDER BY s_fechaini) as tmpz ORDER BY tmpz.s_fechaini;
select count(*) into vi_13 from tb_temp_group3;
if vi_13>0 THEN
FOR z IN 1..vi_13 LOOP
select tiposusp,s_fechaini,s_fechafin,turno,"marcaApli",motivosusp_id,codsusp,codsusppers,congoce,asusfal into vi_36,vi_03,vi_04,vi_29,vi_30,vi_31,vi_32,vi_33,vi_34,vi_35 from tb_temp_group3 where n=z;	
vi_15=(vi_04 - vi_03) + 1;
vi_05=vi_03;
vi_24=EXTRACT(DAY from vi_05);
FOR y IN 1..vi_15 LOOP
if vi_30='E' THEN
vi_26=concat('e',vi_24::TEXT);
vi_27=concat('s',vi_24::TEXT);					
vi_28=concat('c',vi_24::TEXT);
vi_21=concat(vi_36,' (',vi_32,')',' I',vi_29::TEXT);
execute format('select %I from conasis."t_asistenciaMesTrabajador" where id=%L limit 1;',vi_27,vi_20) into vi_38;
if vi_38 is null THEN
vi_23='F';
elseif STRPOS(vi_38,'%(F)%')>0	THEN
vi_23='F';							
elseif STRPOS(vi_38,'%(E)%')>0	THEN
vi_23='E';
ELSE
vi_23=vi_32;
end if;
execute format('UPDATE conasis."t_asistenciaMesTrabajador" SET %I = %L, %I = %L WHERE id = %s;',vi_26,vi_21,vi_28,vi_23,vi_20);
elseif vi_30='S' THEN
vi_26=concat('e',vi_24::TEXT);
vi_27=concat('s',vi_24::TEXT);					
vi_28=concat('c',vi_24::TEXT);
vi_22=concat(vi_36,' (',vi_32,')',' S',vi_29::TEXT);
execute format('select %I from conasis."t_asistenciaMesTrabajador" where id=%L limit 1;',vi_26,vi_20) into vi_38;
if vi_38 is null THEN
vi_23='F';
elseif STRPOS(vi_38,'%(F)%')>0	THEN
vi_23='F';							
elseif STRPOS(vi_38,'%(T)%')>0	THEN
vi_23='T';
ELSE
vi_23=vi_32;
end if;
execute format('UPDATE conasis."t_asistenciaMesTrabajador" SET %I = %L, %I = %L WHERE id = %s;',vi_27,vi_22,vi_28,vi_23,vi_20);
elseif vi_30='ES' THEN
vi_26=concat('e',vi_24::TEXT);
vi_27=concat('s',vi_24::TEXT);
vi_28=concat('c',vi_24::TEXT);
vi_21=concat(vi_36,' (',vi_32,')',' I',vi_29::TEXT);
vi_22=concat(vi_36,' (',vi_32,')',' S',vi_29::TEXT);
vi_23=vi_32;
execute format('UPDATE conasis."t_asistenciaMesTrabajador" SET %I = %L, %I = %L, %I = %L WHERE id = %s;',vi_26,vi_21,vi_27,vi_22,vi_28,vi_23,vi_20);
end if;			
vi_24=vi_24 + 1;
END LOOP;
if not EXISTS(select * from conasis."t_consolAsistMesTrab" as camt where camt.asistencia_id=vi_18 and camt.turno_id=vi_07 and camt."nroTurno"=vi_29) THEN
insert into conasis."t_consolAsistMesTrab" (asistencia_id,"localInstEduc_id",turno_id,"nroTurno","motivoSuspLab_id",sigla,"siglaPers",ndias,remunerado,asusfal,created_at,created_by,"estadoUltim_id") values (vi_18,vi_19,vi_07,vi_29,vi_31,vi_32,vi_33,0,vi_34,vi_35,CURRENT_TIMESTAMP,p_ve_7,vi_45);
end if;
END LOOP;
end if;
DROP TABLE IF EXISTS "tb_temp_group3";
insert into conasis."t_consolAsistMesTrab" (asistencia_id,"localInstEduc_id",turno_id,"nroTurno","motivoSuspLab_id",sigla,"siglaPers",ndias,remunerado,asusfal,created_at,created_by,"estadoUltim_id") select vi_18 as asistencia_id,vi_19 as "localInstEduc_id",vi_07 as turno_id,vi_06 as "nroTurno", mslx.id as "motivoSuspLab_id",mslx.abreviatura as sigla,mslx."abreviaturaPers" as "siglaPers",0 as ndias,mslx."conGoceHaber" as remunerado,mslx.asusfal as asusfal,CURRENT_TIMESTAMP as created_at,p_ve_7 as created_by,vi_45 as "estadoUltim_id" from param."t00_motivosSuspLab" as mslx where mslx.activo='t' and mslx.abreviatura in ('A','DL','F','T','3T','E','3E');
vi_46=0;
vi_47=0;
FOR d IN 1..31 LOOP
vi_28=concat('c',d::TEXT);
execute format('select %I from conasis."t_asistenciaMesTrabajador" where id=%L and %I is not NULL limit 1;',vi_28,vi_20,vi_28) into vi_37;
if not vi_37 is null and vi_37<>'' THEN
if vi_37='T' THEN
vi_46=vi_46 +1;
if vi_46=3 THEN
vi_37='3T';
vi_46=0;
end if;
end if;
if vi_37='E' THEN
vi_47=vi_47 +1;
if vi_47=3 THEN
vi_37='3E';
vi_47=0;
end if;
end if;
UPDATE conasis."t_consolAsistMesTrab" set ndias=ndias + 1 where asistencia_id=vi_18 and turno_id=vi_07 and "nroTurno"=vi_06 and sigla=vi_37;
if vi_37='3T' or vi_37='3E' THEN
vi_23=vi_37;
else
select "abreviaturaPers" into vi_23 from param."t00_motivosSuspLab" where abreviatura=vi_37 and activo='t' ORDER BY id desc limit 1;
end if;		
execute format('UPDATE conasis."t_asistenciaMesTrabajador" SET %I = %L WHERE id = %s;',vi_28,vi_23,vi_20);
end if;
END LOOP;
END LOOP;
vi_17='OK';	
ELSE
vi_17='NO_HOR';
end if;
DROP TABLE IF EXISTS "tb_temp_group1";
RETURN vi_17;
END $$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cache; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


--
-- Name: cache_locks; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


--
-- Name: failed_jobs; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis.failed_jobs_id_seq OWNED BY conasis.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


--
-- Name: jobs; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis.jobs_id_seq OWNED BY conasis.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis.migrations_id_seq OWNED BY conasis.migrations.id;


--
-- Name: t_ampliaDeduceHoras; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_ampliaDeduceHoras" (
    id bigint NOT NULL,
    trabajador_id bigint NOT NULL,
    "altaTrabajador_id" bigint,
    "marcaApli" character varying(2),
    "fechaInicio" date,
    "fechaFin" date,
    turno smallint,
    "horaIngreso" time(6) without time zone,
    "horaSalida" time(6) without time zone,
    "toleranciaPre" smallint,
    "toleranciaPost" smallint,
    expediente_id bigint,
    observacion character varying(255),
    estado_id smallint,
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_ampliaDeduceHoras_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_ampliaDeduceHoras_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_ampliaDeduceHoras_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_ampliaDeduceHoras_id_seq" OWNED BY conasis."t_ampliaDeduceHoras".id;


--
-- Name: t_asistencia; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis.t_asistencia (
    id bigint NOT NULL,
    "institucionEduc_id" bigint NOT NULL,
    trabajador_id bigint NOT NULL,
    "altaTrabajador_id" bigint NOT NULL,
    anio smallint NOT NULL,
    mes smallint NOT NULL,
    ndias_asis numeric,
    nhoras_crono numeric,
    nhoras_acad numeric,
    ndias_perm numeric,
    nhoras_perm numeric,
    nminu_perm numeric,
    ndias_falt numeric,
    ndias_tarde numeric,
    nhoras_tarde numeric,
    nminu_tarde numeric,
    ndias_extra numeric,
    nhoras_extra numeric,
    nnimu_extra numeric,
    "estadoUltim_id" bigint,
    created_at timestamp(6) without time zone,
    created_by bigint,
    "fechaDesde" date,
    "fechaHasta" date
);


--
-- Name: t_asistenciaMesTrabajador; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_asistenciaMesTrabajador" (
    id bigint NOT NULL,
    asistencia_id bigint NOT NULL,
    "localInstEduc_id" bigint,
    turno_id smallint,
    "nroTurno" smallint,
    created_at timestamp(6) without time zone,
    created_by bigint,
    e1 character varying(30),
    s1 character varying(30),
    c1 character varying(10),
    e2 character varying(30),
    s2 character varying(30),
    c2 character varying(10),
    e3 character varying(30),
    s3 character varying(30),
    c3 character varying(10),
    e4 character varying(30),
    s4 character varying(30),
    c4 character varying(10),
    e5 character varying(30),
    s5 character varying(30),
    c5 character varying(10),
    e6 character varying(30),
    s6 character varying(30),
    c6 character varying(10),
    e7 character varying(30),
    s7 character varying(30),
    c7 character varying(10),
    e8 character varying(30),
    s8 character varying(30),
    c8 character varying(10),
    e9 character varying(30),
    s9 character varying(30),
    c9 character varying(10),
    e10 character varying(30),
    s10 character varying(30),
    c10 character varying(10),
    e11 character varying(30),
    s11 character varying(30),
    c11 character varying(10),
    e12 character varying(30),
    s12 character varying(30),
    c12 character varying(10),
    e13 character varying(30),
    s13 character varying(30),
    c13 character varying(10),
    e14 character varying(30),
    s14 character varying(30),
    c14 character varying(10),
    e15 character varying(30),
    s15 character varying(30),
    c15 character varying(10),
    e16 character varying(30),
    s16 character varying(30),
    c16 character varying(10),
    e17 character varying(30),
    s17 character varying(30),
    c17 character varying(10),
    e18 character varying(30),
    s18 character varying(30),
    c18 character varying(10),
    e19 character varying(30),
    s19 character varying(30),
    c19 character varying(10),
    e20 character varying(30),
    s20 character varying(30),
    c20 character varying(10),
    e21 character varying(30),
    s21 character varying(30),
    c21 character varying(10),
    e22 character varying(30),
    s22 character varying(30),
    c22 character varying(10),
    e23 character varying(30),
    s23 character varying(30),
    c23 character varying(10),
    e24 character varying(30),
    s24 character varying(30),
    c24 character varying(10),
    e25 character varying(30),
    s25 character varying(30),
    c25 character varying(10),
    e26 character varying(30),
    s26 character varying(30),
    c26 character varying(10),
    e27 character varying(30),
    s27 character varying(30),
    c27 character varying(10),
    e28 character varying(30),
    s28 character varying(30),
    c28 character varying(10),
    e29 character varying(30),
    s29 character varying(30),
    c29 character varying(10),
    e30 character varying(30),
    s30 character varying(30),
    c30 character varying(10),
    e31 character varying(30),
    s31 character varying(30),
    c31 character varying(10)
);


--
-- Name: t_asistenciaMesTrabajador_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_asistenciaMesTrabajador_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_asistenciaMesTrabajador_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_asistenciaMesTrabajador_id_seq" OWNED BY conasis."t_asistenciaMesTrabajador".id;


--
-- Name: t_asistencia_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis.t_asistencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_asistencia_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis.t_asistencia_id_seq OWNED BY conasis.t_asistencia.id;


--
-- Name: t_cargaHoraria; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_cargaHoraria" (
    id bigint NOT NULL,
    "horarioCurso_id" bigint NOT NULL,
    trabajador_id bigint NOT NULL,
    "altaTrabajador_id" bigint,
    "fechaInicio" date,
    "fechaFin" date,
    "titularSuplencia" character varying(1),
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_cargaHoraria_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_cargaHoraria_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_cargaHoraria_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_cargaHoraria_id_seq" OWNED BY conasis."t_cargaHoraria".id;


--
-- Name: t_consolAsistMesTrab; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_consolAsistMesTrab" (
    id bigint NOT NULL,
    asistencia_id bigint,
    "motivoSuspLab_id" smallint,
    sigla character varying(5),
    ndias numeric,
    remunerado boolean,
    "localInstEduc_id" bigint,
    asusfal character varying(1),
    aniopla smallint,
    mespla smallint,
    ndiaspla numeric,
    created_at timestamp(6) without time zone,
    created_by bigint,
    createdenv_at timestamp(6) without time zone,
    createdenv_by bigint,
    "estadoUltim_id" bigint,
    "siglaPers" character varying(5),
    turno_id smallint,
    "nroTurno" smallint
);


--
-- Name: t_consolAsistMesTrab_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_consolAsistMesTrab_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_consolAsistMesTrab_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_consolAsistMesTrab_id_seq" OWNED BY conasis."t_consolAsistMesTrab".id;


--
-- Name: t_controladoresLocales; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_controladoresLocales" (
    id bigint NOT NULL,
    "localInstEduc_id" bigint NOT NULL,
    user_id bigint,
    trabajador_id bigint,
    "altaTrabajador_id" bigint,
    "fechaInicio" date,
    "fechaFin" date,
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_controladoresLocales_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_controladoresLocales_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_controladoresLocales_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_controladoresLocales_id_seq" OWNED BY conasis."t_controladoresLocales".id;


--
-- Name: t_detalleHorarios; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_detalleHorarios" (
    id bigint NOT NULL,
    "horarioTrabajador_id" bigint NOT NULL,
    turno_id smallint,
    "nombreTurno" character varying(100),
    "nroTurno" smallint,
    "diaSemana" character varying(1),
    "nroDia" smallint,
    "horarioCursoIni_id" bigint,
    "entDiaInicio" smallint,
    "entDiaFin" smallint,
    "entHoraInicio" time(6) without time zone,
    "entHoraFin" time(6) without time zone,
    "entTolerancia" smallint,
    "horarioCursoFin_id" bigint,
    "salDiaInicio" smallint,
    "salDiaFin" smallint,
    "salHoraInicio" time(6) without time zone,
    "salHoraFin" time(6) without time zone,
    "salTolerancia" smallint,
    "horaAcumula" numeric,
    aplicar boolean,
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_detalleHorarios_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_detalleHorarios_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_detalleHorarios_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_detalleHorarios_id_seq" OWNED BY conasis."t_detalleHorarios".id;


--
-- Name: t_diasNoLaborables; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_diasNoLaborables" (
    id bigint NOT NULL,
    feriado_id smallint,
    fecha date,
    observacion character varying(200),
    "nacionalLocal" character varying(1),
    recuperable character varying(1),
    created_at timestamp(6) without time zone,
    created_by bigint,
    activo boolean,
    "institucionEduc_id" bigint
);


--
-- Name: t_diasNoLaborables_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_diasNoLaborables_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_diasNoLaborables_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_diasNoLaborables_id_seq" OWNED BY conasis."t_diasNoLaborables".id;


--
-- Name: t_dispositivosMarca; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_dispositivosMarca" (
    id bigint NOT NULL,
    "telefonoMovil_id" bigint NOT NULL,
    "fechaInicio" date,
    "fechaFin" date,
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_dispositivosMarca_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_dispositivosMarca_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_dispositivosMarca_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_dispositivosMarca_id_seq" OWNED BY conasis."t_dispositivosMarca".id;


--
-- Name: t_documentosTram; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_documentosTram" (
    id bigint NOT NULL,
    expediente_id bigint,
    documento_id bigint,
    "nroDoc" character varying(150),
    "fechaDoc" date,
    "trabajadorDoc_id" bigint,
    "rutaDoc" character varying(255),
    observacion character varying(255),
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_documentosTram_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_documentosTram_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_documentosTram_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_documentosTram_id_seq" OWNED BY conasis."t_documentosTram".id;


--
-- Name: t_estadosAsistencia; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_estadosAsistencia" (
    id bigint NOT NULL,
    asistencia_id bigint NOT NULL,
    "estadoAsis_id" bigint NOT NULL,
    observacion character varying(255),
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_estadosAsistencia_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_estadosAsistencia_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_estadosAsistencia_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_estadosAsistencia_id_seq" OWNED BY conasis."t_estadosAsistencia".id;


--
-- Name: t_exoneracionesMarcacion; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_exoneracionesMarcacion" (
    id bigint NOT NULL,
    trabajador_id bigint NOT NULL,
    "altaTrabajador_id" bigint,
    "fechaInicio" date,
    "fechaFin" date,
    turno smallint,
    "marcaApli" character varying(2),
    observacion character varying(255),
    expediente_id bigint,
    created_at timestamp(6) without time zone,
    created_by bigint,
    "motivoSuspLab_id" smallint
);


--
-- Name: t_exoneracionesMarcacion_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_exoneracionesMarcacion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_exoneracionesMarcacion_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_exoneracionesMarcacion_id_seq" OWNED BY conasis."t_exoneracionesMarcacion".id;


--
-- Name: t_expediente; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis.t_expediente (
    id bigint NOT NULL,
    codigo character varying(30),
    anio smallint,
    trabajador_id bigint,
    asunto character varying(255),
    fecha date,
    observacion character varying(255),
    estado_id smallint,
    created_at timestamp(6) without time zone,
    created_by bigint,
    "tipoExpediente" character varying(1),
    "altaTrabajador_id" bigint
);


--
-- Name: t_expediente_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis.t_expediente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_expediente_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis.t_expediente_id_seq OWNED BY conasis.t_expediente.id;


--
-- Name: t_feriadoLabTrabajador; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_feriadoLabTrabajador" (
    id bigint NOT NULL,
    "diaNoLaborable_id" bigint NOT NULL,
    trabajador_id bigint NOT NULL,
    "altaTrabajador_id" bigint,
    "fechaInicio" date,
    "fechaFin" date,
    observacion character varying(255),
    expediente_id bigint,
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_feriadoLabTrabajador_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_feriadoLabTrabajador_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_feriadoLabTrabajador_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_feriadoLabTrabajador_id_seq" OWNED BY conasis."t_feriadoLabTrabajador".id;


--
-- Name: t_horariosCursos; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_horariosCursos" (
    id bigint NOT NULL,
    anio smallint,
    seccion_id bigint,
    curso_id bigint,
    "diaSemana" character varying(1),
    "nroDia" smallint,
    "horaInicio" time(6) without time zone,
    "horaFin" time(6) without time zone,
    "minAcum" numeric,
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_horariosCursos_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_horariosCursos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_horariosCursos_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_horariosCursos_id_seq" OWNED BY conasis."t_horariosCursos".id;


--
-- Name: t_horariosTrabajador; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_horariosTrabajador" (
    id bigint NOT NULL,
    codigo character varying(30),
    anio smallint,
    "institucionEduc_id" bigint,
    trabajador_id bigint NOT NULL,
    "altaTrabajador_id" bigint,
    "tipoHorario" character varying(1),
    nombre character varying(100),
    "fechaInicio" date,
    "fechaFin" date,
    created_at timestamp(6) without time zone,
    created_by bigint,
    archivado boolean,
    activo boolean
);


--
-- Name: COLUMN "t_horariosTrabajador"."tipoHorario"; Type: COMMENT; Schema: conasis; Owner: -
--

COMMENT ON COLUMN conasis."t_horariosTrabajador"."tipoHorario" IS 'A: Administrativo D:docente';


--
-- Name: t_horariosTrabajador_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_horariosTrabajador_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_horariosTrabajador_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_horariosTrabajador_id_seq" OWNED BY conasis."t_horariosTrabajador".id;


--
-- Name: t_incapsTempTrab; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_incapsTempTrab" (
    id bigint NOT NULL,
    trabajador_id bigint NOT NULL,
    "altaTrabajador_id" bigint,
    "motivoSuspLab_id" smallint,
    "condicionSubsidio" character varying(5),
    turno smallint,
    "marcaApli" character varying(2),
    "fechaInicio" date,
    "fechaFin" date,
    "nroDias" numeric,
    "nroCertificado" character varying(50),
    observacion character varying(255),
    expediente_id bigint,
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_incapsTempTrab_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_incapsTempTrab_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_incapsTempTrab_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_incapsTempTrab_id_seq" OWNED BY conasis."t_incapsTempTrab".id;


--
-- Name: t_justificaciones; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis.t_justificaciones (
    id bigint NOT NULL,
    trabajador_id bigint NOT NULL,
    "altaTrabajador_id" bigint,
    turno smallint,
    "fechaInicio" date,
    "fechaFin" date,
    "marcaApli" character varying(2),
    expediente_id bigint,
    observacion character varying(255),
    created_at timestamp(6) without time zone,
    created_by bigint,
    "motivoSuspLab_id" smallint
);


--
-- Name: t_justificaciones_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis.t_justificaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_justificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis.t_justificaciones_id_seq OWNED BY conasis.t_justificaciones.id;


--
-- Name: t_locales; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis.t_locales (
    id bigint NOT NULL,
    nombre character varying(200),
    domicilio character varying(200),
    zona_id bigint,
    ubigeo character varying(20),
    utm_huso numeric,
    utm_banda character varying(10),
    utm_x_este numeric,
    utm_y_norte numeric,
    created_at timestamp(6) without time zone,
    created_by bigint,
    activo boolean
);


--
-- Name: t_localesInstEduc; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_localesInstEduc" (
    id bigint NOT NULL,
    local_id bigint,
    entidad_id bigint,
    "institucionEduc_id" bigint,
    "fechaInicio" date,
    "fechaFin" date,
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_localesInstEduc_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_localesInstEduc_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_localesInstEduc_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_localesInstEduc_id_seq" OWNED BY conasis."t_localesInstEduc".id;


--
-- Name: t_localesMarcacion; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_localesMarcacion" (
    id bigint NOT NULL,
    trabajador_id bigint NOT NULL,
    "altaTrabajador_id" bigint,
    "localInstEduc_id" bigint,
    "fechaInicio" date,
    "fechaFin" date,
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_localesMarcacion_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_localesMarcacion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_localesMarcacion_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_localesMarcacion_id_seq" OWNED BY conasis."t_localesMarcacion".id;


--
-- Name: t_locales_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis.t_locales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis.t_locales_id_seq OWNED BY conasis.t_locales.id;


--
-- Name: t_marcaciones; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis.t_marcaciones (
    id bigint NOT NULL,
    trabajador_id bigint NOT NULL,
    "altaTrabajador_id" bigint,
    "localMarcacion_id" bigint,
    codigo character varying(20),
    "fechaMarcacion" timestamp(6) without time zone,
    "fechaRegistro" timestamp(6) without time zone,
    reloj_id bigint,
    tipo character varying(1),
    "medioMarcacion" character varying(1),
    procesado boolean,
    "dispositivoMarca_id" bigint,
    utm_huso numeric,
    utm_base character varying(10),
    utm_x_este numeric,
    utm_y_norte numeric,
    created_at timestamp(6) without time zone,
    created_by bigint
);


--
-- Name: t_marcaciones_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis.t_marcaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_marcaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis.t_marcaciones_id_seq OWNED BY conasis.t_marcaciones.id;


--
-- Name: t_mobileBiometricCredentials; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_mobileBiometricCredentials" (
    id bigint NOT NULL,
    trabajador_id bigint NOT NULL,
    face_status character varying(20) DEFAULT 'pending'::character varying NOT NULL,
    face_template character varying(64),
    face_threshold smallint DEFAULT 12 NOT NULL,
    face_embedding jsonb,
    face_similarity_threshold numeric(6,4) DEFAULT 0.6000 NOT NULL,
    face_enrolled_at timestamp without time zone,
    face_approved_at timestamp without time zone,
    local_biometric_enabled boolean DEFAULT false NOT NULL,
    local_biometric_enabled_at timestamp without time zone,
    failed_attempts smallint DEFAULT 0 NOT NULL,
    last_face_distance smallint,
    last_face_similarity numeric(6,4),
    blocked_until timestamp without time zone,
    last_verified_at timestamp without time zone,
    created_by bigint,
    updated_by bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    CONSTRAINT t_mobilebiometriccredentials_face_status_check CHECK (((face_status)::text = ANY (ARRAY[('pending'::character varying)::text, ('approved'::character varying)::text, ('blocked'::character varying)::text])))
);


--
-- Name: t_mobileBiometricCredentials_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_mobileBiometricCredentials_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_mobileBiometricCredentials_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_mobileBiometricCredentials_id_seq" OWNED BY conasis."t_mobileBiometricCredentials".id;


--
-- Name: t_relojes; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis.t_relojes (
    id integer NOT NULL,
    nombre character varying(200),
    "dreccionIP" character varying(30),
    "direccionMac" character varying(50),
    puerto smallint,
    serie character varying(100),
    "localInstEduc_id" bigint,
    "idBiometrico" bigint,
    created_at timestamp(6) without time zone,
    created_by bigint,
    activo boolean
);


--
-- Name: t_relojes_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis.t_relojes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


--
-- Name: t_relojes_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis.t_relojes_id_seq OWNED BY conasis.t_relojes.id;


--
-- Name: t_suspLabTrabajador; Type: TABLE; Schema: conasis; Owner: -
--

CREATE TABLE conasis."t_suspLabTrabajador" (
    id bigint NOT NULL,
    trabajador_id bigint NOT NULL,
    "altaTrabajador_id" bigint,
    "motivoSuspLab_id" smallint NOT NULL,
    "fechaHoraInicio" timestamp(6) without time zone,
    "fechaHoraFin" timestamp(6) without time zone,
    "fechaRegistro" timestamp(6) without time zone,
    "totalDias" numeric,
    "totalHoras" numeric,
    "marcaApli" character varying(2),
    observacion character varying(255),
    expediente_id bigint,
    created_at timestamp(6) without time zone,
    created_by bigint,
    turno smallint
);


--
-- Name: t_suspLabTrabajador_id_seq; Type: SEQUENCE; Schema: conasis; Owner: -
--

CREATE SEQUENCE conasis."t_suspLabTrabajador_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: t_suspLabTrabajador_id_seq; Type: SEQUENCE OWNED BY; Schema: conasis; Owner: -
--

ALTER SEQUENCE conasis."t_suspLabTrabajador_id_seq" OWNED BY conasis."t_suspLabTrabajador".id;


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.failed_jobs ALTER COLUMN id SET DEFAULT nextval('conasis.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.jobs ALTER COLUMN id SET DEFAULT nextval('conasis.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.migrations ALTER COLUMN id SET DEFAULT nextval('conasis.migrations_id_seq'::regclass);


--
-- Name: t_ampliaDeduceHoras id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_ampliaDeduceHoras" ALTER COLUMN id SET DEFAULT nextval('conasis."t_ampliaDeduceHoras_id_seq"'::regclass);


--
-- Name: t_asistencia id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_asistencia ALTER COLUMN id SET DEFAULT nextval('conasis.t_asistencia_id_seq'::regclass);


--
-- Name: t_asistenciaMesTrabajador id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_asistenciaMesTrabajador" ALTER COLUMN id SET DEFAULT nextval('conasis."t_asistenciaMesTrabajador_id_seq"'::regclass);


--
-- Name: t_cargaHoraria id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_cargaHoraria" ALTER COLUMN id SET DEFAULT nextval('conasis."t_cargaHoraria_id_seq"'::regclass);


--
-- Name: t_consolAsistMesTrab id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_consolAsistMesTrab" ALTER COLUMN id SET DEFAULT nextval('conasis."t_consolAsistMesTrab_id_seq"'::regclass);


--
-- Name: t_controladoresLocales id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_controladoresLocales" ALTER COLUMN id SET DEFAULT nextval('conasis."t_controladoresLocales_id_seq"'::regclass);


--
-- Name: t_detalleHorarios id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_detalleHorarios" ALTER COLUMN id SET DEFAULT nextval('conasis."t_detalleHorarios_id_seq"'::regclass);


--
-- Name: t_diasNoLaborables id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_diasNoLaborables" ALTER COLUMN id SET DEFAULT nextval('conasis."t_diasNoLaborables_id_seq"'::regclass);


--
-- Name: t_dispositivosMarca id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_dispositivosMarca" ALTER COLUMN id SET DEFAULT nextval('conasis."t_dispositivosMarca_id_seq"'::regclass);


--
-- Name: t_documentosTram id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_documentosTram" ALTER COLUMN id SET DEFAULT nextval('conasis."t_documentosTram_id_seq"'::regclass);


--
-- Name: t_estadosAsistencia id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_estadosAsistencia" ALTER COLUMN id SET DEFAULT nextval('conasis."t_estadosAsistencia_id_seq"'::regclass);


--
-- Name: t_exoneracionesMarcacion id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_exoneracionesMarcacion" ALTER COLUMN id SET DEFAULT nextval('conasis."t_exoneracionesMarcacion_id_seq"'::regclass);


--
-- Name: t_expediente id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_expediente ALTER COLUMN id SET DEFAULT nextval('conasis.t_expediente_id_seq'::regclass);


--
-- Name: t_feriadoLabTrabajador id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_feriadoLabTrabajador" ALTER COLUMN id SET DEFAULT nextval('conasis."t_feriadoLabTrabajador_id_seq"'::regclass);


--
-- Name: t_horariosCursos id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_horariosCursos" ALTER COLUMN id SET DEFAULT nextval('conasis."t_horariosCursos_id_seq"'::regclass);


--
-- Name: t_horariosTrabajador id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_horariosTrabajador" ALTER COLUMN id SET DEFAULT nextval('conasis."t_horariosTrabajador_id_seq"'::regclass);


--
-- Name: t_incapsTempTrab id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_incapsTempTrab" ALTER COLUMN id SET DEFAULT nextval('conasis."t_incapsTempTrab_id_seq"'::regclass);


--
-- Name: t_justificaciones id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_justificaciones ALTER COLUMN id SET DEFAULT nextval('conasis.t_justificaciones_id_seq'::regclass);


--
-- Name: t_locales id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_locales ALTER COLUMN id SET DEFAULT nextval('conasis.t_locales_id_seq'::regclass);


--
-- Name: t_localesInstEduc id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_localesInstEduc" ALTER COLUMN id SET DEFAULT nextval('conasis."t_localesInstEduc_id_seq"'::regclass);


--
-- Name: t_localesMarcacion id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_localesMarcacion" ALTER COLUMN id SET DEFAULT nextval('conasis."t_localesMarcacion_id_seq"'::regclass);


--
-- Name: t_marcaciones id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_marcaciones ALTER COLUMN id SET DEFAULT nextval('conasis.t_marcaciones_id_seq'::regclass);


--
-- Name: t_mobileBiometricCredentials id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_mobileBiometricCredentials" ALTER COLUMN id SET DEFAULT nextval('conasis."t_mobileBiometricCredentials_id_seq"'::regclass);


--
-- Name: t_relojes id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_relojes ALTER COLUMN id SET DEFAULT nextval('conasis.t_relojes_id_seq'::regclass);


--
-- Name: t_suspLabTrabajador id; Type: DEFAULT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_suspLabTrabajador" ALTER COLUMN id SET DEFAULT nextval('conasis."t_suspLabTrabajador_id_seq"'::regclass);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis.migrations (id, migration, batch) FROM stdin;
1	0000_00_00_000000_create_schemas	1
2	2026_06_03_000001_make_zona_id_nullable_in_t_domicilios	2
3	2026_06_11_000001_add_entidad_ugel_to_usuario_perfil_ie	3
4	2026_06_11_000002_add_institucionEduc_id_to_t_diasNoLaborables	4
5	2026_06_26_000001_add_tipoExpediente_to_t_expediente	5
6	2026_06_26_000002_add_altaTrabajador_to_t_expediente	5
7	2026_06_30_000001_fix_director_ie_permisos	6
8	2026_06_30_000002_fix_docente_permisos	7
9	2026_07_01_000001_add_resolvedBy_to_t00_motivosSuspLab	8
10	2026_07_10_000001_add_motivoSuspLab_id_to_justificaciones_y_exoneraciones	9
11	2026_07_10_000001_rename_resolvedBy_to_autorizadoPor_in_t00_motivosSuspLab	10
12	2026_07_10_000002_add_turno_fechas_to_susplab_asistencia	11
13	2026_07_13_160912_add_turno_nro_turno_to_t_consol_asist_mes_trab	12
\.


--
-- Data for Name: t_ampliaDeduceHoras; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_ampliaDeduceHoras" (id, trabajador_id, "altaTrabajador_id", "marcaApli", "fechaInicio", "fechaFin", turno, "horaIngreso", "horaSalida", "toleranciaPre", "toleranciaPost", expediente_id, observacion, estado_id, created_at, created_by) FROM stdin;
\.


--
-- Data for Name: t_asistencia; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis.t_asistencia (id, "institucionEduc_id", trabajador_id, "altaTrabajador_id", anio, mes, ndias_asis, nhoras_crono, nhoras_acad, ndias_perm, nhoras_perm, nminu_perm, ndias_falt, ndias_tarde, nhoras_tarde, nminu_tarde, ndias_extra, nhoras_extra, nnimu_extra, "estadoUltim_id", created_at, created_by, "fechaDesde", "fechaHasta") FROM stdin;
8	1	2	2	2026	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	2026-07-13 21:10:14.956968	1	2026-05-01	2026-05-31
\.


--
-- Data for Name: t_asistenciaMesTrabajador; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_asistenciaMesTrabajador" (id, asistencia_id, "localInstEduc_id", turno_id, "nroTurno", created_at, created_by, e1, s1, c1, e2, s2, c2, e3, s3, c3, e4, s4, c4, e5, s5, c5, e6, s6, c6, e7, s7, c7, e8, s8, c8, e9, s9, c9, e10, s10, c10, e11, s11, c11, e12, s12, c12, e13, s13, c13, e14, s14, c14, e15, s15, c15, e16, s16, c16, e17, s17, c17, e18, s18, c18, e19, s19, c19, e20, s20, c20, e21, s21, c21, e22, s22, c22, e23, s23, c23, e24, s24, c24, e25, s25, c25, e26, s26, c26, e27, s27, c27, e28, s28, c28, e29, s29, c29, e30, s30, c30, e31, s31, c31) FROM stdin;
8	8	1	1	1	2026-07-13 21:10:14.956968	1	Feriado (FER) I0	Feriado (FER) S0	J			 			 			 			 	SinMarca (F)	SinMarca (F)	I			 	SinMarca (F)	SinMarca (F)	I			 			 			 			 	SinMarca (F)	SinMarca (F)	I			 	SinMarca (F)	SinMarca (F)	I			 			 			 			 	SinMarca (F)	SinMarca (F)	I			 	SinMarca (F)	SinMarca (F)	I			 			 			 			 	SinMarca (F)	SinMarca (F)	I			 	SinMarca (F)	SinMarca (F)	I			 			 
\.


--
-- Data for Name: t_cargaHoraria; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_cargaHoraria" (id, "horarioCurso_id", trabajador_id, "altaTrabajador_id", "fechaInicio", "fechaFin", "titularSuplencia", created_at, created_by) FROM stdin;
1	1	3	\N	2026-07-01	2026-07-31	T	\N	1
2	2	1	1	2026-03-01	2026-12-21	T	2026-05-05 00:00:00	1
3	3	1	1	2026-03-01	2026-12-21	T	2026-05-05 00:00:00	1
4	4	1	1	2026-03-01	2026-12-21	T	2026-05-05 00:00:00	1
5	5	2	2	2026-03-01	2026-12-21	T	2026-05-05 00:00:00	1
6	6	5	5	2026-03-01	2026-12-21	T	2026-05-05 00:00:00	1
7	7	3	\N	2026-07-01	2026-07-31	T	\N	1
\.


--
-- Data for Name: t_consolAsistMesTrab; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_consolAsistMesTrab" (id, asistencia_id, "motivoSuspLab_id", sigla, ndias, remunerado, "localInstEduc_id", asusfal, aniopla, mespla, ndiaspla, created_at, created_by, createdenv_at, createdenv_by, "estadoUltim_id", "siglaPers", turno_id, "nroTurno") FROM stdin;
1	8	4	FER	0	t	1	A	\N	\N	\N	2026-07-13 21:10:14.956968	1	\N	\N	8	J	1	0
3	8	1	A	0	t	1	A	\N	\N	\N	2026-07-13 21:10:14.956968	1	\N	\N	8	A	1	1
5	8	23	T	0	t	1	A	\N	\N	\N	2026-07-13 21:10:14.956968	1	\N	\N	8	T	1	1
6	8	24	3T	0	f	1	F	\N	\N	\N	2026-07-13 21:10:14.956968	1	\N	\N	8	3T	1	1
7	8	25	E	0	t	1	A	\N	\N	\N	2026-07-13 21:10:14.956968	1	\N	\N	8	E	1	1
8	8	26	3E	0	t	1	F	\N	\N	\N	2026-07-13 21:10:14.956968	1	\N	\N	8	3E	1	1
4	8	7	F	8	f	1	F	\N	\N	\N	2026-07-13 21:10:14.956968	1	\N	\N	8	I	1	1
2	8	3	DL	22	t	1	A	\N	\N	\N	2026-07-13 21:10:14.956968	1	\N	\N	8	 	1	1
\.


--
-- Data for Name: t_controladoresLocales; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_controladoresLocales" (id, "localInstEduc_id", user_id, trabajador_id, "altaTrabajador_id", "fechaInicio", "fechaFin", created_at, created_by) FROM stdin;
1	1	1	4	4	2026-01-01	\N	2026-05-05 00:00:00	1
\.


--
-- Data for Name: t_detalleHorarios; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_detalleHorarios" (id, "horarioTrabajador_id", turno_id, "nombreTurno", "nroTurno", "diaSemana", "nroDia", "horarioCursoIni_id", "entDiaInicio", "entDiaFin", "entHoraInicio", "entHoraFin", "entTolerancia", "horarioCursoFin_id", "salDiaInicio", "salDiaFin", "salHoraInicio", "salHoraFin", "salTolerancia", "horaAcumula", aplicar, created_at, created_by) FROM stdin;
1	1	1	MAÑANA	1	L	1	1	0	0	08:00:00	08:00:00	10	1	0	0	09:30:00	09:30:00	0	1.5	t	\N	1
2	1	1	MAÑANA	1	S	5	2	1	1	10:30:00	11:00:00	5	2	1	1	12:30:00	13:00:00	0	90	t	2026-05-05 00:00:00	1
3	1	1	MAÑANA	1	S	2	3	1	1	08:30:00	09:00:00	0	3	1	1	09:45:00	10:15:00	0	45	t	2026-05-05 00:00:00	1
4	2	1	MAÑANA	1	S	3	5	1	1	10:00:00	10:45:00	0	5	1	1	11:30:00	12:00:00	0	45	t	2026-05-05 00:00:00	1
5	2	1	MAÑANA	1	S	5	6	1	1	08:30:00	09:00:00	0	6	1	1	10:00:00	10:30:00	0	60	t	2026-05-05 00:00:00	1
6	3	1	MAÑANA	1	L	1	7	0	0	08:00:00	08:00:00	10	7	0	0	09:30:00	09:30:00	0	1.5	t	\N	1
\.


--
-- Data for Name: t_diasNoLaborables; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_diasNoLaborables" (id, feriado_id, fecha, observacion, "nacionalLocal", recuperable, created_at, created_by, activo, "institucionEduc_id") FROM stdin;
1	1	2026-01-01	01 AÑO NUEVO (Dia: 01 Ene)	N	N	\N	1	t	1
2	2	2026-04-17	02 SEMANA SANTA (Dia: NoEsp)	N	N	\N	1	t	1
3	3	2026-05-01	03 DIA DEL TRABAJO (Dia: 01 May)	N	N	\N	1	t	1
4	4	2026-06-07	04 BATALLA DE ARICA Y DIA DE LA BANDERA (Dia: 07 Jun)	N	N	\N	1	t	1
5	5	2026-06-29	05 SAN PEDRO Y SAN PABLO (Dia: 29 Jun)	N	N	\N	1	t	1
6	6	2026-07-23	06 DIA DE LA FUERZA AEREA DEL PERU (Dia: 23 Jul)	N	N	\N	1	t	1
7	7	2026-07-28	07 FIESTAS PATRIAS (Dia: 28-29 Jul)	N	N	\N	1	t	1
8	8	2026-08-06	08 BATALLA DE JUNIN (Dia: 06 Ago)	N	N	\N	1	t	1
9	9	2026-08-30	09 SANTA ROSA DE LIMA (Dia: 30 Ago)	N	N	\N	1	t	1
10	10	2026-10-08	10 COMBATE DE ANGAMOS (Dia: 08 Oct)	N	N	\N	1	t	1
11	11	2026-11-01	11 DIA DE TODOS LOS SANTOS (Dia: 01 Nov)	N	N	\N	1	t	1
12	12	2026-12-08	12 INMACULADA CONCEPCION (Dia: 08 Dic)	N	N	\N	1	t	1
13	13	2026-12-09	13 BATALLA DE AYACUCHO (Dia: 09 Dic)	N	N	\N	1	t	1
14	14	2026-12-25	14 NAVIDAD (Dia: 25 Dic)	N	N	\N	1	t	1
\.


--
-- Data for Name: t_dispositivosMarca; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_dispositivosMarca" (id, "telefonoMovil_id", "fechaInicio", "fechaFin", created_at, created_by) FROM stdin;
\.


--
-- Data for Name: t_documentosTram; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_documentosTram" (id, expediente_id, documento_id, "nroDoc", "fechaDoc", "trabajadorDoc_id", "rutaDoc", observacion, created_at, created_by) FROM stdin;
1	1	2	123	2026-07-01	3	expedientes/2026/EXP00001_doc1_EUo4p9.pdf	\N	\N	3
2	2	2	123456	2026-07-02	3	expedientes/2026/EXP00002_doc1_oMOd7s.pdf	\N	\N	1
3	3	13	123485	2026-07-03	3	expedientes/2026/EXP00003_doc1_64j9RB.pdf	\N	\N	1
\.


--
-- Data for Name: t_estadosAsistencia; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_estadosAsistencia" (id, asistencia_id, "estadoAsis_id", observacion, created_at, created_by) FROM stdin;
8	8	1	Planilla de asistencia creada	2026-07-13 21:10:14.956968	1
\.


--
-- Data for Name: t_exoneracionesMarcacion; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_exoneracionesMarcacion" (id, trabajador_id, "altaTrabajador_id", "fechaInicio", "fechaFin", turno, "marcaApli", observacion, expediente_id, created_at, created_by, "motivoSuspLab_id") FROM stdin;
\.


--
-- Data for Name: t_expediente; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis.t_expediente (id, codigo, anio, trabajador_id, asunto, fecha, observacion, estado_id, created_at, created_by, "tipoExpediente", "altaTrabajador_id") FROM stdin;
1	EXP00001	2026	3	JUSTIFICACION DE EJEMPLO	2026-07-01	\N	2	\N	3	J	2
2	EXP00002	2026	3	SUSPESNECION EJEMPLO (SUSPENCION)	2026-07-09	\N	4	\N	1	S	2
3	EXP00003	2026	3	EJEMPLO DE SUS 2	2026-07-02	\N	4	\N	1	S	2
\.


--
-- Data for Name: t_feriadoLabTrabajador; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_feriadoLabTrabajador" (id, "diaNoLaborable_id", trabajador_id, "altaTrabajador_id", "fechaInicio", "fechaFin", observacion, expediente_id, created_at, created_by) FROM stdin;
\.


--
-- Data for Name: t_horariosCursos; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_horariosCursos" (id, anio, seccion_id, curso_id, "diaSemana", "nroDia", "horaInicio", "horaFin", "minAcum", created_at, created_by) FROM stdin;
1	2026	1	1	L	1	08:00:00	09:30:00	90	\N	1
2	2026	1	1	S	5	11:00:00	12:30:00	90	2026-05-05 00:00:00	1
3	2026	2	1	S	2	09:00:00	09:45:00	45	2026-05-05 00:00:00	1
4	2026	2	1	S	4	08:00:00	09:30:00	90	2026-05-05 00:00:00	1
5	2026	5	2	S	3	10:45:00	11:30:00	45	2026-05-05 00:00:00	1
6	2026	5	2	S	5	09:00:00	10:00:00	60	2026-05-05 00:00:00	1
7	2026	9	7	L	1	08:00:00	09:30:00	90	\N	1
\.


--
-- Data for Name: t_horariosTrabajador; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_horariosTrabajador" (id, codigo, anio, "institucionEduc_id", trabajador_id, "altaTrabajador_id", "tipoHorario", nombre, "fechaInicio", "fechaFin", created_at, created_by, archivado, activo) FROM stdin;
1	HOR00001	2026	1	3	2	1	Horario del Docente 2026	\N	\N	\N	1	f	t
2	H00002	2026	1	2	2	D	HORARIO DOCENTE	2026-03-01	2026-12-21	2026-05-05 00:00:00	1	t	t
3	HOR00002	2026	2	3	8	1	Horario del Docente 2026	\N	\N	\N	1	f	t
\.


--
-- Data for Name: t_incapsTempTrab; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_incapsTempTrab" (id, trabajador_id, "altaTrabajador_id", "motivoSuspLab_id", "condicionSubsidio", turno, "marcaApli", "fechaInicio", "fechaFin", "nroDias", "nroCertificado", observacion, expediente_id, created_at, created_by) FROM stdin;
\.


--
-- Data for Name: t_justificaciones; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis.t_justificaciones (id, trabajador_id, "altaTrabajador_id", turno, "fechaInicio", "fechaFin", "marcaApli", expediente_id, observacion, created_at, created_by, "motivoSuspLab_id") FROM stdin;
\.


--
-- Data for Name: t_locales; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis.t_locales (id, nombre, domicilio, zona_id, ubigeo, utm_huso, utm_banda, utm_x_este, utm_y_norte, created_at, created_by, activo) FROM stdin;
1	LOCAL CHONTAPACCHA	JR. COMERCIO N° 145	1	060101	17	M	773449.78	9208552.04	2026-05-05 00:00:00	1	t
2	LOCAL LA RECOLETA	JR. SILVASANTISTEBAN N° 876	1	060101	17	M	774743.17	9207666.10	2026-05-05 00:00:00	1	t
3	LOCAL EL PENAL	SECTOR MOLLEPAMPA	2	060101	17	M	775485.20	9206457.15	2026-05-05 00:00:00	1	t
4	LOCAL SAN FERNANDO	AV. VIA DE EVITAMIENTO SUR N° 567	3	060101	17	M	773125.20	9208245.18	2026-05-05 00:00:00	1	t
\.


--
-- Data for Name: t_localesInstEduc; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_localesInstEduc" (id, local_id, entidad_id, "institucionEduc_id", "fechaInicio", "fechaFin", created_at, created_by) FROM stdin;
1	1	\N	1	2026-01-01	\N	2026-05-05 00:00:00	1
2	2	\N	2	2026-01-01	\N	2026-05-05 00:00:00	1
3	3	\N	4	2026-01-01	\N	2026-05-05 00:00:00	1
4	4	\N	5	2026-01-01	\N	2026-05-05 00:00:00	1
\.


--
-- Data for Name: t_localesMarcacion; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_localesMarcacion" (id, trabajador_id, "altaTrabajador_id", "localInstEduc_id", "fechaInicio", "fechaFin", created_at, created_by) FROM stdin;
1	1	1	1	2026-03-01	\N	2026-05-05 00:00:00	1
3	3	3	1	2026-03-01	\N	2026-05-05 00:00:00	1
2	2	2	1	2026-03-01	\N	2026-05-05 00:00:00	1
4	4	4	1	2026-03-01	\N	2026-05-05 00:00:00	1
5	5	5	2	2026-03-01	\N	2026-05-05 00:00:00	1
6	3	8	2	2026-07-01	2026-07-31	\N	1
\.


--
-- Data for Name: t_marcaciones; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis.t_marcaciones (id, trabajador_id, "altaTrabajador_id", "localMarcacion_id", codigo, "fechaMarcacion", "fechaRegistro", reloj_id, tipo, "medioMarcacion", procesado, "dispositivoMarca_id", utm_huso, utm_base, utm_x_este, utm_y_norte, created_at, created_by) FROM stdin;
1	1	1	1	11111111	2026-05-05 08:01:15	2026-05-05 08:01:15	\N	A	M	f	\N	17	M	773441.78	9208551.04	2026-05-05 00:00:00	1
2	1	1	1	11111111	2026-05-05 09:40:17	2026-05-05 09:40:17	\N	A	M	f	\N	17	M	773441.78	9208551.04	2026-05-05 00:00:00	1
3	1	1	1	11111111	2026-05-05 09:41:17	2026-05-05 09:41:17	\N	A	M	f	\N	17	M	773441.78	9208551.04	2026-05-05 00:00:00	1
\.


--
-- Data for Name: t_mobileBiometricCredentials; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_mobileBiometricCredentials" (id, trabajador_id, face_status, face_template, face_threshold, face_embedding, face_similarity_threshold, face_enrolled_at, face_approved_at, local_biometric_enabled, local_biometric_enabled_at, failed_attempts, last_face_distance, last_face_similarity, blocked_until, last_verified_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	3	pending	\N	12	\N	0.6000	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	2026-07-12 03:28:19	2026-07-12 03:28:19
\.


--
-- Data for Name: t_relojes; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis.t_relojes (id, nombre, "dreccionIP", "direccionMac", puerto, serie, "localInstEduc_id", "idBiometrico", created_at, created_by, activo) FROM stdin;
\.


--
-- Data for Name: t_suspLabTrabajador; Type: TABLE DATA; Schema: conasis; Owner: -
--

COPY conasis."t_suspLabTrabajador" (id, trabajador_id, "altaTrabajador_id", "motivoSuspLab_id", "fechaHoraInicio", "fechaHoraFin", "fechaRegistro", "totalDias", "totalHoras", "marcaApli", observacion, expediente_id, created_at, created_by, turno) FROM stdin;
1	3	2	21	2026-07-01 23:58:00	2026-07-10 23:58:00	\N	9	216	\N	\N	2	\N	1	\N
2	3	2	21	2026-07-02 00:12:00	2026-07-19 00:12:00	\N	17	408	\N	\N	3	\N	1	\N
\.


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis.migrations_id_seq', 13, true);


--
-- Name: t_ampliaDeduceHoras_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_ampliaDeduceHoras_id_seq"', 1, false);


--
-- Name: t_asistenciaMesTrabajador_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_asistenciaMesTrabajador_id_seq"', 8, true);


--
-- Name: t_asistencia_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis.t_asistencia_id_seq', 8, true);


--
-- Name: t_cargaHoraria_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_cargaHoraria_id_seq"', 7, true);


--
-- Name: t_consolAsistMesTrab_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_consolAsistMesTrab_id_seq"', 8, true);


--
-- Name: t_controladoresLocales_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_controladoresLocales_id_seq"', 1, true);


--
-- Name: t_detalleHorarios_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_detalleHorarios_id_seq"', 6, true);


--
-- Name: t_diasNoLaborables_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_diasNoLaborables_id_seq"', 14, true);


--
-- Name: t_dispositivosMarca_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_dispositivosMarca_id_seq"', 1, false);


--
-- Name: t_documentosTram_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_documentosTram_id_seq"', 3, true);


--
-- Name: t_estadosAsistencia_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_estadosAsistencia_id_seq"', 8, true);


--
-- Name: t_exoneracionesMarcacion_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_exoneracionesMarcacion_id_seq"', 1, false);


--
-- Name: t_expediente_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis.t_expediente_id_seq', 3, true);


--
-- Name: t_feriadoLabTrabajador_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_feriadoLabTrabajador_id_seq"', 1, false);


--
-- Name: t_horariosCursos_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_horariosCursos_id_seq"', 12, true);


--
-- Name: t_horariosTrabajador_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_horariosTrabajador_id_seq"', 4, true);


--
-- Name: t_incapsTempTrab_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_incapsTempTrab_id_seq"', 1, false);


--
-- Name: t_justificaciones_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis.t_justificaciones_id_seq', 1, false);


--
-- Name: t_localesInstEduc_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_localesInstEduc_id_seq"', 8, true);


--
-- Name: t_localesMarcacion_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_localesMarcacion_id_seq"', 6, true);


--
-- Name: t_locales_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis.t_locales_id_seq', 10, true);


--
-- Name: t_marcaciones_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis.t_marcaciones_id_seq', 3, true);


--
-- Name: t_mobileBiometricCredentials_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_mobileBiometricCredentials_id_seq"', 1, true);


--
-- Name: t_relojes_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis.t_relojes_id_seq', 2, true);


--
-- Name: t_suspLabTrabajador_id_seq; Type: SEQUENCE SET; Schema: conasis; Owner: -
--

SELECT pg_catalog.setval('conasis."t_suspLabTrabajador_id_seq"', 2, true);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: t_ampliaDeduceHoras t_ampliaDeduceHoras_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_ampliaDeduceHoras"
    ADD CONSTRAINT "t_ampliaDeduceHoras_pkey" PRIMARY KEY (id);


--
-- Name: t_asistenciaMesTrabajador t_asistenciaMesTrabajador_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_asistenciaMesTrabajador"
    ADD CONSTRAINT "t_asistenciaMesTrabajador_pkey" PRIMARY KEY (id);


--
-- Name: t_asistencia t_asistencia_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_asistencia
    ADD CONSTRAINT t_asistencia_pkey PRIMARY KEY (id);


--
-- Name: t_cargaHoraria t_cargaHoraria_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_cargaHoraria"
    ADD CONSTRAINT "t_cargaHoraria_pkey" PRIMARY KEY (id);


--
-- Name: t_consolAsistMesTrab t_consolAsistMesTrab_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_consolAsistMesTrab"
    ADD CONSTRAINT "t_consolAsistMesTrab_pkey" PRIMARY KEY (id);


--
-- Name: t_controladoresLocales t_controladoresLocales_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_controladoresLocales"
    ADD CONSTRAINT "t_controladoresLocales_pkey" PRIMARY KEY (id);


--
-- Name: t_detalleHorarios t_detalleHorarios_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_detalleHorarios"
    ADD CONSTRAINT "t_detalleHorarios_pkey" PRIMARY KEY (id);


--
-- Name: t_diasNoLaborables t_diasNoLaborables_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_diasNoLaborables"
    ADD CONSTRAINT "t_diasNoLaborables_pkey" PRIMARY KEY (id);


--
-- Name: t_dispositivosMarca t_dispositivosMarca_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_dispositivosMarca"
    ADD CONSTRAINT "t_dispositivosMarca_pkey" PRIMARY KEY (id);


--
-- Name: t_documentosTram t_documentosTram_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_documentosTram"
    ADD CONSTRAINT "t_documentosTram_pkey" PRIMARY KEY (id);


--
-- Name: t_estadosAsistencia t_estadosAsistencia_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_estadosAsistencia"
    ADD CONSTRAINT "t_estadosAsistencia_pkey" PRIMARY KEY (id);


--
-- Name: t_exoneracionesMarcacion t_exoneracionesMarcacion_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_exoneracionesMarcacion"
    ADD CONSTRAINT "t_exoneracionesMarcacion_pkey" PRIMARY KEY (id);


--
-- Name: t_expediente t_expediente_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_expediente
    ADD CONSTRAINT t_expediente_pkey PRIMARY KEY (id);


--
-- Name: t_feriadoLabTrabajador t_feriadoLabTrabajador_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_feriadoLabTrabajador"
    ADD CONSTRAINT "t_feriadoLabTrabajador_pkey" PRIMARY KEY (id);


--
-- Name: t_horariosCursos t_horariosCursos_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_horariosCursos"
    ADD CONSTRAINT "t_horariosCursos_pkey" PRIMARY KEY (id);


--
-- Name: t_horariosTrabajador t_horariosTrabajador_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_horariosTrabajador"
    ADD CONSTRAINT "t_horariosTrabajador_pkey" PRIMARY KEY (id);


--
-- Name: t_incapsTempTrab t_incapsTempTrab_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_incapsTempTrab"
    ADD CONSTRAINT "t_incapsTempTrab_pkey" PRIMARY KEY (id);


--
-- Name: t_justificaciones t_justificaciones_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_justificaciones
    ADD CONSTRAINT t_justificaciones_pkey PRIMARY KEY (id);


--
-- Name: t_localesInstEduc t_localesInstEduc_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_localesInstEduc"
    ADD CONSTRAINT "t_localesInstEduc_pkey" PRIMARY KEY (id);


--
-- Name: t_localesMarcacion t_localesMarcacion_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_localesMarcacion"
    ADD CONSTRAINT "t_localesMarcacion_pkey" PRIMARY KEY (id);


--
-- Name: t_locales t_locales_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_locales
    ADD CONSTRAINT t_locales_pkey PRIMARY KEY (id);


--
-- Name: t_marcaciones t_marcaciones_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_marcaciones
    ADD CONSTRAINT t_marcaciones_pkey PRIMARY KEY (id);


--
-- Name: t_mobileBiometricCredentials t_mobileBiometricCredentials_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_mobileBiometricCredentials"
    ADD CONSTRAINT "t_mobileBiometricCredentials_pkey" PRIMARY KEY (id);


--
-- Name: t_mobileBiometricCredentials t_mobilebiometriccredentials_trabajador_unique; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_mobileBiometricCredentials"
    ADD CONSTRAINT t_mobilebiometriccredentials_trabajador_unique UNIQUE (trabajador_id);


--
-- Name: t_relojes t_relojes_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_relojes
    ADD CONSTRAINT t_relojes_pkey PRIMARY KEY (id);


--
-- Name: t_suspLabTrabajador t_suspLabTrabajador_pkey; Type: CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_suspLabTrabajador"
    ADD CONSTRAINT "t_suspLabTrabajador_pkey" PRIMARY KEY (id);


--
-- Name: cache_expiration_index; Type: INDEX; Schema: conasis; Owner: -
--

CREATE INDEX cache_expiration_index ON conasis.cache USING btree (expiration);


--
-- Name: cache_locks_expiration_index; Type: INDEX; Schema: conasis; Owner: -
--

CREATE INDEX cache_locks_expiration_index ON conasis.cache_locks USING btree (expiration);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: conasis; Owner: -
--

CREATE INDEX jobs_queue_index ON conasis.jobs USING btree (queue);


--
-- Name: t_diasNoLaborables conasis_t_diasnolaborables_institucioneduc_id_foreign; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_diasNoLaborables"
    ADD CONSTRAINT conasis_t_diasnolaborables_institucioneduc_id_foreign FOREIGN KEY ("institucionEduc_id") REFERENCES public."t_institucionesEduc"(id);


--
-- Name: t_exoneracionesMarcacion conasis_t_exoneracionesmarcacion_motivosusplab_id_foreign; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_exoneracionesMarcacion"
    ADD CONSTRAINT conasis_t_exoneracionesmarcacion_motivosusplab_id_foreign FOREIGN KEY ("motivoSuspLab_id") REFERENCES param."t00_motivosSuspLab"(id);


--
-- Name: t_expediente conasis_t_expediente_altatrabajador_id_foreign; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_expediente
    ADD CONSTRAINT conasis_t_expediente_altatrabajador_id_foreign FOREIGN KEY ("altaTrabajador_id") REFERENCES public."t_altasTrabajadores"(id);


--
-- Name: t_justificaciones conasis_t_justificaciones_motivosusplab_id_foreign; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_justificaciones
    ADD CONSTRAINT conasis_t_justificaciones_motivosusplab_id_foreign FOREIGN KEY ("motivoSuspLab_id") REFERENCES param."t00_motivosSuspLab"(id);


--
-- Name: t_consolAsistMesTrab fk_consolasist_turno; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_consolAsistMesTrab"
    ADD CONSTRAINT fk_consolasist_turno FOREIGN KEY (turno_id) REFERENCES param.t00_turnos(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: t_ampliaDeduceHoras fk_t_ampliaDeduceHoras_t_altasTrabajadores_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_ampliaDeduceHoras"
    ADD CONSTRAINT "fk_t_ampliaDeduceHoras_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES public."t_altasTrabajadores"(id);


--
-- Name: t_ampliaDeduceHoras fk_t_ampliaDeduceHoras_t_expediente_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_ampliaDeduceHoras"
    ADD CONSTRAINT "fk_t_ampliaDeduceHoras_t_expediente_1" FOREIGN KEY (expediente_id) REFERENCES conasis.t_expediente(id);


--
-- Name: t_ampliaDeduceHoras fk_t_ampliaDeduceHoras_t_trabajador_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_ampliaDeduceHoras"
    ADD CONSTRAINT "fk_t_ampliaDeduceHoras_t_trabajador_1" FOREIGN KEY (trabajador_id) REFERENCES public.t_trabajador(id);


--
-- Name: t_asistenciaMesTrabajador fk_t_asistenciaMesTrabajador_t00_turnos_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_asistenciaMesTrabajador"
    ADD CONSTRAINT "fk_t_asistenciaMesTrabajador_t00_turnos_1" FOREIGN KEY (turno_id) REFERENCES param.t00_turnos(id);


--
-- Name: t_asistenciaMesTrabajador fk_t_asistenciaMesTrabajador_t_asistencia_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_asistenciaMesTrabajador"
    ADD CONSTRAINT "fk_t_asistenciaMesTrabajador_t_asistencia_1" FOREIGN KEY (asistencia_id) REFERENCES conasis.t_asistencia(id);


--
-- Name: t_asistenciaMesTrabajador fk_t_asistenciaMesTrabajador_t_localesInstEduc_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_asistenciaMesTrabajador"
    ADD CONSTRAINT "fk_t_asistenciaMesTrabajador_t_localesInstEduc_1" FOREIGN KEY ("localInstEduc_id") REFERENCES conasis."t_localesInstEduc"(id);


--
-- Name: t_asistencia fk_t_asistencia_t_altasTrabajadores_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_asistencia
    ADD CONSTRAINT "fk_t_asistencia_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES public."t_altasTrabajadores"(id);


--
-- Name: t_cargaHoraria fk_t_cargaHoraria_t_altasTrabajadores_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_cargaHoraria"
    ADD CONSTRAINT "fk_t_cargaHoraria_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES public."t_altasTrabajadores"(id);


--
-- Name: t_cargaHoraria fk_t_cargaHoraria_t_horariosCursos_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_cargaHoraria"
    ADD CONSTRAINT "fk_t_cargaHoraria_t_horariosCursos_1" FOREIGN KEY ("horarioCurso_id") REFERENCES conasis."t_horariosCursos"(id);


--
-- Name: t_cargaHoraria fk_t_cargaHoraria_t_trabajador_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_cargaHoraria"
    ADD CONSTRAINT "fk_t_cargaHoraria_t_trabajador_1" FOREIGN KEY (trabajador_id) REFERENCES public.t_trabajador(id);


--
-- Name: t_consolAsistMesTrab fk_t_consolAsistMesTrab_t00_motivosSuspLab_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_consolAsistMesTrab"
    ADD CONSTRAINT "fk_t_consolAsistMesTrab_t00_motivosSuspLab_1" FOREIGN KEY ("motivoSuspLab_id") REFERENCES param."t00_motivosSuspLab"(id);


--
-- Name: t_consolAsistMesTrab fk_t_consolAsistMesTrab_t_asistencia_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_consolAsistMesTrab"
    ADD CONSTRAINT "fk_t_consolAsistMesTrab_t_asistencia_1" FOREIGN KEY (asistencia_id) REFERENCES conasis.t_asistencia(id);


--
-- Name: t_controladoresLocales fk_t_controladoresLocales_t_altasTrabajadores_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_controladoresLocales"
    ADD CONSTRAINT "fk_t_controladoresLocales_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES public."t_altasTrabajadores"(id);


--
-- Name: t_controladoresLocales fk_t_controladoresLocales_t_localesInstEduc_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_controladoresLocales"
    ADD CONSTRAINT "fk_t_controladoresLocales_t_localesInstEduc_1" FOREIGN KEY ("localInstEduc_id") REFERENCES conasis."t_localesInstEduc"(id);


--
-- Name: t_controladoresLocales fk_t_controladoresLocales_t_trabajador_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_controladoresLocales"
    ADD CONSTRAINT "fk_t_controladoresLocales_t_trabajador_1" FOREIGN KEY (trabajador_id) REFERENCES public.t_trabajador(id);


--
-- Name: t_detalleHorarios fk_t_detalleHorarios_t00_turnos_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_detalleHorarios"
    ADD CONSTRAINT "fk_t_detalleHorarios_t00_turnos_1" FOREIGN KEY (turno_id) REFERENCES param.t00_turnos(id);


--
-- Name: t_detalleHorarios fk_t_detalleHorarios_t_horariosCursos_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_detalleHorarios"
    ADD CONSTRAINT "fk_t_detalleHorarios_t_horariosCursos_1" FOREIGN KEY ("horarioCursoIni_id") REFERENCES conasis."t_horariosCursos"(id);


--
-- Name: t_detalleHorarios fk_t_detalleHorarios_t_horariosTrabajador_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_detalleHorarios"
    ADD CONSTRAINT "fk_t_detalleHorarios_t_horariosTrabajador_1" FOREIGN KEY ("horarioTrabajador_id") REFERENCES conasis."t_horariosTrabajador"(id);


--
-- Name: t_diasNoLaborables fk_t_diasNoLaborables_t00_feriados_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_diasNoLaborables"
    ADD CONSTRAINT "fk_t_diasNoLaborables_t00_feriados_1" FOREIGN KEY (feriado_id) REFERENCES param.t00_feriados(id);


--
-- Name: t_dispositivosMarca fk_t_dispositivosMarca_t_telefonos_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_dispositivosMarca"
    ADD CONSTRAINT "fk_t_dispositivosMarca_t_telefonos_1" FOREIGN KEY ("telefonoMovil_id") REFERENCES public.t_telefonos(id);


--
-- Name: t_documentosTram fk_t_documentosTram_t_documentos_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_documentosTram"
    ADD CONSTRAINT "fk_t_documentosTram_t_documentos_1" FOREIGN KEY (documento_id) REFERENCES param.t00_documentos(id);


--
-- Name: t_documentosTram fk_t_documentosTram_t_expediente_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_documentosTram"
    ADD CONSTRAINT "fk_t_documentosTram_t_expediente_1" FOREIGN KEY (expediente_id) REFERENCES conasis.t_expediente(id);


--
-- Name: t_documentosTram fk_t_documentosTram_t_trabajador_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_documentosTram"
    ADD CONSTRAINT "fk_t_documentosTram_t_trabajador_1" FOREIGN KEY ("trabajadorDoc_id") REFERENCES public.t_trabajador(id);


--
-- Name: t_estadosAsistencia fk_t_estadosAsistencia_t00_estadosAsis_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_estadosAsistencia"
    ADD CONSTRAINT "fk_t_estadosAsistencia_t00_estadosAsis_1" FOREIGN KEY ("estadoAsis_id") REFERENCES param."t00_estadosAsis"(id);


--
-- Name: t_estadosAsistencia fk_t_estadosAsistencia_t_asistencia_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_estadosAsistencia"
    ADD CONSTRAINT "fk_t_estadosAsistencia_t_asistencia_1" FOREIGN KEY (asistencia_id) REFERENCES conasis.t_asistencia(id);


--
-- Name: t_exoneracionesMarcacion fk_t_exoneracionesMarcacion_t_altasTrabajadores_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_exoneracionesMarcacion"
    ADD CONSTRAINT "fk_t_exoneracionesMarcacion_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES public."t_altasTrabajadores"(id);


--
-- Name: t_exoneracionesMarcacion fk_t_exoneracionesMarcacion_t_expediente_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_exoneracionesMarcacion"
    ADD CONSTRAINT "fk_t_exoneracionesMarcacion_t_expediente_1" FOREIGN KEY (expediente_id) REFERENCES conasis.t_expediente(id);


--
-- Name: t_exoneracionesMarcacion fk_t_exoneracionesMarcacion_t_trabajador_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_exoneracionesMarcacion"
    ADD CONSTRAINT "fk_t_exoneracionesMarcacion_t_trabajador_1" FOREIGN KEY (trabajador_id) REFERENCES public.t_trabajador(id);


--
-- Name: t_expediente fk_t_expediente_t00_estadosTram_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_expediente
    ADD CONSTRAINT "fk_t_expediente_t00_estadosTram_1" FOREIGN KEY (estado_id) REFERENCES param."t00_estadosTram"(id);


--
-- Name: t_expediente fk_t_expediente_t_trabajador_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_expediente
    ADD CONSTRAINT fk_t_expediente_t_trabajador_1 FOREIGN KEY (trabajador_id) REFERENCES public.t_trabajador(id);


--
-- Name: t_feriadoLabTrabajador fk_t_feriadoLabTrabajador_t_altasTrabajadores_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_feriadoLabTrabajador"
    ADD CONSTRAINT "fk_t_feriadoLabTrabajador_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES public."t_altasTrabajadores"(id);


--
-- Name: t_feriadoLabTrabajador fk_t_feriadoLabTrabajador_t_diasNoLaborables_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_feriadoLabTrabajador"
    ADD CONSTRAINT "fk_t_feriadoLabTrabajador_t_diasNoLaborables_1" FOREIGN KEY ("diaNoLaborable_id") REFERENCES conasis."t_diasNoLaborables"(id);


--
-- Name: t_feriadoLabTrabajador fk_t_feriadoLabTrabajador_t_expediente_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_feriadoLabTrabajador"
    ADD CONSTRAINT "fk_t_feriadoLabTrabajador_t_expediente_1" FOREIGN KEY (expediente_id) REFERENCES conasis.t_expediente(id);


--
-- Name: t_feriadoLabTrabajador fk_t_feriadoLabTrabajador_t_trabajador_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_feriadoLabTrabajador"
    ADD CONSTRAINT "fk_t_feriadoLabTrabajador_t_trabajador_1" FOREIGN KEY (trabajador_id) REFERENCES public.t_trabajador(id);


--
-- Name: t_horariosCursos fk_t_horariosCursos_t_cursosIE_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_horariosCursos"
    ADD CONSTRAINT "fk_t_horariosCursos_t_cursosIE_1" FOREIGN KEY (curso_id) REFERENCES public."t_cursosIE"(id);


--
-- Name: t_horariosCursos fk_t_horariosCursos_t_seccionesIE_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_horariosCursos"
    ADD CONSTRAINT "fk_t_horariosCursos_t_seccionesIE_1" FOREIGN KEY (seccion_id) REFERENCES public."t_seccionesIE"(id);


--
-- Name: t_horariosTrabajador fk_t_horariosTrabajador_t_altasTrabajadores_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_horariosTrabajador"
    ADD CONSTRAINT "fk_t_horariosTrabajador_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES public."t_altasTrabajadores"(id);


--
-- Name: t_horariosTrabajador fk_t_horariosTrabajador_t_institucionesEduc_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_horariosTrabajador"
    ADD CONSTRAINT "fk_t_horariosTrabajador_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES public."t_institucionesEduc"(id);


--
-- Name: t_horariosTrabajador fk_t_horariosTrabajador_t_trabajador_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_horariosTrabajador"
    ADD CONSTRAINT "fk_t_horariosTrabajador_t_trabajador_1" FOREIGN KEY (trabajador_id) REFERENCES public.t_trabajador(id);


--
-- Name: t_incapsTempTrab fk_t_incapsTempTrab_t00_motivosSuspLab_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_incapsTempTrab"
    ADD CONSTRAINT "fk_t_incapsTempTrab_t00_motivosSuspLab_1" FOREIGN KEY ("motivoSuspLab_id") REFERENCES param."t00_motivosSuspLab"(id);


--
-- Name: t_incapsTempTrab fk_t_incapsTempTrab_t_altasTrabajadores_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_incapsTempTrab"
    ADD CONSTRAINT "fk_t_incapsTempTrab_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES public."t_altasTrabajadores"(id);


--
-- Name: t_incapsTempTrab fk_t_incapsTempTrab_t_expediente_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_incapsTempTrab"
    ADD CONSTRAINT "fk_t_incapsTempTrab_t_expediente_1" FOREIGN KEY (expediente_id) REFERENCES conasis.t_expediente(id);


--
-- Name: t_incapsTempTrab fk_t_incapsTempTrab_t_trabajador_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_incapsTempTrab"
    ADD CONSTRAINT "fk_t_incapsTempTrab_t_trabajador_1" FOREIGN KEY (trabajador_id) REFERENCES public.t_trabajador(id);


--
-- Name: t_justificaciones fk_t_justificaciones_t_altasTrabajadores_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_justificaciones
    ADD CONSTRAINT "fk_t_justificaciones_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES public."t_altasTrabajadores"(id);


--
-- Name: t_justificaciones fk_t_justificaciones_t_expediente_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_justificaciones
    ADD CONSTRAINT fk_t_justificaciones_t_expediente_1 FOREIGN KEY (expediente_id) REFERENCES conasis.t_expediente(id);


--
-- Name: t_justificaciones fk_t_justificaciones_t_trabajador_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_justificaciones
    ADD CONSTRAINT fk_t_justificaciones_t_trabajador_1 FOREIGN KEY (trabajador_id) REFERENCES public.t_trabajador(id);


--
-- Name: t_localesInstEduc fk_t_localesInstEduc_t_entidades_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_localesInstEduc"
    ADD CONSTRAINT "fk_t_localesInstEduc_t_entidades_1" FOREIGN KEY (entidad_id) REFERENCES public.t_entidades(id);


--
-- Name: t_localesInstEduc fk_t_localesInstEduc_t_institucionesEduc_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_localesInstEduc"
    ADD CONSTRAINT "fk_t_localesInstEduc_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES public."t_institucionesEduc"(id);


--
-- Name: t_localesInstEduc fk_t_localesInstEduc_t_locales_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_localesInstEduc"
    ADD CONSTRAINT "fk_t_localesInstEduc_t_locales_1" FOREIGN KEY (local_id) REFERENCES conasis.t_locales(id);


--
-- Name: t_localesMarcacion fk_t_localesMarcacion_t_altasTrabajadores_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_localesMarcacion"
    ADD CONSTRAINT "fk_t_localesMarcacion_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES public."t_altasTrabajadores"(id);


--
-- Name: t_localesMarcacion fk_t_localesMarcacion_t_localesInstEduc_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_localesMarcacion"
    ADD CONSTRAINT "fk_t_localesMarcacion_t_localesInstEduc_1" FOREIGN KEY ("localInstEduc_id") REFERENCES conasis."t_localesInstEduc"(id);


--
-- Name: t_locales fk_t_locales_t_zonas_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_locales
    ADD CONSTRAINT fk_t_locales_t_zonas_1 FOREIGN KEY (zona_id) REFERENCES public.t_zonas(id);


--
-- Name: t_marcaciones fk_t_marcaciones_t_altasTrabajadores_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_marcaciones
    ADD CONSTRAINT "fk_t_marcaciones_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES public."t_altasTrabajadores"(id);


--
-- Name: t_marcaciones fk_t_marcaciones_t_dispositivosMarca_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_marcaciones
    ADD CONSTRAINT "fk_t_marcaciones_t_dispositivosMarca_1" FOREIGN KEY ("dispositivoMarca_id") REFERENCES conasis."t_dispositivosMarca"(id);


--
-- Name: t_marcaciones fk_t_marcaciones_t_localesMarcacion_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_marcaciones
    ADD CONSTRAINT "fk_t_marcaciones_t_localesMarcacion_1" FOREIGN KEY ("localMarcacion_id") REFERENCES conasis."t_localesMarcacion"(id);


--
-- Name: t_marcaciones fk_t_marcaciones_t_relojes_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_marcaciones
    ADD CONSTRAINT fk_t_marcaciones_t_relojes_1 FOREIGN KEY (reloj_id) REFERENCES conasis.t_relojes(id);


--
-- Name: t_marcaciones fk_t_marcaciones_t_trabajador_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_marcaciones
    ADD CONSTRAINT fk_t_marcaciones_t_trabajador_1 FOREIGN KEY (trabajador_id) REFERENCES public.t_trabajador(id);


--
-- Name: t_relojes fk_t_relojes_t_localesInstEduc_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_relojes
    ADD CONSTRAINT "fk_t_relojes_t_localesInstEduc_1" FOREIGN KEY ("localInstEduc_id") REFERENCES conasis."t_localesInstEduc"(id);


--
-- Name: t_asistencia fk_t_resumenAsistencia_t_institucionesEduc_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_asistencia
    ADD CONSTRAINT "fk_t_resumenAsistencia_t_institucionesEduc_1" FOREIGN KEY ("institucionEduc_id") REFERENCES public."t_institucionesEduc"(id);


--
-- Name: t_asistencia fk_t_resumenAsistencia_t_trabajador_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis.t_asistencia
    ADD CONSTRAINT "fk_t_resumenAsistencia_t_trabajador_1" FOREIGN KEY (trabajador_id) REFERENCES public.t_trabajador(id);


--
-- Name: t_suspLabTrabajador fk_t_suspLabTrabajador_t00_motivosSuspLab_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_suspLabTrabajador"
    ADD CONSTRAINT "fk_t_suspLabTrabajador_t00_motivosSuspLab_1" FOREIGN KEY ("motivoSuspLab_id") REFERENCES param."t00_motivosSuspLab"(id);


--
-- Name: t_suspLabTrabajador fk_t_suspLabTrabajador_t_altasTrabajadores_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_suspLabTrabajador"
    ADD CONSTRAINT "fk_t_suspLabTrabajador_t_altasTrabajadores_1" FOREIGN KEY ("altaTrabajador_id") REFERENCES public."t_altasTrabajadores"(id);


--
-- Name: t_suspLabTrabajador fk_t_suspLabTrabajador_t_expediente_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_suspLabTrabajador"
    ADD CONSTRAINT "fk_t_suspLabTrabajador_t_expediente_1" FOREIGN KEY (expediente_id) REFERENCES conasis.t_expediente(id);


--
-- Name: t_suspLabTrabajador fk_t_suspLabTrabajador_t_trabajador_1; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_suspLabTrabajador"
    ADD CONSTRAINT "fk_t_suspLabTrabajador_t_trabajador_1" FOREIGN KEY (trabajador_id) REFERENCES public.t_trabajador(id);


--
-- Name: t_mobileBiometricCredentials t_mobilebiometriccredentials_trabajador_fk; Type: FK CONSTRAINT; Schema: conasis; Owner: -
--

ALTER TABLE ONLY conasis."t_mobileBiometricCredentials"
    ADD CONSTRAINT t_mobilebiometriccredentials_trabajador_fk FOREIGN KEY (trabajador_id) REFERENCES public.t_trabajador(id);


--
-- PostgreSQL database dump complete
--

\unrestrict k2QeovP8L8O3ZSfslH4jActu1hYfstsvRMgGX4Tp7K92iQLEQkJHX9UTcifeppZ

