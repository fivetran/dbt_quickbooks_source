{% macro get_customer_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "active", "datatype": "boolean"},
    {"name": "alternate_phone_number", "datatype": dbt_utils.type_string()},
    {"name": "ar_account_id", "datatype": dbt_utils.type_string()},
    {"name": "balance", "datatype": dbt_utils.type_float()},
    {"name": "balance_with_jobs", "datatype": dbt_utils.type_float()},
    {"name": "bill_address_id", "datatype": dbt_utils.type_string()},
    {"name": "bill_with_parent", "datatype": "boolean"},
    {"name": "company_name", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "currency_id", "datatype": dbt_utils.type_string()},
    {"name": "default_tax_code_id", "datatype": dbt_utils.type_string()},
    {"name": "display_name", "datatype": dbt_utils.type_string()},
    {"name": "email", "datatype": dbt_utils.type_string()},
    {"name": "family_name", "datatype": dbt_utils.type_string()},
    {"name": "fax_number", "datatype": dbt_utils.type_string()},
    {"name": "fully_qualified_name", "datatype": dbt_utils.type_string()},
    {"name": "given_name", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "job", "datatype": "boolean"},
    {"name": "level", "datatype": dbt_utils.type_int()},
    {"name": "middle_name", "datatype": dbt_utils.type_string()},
    {"name": "mobile_number", "datatype": dbt_utils.type_string()},
    {"name": "notes", "datatype": dbt_utils.type_string()},
    {"name": "open_balance_date", "datatype": "date"},
    {"name": "parent_customer_id", "datatype": dbt_utils.type_string()},
    {"name": "payment_method_id", "datatype": dbt_utils.type_string()},
    {"name": "phone_number", "datatype": dbt_utils.type_string()},
    {"name": "preferred_delivery_method", "datatype": dbt_utils.type_string()},
    {"name": "print_on_check_name", "datatype": dbt_utils.type_string()},
    {"name": "resale_number", "datatype": dbt_utils.type_string()},
    {"name": "sales_term_id", "datatype": dbt_utils.type_string()},
    {"name": "shipping_address_id", "datatype": dbt_utils.type_string()},
    {"name": "suffix", "datatype": dbt_utils.type_string()},
    {"name": "sync_token", "datatype": dbt_utils.type_string()},
    {"name": "tax_exemption_reason_id", "datatype": dbt_utils.type_string()},
    {"name": "taxable", "datatype": "boolean"},
    {"name": "title", "datatype": dbt_utils.type_string()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "website", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
