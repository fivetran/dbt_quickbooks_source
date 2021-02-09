# QuickBooks Source

This package models QuickBooks data from [Fivetran's connector](https://fivetran.com/docs/applications/quickbooks). It uses data in the format described by [this ERD](https://fivetran.com/docs/applications/quickbooks#schemainformation).

This package enriches your Fivetran data by doing the following:

* Adds descriptions to tables and columns that are synced using Fivetran
* Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
* Models staging tables, which will be used in our transform package

## Models

This package contains staging models, designed to work simultaneously with our [QuickBooks modeling package](https://github.com/fivetran/dbt_quickbooks). The staging models name columns consistently across all packages:

* Boolean fields are prefixed with `is_` or `has_`
* Timestamps are appended with `_at`
* ID primary keys are prefixed with the name of the table. For example, the account table's ID column is renamed to `account_id`.

## Installation Instructions

Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

## Configuration

By default, this package looks for your QuickBooks data in the `quickbooks` schema of your [target database](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-command-line-interface/configure-your-profile). If this is not where your QuickBooks data is, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
config-version: 2

vars:
    quickbooks_database: your_database_name
    quickbooks_schema: your_schema_name
```

### Disabling models

This package takes into consideration that not every QuickBooks account utilizes the same transactional tables, and allows you to disable the corresponding functionality. By default, most variables' values are assumed to be `true` (with exception of purchase orders). Add variables for only the tables you want to disable or enable respectively:

```yml
# dbt_project.yml

...
vars:
  quickbooks_source:
    using_bill:           false         #disable if you don't have bils or bill payments in QuickBooks
    using_credit_memo:    false         #disable if you don't have credit memos in QuickBooks
    using_department:     false         #disable if you don't have departments in QuickBooks
    using_deposit:        false         #disable if you don't have deposits in QuickBooks
    using_estimate:       false         #disable if you don't have estimates in QuickBooks
    using_invoice:        false         #disable if you don't have invoices in QuickBooks
    using_invoice_bundle: false         #disable if you don't have invoice bundles in QuickBooks
    using_journal_entry:  false         #disable if you don't have journal entries in QuickBooks
    using_payment:        false         #disable if you don't have payments in QuickBooks
    using_purchase_order: false         #disable if you don't have purchase orders in QuickBooks
    using_refund_receipt: false         #disable if you don't have refund receipts in QuickBooks
    using_transfer:       false         #disable if you don't have transfers in QuickBooks
    using_vendor_credit:  false         #disable if you don't have vendor credits in QuickBooks
    using_sales_receipt:  false         #disable if you don't have sales receipts in QuickBooks
    using_purchase_order: true          #enable if you want to include purchase orders in your staging models
```

## Contributions

Additional contributions to this package are very welcome! Please create issues
or open PRs against `master`. Check out [this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657)
on the best workflow for contributing to a package.

## Resources:

- Provide [feedback](https://www.surveymonkey.com/r/DQ7K7WW) on our existing dbt packages or what you'd like to see next
- Find all of Fivetran's pre-built dbt packages in our [dbt hub](https://hub.getdbt.com/fivetran/)
- Learn more about Fivetran [in the Fivetran docs](https://fivetran.com/docs)
- Check out [Fivetran's blog](https://fivetran.com/blog)
- Learn more about dbt [in the dbt docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the dbt blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
