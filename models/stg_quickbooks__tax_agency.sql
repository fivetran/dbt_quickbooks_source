{{ config(enabled=var('using_tax_agency', True)) }}

with base as (

    select * 
    from {{ ref('stg_quickbooks__tax_agency_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_quickbooks__tax_agency_tmp')),
                staging_columns=get_tax_agency_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as tax_agency_id,
        created_at,
        display_name,
        sync_token,
        tax_registration_number,
        tax_tracked_on_purchases,
        tax_tracked_on_sales,
        updated_at
    from fields
)

select *
from final
