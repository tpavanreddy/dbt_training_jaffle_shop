{% macro timestamp_validation(timestamp_value) %}
coalesce(try_to_timestamp(left({{timestamp_value}},4)||'-'||right(left({{timestamp_value}},6),2)||'-'||right(left({{timestamp_value}},8),2)||' '||right(left({{timestamp_value}},10),2)||':'||right(left({{timestamp_value}},12),2)||':'||right(left({{timestamp_value}},14),2)
),'9999-12-31 00:00:00.000')
{% endmacro %}
