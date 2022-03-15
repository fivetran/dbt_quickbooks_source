{% macro get_refund_receipt_line_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "amount", "datatype": dbt_utils.type_float()},
    {"name": "bundle_id", "datatype": dbt_utils.type_int()},
    {"name": "bundle_quantity", "datatype": dbt_utils.type_float()},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "description_service_date", "datatype": "date"},
    {"name": "description_tax_code_id", "datatype": dbt_utils.type_int()},
    {"name": "discount_account_id", "datatype": dbt_utils.type_int()},
    {"name": "discount_class_id", "datatype": dbt_utils.type_int()},
    {"name": "discount_discount_percent", "datatype": dbt_utils.type_float()},
    {"name": "discount_percent_based", "datatype": "boolean"},
    {"name": "discount_tax_code_id", "datatype": dbt_utils.type_int()},
    {"name": "index", "datatype": dbt_utils.type_int()},
    {"name": "refund_id", "datatype": dbt_utils.type_int()},
    {"name": "sales_item_account_id", "datatype": dbt_utils.type_int()},
    {"name": "sales_item_class_id", "datatype": dbt_utils.type_int()},
    {"name": "sales_item_discount_amount", "datatype": dbt_utils.type_float()},
    {"name": "sales_item_discount_rate", "datatype": dbt_utils.type_float()},
    {"name": "sales_item_item_id", "datatype": dbt_utils.type_string()},
    {"name": "sales_item_quantity", "datatype": dbt_utils.type_float()},
    {"name": "sales_item_service_date", "datatype": "date"},
    {"name": "sales_item_tax_code_id", "datatype": dbt_utils.type_int()},
    {"name": "sales_item_unit_price", "datatype": dbt_utils.type_float()},
    {"name": "sub_total_item_id", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
