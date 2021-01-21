{% macro get_purchase_order_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "class_id", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "currency_id", "datatype": dbt_utils.type_string()},
    {"name": "custom_customer_type", "datatype": dbt_utils.type_string()},
    {"name": "custom_p_o_number", "datatype": dbt_utils.type_string()},
    {"name": "doc_number", "datatype": dbt_utils.type_string()},
    {"name": "due_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "exchange_rate", "datatype": dbt_utils.type_float()},
    {"name": "global_tax_calculation", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "memo", "datatype": dbt_utils.type_string()},
    {"name": "payable_account_id", "datatype": dbt_utils.type_string()},
    {"name": "private_note", "datatype": dbt_utils.type_string()},
    {"name": "sales_term_id", "datatype": dbt_utils.type_string()},
    {"name": "shipping_address_id", "datatype": dbt_utils.type_string()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "sync_token", "datatype": dbt_utils.type_string()},
    {"name": "tax_code_id", "datatype": dbt_utils.type_string()},
    {"name": "total_amount", "datatype": dbt_utils.type_float()},
    {"name": "total_tax", "datatype": dbt_utils.type_float()},
    {"name": "transaction_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "vendor_address_id", "datatype": dbt_utils.type_string()},
    {"name": "vendor_id", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}