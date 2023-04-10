{{ config(enabled=var('using_invoice_tax_line', True)) }}

with base as (

    select * 
    from {{ ref('stg_quickbooks__invoice_tax_line_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_quickbooks__invoice_tax_line_tmp')),
                staging_columns=get_invoice_tax_line_columns()
            )
        }}
    from base
),

final as (
    
    select 
        invoice_id,
        index,
        amount,
        tax_rate_id,
        tax_percent,
        tax_inclusive_amount,
        net_amount_taxable,
        override_delta_amount,
        percent_based
    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final
