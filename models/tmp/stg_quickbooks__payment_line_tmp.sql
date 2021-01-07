--To enable this model, set the using_payment variable within your dbt_project.yml file to True.
{{ config(enabled=var('using_payment', True)) }}

select * 
from {{ var('payment_line') }}
