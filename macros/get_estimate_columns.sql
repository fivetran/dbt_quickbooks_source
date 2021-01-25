{% macro get_estimate_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "accepted_by", "datatype": dbt_utils.type_string()},
    {"name": "accepted_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "apply_tax_after_discount", "datatype": "boolean"},
    {"name": "bill_email", "datatype": dbt_utils.type_string()},
    {"name": "billing_address_id", "datatype": dbt_utils.type_int()},
    {"name": "class_id", "datatype": dbt_utils.type_int()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "currency_id", "datatype": dbt_utils.type_int()},
    {"name": "customer_id", "datatype": dbt_utils.type_int()},
    {"name": "customer_memo", "datatype": dbt_utils.type_string()},
    {"name": "delivery_type", "datatype": dbt_utils.type_string()},
    {"name": "department_id", "datatype": dbt_utils.type_int()},
    {"name": "doc_number", "datatype": dbt_utils.type_string()},
    {"name": "due_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "email_status", "datatype": dbt_utils.type_string()},
    {"name": "exchange_rate", "datatype": dbt_utils.type_float()},
    {"name": "expiration_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "global_tax_calculation", "datatype": dbt_utils.type_string()},
    {"name": "home_total_amount", "datatype": dbt_utils.type_float()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "print_status", "datatype": dbt_utils.type_string()},
    {"name": "private_note", "datatype": dbt_utils.type_string()},
    {"name": "sales_term_id", "datatype": dbt_utils.type_int()},
    {"name": "ship_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "shipping_address_id", "datatype": dbt_utils.type_int()},
    {"name": "sync_token", "datatype": dbt_utils.type_string()},
    {"name": "tax_code_id", "datatype": dbt_utils.type_int()},
    {"name": "total_amount", "datatype": dbt_utils.type_float()},
    {"name": "total_tax", "datatype": dbt_utils.type_float()},
    {"name": "transaction_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "transaction_status", "datatype": dbt_utils.type_string()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}