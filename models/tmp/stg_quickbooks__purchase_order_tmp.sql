--To enable this model, set the using_invoice variable within your dbt_project.yml file to True.
{{ config(enabled=var('using_purchase_order', False)) }}

select *
from {{ var('purchase_order') }}
