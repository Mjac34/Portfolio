# Review: wwi-sql

220 warn, 0 info

| Severity | Rule | Object | Message |
|---|---|---|---|
| warn | `circular_ref` | Warehouse.ColdRoomTemperatures -> Warehouse.ColdRoomTemperatures -> Warehouse.ColdRoomTemperatures | Circular dependency — must be broken manually (no acyclic order exists) |
| warn | `circular_ref` | Warehouse.ColdRoomTemperatures_Staging -> Warehouse.ColdRoomTemperatures_Staging -> Warehouse.ColdRoomTemperatures_Staging | Circular dependency — must be broken manually (no acyclic order exists) |
| warn | `circular_ref` | Warehouse.VehicleTemperatures -> Warehouse.VehicleTemperatures -> Warehouse.VehicleTemperatures | Circular dependency — must be broken manually (no acyclic order exists) |
| warn | `circular_ref` | Warehouse.VehicleTemperatures_Staging -> Warehouse.VehicleTemperatures_Staging -> Warehouse.VehicleTemperatures_Staging | Circular dependency — must be broken manually (no acyclic order exists) |
| warn | `deprecated_syntax` | #result | Deprecated syntax: COMPUTE — must be rewritten |
| warn | `deprecated_syntax` | DataLoadSimulation.DailyProcessToCreateHistory | Deprecated syntax: COMPUTE — must be rewritten |
| warn | `dynamic_sql` | #CurrentValue | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Application.AddRoleMemberIfNonexistent | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Application.Configuration_ApplyAuditing | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Application.Configuration_ApplyColumnstoreIndexing | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Application.Configuration_ApplyFullTextIndexing | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Application.Configuration_ApplyPartitioning | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Application.Configuration_ApplyRowLevelSecurity | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Application.Configuration_EnableInMemory | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Application.Configuration_RemoveAuditing | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Application.Configuration_RemoveColumnstoreIndexing | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Application.Configuration_RemoveRowLevelSecurity | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Application.CreateRoleIfNonexistent | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Application.DetermineCustomerAccess | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | DataLoadSimulation.DeactivateTemporalTablesBeforeDataLoad | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Warehouse.ColdRoomTemperatures | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Warehouse.ColdRoomTemperatures_Staging | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Warehouse.VehicleTemperatures | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Warehouse.VehicleTemperatures_Staging | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Website.InsertCustomerOrders | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Website.InvoiceCustomerOrders | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Website.RecordColdRoomTemperatures | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Website.SearchForCustomers | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Website.SearchForPeople | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Website.SearchForStockItems | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Website.SearchForStockItemsByTags | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | Website.SearchForSuppliers | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `select_star` | #result | SELECT * — implicit column contract breaks on schema change (2 occurrence(s)) |
| warn | `select_star` | Application.Configuration_ApplyPartitioning | SELECT * — implicit column contract breaks on schema change (1 occurrence(s)) |
| warn | `temp_dependency` | #CityChanges | #temp table — dependency not visible in static DAG |
| warn | `temp_dependency` | #CurrentValue | #temp table — dependency not visible in static DAG |
| warn | `temp_dependency` | #CustomerChanges | #temp table — dependency not visible in static DAG |
| warn | `temp_dependency` | #EmployeeChanges | #temp table — dependency not visible in static DAG |
| warn | `temp_dependency` | #PaymentMethodChanges | #temp table — dependency not visible in static DAG |
| warn | `temp_dependency` | #StockItemChanges | #temp table — dependency not visible in static DAG |
| warn | `temp_dependency` | #SupplierChanges | #temp table — dependency not visible in static DAG |
| warn | `temp_dependency` | #TransactionTypeChanges | #temp table — dependency not visible in static DAG |
| warn | `temp_dependency` | #result | #temp table — dependency not visible in static DAG |
| warn | `temp_dependency` | DataLoadSimulation.DailyProcessToCreateHistory | #temp table — dependency not visible in static DAG |
| warn | `unreferenced` | Application.AddRoleMemberIfNonexistent | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Application.Configuration_ApplyAuditing | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Application.Configuration_ConfigureForEnterpriseEdition | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Application.Configuration_PrepareForAzureStandard | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Application.Configuration_RemoveAuditing | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Application.CreateRoleIfNonexistent | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Application.DetermineCustomerAccess | No inbound references — entry point or dead code? |
| warn | `unreferenced` | DataLoadSimulation.GetAreaCode | No inbound references — entry point or dead code? |
| warn | `unreferenced` | DataLoadSimulation.PopulateDataToCurrentDate | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Integration.GetCityUpdates | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Integration.GetCustomerUpdates | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Integration.GetEmployeeUpdates | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Integration.GetMovementUpdates | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Integration.GetOrderUpdates | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Integration.GetPaymentMethodUpdates | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Integration.GetPurchaseUpdates | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Integration.GetSaleUpdates | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Integration.GetStockHoldingUpdates | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Integration.GetStockItemUpdates | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Integration.GetSupplierUpdates | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Integration.GetTransactionTypeUpdates | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Integration.GetTransactionUpdates | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Website.ActivateWebsiteLogon | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Website.CalculateCustomerPrice | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Website.ChangePassword | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Website.InsertCustomerOrders | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Website.InvoiceCustomerOrders | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Website.RecordColdRoomTemperatures | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Website.RecordVehicleTemperature | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Website.SearchForCustomers | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Website.SearchForPeople | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Website.SearchForStockItems | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Website.SearchForStockItemsByTags | No inbound references — entry point or dead code? |
| warn | `unreferenced` | Website.SearchForSuppliers | No inbound references — entry point or dead code? |
| warn | `unresolvable_ref` | @InvoicesToGenerate | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | @OrderLines | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | @Orders | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | @OrdersToGenerate | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | @OrdersToInvoice | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | @OtherLanguages | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | @SensorReadings | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | @StockAlreadyAllocated | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | @UninvoicedOrders | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | AS | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.Cities | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.Cities_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.Configuration_DisableInMemory | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.Countries | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.Countries_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.DeliveryMethods | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.DeliveryMethods_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.PaymentMethods | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.PaymentMethods_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.People | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.People_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.StateProvinces | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.StateProvinces_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.TR_Application_Cities_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.TR_Application_Countries_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.TR_Application_DeliveryMethods_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.TR_Application_PaymentMethods_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.TR_Application_People_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.TR_Application_StateProvinces_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.TR_Application_TransactionTypes_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.TransactionTypes | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Application.TransactionTypes_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | BuyingGroupChangeList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | ChangeList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | CityChangeList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | CountryChangeList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | CustomerCategoryChangeList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | CustomerChangeList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | DataLoadSimulation.AreaCode | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | DataLoadSimulation.ColdRoomTemperatures_temp | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | DataLoadSimulation.GetBogativePhoneNumber | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | DataLoadSimulation.GetBogativePostalCode | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | DataLoadSimulation.GetFicticiousName | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | DataLoadSimulation.GetRandomBuyingGroupNotInUse | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | DataLoadSimulation.GetRandomCustomer | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | DataLoadSimulation.GetRandomCustomerCategory | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | DataLoadSimulation.GetRandomEmployeePerson | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | DataLoadSimulation.GetRandomSalesPersonID | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | DataLoadSimulation.GetRandomSecondaryAddress | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | DataLoadSimulation.GetRandomStockItemToAdjust | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | DataLoadSimulation.GetRandomStreet | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | DataLoadSimulation.PopulateColdRoomTemperatures_temp | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | DataLoadSimulation.SeasonVariation | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | EmployeeChangeList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | EmployeeList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | FREETEXTTABLE | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | InvoiceList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | OPENJSON | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | OrderLineList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | OrderLines | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | OrderList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Orders | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | PurchaseOrderList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Purchasing.PurchaseOrderLines | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Purchasing.PurchaseOrders | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Purchasing.SupplierCategories | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Purchasing.SupplierCategories_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Purchasing.SupplierTransactions | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Purchasing.Suppliers | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Purchasing.Suppliers_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Purchasing.TR_Purchasing_SupplierCategories_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Purchasing.TR_Purchasing_Suppliers_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | SET | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Sales.BuyingGroups | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Sales.BuyingGroups_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Sales.CustomerCategories | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Sales.CustomerCategories_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Sales.CustomerTransactions | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Sales.Customers | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Sales.Customers_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Sales.InvoiceLines | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Sales.Invoices | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Sales.OrderLines | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Sales.Orders | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Sales.SpecialDeals | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Sales.TR_Sales_BuyingGroups_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Sales.TR_Sales_CustomerCategories_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Sales.TR_Sales_Customers_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | StateProvinceChangeList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | StockAlreadyAllocated | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | StockItemChangeList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | StockItemTotals | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | StockItemsToCheck | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | StockItemsToOrder | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | SupplierCategoryChangeList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | SupplierChangeList | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | TransactionsToPay | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | TransactionsToReceive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.ColdRoomTemperatures_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.ColdRoomTemperatures_Backup | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.Colors | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.Colors_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.PackageTypes | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.PackageTypes_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.StockGroups | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.StockGroups_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.StockItemHoldings | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.StockItemStockGroups | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.StockItemTransactions | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.StockItems | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.StockItems_Archive | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.TR_Warehouse_ColdRoomTemperatures_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.TR_Warehouse_Colors_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.TR_Warehouse_PackageTypes_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.TR_Warehouse_StockGroups_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.TR_Warehouse_StockItems_DataLoad_Modify | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | Warehouse.VehicleTemperatures_Backup | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | cc | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | customers | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | dbo.sp_rename | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | earlier | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | purchase | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | si | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sih | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sys.database_audit_specifications | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sys.database_principals | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sys.database_role_members | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sys.filegroups | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sys.fulltext_catalogs | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sys.fulltext_indexes | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sys.indexes | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sys.partition_functions | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sys.partition_schemes | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sys.procedures | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sys.sequences | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sys.server_audit_specifications | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sys.server_audits | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sys.syslanguages | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | sys.tables | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | the | Referenced but has no definition in corpus |
| warn | `write_never_read` | Warehouse.ColdRoomTemperatures_Staging | Written but never read — dead data? |
| warn | `write_never_read` | Warehouse.VehicleTemperatures_Staging | Written but never read — dead data? |

## Not migrated

Constructs observed in the source that cannot be migrated automatically — require a human decision.

| Severity | Object | Message |
|---|---|---|
| warn | Application.AddRoleMemberIfNonexistent | dynamic SQL — target objects cannot be resolved statically |
| warn | Application.Configuration_ApplyAuditing | dynamic SQL — target objects cannot be resolved statically |
| info | Application.Configuration_ApplyColumnstoreIndexing | object kept via regex fallback, but its structure is not fully understood |
| warn | Application.Configuration_ApplyColumnstoreIndexing | dynamic SQL — target objects cannot be resolved statically |
| info | Application.Configuration_ApplyFullTextIndexing | object kept via regex fallback, but its structure is not fully understood |
| warn | Application.Configuration_ApplyFullTextIndexing | dynamic SQL — target objects cannot be resolved statically |
| info | Website.SearchForPeople | object kept via regex fallback, but its structure is not fully understood |
| warn | Website.SearchForPeople | dynamic SQL — target objects cannot be resolved statically |
| info | Website.SearchForSuppliers | object kept via regex fallback, but its structure is not fully understood |
| warn | Website.SearchForSuppliers | dynamic SQL — target objects cannot be resolved statically |
| info | Website.SearchForCustomers | object kept via regex fallback, but its structure is not fully understood |
| warn | Website.SearchForCustomers | dynamic SQL — target objects cannot be resolved statically |
| info | Website.SearchForStockItems | object kept via regex fallback, but its structure is not fully understood |
| warn | Website.SearchForStockItems | dynamic SQL — target objects cannot be resolved statically |
| info | Website.SearchForStockItemsByTags | object kept via regex fallback, but its structure is not fully understood |
| warn | Website.SearchForStockItemsByTags | dynamic SQL — target objects cannot be resolved statically |
| warn | Application.Configuration_ApplyPartitioning | dynamic SQL — target objects cannot be resolved statically |
| info | Application.Configuration_ApplyRowLevelSecurity | object kept via regex fallback, but its structure is not fully understood |
| warn | Application.Configuration_ApplyRowLevelSecurity | dynamic SQL — target objects cannot be resolved statically |
| info | Application.DetermineCustomerAccess | object kept via regex fallback, but its structure is not fully understood |
| warn | Application.DetermineCustomerAccess | dynamic SQL — target objects cannot be resolved statically |
| info | Warehouse.ColdRoomTemperatures_Staging | object kept via regex fallback, but its structure is not fully understood |
| warn | Warehouse.ColdRoomTemperatures_Staging | dynamic SQL — target objects cannot be resolved statically |
| info | Warehouse.VehicleTemperatures_Staging | object kept via regex fallback, but its structure is not fully understood |
| warn | Warehouse.VehicleTemperatures_Staging | dynamic SQL — target objects cannot be resolved statically |
| info | Website.InvoiceCustomerOrders | object kept via regex fallback, but its structure is not fully understood |
| warn | Website.InvoiceCustomerOrders | dynamic SQL — target objects cannot be resolved statically |
| info | Website.RecordColdRoomTemperatures | object kept via regex fallback, but its structure is not fully understood |
| warn | Website.RecordColdRoomTemperatures | dynamic SQL — target objects cannot be resolved statically |
| info | Website.InsertCustomerOrders | object kept via regex fallback, but its structure is not fully understood |
| warn | Website.InsertCustomerOrders | dynamic SQL — target objects cannot be resolved statically |
| info | Application.Configuration_EnableInMemory | object kept via regex fallback, but its structure is not fully understood |
| warn | Application.Configuration_EnableInMemory | dynamic SQL — target objects cannot be resolved statically |
| info | Warehouse.ColdRoomTemperatures | object kept via regex fallback, but its structure is not fully understood |
| warn | Warehouse.ColdRoomTemperatures | dynamic SQL — target objects cannot be resolved statically |
| info | Warehouse.VehicleTemperatures | object kept via regex fallback, but its structure is not fully understood |
| warn | Warehouse.VehicleTemperatures | dynamic SQL — target objects cannot be resolved statically |
| info | Website.InvoiceCustomerOrders | object kept via regex fallback, but its structure is not fully understood |
| warn | Website.InvoiceCustomerOrders | dynamic SQL — target objects cannot be resolved statically |
| info | Website.RecordColdRoomTemperatures | object kept via regex fallback, but its structure is not fully understood |
| warn | Website.RecordColdRoomTemperatures | dynamic SQL — target objects cannot be resolved statically |
| info | Website.InsertCustomerOrders | object kept via regex fallback, but its structure is not fully understood |
| warn | Website.InsertCustomerOrders | dynamic SQL — target objects cannot be resolved statically |
| warn | Application.Configuration_RemoveAuditing | dynamic SQL — target objects cannot be resolved statically |
| info | Application.Configuration_RemoveColumnstoreIndexing | object kept via regex fallback, but its structure is not fully understood |
| warn | Application.Configuration_RemoveColumnstoreIndexing | dynamic SQL — target objects cannot be resolved statically |
| info | Application.Configuration_RemoveRowLevelSecurity | object kept via regex fallback, but its structure is not fully understood |
| warn | Application.Configuration_RemoveRowLevelSecurity | dynamic SQL — target objects cannot be resolved statically |
| warn | Application.CreateRoleIfNonexistent | dynamic SQL — target objects cannot be resolved statically |
| info | DataLoadSimulation.ActivateWebsiteLogons | object kept via regex fallback, but its structure is not fully understood |
| info | DataLoadSimulation.AddCustomers | object kept via regex fallback, but its structure is not fully understood |
| info | DataLoadSimulation.ChangePasswords | object kept via regex fallback, but its structure is not fully understood |
| info | DataLoadSimulation.CreateCustomerOrders | object kept via regex fallback, but its structure is not fully understood |
| info | DataLoadSimulation.DailyProcessToCreateHistory | object kept via regex fallback, but its structure is not fully understood |
| info | #result | object kept via regex fallback, but its structure is not fully understood |
| warn | DataLoadSimulation.DeactivateTemporalTablesBeforeDataLoad | dynamic SQL — target objects cannot be resolved statically |
| info | DataLoadSimulation.InvoicePickedOrders | object kept via regex fallback, but its structure is not fully understood |
| info | DataLoadSimulation.MakeTemporalChanges | object kept via regex fallback, but its structure is not fully understood |
| info | DataLoadSimulation.PerformStocktake | object kept via regex fallback, but its structure is not fully understood |
| info | DataLoadSimulation.PickStockForCustomerOrders | object kept via regex fallback, but its structure is not fully understood |
| info | DataLoadSimulation.ReceivePurchaseOrders | object kept via regex fallback, but its structure is not fully understood |
| info | DataLoadSimulation.RecordColdRoomTemperatures | object kept via regex fallback, but its structure is not fully understood |
| info | DataLoadSimulation.RecordDeliveryVanTemperatures | object kept via regex fallback, but its structure is not fully understood |
| info | DataLoadSimulation.RecordInvoiceDeliveries | object kept via regex fallback, but its structure is not fully understood |
| info | DataLoadSimulation.UpdateCustomFields | object kept via regex fallback, but its structure is not fully understood |
| info | #CityChanges | object kept via regex fallback, but its structure is not fully understood |
| info | #CustomerChanges | object kept via regex fallback, but its structure is not fully understood |
| info | #EmployeeChanges | object kept via regex fallback, but its structure is not fully understood |
| info | Integration.GetMovementUpdates | object kept via regex fallback, but its structure is not fully understood |
| info | Integration.GetOrderUpdates | object kept via regex fallback, but its structure is not fully understood |
| info | #PaymentMethodChanges | object kept via regex fallback, but its structure is not fully understood |
| info | Integration.GetPurchaseUpdates | object kept via regex fallback, but its structure is not fully understood |
| info | Integration.GetSaleUpdates | object kept via regex fallback, but its structure is not fully understood |
| info | Integration.GetStockHoldingUpdates | object kept via regex fallback, but its structure is not fully understood |
| info | #StockItemChanges | object kept via regex fallback, but its structure is not fully understood |
| info | #SupplierChanges | object kept via regex fallback, but its structure is not fully understood |
| info | #TransactionTypeChanges | object kept via regex fallback, but its structure is not fully understood |
| info | Integration.GetTransactionUpdates | object kept via regex fallback, but its structure is not fully understood |
| warn | #CurrentValue | dynamic SQL — target objects cannot be resolved statically |
| info | Website.ActivateWebsiteLogon | object kept via regex fallback, but its structure is not fully understood |
| info | Website.ChangePassword | object kept via regex fallback, but its structure is not fully understood |
| info | Website.InsertCustomerOrders | object kept via regex fallback, but its structure is not fully understood |
| info | Website.InvoiceCustomerOrders | object kept via regex fallback, but its structure is not fully understood |
| info | Website.RecordColdRoomTemperatures | object kept via regex fallback, but its structure is not fully understood |
| info | Website.RecordVehicleTemperature | object kept via regex fallback, but its structure is not fully understood |

## Proposals (AI/mock)

Proposals — reviewed, never auto-accepted. Verification is code.

| Flag | Object | Proposal | Verify |
|---|---|---|---|
| `circular_ref` | Warehouse.ColdRoomTemperatures -> Warehouse.ColdRoomTemperatures -> Warehouse.ColdRoomTemperatures | propose: break the cycle by ignoring the first edge (Warehouse.ColdRoomTemperatures -> War | breaks_cycle=ok; nonempty=ok |
| `circular_ref` | Warehouse.ColdRoomTemperatures_Staging -> Warehouse.ColdRoomTemperatures_Staging -> Warehouse.ColdRoomTemperatures_Staging | propose: break the cycle by ignoring the first edge (Warehouse.ColdRoomTemperatures_Stagin | breaks_cycle=ok; nonempty=ok |
| `circular_ref` | Warehouse.VehicleTemperatures -> Warehouse.VehicleTemperatures -> Warehouse.VehicleTemperatures | propose: break the cycle by ignoring the first edge (Warehouse.VehicleTemperatures -> Ware | breaks_cycle=ok; nonempty=ok |
| `circular_ref` | Warehouse.VehicleTemperatures_Staging -> Warehouse.VehicleTemperatures_Staging -> Warehouse.VehicleTemperatures_Staging | propose: break the cycle by ignoring the first edge (Warehouse.VehicleTemperatures_Staging | breaks_cycle=ok; nonempty=ok |
| `deprecated_syntax` | #result | propose: rewrite deprecated constructs before migration — they do not map to modern target | object_in_graph=ok; nonempty=ok |
| `deprecated_syntax` | DataLoadSimulation.DailyProcessToCreateHistory | propose: rewrite deprecated constructs before migration — they do not map to modern target | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | #CurrentValue | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Application.AddRoleMemberIfNonexistent | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Application.Configuration_ApplyAuditing | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Application.Configuration_ApplyColumnstoreIndexing | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Application.Configuration_ApplyFullTextIndexing | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Application.Configuration_ApplyPartitioning | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Application.Configuration_ApplyRowLevelSecurity | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Application.Configuration_EnableInMemory | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Application.Configuration_RemoveAuditing | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Application.Configuration_RemoveColumnstoreIndexing | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Application.Configuration_RemoveRowLevelSecurity | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Application.CreateRoleIfNonexistent | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Application.DetermineCustomerAccess | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | DataLoadSimulation.DeactivateTemporalTablesBeforeDataLoad | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Warehouse.ColdRoomTemperatures | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Warehouse.ColdRoomTemperatures_Staging | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Warehouse.VehicleTemperatures | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Warehouse.VehicleTemperatures_Staging | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Website.InsertCustomerOrders | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Website.InvoiceCustomerOrders | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Website.RecordColdRoomTemperatures | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Website.SearchForCustomers | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Website.SearchForPeople | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Website.SearchForStockItems | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Website.SearchForStockItemsByTags | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | Website.SearchForSuppliers | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `select_star` | #result | propose: expand SELECT * to explicit columns — the column contract then survives schema ch | object_in_graph=ok; nonempty=ok |
| `select_star` | Application.Configuration_ApplyPartitioning | propose: expand SELECT * to explicit columns — the column contract then survives schema ch | object_in_graph=ok; nonempty=ok |
| `temp_dependency` | #CityChanges | propose: replace #temp with a staging table or CTE so the dependency becomes visible in th | object_in_graph=ok; nonempty=ok |
| `temp_dependency` | #CurrentValue | propose: replace #temp with a staging table or CTE so the dependency becomes visible in th | object_in_graph=ok; nonempty=ok |
| `temp_dependency` | #CustomerChanges | propose: replace #temp with a staging table or CTE so the dependency becomes visible in th | object_in_graph=ok; nonempty=ok |
| `temp_dependency` | #EmployeeChanges | propose: replace #temp with a staging table or CTE so the dependency becomes visible in th | object_in_graph=ok; nonempty=ok |
| `temp_dependency` | #PaymentMethodChanges | propose: replace #temp with a staging table or CTE so the dependency becomes visible in th | object_in_graph=ok; nonempty=ok |
| `temp_dependency` | #StockItemChanges | propose: replace #temp with a staging table or CTE so the dependency becomes visible in th | object_in_graph=ok; nonempty=ok |
| `temp_dependency` | #SupplierChanges | propose: replace #temp with a staging table or CTE so the dependency becomes visible in th | object_in_graph=ok; nonempty=ok |
| `temp_dependency` | #TransactionTypeChanges | propose: replace #temp with a staging table or CTE so the dependency becomes visible in th | object_in_graph=ok; nonempty=ok |
| `temp_dependency` | #result | propose: replace #temp with a staging table or CTE so the dependency becomes visible in th | object_in_graph=ok; nonempty=ok |
| `temp_dependency` | DataLoadSimulation.DailyProcessToCreateHistory | propose: replace #temp with a staging table or CTE so the dependency becomes visible in th | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Application.AddRoleMemberIfNonexistent | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Application.Configuration_ApplyAuditing | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Application.Configuration_ConfigureForEnterpriseEdition | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Application.Configuration_PrepareForAzureStandard | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Application.Configuration_RemoveAuditing | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Application.CreateRoleIfNonexistent | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Application.DetermineCustomerAccess | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | DataLoadSimulation.GetAreaCode | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | DataLoadSimulation.PopulateDataToCurrentDate | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Integration.GetCityUpdates | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Integration.GetCustomerUpdates | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Integration.GetEmployeeUpdates | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Integration.GetMovementUpdates | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Integration.GetOrderUpdates | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Integration.GetPaymentMethodUpdates | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Integration.GetPurchaseUpdates | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Integration.GetSaleUpdates | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Integration.GetStockHoldingUpdates | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Integration.GetStockItemUpdates | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Integration.GetSupplierUpdates | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Integration.GetTransactionTypeUpdates | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Integration.GetTransactionUpdates | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Website.ActivateWebsiteLogon | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Website.CalculateCustomerPrice | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Website.ChangePassword | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Website.InsertCustomerOrders | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Website.InvoiceCustomerOrders | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Website.RecordColdRoomTemperatures | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Website.RecordVehicleTemperature | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Website.SearchForCustomers | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Website.SearchForPeople | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Website.SearchForStockItems | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Website.SearchForStockItemsByTags | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | Website.SearchForSuppliers | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | @InvoicesToGenerate | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | @OrderLines | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | @Orders | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | @OrdersToGenerate | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | @OrdersToInvoice | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | @OtherLanguages | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | @SensorReadings | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | @StockAlreadyAllocated | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | @UninvoicedOrders | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | AS | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.Cities | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.Cities_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.Configuration_DisableInMemory | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.Countries | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.Countries_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.DeliveryMethods | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.DeliveryMethods_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.PaymentMethods | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.PaymentMethods_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.People | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.People_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.StateProvinces | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.StateProvinces_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.TR_Application_Cities_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.TR_Application_Countries_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.TR_Application_DeliveryMethods_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.TR_Application_PaymentMethods_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.TR_Application_People_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.TR_Application_StateProvinces_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.TR_Application_TransactionTypes_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.TransactionTypes | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Application.TransactionTypes_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | BuyingGroupChangeList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | ChangeList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | CityChangeList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | CountryChangeList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | CustomerCategoryChangeList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | CustomerChangeList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | DataLoadSimulation.AreaCode | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | DataLoadSimulation.ColdRoomTemperatures_temp | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | DataLoadSimulation.GetBogativePhoneNumber | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | DataLoadSimulation.GetBogativePostalCode | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | DataLoadSimulation.GetFicticiousName | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | DataLoadSimulation.GetRandomBuyingGroupNotInUse | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | DataLoadSimulation.GetRandomCustomer | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | DataLoadSimulation.GetRandomCustomerCategory | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | DataLoadSimulation.GetRandomEmployeePerson | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | DataLoadSimulation.GetRandomSalesPersonID | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | DataLoadSimulation.GetRandomSecondaryAddress | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | DataLoadSimulation.GetRandomStockItemToAdjust | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | DataLoadSimulation.GetRandomStreet | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | DataLoadSimulation.PopulateColdRoomTemperatures_temp | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | DataLoadSimulation.SeasonVariation | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | EmployeeChangeList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | EmployeeList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | FREETEXTTABLE | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | InvoiceList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | OPENJSON | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | OrderLineList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | OrderLines | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | OrderList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Orders | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | PurchaseOrderList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Purchasing.PurchaseOrderLines | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Purchasing.PurchaseOrders | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Purchasing.SupplierCategories | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Purchasing.SupplierCategories_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Purchasing.SupplierTransactions | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Purchasing.Suppliers | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Purchasing.Suppliers_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Purchasing.TR_Purchasing_SupplierCategories_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Purchasing.TR_Purchasing_Suppliers_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | SET | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Sales.BuyingGroups | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Sales.BuyingGroups_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Sales.CustomerCategories | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Sales.CustomerCategories_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Sales.CustomerTransactions | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Sales.Customers | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Sales.Customers_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Sales.InvoiceLines | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Sales.Invoices | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Sales.OrderLines | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Sales.Orders | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Sales.SpecialDeals | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Sales.TR_Sales_BuyingGroups_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Sales.TR_Sales_CustomerCategories_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Sales.TR_Sales_Customers_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | StateProvinceChangeList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | StockAlreadyAllocated | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | StockItemChangeList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | StockItemTotals | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | StockItemsToCheck | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | StockItemsToOrder | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | SupplierCategoryChangeList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | SupplierChangeList | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | TransactionsToPay | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | TransactionsToReceive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.ColdRoomTemperatures_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.ColdRoomTemperatures_Backup | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.Colors | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.Colors_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.PackageTypes | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.PackageTypes_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.StockGroups | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.StockGroups_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.StockItemHoldings | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.StockItemStockGroups | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.StockItemTransactions | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.StockItems | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.StockItems_Archive | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.TR_Warehouse_ColdRoomTemperatures_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.TR_Warehouse_Colors_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.TR_Warehouse_PackageTypes_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.TR_Warehouse_StockGroups_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.TR_Warehouse_StockItems_DataLoad_Modify | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | Warehouse.VehicleTemperatures_Backup | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | cc | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | customers | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | dbo.sp_rename | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | earlier | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | purchase | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | si | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sih | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sys.database_audit_specifications | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sys.database_principals | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sys.database_role_members | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sys.filegroups | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sys.fulltext_catalogs | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sys.fulltext_indexes | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sys.indexes | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sys.partition_functions | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sys.partition_schemes | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sys.procedures | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sys.sequences | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sys.server_audit_specifications | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sys.server_audits | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sys.syslanguages | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | sys.tables | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | the | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `write_never_read` | Warehouse.ColdRoomTemperatures_Staging | propose: written but never read — drop the table or confirm an external consumer | object_in_graph=ok; nonempty=ok |
| `write_never_read` | Warehouse.VehicleTemperatures_Staging | propose: written but never read — drop the table or confirm an external consumer | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.AddRoleMemberIfNonexistent | propose: review Application.AddRoleMemberIfNonexistent manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.Configuration_ApplyAuditing | propose: review Application.Configuration_ApplyAuditing manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.Configuration_ApplyColumnstoreIndexing | propose: review Application.Configuration_ApplyColumnstoreIndexing manually — no template  | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.Configuration_ApplyColumnstoreIndexing | propose: review Application.Configuration_ApplyColumnstoreIndexing manually — no template  | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.Configuration_ApplyFullTextIndexing | propose: review Application.Configuration_ApplyFullTextIndexing manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.Configuration_ApplyFullTextIndexing | propose: review Application.Configuration_ApplyFullTextIndexing manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.SearchForPeople | propose: review Website.SearchForPeople manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.SearchForPeople | propose: review Website.SearchForPeople manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.SearchForSuppliers | propose: review Website.SearchForSuppliers manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.SearchForSuppliers | propose: review Website.SearchForSuppliers manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.SearchForCustomers | propose: review Website.SearchForCustomers manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.SearchForCustomers | propose: review Website.SearchForCustomers manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.SearchForStockItems | propose: review Website.SearchForStockItems manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.SearchForStockItems | propose: review Website.SearchForStockItems manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.SearchForStockItemsByTags | propose: review Website.SearchForStockItemsByTags manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.SearchForStockItemsByTags | propose: review Website.SearchForStockItemsByTags manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.Configuration_ApplyPartitioning | propose: review Application.Configuration_ApplyPartitioning manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.Configuration_ApplyRowLevelSecurity | propose: review Application.Configuration_ApplyRowLevelSecurity manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.Configuration_ApplyRowLevelSecurity | propose: review Application.Configuration_ApplyRowLevelSecurity manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.DetermineCustomerAccess | propose: review Application.DetermineCustomerAccess manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.DetermineCustomerAccess | propose: review Application.DetermineCustomerAccess manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Warehouse.ColdRoomTemperatures_Staging | propose: review Warehouse.ColdRoomTemperatures_Staging manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Warehouse.ColdRoomTemperatures_Staging | propose: review Warehouse.ColdRoomTemperatures_Staging manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Warehouse.VehicleTemperatures_Staging | propose: review Warehouse.VehicleTemperatures_Staging manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Warehouse.VehicleTemperatures_Staging | propose: review Warehouse.VehicleTemperatures_Staging manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.InvoiceCustomerOrders | propose: review Website.InvoiceCustomerOrders manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.InvoiceCustomerOrders | propose: review Website.InvoiceCustomerOrders manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.RecordColdRoomTemperatures | propose: review Website.RecordColdRoomTemperatures manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.RecordColdRoomTemperatures | propose: review Website.RecordColdRoomTemperatures manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.InsertCustomerOrders | propose: review Website.InsertCustomerOrders manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.InsertCustomerOrders | propose: review Website.InsertCustomerOrders manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.Configuration_EnableInMemory | propose: review Application.Configuration_EnableInMemory manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.Configuration_EnableInMemory | propose: review Application.Configuration_EnableInMemory manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Warehouse.ColdRoomTemperatures | propose: review Warehouse.ColdRoomTemperatures manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Warehouse.ColdRoomTemperatures | propose: review Warehouse.ColdRoomTemperatures manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Warehouse.VehicleTemperatures | propose: review Warehouse.VehicleTemperatures manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Warehouse.VehicleTemperatures | propose: review Warehouse.VehicleTemperatures manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.InvoiceCustomerOrders | propose: review Website.InvoiceCustomerOrders manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.InvoiceCustomerOrders | propose: review Website.InvoiceCustomerOrders manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.RecordColdRoomTemperatures | propose: review Website.RecordColdRoomTemperatures manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.RecordColdRoomTemperatures | propose: review Website.RecordColdRoomTemperatures manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.InsertCustomerOrders | propose: review Website.InsertCustomerOrders manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.InsertCustomerOrders | propose: review Website.InsertCustomerOrders manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.Configuration_RemoveAuditing | propose: review Application.Configuration_RemoveAuditing manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.Configuration_RemoveColumnstoreIndexing | propose: review Application.Configuration_RemoveColumnstoreIndexing manually — no template | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.Configuration_RemoveColumnstoreIndexing | propose: review Application.Configuration_RemoveColumnstoreIndexing manually — no template | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.Configuration_RemoveRowLevelSecurity | propose: review Application.Configuration_RemoveRowLevelSecurity manually — no template ye | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.Configuration_RemoveRowLevelSecurity | propose: review Application.Configuration_RemoveRowLevelSecurity manually — no template ye | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Application.CreateRoleIfNonexistent | propose: review Application.CreateRoleIfNonexistent manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | DataLoadSimulation.ActivateWebsiteLogons | propose: review DataLoadSimulation.ActivateWebsiteLogons manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | DataLoadSimulation.AddCustomers | propose: review DataLoadSimulation.AddCustomers manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | DataLoadSimulation.ChangePasswords | propose: review DataLoadSimulation.ChangePasswords manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | DataLoadSimulation.CreateCustomerOrders | propose: review DataLoadSimulation.CreateCustomerOrders manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | DataLoadSimulation.DailyProcessToCreateHistory | propose: review DataLoadSimulation.DailyProcessToCreateHistory manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | #result | propose: review #result manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | DataLoadSimulation.DeactivateTemporalTablesBeforeDataLoad | propose: review DataLoadSimulation.DeactivateTemporalTablesBeforeDataLoad manually — no te | object_in_graph=ok; nonempty=ok |
| `not_migrated` | DataLoadSimulation.InvoicePickedOrders | propose: review DataLoadSimulation.InvoicePickedOrders manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | DataLoadSimulation.MakeTemporalChanges | propose: review DataLoadSimulation.MakeTemporalChanges manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | DataLoadSimulation.PerformStocktake | propose: review DataLoadSimulation.PerformStocktake manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | DataLoadSimulation.PickStockForCustomerOrders | propose: review DataLoadSimulation.PickStockForCustomerOrders manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | DataLoadSimulation.ReceivePurchaseOrders | propose: review DataLoadSimulation.ReceivePurchaseOrders manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | DataLoadSimulation.RecordColdRoomTemperatures | propose: review DataLoadSimulation.RecordColdRoomTemperatures manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | DataLoadSimulation.RecordDeliveryVanTemperatures | propose: review DataLoadSimulation.RecordDeliveryVanTemperatures manually — no template ye | object_in_graph=ok; nonempty=ok |
| `not_migrated` | DataLoadSimulation.RecordInvoiceDeliveries | propose: review DataLoadSimulation.RecordInvoiceDeliveries manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | DataLoadSimulation.UpdateCustomFields | propose: review DataLoadSimulation.UpdateCustomFields manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | #CityChanges | propose: review #CityChanges manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | #CustomerChanges | propose: review #CustomerChanges manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | #EmployeeChanges | propose: review #EmployeeChanges manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Integration.GetMovementUpdates | propose: review Integration.GetMovementUpdates manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Integration.GetOrderUpdates | propose: review Integration.GetOrderUpdates manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | #PaymentMethodChanges | propose: review #PaymentMethodChanges manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Integration.GetPurchaseUpdates | propose: review Integration.GetPurchaseUpdates manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Integration.GetSaleUpdates | propose: review Integration.GetSaleUpdates manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Integration.GetStockHoldingUpdates | propose: review Integration.GetStockHoldingUpdates manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | #StockItemChanges | propose: review #StockItemChanges manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | #SupplierChanges | propose: review #SupplierChanges manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | #TransactionTypeChanges | propose: review #TransactionTypeChanges manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Integration.GetTransactionUpdates | propose: review Integration.GetTransactionUpdates manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | #CurrentValue | propose: review #CurrentValue manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.ActivateWebsiteLogon | propose: review Website.ActivateWebsiteLogon manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.ChangePassword | propose: review Website.ChangePassword manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.InsertCustomerOrders | propose: review Website.InsertCustomerOrders manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.InvoiceCustomerOrders | propose: review Website.InvoiceCustomerOrders manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.RecordColdRoomTemperatures | propose: review Website.RecordColdRoomTemperatures manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Website.RecordVehicleTemperature | propose: review Website.RecordVehicleTemperature manually — no template yet | object_in_graph=ok; nonempty=ok |

## Ingestion assumptions

The values below are inferred, not observed — review before relying on them.

| Severity | Object | Assumption |
|---|---|---|
| warn | Application.Configuration_ApplyColumnstoreIndexing | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Application.Configuration_ApplyFullTextIndexing | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.SearchForPeople | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.SearchForSuppliers | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.SearchForCustomers | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.SearchForStockItems | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.SearchForStockItemsByTags | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Application.Configuration_ApplyRowLevelSecurity | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Application.DetermineCustomerAccess | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Warehouse.ColdRoomTemperatures_Staging | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Warehouse.VehicleTemperatures_Staging | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.InvoiceCustomerOrders | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.RecordColdRoomTemperatures | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.InsertCustomerOrders | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Application.Configuration_EnableInMemory | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Warehouse.ColdRoomTemperatures | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Warehouse.VehicleTemperatures | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.InvoiceCustomerOrders | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.RecordColdRoomTemperatures | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.InsertCustomerOrders | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| info | Application.Configuration_PrepareForAzureStandard | parsed but no edges extracted — edges inferred via regex (confidence=inferred) |
| warn | Application.Configuration_RemoveColumnstoreIndexing | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Application.Configuration_RemoveRowLevelSecurity | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| info | DataLoadSimulation.GetAreaCode | parsed but no edges extracted — edges inferred via regex (confidence=inferred) |
| warn | DataLoadSimulation.ActivateWebsiteLogons | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | DataLoadSimulation.AddCustomers | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | DataLoadSimulation.ChangePasswords | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | DataLoadSimulation.CreateCustomerOrders | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | DataLoadSimulation.DailyProcessToCreateHistory | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | #result | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | DataLoadSimulation.InvoicePickedOrders | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | DataLoadSimulation.MakeTemporalChanges | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | DataLoadSimulation.PerformStocktake | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | DataLoadSimulation.PickStockForCustomerOrders | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | DataLoadSimulation.ReceivePurchaseOrders | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | DataLoadSimulation.RecordColdRoomTemperatures | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | DataLoadSimulation.RecordDeliveryVanTemperatures | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | DataLoadSimulation.RecordInvoiceDeliveries | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | DataLoadSimulation.UpdateCustomFields | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | #CityChanges | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | #CustomerChanges | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | #EmployeeChanges | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Integration.GetMovementUpdates | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Integration.GetOrderUpdates | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | #PaymentMethodChanges | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Integration.GetPurchaseUpdates | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Integration.GetSaleUpdates | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Integration.GetStockHoldingUpdates | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | #StockItemChanges | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | #SupplierChanges | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | #TransactionTypeChanges | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Integration.GetTransactionUpdates | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.ActivateWebsiteLogon | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.ChangePassword | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.InsertCustomerOrders | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.InvoiceCustomerOrders | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.RecordColdRoomTemperatures | could not be fully parsed — edges inferred via regex (confidence=inferred) |
| warn | Website.RecordVehicleTemperature | could not be fully parsed — edges inferred via regex (confidence=inferred) |
