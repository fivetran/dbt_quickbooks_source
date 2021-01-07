--To enable this model, set the using_purchase_order variable within your dbt_project.yml file to True.
{{ config(enabled=var('using_purchase_order', True)) }}

with base as (

    select * 
    from {{ ref('stg_quickbooks__purchase_order_tmp') }}

),

fields as (

    select
        /*
        The below macro is used to generate the correct SQL for package staging models. It takes a list of columns 
        that are expected/needed (staging_columns from dbt_salesforce_source/models/tmp/) and compares it with columns 
        in the source (source_columns from dbt_salesforce_source/macros/).
        For more information refer to our dbt_fivetran_utils documentation (https://github.com/fivetran/dbt_fivetran_utils.git).
        */

        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_quickbooks__purchase_order_tmp')),
                staging_columns=get_purchase_order_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        id as purchase_order_id,
        total_amount,
        currency_id,
        payable_account_id,
        exchange_rate,
        transaction_date,
        vendor_id,
        _fivetran_deleted

    from fields
)

select * 
from final
where not coalesce(_fivetran_deleted, false)
