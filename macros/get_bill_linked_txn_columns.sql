{% macro get_bill_linked_txn_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "bill_id", "datatype": dbt_utils.type_int()},
    {"name": "bill_payment_id", "datatype": dbt_utils.type_int()},
    {"name": "index", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
