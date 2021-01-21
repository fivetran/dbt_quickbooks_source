--To disable this model, set the using_department variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_department', True)) }}

select * 
from {{ var('department') }}
