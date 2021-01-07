--To disable this model, set the using_bill_payment variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_bill_payment', True)) }}

select * 
from {{ var('bill_payment_line') }}
