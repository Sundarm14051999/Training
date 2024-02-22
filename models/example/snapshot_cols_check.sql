{{  config(materialized='table') }}

with snapshot as (
    select * from {{ref('shipping_cols')}}
)

select * from snapshot