{{
  config(
    materialized = 'incremental',
    unique_key = 'id', 
    incremental_strategy='merge'
  )
}}
with
    latest_data as (
        select
            id,
            name,
            city,
            last_updated_ts,
            flag
        
        from raw.dbt_smurugesan.scd1 
    
    )
select id, name, city, last_updated_ts, flag
from latest_data 
{% if is_incremental() %}
where last_updated_ts >=  dateadd('day', -7, current_date) 
or flag='Y'
{% endif %}


