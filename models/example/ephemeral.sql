{{ config(materialized='ephemeral') }}

with teams as ( select * from {{ source('SNOWFLAKE', 'customer') }})

select * from teams