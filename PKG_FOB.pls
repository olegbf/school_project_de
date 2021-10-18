create or replace package PKG_FOB as

PROCEDURE clear_tables_csv;

PROCEDURE make_winter;
PROCEDURE make_summer;
PROCEDURE make_dict;

PROCEDURE make_aggr_w;
PROCEDURE make_aggr_s;
PROCEDURE make_aggr_dict;
   
end PKG_FOB;
