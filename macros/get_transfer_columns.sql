{% macro get_transfer_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "amount", "datatype": dbt_utils.type_float()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "from_account_id", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "private_note", "datatype": dbt_utils.type_string()},
    {"name": "sync_token", "datatype": dbt_utils.type_string()},
    {"name": "to_account_id", "datatype": dbt_utils.type_string()},
    {"name": "transaction_date", "datatype": "date"},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
