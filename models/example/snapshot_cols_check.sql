{{  config(materialized='table') }}

with snapshot as (
    select * from {{source('snapshot','shipping')}}
)

select * from snapshot