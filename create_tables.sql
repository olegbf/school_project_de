CREATE TABLE "FOB"."OLYMP_S"
   ("YEAR" VARCHAR2(200 BYTE),
    "CITY" VARCHAR2(200 BYTE),
    "SPORT" VARCHAR2(200 BYTE),
    "DISCIPLINE" VARCHAR2(200 BYTE),
    "ATHLETE" VARCHAR2(200 BYTE),
    "COUNTRY" VARCHAR2(200 BYTE),
    "GENDER" VARCHAR2(200 BYTE),
    "EVENT" VARCHAR2(200 BYTE),
    "MEDAL" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
/
 CREATE TABLE "FOB"."OLYMP_W"
  ("YEAR" VARCHAR2(200 BYTE),
    "CITY" VARCHAR2(200 BYTE),
    "SPORT" VARCHAR2(200 BYTE),
    "DISCIPLINE" VARCHAR2(200 BYTE),
    "ATHLETE" VARCHAR2(200 BYTE),
    "COUNTRY" VARCHAR2(200 BYTE),
    "GENDER" VARCHAR2(200 BYTE),
    "EVENT" VARCHAR2(200 BYTE),
    "MEDAL" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
/
  CREATE TABLE "FOB"."OLYMP_DICT"
   ("COUNTRY" VARCHAR2(100 BYTE),
    "CODE" VARCHAR2(10 BYTE),
    "POPULATION" VARCHAR2(100 BYTE) DEFAULT NULL,
    "VVP" VARCHAR2(100 BYTE) DEFAULT NULL
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
/
create table t_winter (       
       country varchar2(30),        
       athlete varchar2(128),
       medal   varchar2(10),
       year    number(4)
);
/
create table t_summer (       
       country varchar2(30),
       athlete varchar2(128),
       medal   varchar2(10),
       year    number(4)
);
/
create table t_dict (
       country varchar2(100),
       code    varchar2(10),
       population number(10),
       vvp   varchar2(10)
);
/
?
?
?
/
create table t_aggr_w (
       country varchar2(30),
       athlete varchar2(128),
       medal   number(2)
);
/
create table t_aggr_s (       
       country varchar2(30),
       athlete varchar2(128),
       medal   number(2)      
);
/
create table t_aggr_dict (       
       country varchar2(100),
       vvp   number(6,5)
);




















































/*
/
SELECT count(country),
       country
FROM   t_summer
WHERE  country NOT IN (SELECT code
                          FROM   t_dict)
group by country
/

select *
  from olymp_dict
 where code in ('FRG', 'GDR', 'TCH', 'URS', 'YUG','EUN', 'EUA', 'ROU')
/
----------

/
insert all
 into t_dict values ('Federal Republic of Germany', 'FRG', null, null)
 into t_dict values ('German Democratic Republic', 'GDR', null, null)
 into t_dict values ('Czechoslovakia', 'TCH', null, null)
 into t_dict values ('USSR', 'URS', null, null)
 into t_dict values ('Yugoslavia', 'YUG', null, null)
 into t_dict values (null, 'EUN', null, null)
 into t_dict values (null, 'EUA', null, null)
 into t_dict values (null, 'ROU', null, null)
select * from dual;
/
insert all
 into t_dict values (null, 'ANZ', null, null)
 into t_dict values (null, 'IOP', null, null)
 into t_dict values (null, 'TTO', null, null)
 into t_dict values (null, 'ZZX', null, null)
 into t_dict values (null, 'MNE', null, null)
 into t_dict values (null, 'RU1', null, null)
 into t_dict values (null, 'BWI', null, null)
 into t_dict values (null, 'SRB', null, null)
 into t_dict values (null, 'BOH', null, null)
 into t_dict values (null, 'SGP', null, null)
select * from dual; 
/


















--create table r1_ord (
--ORDER_ID	    NUMBER(38,0)
--    constraint r1_ord_id_pk primary key,
--ORDER_DATE	    DATE,
--ITEM_NAME	    VARCHAR2(100 BYTE),
--QUANTITY	    NUMBER(38,0),
--PRODUCT_PRICE	VARCHAR2(10 BYTE),
--TOTAL_PRODUCT	NUMBER(38,0)
--);
--
--create table r1_pp (
--ITEM_NAME	    VARCHAR2(100 BYTE),
--PRODUCT_PRICE	VARCHAR2(10 BYTE)
--);
--
--
--
--create table r2_ord (
--ORDER_ID	    NUMBER(38,0)
--    constraint r2_ord_id_pk primary key,
--ORDER_DATE	    DATE,
--ITEM_NAME	    VARCHAR2(100 BYTE),
--QUANTITY	    NUMBER(38,0),
--PRODUCT_PRICE	VARCHAR2(10 BYTE),
--TOTAL_PRODUCT	NUMBER(38,0)
--);
--
--create table r2_pp (
--ITEM_NAME	    VARCHAR2(100 BYTE),
--PRODUCT_PRICE	VARCHAR2(10 BYTE)
--);


--create table imdb_movies (
--imdb_title_id           varchar2(20)
--    constraint imdb_moves_id_pk primary key,
--title                   varchar2(500),
--original_title          varchar2(500),
--year                    varchar2(10),
--date_published          varchar2(20),
--genre                   varchar2(500),
--duration                varchar2(10),
--country                 varchar2(500),
--language                varchar2(500),
--director                varchar2(500),
--writer                  varchar2(500),
--production_company      varchar2(500),
--actors                  varchar2(500),
--description             varchar2(500),
--avg_vote                varchar2(10),
--votes                   varchar2(10),
--budget                  varchar2(20),
--usa_gross_income        varchar2(20),
--worlwide_gross_income   varchar2(20),
--metascore               varchar2(10),
--reviews_from_users      varchar2(10),
--reviews_from_critics    varchar2(10)
--);
--
--
--create table imdb_names (
--imdb_name_id            varchar2(20)
--    constraint imdb_names_id_pk primary key,
--name                    varchar2(200),
--birth_name              varchar2(200),
--height                  number(3),
--bio                     varchar2(4000),
--birth_details           varchar2(200),
--date_of_birth           varchar2(20),
--place_of_birth          varchar2(200),
--death_details           varchar2(200),
--date_of_death           varchar2(20),
--place_of_death          varchar2(200),
--reason_of_death         varchar2(200),
--spouses_string          varchar2(1000),
--spouses                 varchar2(20),
--divorces                varchar2(20),
--spouses_with_children   varchar2(20),
--children                varchar2(20)
--);
--
--
--create table imdb_principals (
--imdb_title_id           varchar2(20)
--    constraint imdb_title_principals_fk references
--    imdb_movies (imdb_title_id),
--ordering                number(3),
--imdb_name_id            varchar2(20)
--    constraint imdb_name_principals_fk references
--    imdb_names (imdb_name_id),
--category                varchar2(20),
--job                     varchar2(100),	
--characters              varchar2(100)
--);
