
{% macro parse_date(col) %}
    make_date(
        substring({{ col }} for 4)::int,
        substring({{ col }} from 5 for 2)::int,
        substring({{ col }} from 7 for 2)::int
    )
{% endmacro %}