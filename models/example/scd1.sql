{{ config(materialized="table") }}

with
    latest_data as (
        select
            id,
            name,
            city,
            last_updated_ts,
            flag,
            row_number() over (partition by id order by last_updated_ts desc) as row_num
        from raw.dbt_smurugesan.scd1
        where flag = 'Y' or last_updated_ts >= dateadd('day', -7, current_date)
    )

select id, name, city, last_updated_ts, flag
from latest_data
where row_num = 1
