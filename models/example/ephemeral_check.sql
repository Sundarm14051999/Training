with teams as (
    select * from {{ref('ephemeral')}}
)
select * from teams