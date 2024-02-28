-- macros/macros.sql

{% macro is_even(value) %}
    select 
        case
            when {{ value }} % 2 = 0 then 1
            else 0
        end as is_even
{% endmacro %}
