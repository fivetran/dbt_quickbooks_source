{% macro get_purchase_order_line_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "amount", "datatype": dbt_utils.type_float()},
    {"name": "purchase_order_id", "datatype": dbt_utils.type_string()},
    {"name": "index", "datatype": dbt_utils.type_int()},
    {"name": "account_expense_account_id", "datatype": dbt_utils.type_string()},
    {"name": "account_expense_customer_id", "datatype": dbt_utils.type_string()},
    {"name": "item_expense_item_id", "datatype": dbt_utils.type_string()},
    {"name": "item_expense_customer_id", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
