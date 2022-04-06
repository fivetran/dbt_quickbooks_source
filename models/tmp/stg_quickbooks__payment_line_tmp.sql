--To enable this model, set the using_payment variable within your dbt_project.yml file to True.
{{ config(enabled=var('using_payment', True)) }}

{{
    fivetran_utils.union_data(
        table_identifier='payment_line',
        database_variable='quickbooks_database',
        schema_variable='quickbooks_schema',
        default_database=target.database,
        default_schema='quickbooks',
        default_variable='payment_line'
    )
}}