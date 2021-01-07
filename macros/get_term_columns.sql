{% macro get_term_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "active", "datatype": "boolean"},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "day_of_month_due", "datatype": dbt_utils.type_int()},
    {"name": "discount_day_of_month", "datatype": dbt_utils.type_int()},
    {"name": "discount_days", "datatype": dbt_utils.type_int()},
    {"name": "discount_percent", "datatype": dbt_utils.type_float()},
    {"name": "due_days", "datatype": dbt_utils.type_int()},
    {"name": "due_next_month_days", "datatype": dbt_utils.type_int()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "sync_token", "datatype": dbt_utils.type_string()},
    {"name": "type", "datatype": dbt_utils.type_string()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
