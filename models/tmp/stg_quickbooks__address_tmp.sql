--To disable this model, set the using_address variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_address', True)) }}

select * 
from {{ var('address') }}
