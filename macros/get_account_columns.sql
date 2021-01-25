{% macro get_account_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "account_number", "datatype": dbt_utils.type_string()},
    {"name": "account_sub_type", "datatype": dbt_utils.type_string()},
    {"name": "account_type", "datatype": dbt_utils.type_string()},
    {"name": "active", "datatype": "boolean"},
    {"name": "balance", "datatype": dbt_utils.type_float()},
    {"name": "balance_with_sub_accounts", "datatype": dbt_utils.type_float()},
    {"name": "classification", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "currency_id", "datatype": dbt_utils.type_int()},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "fully_qualified_name", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "parent_account_id", "datatype": dbt_utils.type_int()},
    {"name": "sub_account", "datatype": "boolean"},
    {"name": "sync_token", "datatype": dbt_utils.type_string()},
    {"name": "tax_code_id", "datatype": dbt_utils.type_int()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
