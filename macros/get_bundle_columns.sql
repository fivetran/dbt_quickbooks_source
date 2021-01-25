{% macro get_bundle_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "active", "datatype": "boolean"},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "fully_qualified_name", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "print_grouped_items", "datatype": "boolean"},
    {"name": "purchase_cost", "datatype": dbt_utils.type_float()},
    {"name": "sync_token", "datatype": dbt_utils.type_string()},
    {"name": "taxable", "datatype": "boolean"},
    {"name": "unit_price", "datatype": dbt_utils.type_float()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
