--To disable this model, set the using_journal_entry variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_purchase', True)) }}

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
        purchase_id,
        index,
        account_expense_account_id,
        account_expense_billable_status,
        account_expense_tax_code_id,
        amount,
        description

    from fields
)

select * 
from final
