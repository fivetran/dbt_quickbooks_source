{% macro get_bill_payment_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "check_bank_account_id", "datatype": dbt_utils.type_int()},
    {"name": "check_print_status", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "credit_card_account_id", "datatype": dbt_utils.type_int()},
    {"name": "currency_id", "datatype": dbt_utils.type_int()},
    {"name": "department_id", "datatype": dbt_utils.type_int()},
    {"name": "doc_number", "datatype": dbt_utils.type_string()},
    {"name": "exchange_rate", "datatype": dbt_utils.type_float()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "pay_type", "datatype": dbt_utils.type_string()},
    {"name": "payable_account_id", "datatype": dbt_utils.type_int()},
    {"name": "private_note", "datatype": dbt_utils.type_string()},
    {"name": "process_bill_payment", "datatype": "boolean"},
    {"name": "sync_token", "datatype": dbt_utils.type_string()},
    {"name": "total_amount", "datatype": dbt_utils.type_float()},
    {"name": "transaction_date", "datatype": "date"},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "vendor_id", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
