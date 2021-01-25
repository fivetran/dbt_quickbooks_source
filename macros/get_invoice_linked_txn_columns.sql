{% macro get_invoice_linked_txn_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "charge_credit_id", "datatype": dbt_utils.type_int()},
    {"name": "estimate_id", "datatype": dbt_utils.type_int()},
    {"name": "index", "datatype": dbt_utils.type_int()},
    {"name": "invoice_id", "datatype": dbt_utils.type_int()},
    {"name": "payment_id", "datatype": dbt_utils.type_int()},
    {"name": "reimburse_charge_id", "datatype": dbt_utils.type_int()},
    {"name": "statement_charge_id", "datatype": dbt_utils.type_int()},
    {"name": "time_activity_id", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
