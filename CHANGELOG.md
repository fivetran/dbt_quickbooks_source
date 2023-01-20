#  dbt_quickbooks_source v0.7.0
## 🎉 🚨 Breaking Changes and New Feature 🚨 🎉:
- Add union schema ability to run QuickBooks across a number of schemas. ([#26](https://github.com/fivetran/dbt_quickbooks_source/pull/26) and [#35](https://github.com/fivetran/dbt_quickbooks_source/pull/35)) 

Thanks to [@ligfx](https://github.com/ligfx) for [putting in the hard work](https://github.com/fivetran/dbt_quickbooks_source/pull/26) that inspired this new feature! 
## 🎉 Additional Features
- Addition of all `class_id` fields to relevant models to support adding classes upstream into your general ledger models. [#35](https://github.com/fivetran/dbt_quickbooks_source/pull/35)
- Updated README to follow latest package standards. [#37](https://github.com/fivetran/dbt_quickbooks_source/pull/37)
- Added `quickbooks_[source_table_name]_identifier` variables so it's easier to refer to source tables with different names. [#37](https://github.com/fivetran/dbt_quickbooks_source/pull/37)

## Under the Hood
- Added unique tests because columns that were previously used for unique tests may now have duplicate fields across multiple sources, these columns are combined with the new `source_relation` column for unique tests and tested using the `dbt_utils.unique_combination_of_columns` macro. ([#26](https://github.com/fivetran/dbt_quickbooks_source/pull/26))
- Included a source relation column. This distinguishes which source each field comes from, we added a new `source_relation` column in each staging model and applied the `fivetran_utils.source_relation` macro. ([#26](https://github.com/fivetran/dbt_quickbooks_source/pull/26))

## Contibutors
- [@ligfx](https://github.com/ligfx) [#26](https://github.com/fivetran/dbt_quickbooks_source/pull/26)

# dbt_quickbooks_source v0.6.0
## 🚨 Breaking Changes 🚨:
[PR #30](https://github.com/fivetran/dbt_quickbooks_source/pull/30) includes the following breaking changes:
- Dispatch update for dbt-utils to dbt-core cross-db macros migration. Specifically `{{ dbt_utils.<macro> }}` have been updated to `{{ dbt.<macro> }}` for the below macros:
    - `any_value`
    - `bool_or`
    - `cast_bool_to_text`
    - `concat`
    - `date_trunc`
    - `dateadd`
    - `datediff`
    - `escape_single_quotes`
    - `except`
    - `hash`
    - `intersect`
    - `last_day`
    - `length`
    - `listagg`
    - `position`
    - `replace`
    - `right`
    - `safe_cast`
    - `split_part`
    - `string_literal`
    - `type_bigint`
    - `type_float`
    - `type_int`
    - `type_numeric`
    - `type_string`
    - `type_timestamp`
    - `array_append`
    - `array_concat`
    - `array_construct`
- For `current_timestamp` and `current_timestamp_in_utc` macros, the dispatch AND the macro names have been updated to the below, respectively:
    - `dbt.current_timestamp_backcompat`
    - `dbt.current_timestamp_in_utc_backcompat`
- `dbt_utils.surrogate_key` has also been updated to `dbt_utils.generate_surrogate_key`. Since the method for creating surrogate keys differ, we suggest all users do a `full-refresh` for the most accurate data. For more information, please refer to dbt-utils [release notes](https://github.com/dbt-labs/dbt-utils/releases) for this update.
- `packages.yml` has been updated to reflect new default `fivetran/fivetran_utils` version, previously `[">=0.3.0", "<0.4.0"]` now `[">=0.4.0", "<0.5.0"]`.
## Features
- Addition of the `credit_card_payment_txn` (enabled/disabled using the `using_credit_card_payment_txn` variable) source as well as the accompanying staging models. This source includes all credit card payment transactions and will be used in downstream General Ledger generation to ensure accurate reporting of all transaction types. ([#29](https://github.com/fivetran/dbt_quickbooks_source/pull/29))
  >**Note**: the `credit_card_payment_txn` source and models are disabled by default. In order to enabled them, you will want to set the `using_credit_card_payment_txn` variable to `true` in your dbt_project.yml.
- A GitHub workflow has been added to ensure the dbt docs are regenerated before each merge to the `main` release branch. 

# dbt_quickbooks_source v0.5.0
## 🚨 Breaking Changes 🚨
- It was discovered that IDs from the source tables can sometimes be strings. The previous build of the package interpreted all IDs as integers. To ensure the package operates as intended, the package has been updated to cast all IDs to the string datatype. If you were leveraging the end models in downstream analysis, this change could break your join conditions. Be sure to be aware of any join conditions you may have downstream before upgrading your QuickBooks package. ([#36](https://github.com/fivetran/dbt_quickbooks/pull/36)) ([#25](https://github.com/fivetran/dbt_quickbooks_source/pull/25)) ([#24](https://github.com/fivetran/dbt_quickbooks_source/pull/24))

## Contributors
- [@evancole-untitled](https://github.com/evancole-untitled) ([#24](https://github.com/fivetran/dbt_quickbooks_source/pull/24))

# dbt_quickbooks_source v0.4.0
🎉 dbt v1.0.0 Compatibility 🎉
## 🚨 Breaking Changes 🚨
- Adjusts the `require-dbt-version` to now be within the range [">=1.0.0", "<2.0.0"]. Additionally, the package has been updated for dbt v1.0.0 compatibility. If you are using a dbt version <1.0.0, you will need to upgrade in order to leverage the latest version of the package.
  - For help upgrading your package, I recommend reviewing this GitHub repo's Release Notes on what changes have been implemented since your last upgrade.
  - For help upgrading your dbt project to dbt v1.0.0, I recommend reviewing dbt-labs [upgrading to 1.0.0 docs](https://docs.getdbt.com/docs/guides/migration-guide/upgrading-to-1-0-0) for more details on what changes must be made.
- Upgrades the package dependency to refer to the latest `dbt_fivetran_utils`. The latest `dbt_fivetran_utils` package also has a dependency on `dbt_utils` [">=0.8.0", "<0.9.0"].
  - Please note, if you are installing a version of `dbt_utils` in your `packages.yml` that is not in the range above then you will encounter a package dependency error.

# dbt_quickbooks_source v0.1.0 -> v0.3.0
Refer to the relevant release notes on the Github repository for specific details for the previous releases. Thank you!
