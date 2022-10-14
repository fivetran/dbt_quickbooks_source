--To enable this model, set the using_credit_card_payment_txn variable within your dbt_project.yml file to True.
{{ config(enabled=var('using_credit_card_payment_txn', False)) }}

select * 
from {{ var('credit_card_payment_txn') }}