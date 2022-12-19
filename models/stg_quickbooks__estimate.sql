--To disable this model, set the using_estimate variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_estimate', True)) }}

with base as (

    select * 
    from {{ ref('stg_quickbooks__estimate_tmp') }}

),
 
fields as (

    select
        /*
        The below macro is used to generate the correct SQL for package staging models. It takes a list of columns 
        that are expected/needed (staging_columns from dbt_quickbooks_source/models/tmp/) and compares it with columns 
        in the source (source_columns from dbt_quickbooks_source/macros/).
        For more information refer to our dbt_fivetran_utils documentation (https://github.com/fivetran/dbt_fivetran_utils.git).
        */

        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_quickbooks__estimate_tmp')),
                staging_columns=get_estimate_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        cast(id as {{ dbt.type_string() }}) as estimate_id,
        class_id,
        created_at,
        currency_id,
        customer_id,
        department_id,
        due_date,
        total_amount,
        transaction_date,
        transaction_status,
        _fivetran_deleted
    from fields
)

select * 
from final
where not coalesce(_fivetran_deleted, false)
