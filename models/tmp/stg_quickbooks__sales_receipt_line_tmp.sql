{{ config(enabled=var('using_sales_receipt', True)) }}

{{
    fivetran_utils.union_data(
        table_identifier='sales_receipt_line',
        database_variable='quickbooks_database',
        schema_variable='quickbooks_schema',
        default_database=target.database,
        default_schema='quickbooks',
        default_variable='sales_receipt_line'
    )
}}