{% macro get_address_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "city", "datatype": dbt_utils.type_string()},
    {"name": "country", "datatype": dbt_utils.type_string()},
    {"name": "country_sub_division_code", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "latitude", "datatype": dbt_utils.type_string()},
    {"name": "line_1", "datatype": dbt_utils.type_string()},
    {"name": "line_2", "datatype": dbt_utils.type_string()},
    {"name": "line_3", "datatype": dbt_utils.type_string()},
    {"name": "line_4", "datatype": dbt_utils.type_string()},
    {"name": "line_5", "datatype": dbt_utils.type_string()},
    {"name": "longitude", "datatype": dbt_utils.type_string()},
    {"name": "postal_code", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
