


{% test is_even(model, coulmn_name) %}

select * from {{ref('snipping_snap')}}

{% endtest %}