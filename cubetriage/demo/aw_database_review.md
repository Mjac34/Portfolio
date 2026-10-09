# Review: aw_database

84 warn, 67 info

| Severity | Rule | Object | Message |
|---|---|---|---|
| warn | `parent_child_flattened` | Dim Account | Self-referencing hierarchy flattened to fixed depth 2 (AccountKey -> Parent Account Key) |
| warn | `orphan_attribute` | Dim Customer.Birth Date | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Customer.Date First Purchase | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Customer.Phone | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Customer.Email Address | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Customer.CommuteDistanceSort | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Customer.Address Line1 | Attribute not part of any hierarchy — keep or drop? |
| warn | `parent_child_flattened` | Dim Department Group | Self-referencing hierarchy flattened to fixed depth 2 (DepartmentGroupKey -> Parent Department Group Key) |
| warn | `orphan_attribute` | Dim Destination Currency.LCID | Attribute not part of any hierarchy — keep or drop? |
| warn | `scd2_incomplete` | Dim Employee | SCD metadata partial — missing natural_key (current_flag=EmployeeStatus, valid_from=SimpleStartDate, valid_to=SimpleEndDate); confirm whether this is really type-2 |
| warn | `scd2_dimension` | Dim Employee | Type-2 dimension — fact FK joins surrogate EmployeeKey; point-in-time vs current-version (? + SimpleStartDate/SimpleEndDate) must be decided |
| warn | `parent_child_flattened` | Dim Employee | Self-referencing hierarchy flattened to fixed depth 2 (EmployeeKey -> ParentEmployeeKey) |
| warn | `orphan_attribute` | Dim Employee.Birth Date | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Employee.Login ID | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Employee.Email Address | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Employee.Emergency Contact Name | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Employee.Emergency Contact Phone | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Employee.SSN | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Employee.Manager SSN | Attribute not part of any hierarchy — keep or drop? |
| warn | `parent_child_flattened` | Dim Organization | Self-referencing hierarchy flattened to fixed depth 2 (OrganizationKey -> Parent Organization Key) |
| warn | `scd2_incomplete` | Dim Product | SCD metadata partial — missing natural_key (current_flag=StatusDesc, valid_from=SimpleStartDate, valid_to=SimpleEndDate); confirm whether this is really type-2 |
| warn | `scd2_dimension` | Dim Product | Type-2 dimension — fact FK joins surrogate ProductKey; point-in-time vs current-version (? + SimpleStartDate/SimpleEndDate) must be decided |
| warn | `orphan_attribute` | Dim Reseller.Phone | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Reseller.Last Order Year | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Reseller.First Order Year | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Reseller.Year Opened | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Reseller.Min Payment Amount | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Reseller.Min Payment Type | Attribute not part of any hierarchy — keep or drop? |
| warn | `orphan_attribute` | Dim Reseller.AddressLine1 | Attribute not part of any hierarchy — keep or drop? |
| warn | `calculated_measure` | Fact Internet Sales 1.Internet Sales Amount | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales 1.Internet Extended Amount | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales 1.Internet Tax Amount | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales 1.Internet Freight Cost | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales 1.Internet Unit Price | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales 1.Internet Total Product Cost | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales 1.Internet Standard Product Cost | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Reseller Sales.Reseller Sales Amount | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Reseller Sales.Reseller Extended Amount | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Reseller Sales.Reseller Tax Amount | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Reseller Sales.Reseller Freight Cost | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Reseller Sales.Discount Amount | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Reseller Sales.Reseller Unit Price | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Reseller Sales.Reseller Total Product Cost | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Reseller Sales.Reseller Standard Product Cost | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Sales Summary.Unit Price | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Sales Summary.Extended Amount | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Sales Summary.Standard Product Cost | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Sales Summary.Total Product Cost | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Sales Summary.Sales Amount | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Sales Summary.Tax Amount | MDX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Sales Summary.Freight Cost | MDX expression cannot be auto-translated — manual review |
| warn | `inactive_relationship` | Fact Internet Sales 1 -> Dim Time (Order Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Internet Sales 1 -> Dim Time (Ship Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Internet Sales 1 -> Dim Time (Due Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Internet Orders -> Dim Time (Due Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Internet Orders -> Dim Time (Ship Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Internet Orders -> Dim Time (Order Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Internet Sales -> Dim Time (Order Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Internet Sales -> Dim Time (Ship Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Internet Sales -> Dim Time (Due Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Internet Sales Reason -> Dim Sales Reason (Sales Reason) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Internet Sales Reason -> Fact Internet Sales (Internet Sales Order Details) | Inactive relationship — materialize as separate role dim? |
| warn | `reference_dimension` | Fact Reseller Sales <- Dim Geography | Dimension reaches fact via Dim Reseller — join path must be resolved |
| warn | `inactive_relationship` | Fact Reseller Sales -> Dim Time (Order Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Reseller Sales -> Dim Time (Ship Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Reseller Sales -> Dim Time (Due Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `reference_dimension` | Reseller Orders <- Dim Geography | Dimension reaches fact via Dim Reseller — join path must be resolved |
| warn | `inactive_relationship` | Reseller Orders -> Dim Time (Order Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Reseller Orders -> Dim Time (Ship Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Reseller Orders -> Dim Time (Due Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Sales Summary -> Fact Sales Summary (Sales Channel) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Sales Summary -> Dim Time (Order Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Sales Summary -> Dim Time (Ship Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Sales Summary -> Dim Time (Due Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Sales Summary -> Fact Sales Summary (Sales Channel) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Sales Summary -> Dim Time (Order Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Sales Summary -> Dim Time (Ship Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Sales Summary -> Dim Time (Due Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `reference_dimension` | Fact Sales Quota <- Dim Sales Territory | Dimension reaches fact via Dim Employee — join path must be resolved |
| warn | `inactive_relationship` | Fact Sales Quota -> Dim Time (Order Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `reference_dimension` | Fact Finance <- Dim Destination Currency | Dimension reaches fact via Dim Organization — join path must be resolved |
| warn | `inactive_relationship` | Fact Finance -> Dim Time (Order Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Currency Rate -> Dim Destination Currency (Destination Currency) | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Currency Rate -> Dim Time (Order Date Key - Dim Time) | Inactive relationship — materialize as separate role dim? |
| info | `snowflake_denormalized` | Dim Customer | Snowflake source dbo_DimCustomer -> dbo_DimGeography flattened into one dim table |
| info | `hidden_attribute` | Dim Customer.Birth Date | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Customer.Date First Purchase | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Customer.Phone | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Customer.Email Address | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Customer.CommuteDistanceSort | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Customer.Address Line1 | Hidden attribute excluded from dim table unless needed |
| info | `ragged_hierarchy` | Dim Customer.Hierarchy | Ragged hierarchy — missing levels padded with NULL |
| info | `hidden_attribute` | Dim Destination Currency.LCID | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Employee.Birth Date | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Employee.Login ID | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Employee.Email Address | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Employee.Emergency Contact Name | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Employee.Emergency Contact Phone | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Employee.SSN | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Employee.Manager SSN | Hidden attribute excluded from dim table unless needed |
| info | `ragged_hierarchy` | Dim Geography.Hierarchy | Ragged hierarchy — missing levels padded with NULL |
| info | `snowflake_denormalized` | Dim Product | Snowflake source dbo_DimProduct -> dbo_DimProductCategory -> dbo_DimProductSubcategory flattened into one dim table |
| info | `ragged_hierarchy` | Dim Promotion.Hierarchy | Ragged hierarchy — missing levels padded with NULL |
| info | `hidden_attribute` | Dim Reseller.Phone | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Reseller.Last Order Year | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Reseller.First Order Year | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Reseller.Year Opened | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Reseller.Min Payment Amount | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Reseller.Min Payment Type | Hidden attribute excluded from dim table unless needed |
| info | `hidden_attribute` | Dim Reseller.AddressLine1 | Hidden attribute excluded from dim table unless needed |
| info | `ragged_hierarchy` | Dim Sales Territory.Hierarchy | Ragged hierarchy — missing levels padded with NULL |
| info | `hidden_measure` | Fact Internet Sales 1.Internet Unit Price | Hidden measure — confirm whether to carry over |
| info | `hidden_measure` | Fact Internet Sales 1.Internet Transaction Count | Hidden measure — confirm whether to carry over |
| info | `degenerate_attribute` | Fact Internet Sales 1.SalesOrderNumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales 1.SalesOrderLineNumber | Degenerate attribute kept on fact table |
| info | `count_distinct` | Internet Orders.Internet Order Count | Distinct count has no cheap relational equivalent |
| info | `degenerate_attribute` | Internet Orders.SalesOrderNumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Internet Orders.SalesOrderLineNumber | Degenerate attribute kept on fact table |
| info | `count_distinct` | Fact Internet Sales.Customer Count | Distinct count has no cheap relational equivalent |
| info | `degenerate_attribute` | Fact Internet Sales.SalesOrderNumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.SalesOrderLineNumber | Degenerate attribute kept on fact table |
| info | `hidden_measure` | Fact Internet Sales Reason.Sales Reason Count | Hidden measure — confirm whether to carry over |
| info | `hidden_measure` | Fact Reseller Sales.Reseller Unit Price | Hidden measure — confirm whether to carry over |
| info | `hidden_measure` | Fact Reseller Sales.Unit Price Discount Percent | Hidden measure — confirm whether to carry over |
| info | `hidden_measure` | Fact Reseller Sales.Reseller Transaction Count | Hidden measure — confirm whether to carry over |
| info | `degenerate_attribute` | Fact Reseller Sales.SalesOrderNumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.SalesOrderLineNumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.CarrierTrackingNumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.CustomerPONumber | Degenerate attribute kept on fact table |
| info | `count_distinct` | Reseller Orders.Reseller Order Count | Distinct count has no cheap relational equivalent |
| info | `degenerate_attribute` | Reseller Orders.SalesOrderNumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Reseller Orders.SalesOrderLineNumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Reseller Orders.CarrierTrackingNumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Reseller Orders.CustomerPONumber | Degenerate attribute kept on fact table |
| info | `hidden_measure` | Fact Sales Summary.Unit Price | Hidden measure — confirm whether to carry over |
| info | `hidden_measure` | Fact Sales Summary.Transaction Count | Hidden measure — confirm whether to carry over |
| info | `degenerate_attribute` | Fact Sales Summary.SalesOrderNumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Sales Summary.SalesOrderLineNumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Sales Summary.CarrierTrackingNumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Sales Summary.CustomerPONumber | Degenerate attribute kept on fact table |
| info | `count_distinct` | Sales Summary.Order Count | Distinct count has no cheap relational equivalent |
| info | `degenerate_attribute` | Sales Summary.SalesOrderNumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Sales Summary.SalesOrderLineNumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Sales Summary.CarrierTrackingNumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Sales Summary.CustomerPONumber | Degenerate attribute kept on fact table |
| info | `m2m_via_bridge` | Fact Internet Sales 1 <-> Dim Destination Currency | m2m resolved via bridge Fact Currency Rate |
| info | `m2m_via_bridge` | Fact Internet Sales 1 <-> Dim Sales Reason | m2m resolved via bridge Fact Internet Sales Reason |
| info | `m2m_via_bridge` | Internet Orders <-> Dim Sales Reason | m2m resolved via bridge Fact Internet Sales Reason |
| info | `m2m_via_bridge` | Fact Internet Sales <-> Dim Sales Reason | m2m resolved via bridge Fact Internet Sales Reason |
| info | `m2m_via_bridge` | Fact Reseller Sales <-> Dim Destination Currency | m2m resolved via bridge Fact Currency Rate |
| info | `m2m_via_bridge` | Fact Sales Summary <-> Dim Destination Currency | m2m resolved via bridge Fact Currency Rate |

## Not migrated

Constructs observed in the source that cannot be migrated automatically — require a human decision.

| Severity | Object | Message |
|---|---|---|
| warn | Dim Account.Parent Account Key | unary operator column — not migratable; reimplement roll-up logic in target |
| warn | Dim Account.Parent Account Key | custom rollup column — not migratable; reimplement in target |
| warn | Dim Organization.Parent Organization Key | unary operator column — not migratable; reimplement roll-up logic in target |
| warn | Fact Finance.Amount | AggregateFunction 'ByAccount' unsupported (semi-additive?) — migrated as 'none'; manual translation required |
| warn | Fact Currency Rate.Average Rate | AggregateFunction 'AverageOfChildren' unsupported (semi-additive?) — migrated as 'none'; manual translation required |
| warn | Fact Currency Rate.End Of Day Rate | AggregateFunction 'LastNonEmpty' unsupported (semi-additive?) — migrated as 'none'; manual translation required |
| warn | MdxScript: /*-- Aggregate leaf data ---------------... | script command '/*--' not migratable — review manually |
| warn | KPI 5 | cube KPI — not representable in star schema; rebuild in target |
| warn | KPI 12 | cube KPI — not representable in star schema; rebuild in target |
| warn | KPI 6 | cube KPI — not representable in star schema; rebuild in target |
| warn | KPI 8 | cube KPI — not representable in star schema; rebuild in target |
| warn | KPI 7 | cube KPI — not representable in star schema; rebuild in target |
| warn | Return On Assets | cube KPI — not representable in star schema; rebuild in target |
| warn | KPI | cube KPI — not representable in star schema; rebuild in target |
| warn | KPI 4 | cube KPI — not representable in star schema; rebuild in target |
| warn | KPI 1 | cube KPI — not representable in star schema; rebuild in target |
| warn | KPI 10 | cube KPI — not representable in star schema; rebuild in target |
| warn | KPI 3 | cube KPI — not representable in star schema; rebuild in target |
| warn | KPI 11 | cube KPI — not representable in star schema; rebuild in target |
| warn | Action | cube action — not migratable; reimplement manually |
| warn | Report Action | cube action — not migratable; reimplement manually |
| warn | Drillthrough Action | cube action — not migratable; reimplement manually |
| warn | Drillthrough Action 1 | cube action — not migratable; reimplement manually |
| warn | Drillthrough Action 2 | cube action — not migratable; reimplement manually |
| warn | Drillthrough Action 4 | cube action — not migratable; reimplement manually |
| info | Perspective | perspective — not migrated; recreate in target if needed |
| info | Perspective 1 | perspective — not migrated; recreate in target if needed |
| info | Perspective 2 | perspective — not migrated; recreate in target if needed |
| info | Perspective 3 | perspective — not migrated; recreate in target if needed |
| info | Perspective 4 | perspective — not migrated; recreate in target if needed |
| info | Adventure Works | cube translations in 2 language(s) (1036, 3082) — not migrated; recreate in target |

## Proposals (AI/mock)

Proposals — reviewed, never auto-accepted. Verification is code.

| Flag | Object | Proposal | Verify |
|---|---|---|---|
| `parent_child_flattened` | Dim Account | propose: materialized path column + adjacency; confirm max_depth with data profiling | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Customer.Birth Date | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Customer.Date First Purchase | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Customer.Phone | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Customer.Email Address | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Customer.CommuteDistanceSort | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Customer.Address Line1 | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `parent_child_flattened` | Dim Department Group | propose: materialized path column + adjacency; confirm max_depth with data profiling | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Destination Currency.LCID | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `scd2_incomplete` | Dim Employee | propose: either add natural_key or confirm this is NOT scd2 and strip the flag | column_refs=ok; type_vocab=ok; nonempty=ok |
| `scd2_dimension` | Dim Employee | propose: keep surrogate key; load valid_from/valid_to as columns; decide point-in-time pol | column_refs=ok; type_vocab=ok; nonempty=ok |
| `parent_child_flattened` | Dim Employee | propose: materialized path column + adjacency; confirm max_depth with data profiling | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Employee.Birth Date | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Employee.Login ID | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Employee.Email Address | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Employee.Emergency Contact Name | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Employee.Emergency Contact Phone | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Employee.SSN | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Employee.Manager SSN | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `parent_child_flattened` | Dim Organization | propose: materialized path column + adjacency; confirm max_depth with data profiling | column_refs=ok; type_vocab=ok; nonempty=ok |
| `scd2_incomplete` | Dim Product | propose: either add natural_key or confirm this is NOT scd2 and strip the flag | column_refs=ok; type_vocab=ok; nonempty=ok |
| `scd2_dimension` | Dim Product | propose: keep surrogate key; load valid_from/valid_to as columns; decide point-in-time pol | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Reseller.Phone | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Reseller.Last Order Year | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Reseller.First Order Year | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Reseller.Year Opened | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Reseller.Min Payment Amount | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Reseller.Min Payment Type | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `orphan_attribute` | Dim Reseller.AddressLine1 | propose: drop column OR move to dim table — check if reports use it | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales 1.Internet Sales Amount | -- manual translation required: --   [Internet Sales Amount] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales 1.Internet Extended Amount | -- manual translation required: --   [Internet Extended Amount] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales 1.Internet Tax Amount | -- manual translation required: --   [Internet Tax Amount] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales 1.Internet Freight Cost | -- manual translation required: --   [Internet Freight Cost] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales 1.Internet Unit Price | -- manual translation required: --   [Internet Unit Price] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales 1.Internet Total Product Cost | -- manual translation required: --   [Internet Total Product Cost] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales 1.Internet Standard Product Cost | -- manual translation required: --   [Internet Standard Product Cost] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Reseller Sales.Reseller Sales Amount | -- manual translation required: --   [Reseller Sales Amount] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Reseller Sales.Reseller Extended Amount | -- manual translation required: --   [Reseller Extended Amount] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Reseller Sales.Reseller Tax Amount | -- manual translation required: --   [Reseller Tax Amount] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Reseller Sales.Reseller Freight Cost | -- manual translation required: --   [Reseller Freight Cost] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Reseller Sales.Discount Amount | -- manual translation required: --   [Discount Amount] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Reseller Sales.Reseller Unit Price | -- manual translation required: --   [Reseller Unit Price] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Reseller Sales.Reseller Total Product Cost | -- manual translation required: --   [Reseller Total Product Cost] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Reseller Sales.Reseller Standard Product Cost | -- manual translation required: --   [Reseller Standard Product Cost] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Sales Summary.Unit Price | -- manual translation required: --   [Unit Price] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Sales Summary.Extended Amount | -- manual translation required: --   [Extended Amount] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Sales Summary.Standard Product Cost | -- manual translation required: --   [Standard Product Cost] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Sales Summary.Total Product Cost | -- manual translation required: --   [Total Product Cost] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Sales Summary.Sales Amount | -- manual translation required: --   [Sales Amount] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Sales Summary.Tax Amount | -- manual translation required: --   [Tax Amount] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Sales Summary.Freight Cost | -- manual translation required: --   [Freight Cost] / [Average Rate] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Internet Sales 1 -> Dim Time (Order Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Internet Sales 1 -> Dim Time (Ship Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Internet Sales 1 -> Dim Time (Due Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Internet Orders -> Dim Time (Due Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Internet Orders -> Dim Time (Ship Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Internet Orders -> Dim Time (Order Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Internet Sales -> Dim Time (Order Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Internet Sales -> Dim Time (Ship Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Internet Sales -> Dim Time (Due Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Internet Sales Reason -> Dim Sales Reason (Sales Reason) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Internet Sales Reason -> Fact Internet Sales (Internet Sales Order Details) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `reference_dimension` | Fact Reseller Sales <- Dim Geography | propose: flatten reference into fact OR keep snowflake; snowflake adds a join | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Reseller Sales -> Dim Time (Order Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Reseller Sales -> Dim Time (Ship Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Reseller Sales -> Dim Time (Due Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `reference_dimension` | Reseller Orders <- Dim Geography | propose: flatten reference into fact OR keep snowflake; snowflake adds a join | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Reseller Orders -> Dim Time (Order Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Reseller Orders -> Dim Time (Ship Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Reseller Orders -> Dim Time (Due Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Sales Summary -> Fact Sales Summary (Sales Channel) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Sales Summary -> Dim Time (Order Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Sales Summary -> Dim Time (Ship Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Sales Summary -> Dim Time (Due Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Sales Summary -> Fact Sales Summary (Sales Channel) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Sales Summary -> Dim Time (Order Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Sales Summary -> Dim Time (Ship Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Sales Summary -> Dim Time (Due Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `reference_dimension` | Fact Sales Quota <- Dim Sales Territory | propose: flatten reference into fact OR keep snowflake; snowflake adds a join | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Sales Quota -> Dim Time (Order Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `reference_dimension` | Fact Finance <- Dim Destination Currency | propose: flatten reference into fact OR keep snowflake; snowflake adds a join | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Finance -> Dim Time (Order Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Currency Rate -> Dim Destination Currency (Destination Currency) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Currency Rate -> Dim Time (Order Date Key - Dim Time) | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Dim Account.Parent Account Key | propose: custom rollup logic — reimplement in ETL or target measure | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Dim Account.Parent Account Key | propose: custom rollup logic — reimplement in ETL or target measure | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Dim Organization.Parent Organization Key | propose: custom rollup logic — reimplement in ETL or target measure | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Fact Finance.Amount | propose: semi-additive aggregation — needs partition-aware or manual logic in target | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Fact Currency Rate.Average Rate | propose: semi-additive aggregation — needs partition-aware or manual logic in target | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Fact Currency Rate.End Of Day Rate | propose: semi-additive aggregation — needs partition-aware or manual logic in target | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | MdxScript: /*-- Aggregate leaf data ---------------... | propose: rewrite construct in target language; scope/if/freeze do not map to star schema | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | KPI 5 | propose: rebuild as target-layer KPI (e.g. semantic model or BI tool); extract goal/status | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | KPI 12 | propose: rebuild as target-layer KPI (e.g. semantic model or BI tool); extract goal/status | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | KPI 6 | propose: rebuild as target-layer KPI (e.g. semantic model or BI tool); extract goal/status | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | KPI 8 | propose: rebuild as target-layer KPI (e.g. semantic model or BI tool); extract goal/status | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | KPI 7 | propose: rebuild as target-layer KPI (e.g. semantic model or BI tool); extract goal/status | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Return On Assets | propose: rebuild as target-layer KPI (e.g. semantic model or BI tool); extract goal/status | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | KPI | propose: rebuild as target-layer KPI (e.g. semantic model or BI tool); extract goal/status | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | KPI 4 | propose: rebuild as target-layer KPI (e.g. semantic model or BI tool); extract goal/status | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | KPI 1 | propose: rebuild as target-layer KPI (e.g. semantic model or BI tool); extract goal/status | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | KPI 10 | propose: rebuild as target-layer KPI (e.g. semantic model or BI tool); extract goal/status | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | KPI 3 | propose: rebuild as target-layer KPI (e.g. semantic model or BI tool); extract goal/status | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | KPI 11 | propose: rebuild as target-layer KPI (e.g. semantic model or BI tool); extract goal/status | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Action | propose: document action behavior; reimplement in consuming tool | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Report Action | propose: document action behavior; reimplement in consuming tool | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Drillthrough Action | propose: document action behavior; reimplement in consuming tool | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Drillthrough Action 1 | propose: document action behavior; reimplement in consuming tool | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Drillthrough Action 2 | propose: document action behavior; reimplement in consuming tool | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Drillthrough Action 4 | propose: document action behavior; reimplement in consuming tool | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Perspective | propose: recreate as view/schema filter in target | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Perspective 1 | propose: recreate as view/schema filter in target | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Perspective 2 | propose: recreate as view/schema filter in target | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Perspective 3 | propose: recreate as view/schema filter in target | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Perspective 4 | propose: recreate as view/schema filter in target | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Adventure Works | propose: extract translation table to target metadata layer | column_refs=ok; type_vocab=ok; nonempty=ok |

## Ingestion assumptions

The values below are inferred, not observed — review before relying on them.

| Severity | Object | Assumption |
|---|---|---|
| warn | Dim Account | parent_child max_depth defaulted to 2 — not observable in ASSL; flattening truncates at this depth |
| info | Dim Customer.dbo_DimGeography | snowflake join key 'PostalCode' derived from attribute KeyColumns binding — verify FK column name in head table |
| warn | Dim Department Group | parent_child max_depth defaulted to 2 — not observable in ASSL; flattening truncates at this depth |
| warn | Dim Employee | parent_child max_depth defaulted to 2 — not observable in ASSL; flattening truncates at this depth |
| warn | Dim Organization | parent_child max_depth defaulted to 2 — not observable in ASSL; flattening truncates at this depth |
| info | Dim Product.dbo_DimProductCategory | snowflake join key 'ProductCategoryKey' derived from attribute KeyColumns binding — verify FK column name in head table |
| info | Dim Product.dbo_DimProductSubcategory | snowflake join key 'ProductSubcategoryKey' derived from attribute KeyColumns binding — verify FK column name in head table |
| info | Fact Internet Sales 1.Sales Amount 2 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Internet Sales 1.Sales Amount 2 | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Internet Sales 1.Order Quantity 2 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Internet Sales 1.Extended Amount 2 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Internet Sales 1.Extended Amount 2 | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Internet Sales 1.Tax Amt 2 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Internet Sales 1.Tax Amt 2 | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Internet Sales 1.Freight 2 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Internet Sales 1.Freight 2 | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Internet Sales 1.Unit Price 2 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Internet Sales 1.Unit Price 2 | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Internet Sales 1.Total Product Cost 2 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Internet Sales 1.Total Product Cost 2 | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Internet Sales 1.Product Standard Cost 2 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Internet Sales 1.Product Standard Cost 2 | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Internet Sales 1 -> Dim Destination Currency (Destination Currency) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Internet Sales 1 -> Dim Destination Currency | m2m bridge resolved via intermediate MeasureGroup; column mapping derived from its granularity bindings |
| info | Fact Internet Sales 1 -> Dim Time (Order Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Internet Sales 1 -> Dim Time (Ship Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Internet Sales 1 -> Dim Sales Reason (Sales Reason) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Internet Sales 1 -> Dim Sales Reason | m2m bridge resolved via intermediate MeasureGroup; column mapping derived from its granularity bindings |
| info | Fact Internet Sales 1 -> Dim Time (Due Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Internet Orders -> Dim Time (Due Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Internet Orders -> Dim Time (Ship Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Internet Orders -> Dim Time (Order Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Internet Orders -> Dim Sales Reason (Sales Reason) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Internet Orders -> Dim Sales Reason | m2m bridge resolved via intermediate MeasureGroup; column mapping derived from its granularity bindings |
| info | Fact Internet Sales -> Dim Time (Order Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Internet Sales -> Dim Time (Ship Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Internet Sales -> Dim Time (Due Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Internet Sales -> Dim Sales Reason (Sales Reason) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Internet Sales -> Dim Sales Reason | m2m bridge resolved via intermediate MeasureGroup; column mapping derived from its granularity bindings |
| info | Fact Internet Sales Reason -> Dim Sales Reason (Sales Reason) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Internet Sales Reason -> Fact Internet Sales (Internet Sales Order Details) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Reseller Sales.Sales Amount 1 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Reseller Sales.Sales Amount 1 | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Reseller Sales.Order Quantity 1 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Reseller Sales.Extended Amount 1 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Reseller Sales.Extended Amount 1 | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Reseller Sales.Tax Amt 1 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Reseller Sales.Tax Amt 1 | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Reseller Sales.Freight 1 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Reseller Sales.Freight 1 | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Reseller Sales.Discount Amount 1 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Reseller Sales.Discount Amount 1 | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Reseller Sales.Unit Price 1 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Reseller Sales.Unit Price 1 | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Reseller Sales.Total Product Cost 1 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Reseller Sales.Total Product Cost 1 | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Reseller Sales.Product Standard Cost 1 | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Reseller Sales.Product Standard Cost 1 | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Reseller Sales -> Dim Destination Currency (Destination Currency) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Reseller Sales -> Dim Destination Currency | m2m bridge resolved via intermediate MeasureGroup; column mapping derived from its granularity bindings |
| info | Fact Reseller Sales -> Dim Time (Order Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Reseller Sales -> Dim Time (Ship Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Reseller Sales -> Dim Time (Due Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Reseller Orders -> Dim Time (Order Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Reseller Orders -> Dim Time (Ship Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Reseller Orders -> Dim Time (Due Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Sales Summary.Order Quantity | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Sales Summary.Unit Price | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Sales Summary.Unit Price | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Sales Summary.Extended Amount | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Sales Summary.Extended Amount | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Sales Summary.Product Standard Cost | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Sales Summary.Product Standard Cost | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Sales Summary.Total Product Cost | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Sales Summary.Total Product Cost | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Sales Summary.Sales Amount | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Sales Summary.Sales Amount | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Sales Summary.Tax Amt | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Sales Summary.Tax Amt | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Sales Summary.Freight | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Sales Summary.Freight | MeasureExpression treated as calculated — leaf-level formula, aggregation semantics may differ in target |
| info | Fact Sales Summary -> Fact Sales Summary (Sales Channel) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Sales Summary -> Dim Destination Currency (Destination Currency) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Sales Summary -> Dim Destination Currency | m2m bridge resolved via intermediate MeasureGroup; column mapping derived from its granularity bindings |
| info | Fact Sales Summary -> Dim Time (Order Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Sales Summary -> Dim Time (Ship Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Sales Summary -> Dim Time (Due Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Sales Summary -> Fact Sales Summary (Sales Channel) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Sales Summary -> Dim Time (Order Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Sales Summary -> Dim Time (Ship Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Sales Summary -> Dim Time (Due Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Sales Quota.Sales Amount Quota | AggregateFunction absent — defaulted to 'sum' (ASSL default) |
| info | Fact Sales Quota -> Dim Time (Order Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| warn | Fact Sales Quota -> Dim Time | granularity at 'CalendarQuarterDesc', not key attr 'TimeKey' — coarse-grain relationship |
| info | Fact Finance -> Dim Destination Currency (Destination Currency) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Finance -> Dim Time (Order Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Currency Rate -> Dim Destination Currency (Destination Currency) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Currency Rate -> Dim Time (Order Date Key - Dim Time) | role-playing cube dimension assumed inactive (alias over shared dimension) |
| info | Fact Sales Summary 1 | dimension used only as fact/degenerate dimension — folded into fact columns |
| info | Fact Reseller Sales | dimension used only as fact/degenerate dimension — folded into fact columns |
| info | Fact Internet Sales | dimension used only as fact/degenerate dimension — folded into fact columns |

## Renderer notes
- Column types resolved from canonical column_types (neutral -> T-SQL); untyped columns fall back to placeholders
- Bridge columns resolved from canonical bridge metadata
