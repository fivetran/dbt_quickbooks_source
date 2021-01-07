--To disable this model, set the using_journal_entry variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_purchase', True)) }}

select * 
from {{ var('purchase') }}
