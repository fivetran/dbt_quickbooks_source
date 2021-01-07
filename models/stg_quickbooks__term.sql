
with base as (

    select * 
    from {{ ref('stg_quickbooks__term_tmp') }}

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
                source_columns=adapter.get_columns_in_relation(ref('stg_quickbooks__term_tmp')),
                staging_columns=get_term_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        id as term_id,
        active as is_active,
        created_at,
        discount_days,
        discount_percent,
        due_days,
        day_of_month_due,
        name,
        type

    from fields
)

select * 
from final
