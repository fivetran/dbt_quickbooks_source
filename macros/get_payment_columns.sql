{% macro get_payment_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "credit_card_amount", "datatype": dbt_utils.type_float()},
    {"name": "credit_card_auth_code", "datatype": dbt_utils.type_string()},
    {"name": "credit_card_billing_address_street", "datatype": dbt_utils.type_string()},
    {"name": "credit_card_cc_expiry_month", "datatype": dbt_utils.type_string()},
    {"name": "credit_card_cc_expiry_year", "datatype": dbt_utils.type_string()},
    {"name": "credit_card_cctrans_id", "datatype": dbt_utils.type_string()},
    {"name": "credit_card_name_on_account", "datatype": dbt_utils.type_string()},
    {"name": "credit_card_postal_code", "datatype": dbt_utils.type_string()},
    {"name": "credit_card_process_payment", "datatype": "boolean"},
    {"name": "credit_card_status", "datatype": dbt_utils.type_string()},
    {"name": "credit_card_transaction_authorization_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "credit_card_type", "datatype": dbt_utils.type_string()},
    {"name": "currency_id", "datatype": dbt_utils.type_string()},
    {"name": "customer_id", "datatype": dbt_utils.type_string()},
    {"name": "deposit_to_account_id", "datatype": dbt_utils.type_string()},
    {"name": "exchange_rate", "datatype": dbt_utils.type_float()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "payment_method_id", "datatype": dbt_utils.type_string()},
    {"name": "private_note", "datatype": dbt_utils.type_string()},
    {"name": "process_payment", "datatype": "boolean"},
    {"name": "receivable_account_id", "datatype": dbt_utils.type_string()},
    {"name": "reference_number", "datatype": dbt_utils.type_string()},
    {"name": "sync_token", "datatype": dbt_utils.type_string()},
    {"name": "total_amount", "datatype": dbt_utils.type_float()},
    {"name": "transaction_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "transaction_source", "datatype": dbt_utils.type_string()},
    {"name": "transaction_status", "datatype": dbt_utils.type_string()},
    {"name": "unapplied_amount", "datatype": dbt_utils.type_float()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}