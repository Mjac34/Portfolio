# Review: Model_aw1400

23 warn, 46 info

| Severity | Rule | Object | Message |
|---|---|---|---|
| warn | `calculated_measure` | Fact Internet Sales.InternetDistinctCountSalesOrder | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetOrderLinesCount | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetTotalUnits | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetTotalDiscountAmount | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetTotalProductCost | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetTotalSales | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetTotalTaxAmt | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetTotalFreight | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetTotalMargin | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetCurrentQuarterSalesPerformance | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetPreviousQuarterMargin | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetCurrentQuarterMargin | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetPreviousQuarterMarginProportionToQTD | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetPreviousQuarterSales | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetCurrentQuarterSales | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetPreviousQuarterSalesProportionToQTD | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.InternetCurrentQuarterMarginPerformance | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Internet Sales.YTD InternetTotalSales | DAX expression cannot be auto-translated — manual review |
| warn | `calculated_measure` | Fact Reseller Sales.ResellerTotalSales | DAX expression cannot be auto-translated — manual review |
| warn | `inactive_relationship` | Fact Reseller Sales -> Date | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Reseller Sales -> Date | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Internet Sales -> Date | Inactive relationship — materialize as separate role dim? |
| warn | `inactive_relationship` | Fact Internet Sales -> Date | Inactive relationship — materialize as separate role dim? |
| info | `snowflake_denormalized` | Customer | Snowflake source Dim Customer -> Dim Geography flattened into one dim table |
| info | `snowflake_denormalized` | Product | Snowflake source Dim Product -> Dim Product Subcategory -> Dim Product Category flattened into one dim table |
| info | `degenerate_attribute` | Fact Internet Sales.Promotion Key | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Currency Key | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Sales Territory Key | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Sales Order Number | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Sales Order Line Number | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Revision Number | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Order Quantity | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Unit Price | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Extended Amount | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Unit Price Discount Pct | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Discount Amount | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Product Standard Cost | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Total Product Cost | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Sales Amount | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Tax Amt | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Freight | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Carrier Tracking Number | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Customer PONumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Order Date | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Due Date | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Ship Date | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Internet Sales.Margin | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Reseller Key | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Promotion Key | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Currency Key | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Sales Territory Key | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Sales Order Number | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Sales Order Line Number | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Revision Number | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Order Quantity | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Unit Price | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Extended Amount | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Unit Price Discount Pct | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Discount Amount | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Product Standard Cost | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Total Product Cost | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Sales Amount | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Tax Amt | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Freight | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Carrier Tracking Number | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Customer PONumber | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Order Date | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Due Date | Degenerate attribute kept on fact table |
| info | `degenerate_attribute` | Fact Reseller Sales.Ship Date | Degenerate attribute kept on fact table |

## Not migrated

Constructs observed in the source that cannot be migrated automatically — require a human decision.

| Severity | Object | Message |
|---|---|---|
| warn | Date.DaysCurrentQuarterToDate | measure on table classified as dim — not rehomed; recreate in target if needed |
| warn | Date.DaysInCurrentQuarter | measure on table classified as dim — not rehomed; recreate in target if needed |
| warn | Fact Internet Sales.InternetCurrentQuarterSalesPerformance | measure KPI — not representable in star schema; rebuild in target layer |
| warn | Fact Internet Sales.InternetCurrentQuarterMarginPerformance | measure KPI — not representable in star schema; rebuild in target layer |
| info | Internet Sales | perspective — not migrated; recreate in target if needed |
| warn | General Users | row-level security role — not migrated; security must be reimplemented in target |

## Proposals (AI/mock)

Proposals — reviewed, never auto-accepted. Verification is code.

| Flag | Object | Proposal | Verify |
|---|---|---|---|
| `calculated_measure` | Fact Internet Sales.InternetDistinctCountSalesOrder | -- manual translation required: --   DISTINCTCOUNT([SalesOrderNumber]) | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetOrderLinesCount | -- manual translation required: --   COUNTA([SalesOrderLineNumber]) | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetTotalUnits | -- manual translation required: --   SUM([OrderQuantity]) | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetTotalDiscountAmount | -- manual translation required: --   SUM([DiscountAmount]) | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetTotalProductCost | -- manual translation required: --   SUM([TotalProductCost]) | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetTotalSales | -- manual translation required: --   SUM([SalesAmount]) | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetTotalTaxAmt | -- manual translation required: --   SUM([TaxAmt]) | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetTotalFreight | -- manual translation required: --   SUM([Freight]) | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetTotalMargin | -- manual translation required: --   SUM([Margin]) | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetCurrentQuarterSalesPerformance | -- manual translation required: --   IFERROR([InternetCurrentQuarterSales]/[InternetPrevio | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetPreviousQuarterMargin | -- manual translation required: --   CALCULATE([InternetTotalMargin],PREVIOUSQUARTER('Date | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetCurrentQuarterMargin | -- manual translation required: --   TOTALQTD([InternetTotalMargin],'Date'[Date]) | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetPreviousQuarterMarginProportionToQTD | -- manual translation required: --   [InternetPreviousQuarterMargin]*([DaysCurrentQuarterT | column_refs=missing: DaysCurrentQuarterToDate, DaysInCurrentQuarter; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetPreviousQuarterSales | -- manual translation required: --   CALCULATE([InternetTotalSales],PREVIOUSQUARTER('Date' | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetCurrentQuarterSales | -- manual translation required: --   TOTALQTD([InternetTotalSales],'Date'[Date]) | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetPreviousQuarterSalesProportionToQTD | -- manual translation required: --   [InternetPreviousQuarterSales]*([DaysCurrentQuarterTo | column_refs=missing: DaysCurrentQuarterToDate, DaysInCurrentQuarter; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.InternetCurrentQuarterMarginPerformance | -- manual translation required: --   IF([InternetPreviousQuarterMarginProportionToQTD]<>0, | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Internet Sales.YTD InternetTotalSales | -- manual translation required: --   CALCULATE([InternetTotalSales], DATESYTD('Date'[Date] | column_refs=ok; type_vocab=ok; nonempty=ok |
| `calculated_measure` | Fact Reseller Sales.ResellerTotalSales | -- manual translation required: --   SUM([SalesAmount]) | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Reseller Sales -> Date | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Reseller Sales -> Date | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Internet Sales -> Date | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `inactive_relationship` | Fact Internet Sales -> Date | propose: role-playing view per role OR duplicate dim; verify which is intended | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Date.DaysCurrentQuarterToDate | propose: review Date.DaysCurrentQuarterToDate manually — no template yet | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Date.DaysInCurrentQuarter | propose: review Date.DaysInCurrentQuarter manually — no template yet | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Fact Internet Sales.InternetCurrentQuarterSalesPerformance | propose: rebuild as target-layer KPI (e.g. semantic model or BI tool); extract goal/status | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Fact Internet Sales.InternetCurrentQuarterMarginPerformance | propose: rebuild as target-layer KPI (e.g. semantic model or BI tool); extract goal/status | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | Internet Sales | propose: recreate as view/schema filter in target | column_refs=ok; type_vocab=ok; nonempty=ok |
| `not_migrated` | General Users | propose: reimplement as row-level security policy in target (never silently dropped) | column_refs=ok; type_vocab=ok; nonempty=ok |

## Ingestion assumptions

The values below are inferred, not observed — review before relying on them.

| Severity | Object | Assumption |
|---|---|---|
| info | model | no Dim*/Fact* naming convention — tables classified by relationship-graph role (from-side=fact, to-side=dim, key-only=m2m bridge) |
| info | Customer | key_column 'CustomerKey' observed — relationship toColumn endpoint |
| info | Customer | snowflake join path inferred from Dim->Dim relationship chain: Dim Customer -> Dim Geography |
| info | Customer | orphan assumed false for unbound attribute(s) with no 'orphan' annotation: GeographyKey, CustomerAlternateKey, Title, FirstName, MiddleName, LastName, NameStyle, BirthDate, MaritalStatus, Suffix, Gender, EmailAddress, YearlyIncome, TotalChildren, NumberChildrenAtHome, EnglishEducation, EnglishOccupation, HouseOwnerFlag, NumberCarsOwned, AddressLine1, AddressLine2, Phone, DateFirstPurchase, CommuteDistance, City, StateProvinceCode, StateProvince, CountryCode, Country, PostalCode, SalesTerritoryKey, IpAddressLocator |
| info | Date | key_column 'DateKey' observed — relationship toColumn endpoint |
| info | Date | type 'time' inferred from dimension name |
| info | Date | orphan assumed false for unbound attribute(s) with no 'orphan' annotation: DayNumberOfWeek, EnglishDayNameOfWeek, DayNumberOfMonth, DayNumberOfYear, WeekNumberOfYear, MonthNumberOfYear, CalendarQuarter, CalendarSemester, FiscalQuarter, FiscalSemester |
| info | Product | key_column 'ProductKey' observed — relationship toColumn endpoint |
| info | Product | snowflake join path inferred from Dim->Dim relationship chain: Dim Product -> Dim Product Subcategory -> Dim Product Category |
| info | Product | orphan assumed false for unbound attribute(s) with no 'orphan' annotation: ProductAlternateKey, ProductSubcategoryKey, WeightUnitMeasureCode, SizeUnitMeasureCode, StandardCost, FinishedGoodsFlag, Color, SafetyStockLevel, ReorderPoint, ListPrice, Size, SizeRange, Weight, DaysToManufacture, ProductLine, DealerPrice, Class, Style, EnglishDescription, StartDate, EndDate, Status, ProductSubcategoryAlternateKey, EnglishProductSubcategoryName, ProductCategoryKey, ProductCategoryAlternateKey, EnglishProductCategoryName |
| info | Employee | key_column 'EmployeeKey' observed — relationship toColumn endpoint |
| info | Employee | orphan assumed false for unbound attribute(s) with no 'orphan' annotation: ParentEmployeeKey, EmployeeNationalIDAlternateKey, ParentEmployeeNationalIDAlternateKey, SalesTerritoryKey, FirstName, LastName, MiddleName, NameStyle, Title, HireDate, BirthDate, LoginID, EmailAddress, Phone, MaritalStatus, EmergencyContactName, EmergencyContactPhone, SalariedFlag, Gender, PayFrequency, BaseRate, VacationHours, SickLeaveHours, CurrentFlag, SalesPersonFlag, DepartmentName, StartDate, EndDate, Status, FullName, Path |
| info | Fact Internet Sales | degenerate attributes are a fixture convention, not standard TMSL — inferred by elimination (not FK/bridge/measure source): PromotionKey, CurrencyKey, SalesTerritoryKey, SalesOrderNumber, SalesOrderLineNumber, RevisionNumber, OrderQuantity, UnitPrice, ExtendedAmount, UnitPriceDiscountPct, DiscountAmount, ProductStandardCost, TotalProductCost, SalesAmount, TaxAmt, Freight, CarrierTrackingNumber, CustomerPONumber, OrderDate, DueDate, ShipDate, Margin |
| info | Fact Reseller Sales | degenerate attributes are a fixture convention, not standard TMSL — inferred by elimination (not FK/bridge/measure source): ResellerKey, PromotionKey, CurrencyKey, SalesTerritoryKey, SalesOrderNumber, SalesOrderLineNumber, RevisionNumber, OrderQuantity, UnitPrice, ExtendedAmount, UnitPriceDiscountPct, DiscountAmount, ProductStandardCost, TotalProductCost, SalesAmount, TaxAmt, Freight, CarrierTrackingNumber, CustomerPONumber, OrderDate, DueDate, ShipDate |

## Renderer notes
- Column types resolved from canonical column_types (neutral -> T-SQL); untyped columns fall back to placeholders
