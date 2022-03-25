{% macro get_bundle_item_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "bundle_id", "datatype": dbt_utils.type_string()},
    {"name": "item_id", "datatype": dbt_utils.type_string()},
    {"name": "item_quantity", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}
