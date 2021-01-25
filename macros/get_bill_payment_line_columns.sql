{% macro get_bill_payment_line_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "amount", "datatype": dbt_utils.type_float()},
    {"name": "bill_id", "datatype": dbt_utils.type_int()},
    {"name": "bill_payment_credit_card_id", "datatype": dbt_utils.type_int()},
    {"name": "bill_payment_id", "datatype": dbt_utils.type_int()},
    {"name": "check_id", "datatype": dbt_utils.type_int()},
    {"name": "credit_card_charge_id", "datatype": dbt_utils.type_int()},
    {"name": "credit_card_credit_id", "datatype": dbt_utils.type_int()},
    {"name": "deposit_id", "datatype": dbt_utils.type_int()},
    {"name": "expense_id", "datatype": dbt_utils.type_int()},
    {"name": "index", "datatype": dbt_utils.type_int()},
    {"name": "journal_entry_id", "datatype": dbt_utils.type_int()},
    {"name": "linked_bill_payment_id", "datatype": dbt_utils.type_int()},
    {"name": "vendor_credit_id", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
