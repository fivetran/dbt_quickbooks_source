--To disable this model, set the using_bill_payment variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_bill', True)) }}

select * 
from {{ var('bill_payment') }}
