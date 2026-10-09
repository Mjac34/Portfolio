# Review: wwi-ssis

17 warn, 42 info

| Severity | Rule | Object | Message |
|---|---|---|---|
| warn | `expression_driven` | Calculate ETL Cutoff Time backup | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `expression_driven` | Load City Dimension.Set TableName to City | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `expression_driven` | Load Customer Dimension.Set TableName to Customer | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `expression_driven` | Load Employee Dimension.Set TableName to Employee | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `expression_driven` | Load Movement Fact.Set TableName to Movement | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `expression_driven` | Load Order Fact.Set TableName to Order | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `expression_driven` | Load Payment Method Dimension.Set TableName to Payment Method | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `expression_driven` | Load Purchase Fact.Set TableName to Purchase | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `expression_driven` | Load Sale Fact.Set TableName to Sale | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `expression_driven` | Load Stock Holding Fact.Set TableName to Stock Holding | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `expression_driven` | Load Stock Item Dimension.Set TableName to Stock Item | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `expression_driven` | Load Supplier Dimension.Set TableName to Supplier | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `expression_driven` | Load Transaction Fact.Set TableName to Transaction | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `expression_driven` | Load Transaction Type Dimension.Set TableName to Transaction Type | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `expression_driven` | Trim Any Milliseconds | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `project_connection` | conn:WWI_DW_Destination_DB | Project-level connection — string lives in .dtproj/.conmgr, not the package |
| warn | `project_connection` | conn:WWI_Source_DB | Project-level connection — string lives in .dtproj/.conmgr, not the package |
| info | `external_dependency` | Integration.City_Staging | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.Customer_Staging | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.Employee_Staging | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.GetCityUpdates | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.GetCustomerUpdates | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.GetEmployeeUpdates | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.GetLastETLCutoffTime | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.GetLineageKey | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.GetMovementUpdates | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.GetOrderUpdates | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.GetPaymentMethodUpdates | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.GetPurchaseUpdates | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.GetSaleUpdates | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.GetStockHoldingUpdates | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.GetStockItemUpdates | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.GetSupplierUpdates | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.GetTransactionTypeUpdates | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.GetTransactionUpdates | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.MigrateStagedCityData | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.MigrateStagedCustomerData | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.MigrateStagedEmployeeData | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.MigrateStagedMovementData | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.MigrateStagedOrderData | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.MigrateStagedPaymentMethodData | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.MigrateStagedPurchaseData | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.MigrateStagedSaleData | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.MigrateStagedStockHoldingData | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.MigrateStagedStockItemData | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.MigrateStagedSupplierData | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.MigrateStagedTransactionData | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.MigrateStagedTransactionTypeData | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.Movement_Staging | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.Order_Staging | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.PaymentMethod_Staging | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.PopulateDateDimensionForYear | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.Purchase_Staging | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.Sale_Staging | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.StockHolding_Staging | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.StockItem_Staging | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.Supplier_Staging | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.TransactionType_Staging | Database object used by package, defined elsewhere — must exist in target |
| info | `external_dependency` | Integration.Transaction_Staging | Database object used by package, defined elsewhere — must exist in target |

## Proposals (AI/mock)

Proposals — reviewed, never auto-accepted. Verification is code.

| Flag | Object | Proposal | Verify |
|---|---|---|---|
| `expression_driven` | Calculate ETL Cutoff Time backup | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `expression_driven` | Load City Dimension.Set TableName to City | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `expression_driven` | Load Customer Dimension.Set TableName to Customer | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `expression_driven` | Load Employee Dimension.Set TableName to Employee | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `expression_driven` | Load Movement Fact.Set TableName to Movement | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `expression_driven` | Load Order Fact.Set TableName to Order | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `expression_driven` | Load Payment Method Dimension.Set TableName to Payment Method | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `expression_driven` | Load Purchase Fact.Set TableName to Purchase | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `expression_driven` | Load Sale Fact.Set TableName to Sale | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `expression_driven` | Load Stock Holding Fact.Set TableName to Stock Holding | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `expression_driven` | Load Stock Item Dimension.Set TableName to Stock Item | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `expression_driven` | Load Supplier Dimension.Set TableName to Supplier | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `expression_driven` | Load Transaction Fact.Set TableName to Transaction | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `expression_driven` | Load Transaction Type Dimension.Set TableName to Transaction Type | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `expression_driven` | Trim Any Milliseconds | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `project_connection` | conn:WWI_DW_Destination_DB | propose: migrate the project-level connection string (lives in .conmgr, not the package) | object_in_graph=ok; nonempty=ok |
| `project_connection` | conn:WWI_Source_DB | propose: migrate the project-level connection string (lives in .conmgr, not the package) | object_in_graph=ok; nonempty=ok |
