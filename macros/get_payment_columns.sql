{% macro get_payment_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "receivable_account_id", "datatype": dbt_utils.type_string()},
    {"name": "deposit_to_account_id", "datatype": dbt_utils.type_string()},
    {"name": "unapplied_amount", "datatype": dbt_utils.type_float()},
    {"name": "currency_id", "datatype": dbt_utils.type_string()},
    {"name": "exchange_rate", "datatype": dbt_utils.type_float()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "customer_id", "datatype": dbt_utils.type_string()},
    {"name": "total_amount", "datatype": dbt_utils.type_float()},
    {"name": "transaction_date", "datatype": "date"}
] %}

{{ return(columns) }}

{% endmacro %}
