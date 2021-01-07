--To disable this model, set the using_transfer variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_transfer', True)) }}

select * 
from {{ var('transfer') }}
