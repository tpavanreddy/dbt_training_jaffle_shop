{% macro date_validation(date_value) %}
    coalesce(try_to_date(left({{date_value}},4)||'-'||right(left({{date_value}},6),2)||'-'||right({{date_value}},2)),'9999-12-31') 
{% endmacro %}
