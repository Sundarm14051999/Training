{{
  config(
    materialized = 'incremental',
    unique_key = 'id',  
    incremental_strategy='merge',
    incremental_predicates = [
      "last_updated_ts >= dateadd('day', -7, current_date)"
    ]
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

