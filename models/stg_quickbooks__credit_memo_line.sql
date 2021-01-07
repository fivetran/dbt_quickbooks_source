--To enable this model, set the using_credit_memo variable within your dbt_project.yml file to True.
{{ config(enabled=var('using_credit_memo', True)) }}

with base as (

    select * 
    from {{ ref('stg_quickbooks__credit_memo_line_tmp') }}

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
                source_columns=adapter.get_columns_in_relation(ref('stg_quickbooks__credit_memo_line_tmp')),
                staging_columns=get_credit_memo_line_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        credit_memo_id,
        index,
        amount,
        sales_item_account_id,
        sales_item_item_id,
        discount_account_id,
        discount_class_id

    from fields
)

select * 
from final
