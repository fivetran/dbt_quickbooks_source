with base as (

    select * 
    from {{ ref('stg_quickbooks__sales_receipt_tmp') }}

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
                source_columns=adapter.get_columns_in_relation(ref('stg_quickbooks__sales_receipt_tmp')),
                staging_columns=get_sales_receipt_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        cast(id as {{ 'int64' if target.name == 'bigquery' else 'bigint' }}) as sales_receipt_id,
        balance,
        total_amount,
        cast(deposit_to_account_id as {{ 'int64' if target.name == 'bigquery' else 'bigint' }}) as deposit_to_account_id,
        created_at,
        customer_id,
        department_id,
        class_id,
        currency_id,
        exchange_rate,
        transaction_date,
        _fivetran_deleted
    from fields
)

select * 
from final
where not coalesce(_fivetran_deleted, false)
