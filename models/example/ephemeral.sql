{{ config(materialized='ephemeral') }}

 select * from {{ source('SNOWFLAKE', 'customer') }}