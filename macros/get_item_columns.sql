{% macro get_item_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "active", "datatype": "boolean"},
    {"name": "asset_account_id", "datatype": dbt_utils.type_int()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "expense_account_id", "datatype": dbt_utils.type_int()},
    {"name": "fully_qualified_name", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "income_account_id", "datatype": dbt_utils.type_int()},
    {"name": "inventory_start_date", "datatype": "date"},
    {"name": "level", "datatype": dbt_utils.type_int()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "parent_item_id", "datatype": dbt_utils.type_int()},
    {"name": "purchase_cost", "datatype": dbt_utils.type_float()},
    {"name": "purchase_description", "datatype": dbt_utils.type_string()},
    {"name": "purchase_tax_code_id", "datatype": dbt_utils.type_int()},
    {"name": "purchase_tax_included", "datatype": "boolean"},
    {"name": "quantity_on_hand", "datatype": dbt_utils.type_float()},
    {"name": "sales_tax_code_id", "datatype": dbt_utils.type_int()},
    {"name": "sales_tax_included", "datatype": "boolean"},
    {"name": "stock_keeping_unit", "datatype": dbt_utils.type_string()},
    {"name": "sub_item", "datatype": "boolean"},
    {"name": "sync_token", "datatype": dbt_utils.type_string()},
    {"name": "taxable", "datatype": "boolean"},
    {"name": "track_quantity_on_hand", "datatype": "boolean"},
    {"name": "type", "datatype": dbt_utils.type_string()},
    {"name": "unit_price", "datatype": dbt_utils.type_float()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
