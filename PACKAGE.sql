CREATE OR REPLACE PACKAGE "C##FOB"."PKG_FOB" AS
PROCEDURE clear_tables_csv;

PROCEDURE make_winter;
PROCEDURE make_summer;
PROCEDURE make_dict;

PROCEDURE make_aggr_w;
PROCEDURE make_aggr_s;
PROCEDURE make_aggr_dict;

end PKG_FOB;
/
CREATE OR REPLACE PACKAGE BODY "C##FOB"."PKG_FOB" AS

PROCEDURE clear_tables_csv
    is
    begin
        execute immediate 'truncate table olymp_dict drop storage';
  		execute immediate 'truncate table olymp_w drop storage';
  		execute immediate 'truncate table olymp_s drop storage';	            
    end clear_tables_csv;

PROCEDURE make_winter
    is
    begin
        execute immediate 'truncate table t_winter drop storage';
        insert into t_winter(country, athlete, medal, year)
        select country
               ,athlete
               ,medal
               ,year
          from olymp_w;  
    commit;
    
    end make_winter;

PROCEDURE make_summer
    is
    begin
        execute immediate 'truncate table t_summer drop storage';
        insert into t_summer(country, athlete, medal, year)
        select country
               ,athlete
               ,medal
               ,year
          from olymp_s;
    commit;
    
    end make_summer;        


PROCEDURE make_dict
    is
    begin
        execute immediate 'truncate table t_dict drop storage';
        insert into t_dict(country, code, population, vvp)
        select country
               ,code
               ,population
               ,vvp
        from olymp_dict;
    commit;
    
    end make_dict; 

PROCEDURE make_aggr_w
    is
    begin
         execute immediate 'truncate table t_aggr_w drop storage';
         insert into t_aggr_w(country, medal)
           select country
                  ,count(country) as gold_medals       
             from t_winter
            where medal = 'Gold'
         group by country
           having count(country) >= 50
         order by gold_medals desc;
    commit;
    
    end make_aggr_w;

PROCEDURE make_aggr_s
    is
    begin
         execute immediate 'truncate table t_aggr_s drop storage';
         insert into t_aggr_s(country, medal)
           select country
                  ,count(country) as gold_medals       
             from t_summer
            where medal = 'Gold'
         group by country
           having count(country) >= 50
         order by gold_medals desc;
    commit;
    
    end make_aggr_s;

PROCEDURE make_aggr_dict
    is
    begin
         execute immediate 'truncate table t_aggr_dict drop storage';
         insert into t_aggr_dict(country, vvp)
         select   code
                  ,vvp                 
           from   t_dict
          where   vvp >= 5000
            and   population > 50000000
         order by vvp desc;
    commit;
    
    end make_aggr_dict;
    
end PKG_FOB;
