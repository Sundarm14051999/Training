with 

source as (

    select * from {{ source('SNOWFLAKE', 'customers') }}

),

renamed as (

    select

    from source

)

select * from renamed
