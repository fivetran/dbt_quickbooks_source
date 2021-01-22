--To disable this model, set the using_invoice_bundle variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_invoice_bundle', True)) }}

select * 
from {{ var('bundle_item') }}
