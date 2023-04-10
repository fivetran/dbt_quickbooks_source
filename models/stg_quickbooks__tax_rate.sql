{{ config(enabled=var('using_tax_rate', True)) }}

with base as (

    select * 
    from {{ ref('stg_quickbooks__tax_rate_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_quickbooks__tax_rate_tmp')),
                staging_columns=get_tax_rate_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as tax_rate_id,
        name,
        active,
        created_at,
        description,
        display_type,
        effective_tax_rate,
        rate_value,
        special_tax_type,
        sync_token,
        tax_agency_id,
        updated_at
    from fields
)

select *
from final
