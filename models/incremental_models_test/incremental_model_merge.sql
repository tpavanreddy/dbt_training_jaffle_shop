{{config(materialized='incremental', unique_key ='d_date', incremental_strategy='merge')}}

select *, current_timestamp as c_time from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."DATE_DIM" where d_date <= current_date()+10

{%if is_incremental() %}
and d_date > (select max(d_date) from {{this}})
{%endif%}
