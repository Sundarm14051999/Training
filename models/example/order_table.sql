{{ config(materialized='table') }}

with 

source as (

    select * from {{ source('SNOWFLAKE', 'orders') }}

),

renamed as (

    select
        o_orderkey,
        o_custkey,
        o_orderstatus,
        o_totalprice,
        o_orderdate,
        o_orderpriority,
        o_clerk,
        o_shippriority,
        o_comment

    from source

)

select * from renamed
