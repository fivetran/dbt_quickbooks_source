{% macro get_journal_entry_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "adjustment", "datatype": "boolean"},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "currency_id", "datatype": dbt_utils.type_string()},
    {"name": "doc_number", "datatype": dbt_utils.type_string()},
    {"name": "exchange_rate", "datatype": dbt_utils.type_float()},
    {"name": "home_total_amount", "datatype": dbt_utils.type_float()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "private_note", "datatype": dbt_utils.type_string()},
    {"name": "sync_token", "datatype": dbt_utils.type_string()},
    {"name": "tax_code_id", "datatype": dbt_utils.type_string()},
    {"name": "total_amount", "datatype": dbt_utils.type_float()},
    {"name": "total_tax", "datatype": dbt_utils.type_float()},
    {"name": "transaction_date", "datatype": "date"},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
