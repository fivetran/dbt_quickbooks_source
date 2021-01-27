with base as (

    select * 
    from {{ ref('stg_quickbooks__purchase_line_tmp') }}

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
                source_columns=adapter.get_columns_in_relation(ref('stg_quickbooks__purchase_line_tmp')),
                staging_columns=get_purchase_line_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        cast(purchase_id as {{ 'int64' if target.name == 'bigquery' else 'bigint' }}) as purchase_id,
        index,
        cast(account_expense_account_id as {{ 'int64' if target.name == 'bigquery' else 'bigint' }}) as account_expense_account_id,
        account_expense_class_id,
        account_expense_billable_status,
        account_expense_tax_code_id,
        cast(item_expense_item_id as {{ 'int64' if target.name == 'bigquery' else 'bigint' }}) as item_expense_item_id,
        item_expense_billable_status,
        amount,
        description
    from fields
)

select * 
from final
