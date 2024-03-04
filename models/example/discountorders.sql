{{  config(materialized='table') }}

select * ,(o_totalprice-{{discount('o_totalprice',10)}}) as discount_amnt from {{ ref('order_table')}}