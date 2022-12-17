<p align="center">
    <a alt="License"
        href="https://github.com/fivetran/dbt_netsuite_source/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.3.0_<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
</p>

## QuickBooks Source

This package models QuickBooks data from [Fivetran's connector](https://fivetran.com/docs/applications/quickbooks). It uses data in the format described by [this ERD](https://fivetran.com/docs/applications/quickbooks#schemainformation).

This package enriches your Fivetran data by doing the following:

* Adds descriptions to tables and columns that are synced using Fivetran
* Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
* Models staging tables, which will be used in our transform package

## Models

This package contains staging models, designed to work simultaneously with our [QuickBooks transformation package](https://github.com/fivetran/dbt_quickbooks). The staging models name columns consistently across all packages:

* Boolean fields are prefixed with `is_` or `has_`
* Timestamps are appended with `_at`
* ID primary keys are prefixed with the name of the table. For example, the account table's ID column is renamed to `account_id`.

## Installation Instructions
Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

Include in your `packages.yml`

```yaml
packages:
  - package: fivetran/quickbooks_source
    version: [">=0.6.0", "<0.7.0"]
```

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

### Union Multiple Quickbooks Connectors
If you have multiple Quickbooks connectors in Fivetran and would like to use this package on all of them simultaneously, we have provided functionality to do so. The package will union all of the data together and pass the unioned table into the transformations. You will be able to see which source it came from in the `source_relation` column of each model. To use this functionality, you will need to set either the `quickbooks_union_schemas` or `quickbooks_union_databases` variables:

```yml
# dbt_project.yml

...
config-version: 2

vars:
    quickbooks_union_schemas: ['quickbooks_usa','quickbooks_canada'] # use this if the data is in different schemas/datasets of the same database/project
    quickbooks_union_databases: ['quickbooks_usa','quickbooks_canada'] # use this if the data is in different databases/projects but uses the same schema name
```


### Changing the Build Schema
By default this package will build the QuickBooks staging models within a schema titled (<target_schema> + `_quickbooks_staging`) in your target database. If this is not where you would like you QuickBooks staging data to be written to, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
models:
    quickbooks_source:
        +schema: my_new_schema_name
```
### Disabling models

This package takes into consideration that not every QuickBooks account utilizes the same transactional tables, and allows you to disable the corresponding functionality. By default, most variables' values are assumed to be `true` (with exception of purchase orders and credit card payments). Add variables for only the tables you want to disable or enable respectively:

```yml
# dbt_project.yml

...
vars:
  quickbooks_source:
    using_address:        false         #disable if you don't have addresses in QuickBooks
    using_bill:           false         #disable if you don't have bills or bill payments in QuickBooks
    using_credit_memo:    false         #disable if you don't have credit memos in QuickBooks
    using_department:     false         #disable if you don't have departments in QuickBooks
    using_deposit:        false         #disable if you don't have deposits in QuickBooks
    using_estimate:       false         #disable if you don't have estimates in QuickBooks
    using_invoice:        false         #disable if you don't have invoices in QuickBooks
    using_invoice_bundle: false         #disable if you don't have invoice bundles in QuickBooks
    using_journal_entry:  false         #disable if you don't have journal entries in QuickBooks
    using_payment:        false         #disable if you don't have payments in QuickBooks
    using_refund_receipt: false         #disable if you don't have refund receipts in QuickBooks
    using_transfer:       false         #disable if you don't have transfers in QuickBooks
    using_vendor_credit:  false         #disable if you don't have vendor credits in QuickBooks
    using_sales_receipt:  false         #disable if you don't have sales receipts in QuickBooks
    using_purchase_order: true          #enable if you want to include purchase orders in your staging models
    using_credit_card_payment_txn: true #enable if you want to include credit card payment transactions in your staging models
```

### Customize the ordinal for account classes in balance sheet and profit-and-loss models
If you're also using the `dbt_quickbooks` package, you can customize the order of your account classes in the `quickbooks__balance_sheet_account_class_order` and `quickbooks__profit_and_loss_account_class_order` seed files by changing the `ordinal` numbering. The current default numbering is based on best practices for finance balance sheets and profit-and-loss statements. If you are adding additional account class types, you will need to customize your own version of the `int_quickbooks__account_classifications` model to handle the logic for these types and either override or disable the above model and set up your own custom configuration. 

## Contributions

Additional contributions to this package are very welcome! Please create issues
or open PRs against `main`. Check out [this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657)
on the best workflow for contributing to a package.

## Resources:
- Provide [feedback](https://www.surveymonkey.com/r/DQ7K7WW) on our existing dbt packages or what you'd like to see next
- Have questions or feedback, or need help? Book a time during our office hours [here](https://calendly.com/fivetran-solutions-team/fivetran-solutions-team-office-hours) or shoot us an email at solutions@fivetran.com.
- Find all of Fivetran's pre-built dbt packages in our [dbt hub](https://hub.getdbt.com/fivetran/)
- Learn how to orchestrate your models with [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt)
- Learn more about Fivetran overall [in our docs](https://fivetran.com/docs)
- Check out [Fivetran's blog](https://fivetran.com/blog)
- Learn more about dbt [in the dbt docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the dbt blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
