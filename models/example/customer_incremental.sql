{{
    config(
        materialized='incremental',
        alias='customer_incremental',
        unique_key='c_custkey'
    )
}}



    select * from {{ source('SNOWFLAKE','customer')}}
    {% if is_incremental() %}
      where c_custkey > (select max(c_custkey) from {{ this }})
    {% endif %}


