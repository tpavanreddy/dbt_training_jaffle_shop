{{config(materialized='incremental'
         , unique_key = 'ukey'
         , incremental_strategy='delete+insert')}}

select concat(d_date, '-', d_date_sk) as ukey, *, current_timestamp as c_time from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."DATE_DIM" where d_date <= current_date()+1500

{%if is_incremental() %}
and d_date > (select max(d_date) from {{this}})
{%endif%}