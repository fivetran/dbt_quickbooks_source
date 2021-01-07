--To enable this model, set the using_purchase_order variable within your dbt_project.yml file to True.
{{ config(enabled=var('using_purchase_order', True)) }}

select * 
from {{ var('purchase_order') }}
