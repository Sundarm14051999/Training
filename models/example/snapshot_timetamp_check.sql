{{  config(materialized='table') }}

with snapshot as (
    select * from {{ref('shipping_snap')}}
)

select * from snapshot