--To disable this model, set the using_bill and using_bill_payment variables within your dbt_project.yml file to False.
{{ config(enabled=var('using_bill', True)) }}

{{
    fivetran_utils.union_data(
        table_identifier='bill_linked_txn',
        database_variable='quickbooks_database',
        schema_variable='quickbooks_schema',
        default_database=target.database,
        default_schema='quickbooks',
        default_variable='bill_linked_txn'
    )
}}