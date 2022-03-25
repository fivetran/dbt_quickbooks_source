{% macro get_invoice_line_bundle_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "account_id", "datatype": dbt_utils.type_string()},
    {"name": "amount", "datatype": dbt_utils.type_float()},
    {"name": "class_id", "datatype": dbt_utils.type_string()},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "discount_amount", "datatype": dbt_utils.type_float()},
    {"name": "discount_rate", "datatype": dbt_utils.type_float()},
    {"name": "index", "datatype": dbt_utils.type_string()},
    {"name": "invoice_id", "datatype": dbt_utils.type_string()},
    {"name": "invoice_line_index", "datatype": dbt_utils.type_string()},
    {"name": "item_id", "datatype": dbt_utils.type_string()},
    {"name": "line_num", "datatype": dbt_utils.type_string()},
    {"name": "quantity", "datatype": dbt_utils.type_float()},
    {"name": "sales_item_account_id", "datatype": dbt_utils.type_string()},
    {"name": "sales_item_item_id", "datatype": dbt_utils.type_string()},
    {"name": "sales_item_quantity", "datatype": dbt_utils.type_float()},
    {"name": "sales_item_tax_code_id", "datatype": dbt_utils.type_string()},
    {"name": "service_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "tax_code_id", "datatype": dbt_utils.type_string()},
    {"name": "unit_price", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}
