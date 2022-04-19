{% macro get_deposit_line_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "amount", "datatype": dbt_utils.type_float()},
    {"name": "bill_id", "datatype": dbt_utils.type_string()},
    {"name": "deposit_account_id", "datatype": dbt_utils.type_string()},
    {"name": "deposit_check_number", "datatype": dbt_utils.type_string()},
    {"name": "deposit_class_id", "datatype": dbt_utils.type_string()},
    {"name": "deposit_customer_id", "datatype": dbt_utils.type_string()},
    {"name": "deposit_id", "datatype": dbt_utils.type_string()},
    {"name": "deposit_payment_method_id", "datatype": dbt_utils.type_string()},
    {"name": "deposit_tax_applicable_on", "datatype": dbt_utils.type_string()},
    {"name": "deposit_tax_code_id", "datatype": dbt_utils.type_string()},
    {"name": "deposit_transaction_type", "datatype": dbt_utils.type_string()},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "detail_type", "datatype": dbt_utils.type_string()},
    {"name": "expense_id", "datatype": dbt_utils.type_string()},
    {"name": "index", "datatype": dbt_utils.type_string()},
    {"name": "invoice_id", "datatype": dbt_utils.type_string()},
    {"name": "journal_entry_id", "datatype": dbt_utils.type_string()},
    {"name": "payment_id", "datatype": dbt_utils.type_string()},
    {"name": "purchase_id", "datatype": dbt_utils.type_string()},
    {"name": "refund_receipt_id", "datatype": dbt_utils.type_string()},
    {"name": "sales_receipt_id", "datatype": dbt_utils.type_string()},
    {"name": "transfer_id", "datatype": dbt_utils.type_string()},
    {"name": "vendor_credit_id", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
