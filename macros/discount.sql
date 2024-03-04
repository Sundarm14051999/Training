
{% macro discount(column_name, value) %}
    ({{ column_name }} * {{ value }}/100)
{% endmacro %}
