{% macro get_invoice_line_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "amount", "datatype": dbt_utils.type_float()},
    {"name": "invoice_id", "datatype": dbt_utils.type_string()},
    {"name": "sales_item_account_id", "datatype": dbt_utils.type_string()},
    {"name": "index", "datatype": dbt_utils.type_int()},
    {"name": "sales_item_item_id", "datatype": dbt_utils.type_string()},
    {"name": "discount_account_id", "datatype": dbt_utils.type_string()},
    {"name": "discount_class_id", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
