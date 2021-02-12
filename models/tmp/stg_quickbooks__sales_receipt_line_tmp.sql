{{ config(enabled=var('using_sales_receipt', True)) }}

select * 
from {{ var('sales_receipt_line') }}
