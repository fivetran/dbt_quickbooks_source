{% macro get_vendor_credit_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "balance", "datatype": dbt_utils.type_float()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "currency_id", "datatype": dbt_utils.type_int()},
    {"name": "department_id", "datatype": dbt_utils.type_int()},
    {"name": "doc_number", "datatype": dbt_utils.type_string()},
    {"name": "exchange_rate", "datatype": dbt_utils.type_float()},
    {"name": "global_tax_calculation", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "payable_account_id", "datatype": dbt_utils.type_int()},
    {"name": "private_note", "datatype": dbt_utils.type_string()},
    {"name": "sync_token", "datatype": dbt_utils.type_string()},
    {"name": "total_amount", "datatype": dbt_utils.type_float()},
    {"name": "transaction_date", "datatype": "date"},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "vendor_id", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}