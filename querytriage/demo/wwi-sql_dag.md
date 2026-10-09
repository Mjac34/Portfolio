```mermaid
flowchart TD
    classDef tbl fill:#f1f5f9,stroke:#333,color:#000
    classDef view fill:#dbeafe,stroke:#333,color:#000
    classDef proc fill:#fed7aa,stroke:#333,color:#000
    classDef fn fill:#dcfce7,stroke:#333,color:#000
    classDef ext fill:#ede9fe,stroke:#7c3aed,color:#000,stroke-dasharray:5 4
    classDef miss fill:#fff,stroke:#dc2626,color:#000,stroke-dasharray:5 4
    classDef trap fill:#f4cccc,stroke:#c00,color:#000
    n_CityChanges["#CityChanges"]:::trap
    n_CurrentValue["#CurrentValue"]:::trap
    n_CustomerChanges["#CustomerChanges"]:::trap
    n_EmployeeChanges["#EmployeeChanges"]:::trap
    n_PaymentMethodChanges["#PaymentMethodChanges"]:::trap
    n_StockItemChanges["#StockItemChanges"]:::trap
    n_SupplierChanges["#SupplierChanges"]:::trap
    n_TransactionTypeChanges["#TransactionTypeChanges"]:::trap
    n_result["#result"]:::trap
    n_InvoicesToGenerate["@InvoicesToGenerate"]:::trap
    n_OrderLines["@OrderLines"]:::trap
    n_Orders["@Orders"]:::trap
    n_OrdersToGenerate["@OrdersToGenerate"]:::trap
    n_OrdersToInvoice["@OrdersToInvoice"]:::trap
    n_OtherLanguages["@OtherLanguages"]:::trap
    n_SensorReadings["@SensorReadings"]:::trap
    n_StockAlreadyAllocated["@StockAlreadyAllocated"]:::trap
    n_UninvoicedOrders["@UninvoicedOrders"]:::trap
    nAS["AS"]:::trap
    nApplication_AddRoleMemberIfNonexistent["Application.AddRoleMemberIfNonexistent"]:::trap
    nApplication_Cities["Application.Cities"]:::trap
    nApplication_Cities_Archive["Application.Cities_Archive"]:::trap
    nApplication_Configuration_ApplyAuditing["Application.Configuration_ApplyAuditing"]:::trap
    nApplication_Configuration_ApplyColumnstoreIndexing["Application.Configuration_ApplyColumnstoreIndexing"]:::trap
    nApplication_Configuration_ApplyFullTextIndexing["Application.Configuration_ApplyFullTextIndexing"]:::trap
    nApplication_Configuration_ApplyPartitioning["Application.Configuration_ApplyPartitioning"]:::trap
    nApplication_Configuration_ApplyRowLevelSecurity["Application.Configuration_ApplyRowLevelSecurity"]:::trap
    nApplication_Configuration_ConfigureForEnterpriseEdition["Application.Configuration_ConfigureForEnterpriseEdition"]:::trap
    nApplication_Configuration_DisableInMemory["Application.Configuration_DisableInMemory"]:::trap
    nApplication_Configuration_EnableInMemory["Application.Configuration_EnableInMemory"]:::trap
    nApplication_Configuration_PrepareForAzureStandard["Application.Configuration_PrepareForAzureStandard"]:::trap
    nApplication_Configuration_RemoveAuditing["Application.Configuration_RemoveAuditing"]:::trap
    nApplication_Configuration_RemoveColumnstoreIndexing["Application.Configuration_RemoveColumnstoreIndexing"]:::trap
    nApplication_Configuration_RemoveRowLevelSecurity["Application.Configuration_RemoveRowLevelSecurity"]:::trap
    nApplication_Countries["Application.Countries"]:::trap
    nApplication_Countries_Archive["Application.Countries_Archive"]:::trap
    nApplication_CreateRoleIfNonexistent["Application.CreateRoleIfNonexistent"]:::trap
    nApplication_DeliveryMethods["Application.DeliveryMethods"]:::trap
    nApplication_DeliveryMethods_Archive["Application.DeliveryMethods_Archive"]:::trap
    nApplication_DetermineCustomerAccess["Application.DetermineCustomerAccess"]:::trap
    nApplication_PaymentMethods["Application.PaymentMethods"]:::trap
    nApplication_PaymentMethods_Archive["Application.PaymentMethods_Archive"]:::trap
    nApplication_People["Application.People"]:::trap
    nApplication_People_Archive["Application.People_Archive"]:::trap
    nApplication_StateProvinces["Application.StateProvinces"]:::trap
    nApplication_StateProvinces_Archive["Application.StateProvinces_Archive"]:::trap
    nApplication_TR_Application_Cities_DataLoad_Modify["Application.TR_Application_Cities_DataLoad_Modify"]:::trap
    nApplication_TR_Application_Countries_DataLoad_Modify["Application.TR_Application_Countries_DataLoad_Modify"]:::trap
    nApplication_TR_Application_DeliveryMethods_DataLoad_Modify["Application.TR_Application_DeliveryMethods_DataLoad_Modify"]:::trap
    nApplication_TR_Application_PaymentMethods_DataLoad_Modify["Application.TR_Application_PaymentMethods_DataLoad_Modify"]:::trap
    nApplication_TR_Application_People_DataLoad_Modify["Application.TR_Application_People_DataLoad_Modify"]:::trap
    nApplication_TR_Application_StateProvinces_DataLoad_Modify["Application.TR_Application_StateProvinces_DataLoad_Modify"]:::trap
    nApplication_TR_Application_TransactionTypes_DataLoad_Modify["Application.TR_Application_TransactionTypes_DataLoad_Modify"]:::trap
    nApplication_TransactionTypes["Application.TransactionTypes"]:::trap
    nApplication_TransactionTypes_Archive["Application.TransactionTypes_Archive"]:::trap
    nBuyingGroupChangeList["BuyingGroupChangeList"]:::trap
    nChangeList["ChangeList"]:::trap
    nCityChangeList["CityChangeList"]:::trap
    nCountryChangeList["CountryChangeList"]:::trap
    nCustomerCategoryChangeList["CustomerCategoryChangeList"]:::trap
    nCustomerChangeList["CustomerChangeList"]:::trap
    nDataLoadSimulation_ActivateWebsiteLogons["DataLoadSimulation.ActivateWebsiteLogons"]:::proc
    nDataLoadSimulation_AddCustomers["DataLoadSimulation.AddCustomers"]:::proc
    nDataLoadSimulation_AddSpecialDeals["DataLoadSimulation.AddSpecialDeals"]:::proc
    nDataLoadSimulation_AddStockItems["DataLoadSimulation.AddStockItems"]:::proc
    nDataLoadSimulation_AreaCode["DataLoadSimulation.AreaCode"]:::trap
    nDataLoadSimulation_ChangePasswords["DataLoadSimulation.ChangePasswords"]:::proc
    nDataLoadSimulation_ColdRoomTemperatures_temp["DataLoadSimulation.ColdRoomTemperatures_temp"]:::trap
    nDataLoadSimulation_CreateCustomerOrders["DataLoadSimulation.CreateCustomerOrders"]:::proc
    nDataLoadSimulation_DailyProcessToCreateHistory["DataLoadSimulation.DailyProcessToCreateHistory"]:::trap
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad["DataLoadSimulation.DeactivateTemporalTablesBeforeDataLoad"]:::trap
    nDataLoadSimulation_GetAreaCode["DataLoadSimulation.GetAreaCode"]:::trap
    nDataLoadSimulation_GetBogativePhoneNumber["DataLoadSimulation.GetBogativePhoneNumber"]:::trap
    nDataLoadSimulation_GetBogativePostalCode["DataLoadSimulation.GetBogativePostalCode"]:::trap
    nDataLoadSimulation_GetFicticiousName["DataLoadSimulation.GetFicticiousName"]:::trap
    nDataLoadSimulation_GetRandomBuyingGroupNotInUse["DataLoadSimulation.GetRandomBuyingGroupNotInUse"]:::trap
    nDataLoadSimulation_GetRandomCustomer["DataLoadSimulation.GetRandomCustomer"]:::trap
    nDataLoadSimulation_GetRandomCustomerCategory["DataLoadSimulation.GetRandomCustomerCategory"]:::trap
    nDataLoadSimulation_GetRandomEmployeePerson["DataLoadSimulation.GetRandomEmployeePerson"]:::trap
    nDataLoadSimulation_GetRandomSalesPersonID["DataLoadSimulation.GetRandomSalesPersonID"]:::trap
    nDataLoadSimulation_GetRandomSecondaryAddress["DataLoadSimulation.GetRandomSecondaryAddress"]:::trap
    nDataLoadSimulation_GetRandomStockItemToAdjust["DataLoadSimulation.GetRandomStockItemToAdjust"]:::trap
    nDataLoadSimulation_GetRandomStreet["DataLoadSimulation.GetRandomStreet"]:::trap
    nDataLoadSimulation_InvoicePickedOrders["DataLoadSimulation.InvoicePickedOrders"]:::proc
    nDataLoadSimulation_MakeTemporalChanges["DataLoadSimulation.MakeTemporalChanges"]:::proc
    nDataLoadSimulation_PaySuppliers["DataLoadSimulation.PaySuppliers"]:::proc
    nDataLoadSimulation_PerformStocktake["DataLoadSimulation.PerformStocktake"]:::proc
    nDataLoadSimulation_PickStockForCustomerOrders["DataLoadSimulation.PickStockForCustomerOrders"]:::proc
    nDataLoadSimulation_PlaceSupplierOrders["DataLoadSimulation.PlaceSupplierOrders"]:::proc
    nDataLoadSimulation_PopulateColdRoomTemperatures_temp["DataLoadSimulation.PopulateColdRoomTemperatures_temp"]:::trap
    nDataLoadSimulation_PopulateDataToCurrentDate["DataLoadSimulation.PopulateDataToCurrentDate"]:::trap
    nDataLoadSimulation_ProcessCustomerPayments["DataLoadSimulation.ProcessCustomerPayments"]:::proc
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad["DataLoadSimulation.ReactivateTemporalTablesAfterDataLoad"]:::proc
    nDataLoadSimulation_ReceivePurchaseOrders["DataLoadSimulation.ReceivePurchaseOrders"]:::proc
    nDataLoadSimulation_RecordColdRoomTemperatures["DataLoadSimulation.RecordColdRoomTemperatures"]:::proc
    nDataLoadSimulation_RecordDeliveryVanTemperatures["DataLoadSimulation.RecordDeliveryVanTemperatures"]:::proc
    nDataLoadSimulation_RecordInvoiceDeliveries["DataLoadSimulation.RecordInvoiceDeliveries"]:::proc
    nDataLoadSimulation_SeasonVariation["DataLoadSimulation.SeasonVariation"]:::trap
    nDataLoadSimulation_UpdateCustomFields["DataLoadSimulation.UpdateCustomFields"]:::proc
    nEmployeeChangeList["EmployeeChangeList"]:::trap
    nEmployeeList["EmployeeList"]:::trap
    nFREETEXTTABLE["FREETEXTTABLE"]:::trap
    nIntegration_GetCityUpdates["Integration.GetCityUpdates"]:::trap
    nIntegration_GetCustomerUpdates["Integration.GetCustomerUpdates"]:::trap
    nIntegration_GetEmployeeUpdates["Integration.GetEmployeeUpdates"]:::trap
    nIntegration_GetMovementUpdates["Integration.GetMovementUpdates"]:::trap
    nIntegration_GetOrderUpdates["Integration.GetOrderUpdates"]:::trap
    nIntegration_GetPaymentMethodUpdates["Integration.GetPaymentMethodUpdates"]:::trap
    nIntegration_GetPurchaseUpdates["Integration.GetPurchaseUpdates"]:::trap
    nIntegration_GetSaleUpdates["Integration.GetSaleUpdates"]:::trap
    nIntegration_GetStockHoldingUpdates["Integration.GetStockHoldingUpdates"]:::trap
    nIntegration_GetStockItemUpdates["Integration.GetStockItemUpdates"]:::trap
    nIntegration_GetSupplierUpdates["Integration.GetSupplierUpdates"]:::trap
    nIntegration_GetTransactionTypeUpdates["Integration.GetTransactionTypeUpdates"]:::trap
    nIntegration_GetTransactionUpdates["Integration.GetTransactionUpdates"]:::trap
    nInvoiceList["InvoiceList"]:::trap
    nOPENJSON["OPENJSON"]:::trap
    nOrderLineList["OrderLineList"]:::trap
    nOrderLines["OrderLines"]:::trap
    nOrderList["OrderList"]:::trap
    nOrders["Orders"]:::trap
    nPurchaseOrderList["PurchaseOrderList"]:::trap
    nPurchasing_PurchaseOrderLines["Purchasing.PurchaseOrderLines"]:::trap
    nPurchasing_PurchaseOrders["Purchasing.PurchaseOrders"]:::trap
    nPurchasing_SupplierCategories["Purchasing.SupplierCategories"]:::trap
    nPurchasing_SupplierCategories_Archive["Purchasing.SupplierCategories_Archive"]:::trap
    nPurchasing_SupplierTransactions["Purchasing.SupplierTransactions"]:::trap
    nPurchasing_Suppliers["Purchasing.Suppliers"]:::trap
    nPurchasing_Suppliers_Archive["Purchasing.Suppliers_Archive"]:::trap
    nPurchasing_TR_Purchasing_SupplierCategories_DataLoad_Modify["Purchasing.TR_Purchasing_SupplierCategories_DataLoad_Modify"]:::trap
    nPurchasing_TR_Purchasing_Suppliers_DataLoad_Modify["Purchasing.TR_Purchasing_Suppliers_DataLoad_Modify"]:::trap
    nSET["SET"]:::trap
    nSales_BuyingGroups["Sales.BuyingGroups"]:::trap
    nSales_BuyingGroups_Archive["Sales.BuyingGroups_Archive"]:::trap
    nSales_CustomerCategories["Sales.CustomerCategories"]:::trap
    nSales_CustomerCategories_Archive["Sales.CustomerCategories_Archive"]:::trap
    nSales_CustomerTransactions["Sales.CustomerTransactions"]:::trap
    nSales_Customers["Sales.Customers"]:::trap
    nSales_Customers_Archive["Sales.Customers_Archive"]:::trap
    nSales_InvoiceLines["Sales.InvoiceLines"]:::trap
    nSales_Invoices["Sales.Invoices"]:::trap
    nSales_OrderLines["Sales.OrderLines"]:::trap
    nSales_Orders["Sales.Orders"]:::trap
    nSales_SpecialDeals["Sales.SpecialDeals"]:::trap
    nSales_TR_Sales_BuyingGroups_DataLoad_Modify["Sales.TR_Sales_BuyingGroups_DataLoad_Modify"]:::trap
    nSales_TR_Sales_CustomerCategories_DataLoad_Modify["Sales.TR_Sales_CustomerCategories_DataLoad_Modify"]:::trap
    nSales_TR_Sales_Customers_DataLoad_Modify["Sales.TR_Sales_Customers_DataLoad_Modify"]:::trap
    nSequences_ReseedAllSequences["Sequences.ReseedAllSequences"]:::proc
    nSequences_ReseedSequenceBeyondTableValues["Sequences.ReseedSequenceBeyondTableValues"]:::proc
    nStateProvinceChangeList["StateProvinceChangeList"]:::trap
    nStockAlreadyAllocated["StockAlreadyAllocated"]:::trap
    nStockItemChangeList["StockItemChangeList"]:::trap
    nStockItemTotals["StockItemTotals"]:::trap
    nStockItemsToCheck["StockItemsToCheck"]:::trap
    nStockItemsToOrder["StockItemsToOrder"]:::trap
    nSupplierCategoryChangeList["SupplierCategoryChangeList"]:::trap
    nSupplierChangeList["SupplierChangeList"]:::trap
    nTransactionsToPay["TransactionsToPay"]:::trap
    nTransactionsToReceive["TransactionsToReceive"]:::trap
    nWarehouse_ColdRoomTemperatures["Warehouse.ColdRoomTemperatures ⟳"]:::trap
    nWarehouse_ColdRoomTemperatures_Archive["Warehouse.ColdRoomTemperatures_Archive"]:::trap
    nWarehouse_ColdRoomTemperatures_Backup["Warehouse.ColdRoomTemperatures_Backup"]:::trap
    nWarehouse_ColdRoomTemperatures_Staging["Warehouse.ColdRoomTemperatures_Staging ⟳"]:::trap
    nWarehouse_Colors["Warehouse.Colors"]:::trap
    nWarehouse_Colors_Archive["Warehouse.Colors_Archive"]:::trap
    nWarehouse_PackageTypes["Warehouse.PackageTypes"]:::trap
    nWarehouse_PackageTypes_Archive["Warehouse.PackageTypes_Archive"]:::trap
    nWarehouse_StockGroups["Warehouse.StockGroups"]:::trap
    nWarehouse_StockGroups_Archive["Warehouse.StockGroups_Archive"]:::trap
    nWarehouse_StockItemHoldings["Warehouse.StockItemHoldings"]:::trap
    nWarehouse_StockItemStockGroups["Warehouse.StockItemStockGroups"]:::trap
    nWarehouse_StockItemTransactions["Warehouse.StockItemTransactions"]:::trap
    nWarehouse_StockItems["Warehouse.StockItems"]:::trap
    nWarehouse_StockItems_Archive["Warehouse.StockItems_Archive"]:::trap
    nWarehouse_TR_Warehouse_ColdRoomTemperatures_DataLoad_Modify["Warehouse.TR_Warehouse_ColdRoomTemperatures_DataLoad_Modify"]:::trap
    nWarehouse_TR_Warehouse_Colors_DataLoad_Modify["Warehouse.TR_Warehouse_Colors_DataLoad_Modify"]:::trap
    nWarehouse_TR_Warehouse_PackageTypes_DataLoad_Modify["Warehouse.TR_Warehouse_PackageTypes_DataLoad_Modify"]:::trap
    nWarehouse_TR_Warehouse_StockGroups_DataLoad_Modify["Warehouse.TR_Warehouse_StockGroups_DataLoad_Modify"]:::trap
    nWarehouse_TR_Warehouse_StockItems_DataLoad_Modify["Warehouse.TR_Warehouse_StockItems_DataLoad_Modify"]:::trap
    nWarehouse_VehicleTemperatures["Warehouse.VehicleTemperatures ⟳"]:::trap
    nWarehouse_VehicleTemperatures_Backup["Warehouse.VehicleTemperatures_Backup"]:::trap
    nWarehouse_VehicleTemperatures_Staging["Warehouse.VehicleTemperatures_Staging ⟳"]:::trap
    nWebsite_ActivateWebsiteLogon["Website.ActivateWebsiteLogon"]:::trap
    nWebsite_CalculateCustomerPrice["Website.CalculateCustomerPrice"]:::trap
    nWebsite_ChangePassword["Website.ChangePassword"]:::trap
    nWebsite_InsertCustomerOrders["Website.InsertCustomerOrders"]:::trap
    nWebsite_InvoiceCustomerOrders["Website.InvoiceCustomerOrders"]:::trap
    nWebsite_RecordColdRoomTemperatures["Website.RecordColdRoomTemperatures"]:::trap
    nWebsite_RecordVehicleTemperature["Website.RecordVehicleTemperature"]:::trap
    nWebsite_SearchForCustomers["Website.SearchForCustomers"]:::trap
    nWebsite_SearchForPeople["Website.SearchForPeople"]:::trap
    nWebsite_SearchForStockItems["Website.SearchForStockItems"]:::trap
    nWebsite_SearchForStockItemsByTags["Website.SearchForStockItemsByTags"]:::trap
    nWebsite_SearchForSuppliers["Website.SearchForSuppliers"]:::trap
    ncc["cc"]:::trap
    ncustomers["customers"]:::trap
    ndbo_sp_rename["dbo.sp_rename"]:::trap
    nearlier["earlier"]:::trap
    npurchase["purchase"]:::trap
    nsi["si"]:::trap
    nsih["sih"]:::trap
    nsys_database_audit_specifications["sys.database_audit_specifications"]:::trap
    nsys_database_principals["sys.database_principals"]:::trap
    nsys_database_role_members["sys.database_role_members"]:::trap
    nsys_filegroups["sys.filegroups"]:::trap
    nsys_fulltext_catalogs["sys.fulltext_catalogs"]:::trap
    nsys_fulltext_indexes["sys.fulltext_indexes"]:::trap
    nsys_indexes["sys.indexes"]:::trap
    nsys_partition_functions["sys.partition_functions"]:::trap
    nsys_partition_schemes["sys.partition_schemes"]:::trap
    nsys_procedures["sys.procedures"]:::trap
    nsys_sequences["sys.sequences"]:::trap
    nsys_server_audit_specifications["sys.server_audit_specifications"]:::trap
    nsys_server_audits["sys.server_audits"]:::trap
    nsys_syslanguages["sys.syslanguages"]:::trap
    nsys_tables["sys.tables"]:::trap
    nthe["the"]:::trap
    n_CityChanges -.->|read| nApplication_Cities
    n_CityChanges -.->|read| nApplication_Cities_Archive
    n_CityChanges -.->|read| nApplication_Countries
    n_CityChanges -.->|read| nApplication_Countries_Archive
    n_CityChanges -.->|read| nApplication_StateProvinces
    n_CityChanges -.->|read| nApplication_StateProvinces_Archive
    n_CityChanges -.->|read| nCityChangeList
    n_CityChanges -.->|read| nCountryChangeList
    n_CityChanges -.->|read| nStateProvinceChangeList
    n_CityChanges -.->|write| ncc
    n_CustomerChanges -.->|read| nApplication_People
    n_CustomerChanges -.->|read| nBuyingGroupChangeList
    n_CustomerChanges -.->|read| nCustomerCategoryChangeList
    n_CustomerChanges -.->|read| nCustomerChangeList
    n_CustomerChanges -.->|read| nSales_BuyingGroups
    n_CustomerChanges -.->|read| nSales_BuyingGroups_Archive
    n_CustomerChanges -.->|read| nSales_CustomerCategories
    n_CustomerChanges -.->|read| nSales_CustomerCategories_Archive
    n_CustomerChanges -.->|read| nSales_Customers
    n_CustomerChanges -.->|read| nSales_Customers_Archive
    n_CustomerChanges -.->|write| ncc
    n_EmployeeChanges -.->|read| nApplication_People
    n_EmployeeChanges -.->|read| nApplication_People_Archive
    n_EmployeeChanges -.->|read| nEmployeeChangeList
    n_EmployeeChanges -.->|write| ncc
    n_PaymentMethodChanges -.->|read| nApplication_PaymentMethods
    n_PaymentMethodChanges -.->|read| nApplication_PaymentMethods_Archive
    n_PaymentMethodChanges -.->|read| nChangeList
    n_PaymentMethodChanges -.->|write| ncc
    n_StockItemChanges -.->|read| nStockItemChangeList
    n_StockItemChanges -.->|read| nWarehouse_Colors
    n_StockItemChanges -.->|read| nWarehouse_PackageTypes
    n_StockItemChanges -.->|read| nWarehouse_StockItems
    n_StockItemChanges -.->|read| nWarehouse_StockItems_Archive
    n_StockItemChanges -.->|write| ncc
    n_SupplierChanges -.->|read| nApplication_People
    n_SupplierChanges -.->|read| nPurchasing_SupplierCategories
    n_SupplierChanges -.->|read| nPurchasing_SupplierCategories_Archive
    n_SupplierChanges -.->|read| nPurchasing_Suppliers
    n_SupplierChanges -.->|read| nPurchasing_Suppliers_Archive
    n_SupplierChanges -.->|read| nSupplierCategoryChangeList
    n_SupplierChanges -.->|read| nSupplierChangeList
    n_SupplierChanges -.->|write| ncc
    n_TransactionTypeChanges -.->|read| nApplication_TransactionTypes
    n_TransactionTypeChanges -.->|read| nApplication_TransactionTypes_Archive
    n_TransactionTypeChanges -.->|read| nChangeList
    n_TransactionTypeChanges -.->|write| ncc
    n_result -.->|call| nApplication_Configuration_ApplyRowLevelSecurity
    n_result -.->|call| nDataLoadSimulation_ActivateWebsiteLogons
    n_result -.->|call| nDataLoadSimulation_AddCustomers
    n_result -.->|call| nDataLoadSimulation_AddSpecialDeals
    n_result -.->|call| nDataLoadSimulation_AddStockItems
    n_result -.->|call| nDataLoadSimulation_ChangePasswords
    n_result -.->|call| nDataLoadSimulation_CreateCustomerOrders
    n_result -.->|call| nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad
    n_result -.->|call| nDataLoadSimulation_InvoicePickedOrders
    n_result -.->|call| nDataLoadSimulation_MakeTemporalChanges
    n_result -.->|call| nDataLoadSimulation_PaySuppliers
    n_result -.->|call| nDataLoadSimulation_PerformStocktake
    n_result -.->|call| nDataLoadSimulation_PickStockForCustomerOrders
    n_result -.->|call| nDataLoadSimulation_PlaceSupplierOrders
    n_result -.->|call| nDataLoadSimulation_ProcessCustomerPayments
    n_result -.->|call| nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad
    n_result -.->|call| nDataLoadSimulation_ReceivePurchaseOrders
    n_result -.->|call| nDataLoadSimulation_RecordColdRoomTemperatures
    n_result -.->|call| nDataLoadSimulation_RecordDeliveryVanTemperatures
    n_result -.->|call| nDataLoadSimulation_RecordInvoiceDeliveries
    n_result -.->|read| nDataLoadSimulation_SeasonVariation
    n_result -.->|write| nDataLoadSimulation_SeasonVariation
    n_result -.->|call| nDataLoadSimulation_UpdateCustomFields
    n_result -.->|call| nSequences_ReseedAllSequences
    n_result -.->|read| ncustomers
    nApplication_AddRoleMemberIfNonexistent -->|read| nsys_database_principals
    nApplication_AddRoleMemberIfNonexistent -->|read| nsys_database_role_members
    nApplication_Configuration_ApplyAuditing -->|read| nsys_database_audit_specifications
    nApplication_Configuration_ApplyAuditing -->|read| nsys_server_audit_specifications
    nApplication_Configuration_ApplyAuditing -->|read| nsys_server_audits
    nApplication_Configuration_ApplyColumnstoreIndexing -.->|call| nAS
    nApplication_Configuration_ApplyColumnstoreIndexing -.->|read| nsys_indexes
    nApplication_Configuration_ApplyColumnstoreIndexing -.->|read| nsys_tables
    nApplication_Configuration_ApplyFullTextIndexing -.->|call| nAS
    nApplication_Configuration_ApplyFullTextIndexing -.->|read| nsys_fulltext_catalogs
    nApplication_Configuration_ApplyFullTextIndexing -.->|read| nsys_fulltext_indexes
    nApplication_Configuration_ApplyPartitioning -->|read| nsys_indexes
    nApplication_Configuration_ApplyPartitioning -->|read| nsys_partition_functions
    nApplication_Configuration_ApplyPartitioning -->|read| nsys_partition_schemes
    nApplication_Configuration_ApplyRowLevelSecurity -.->|call| nAS
    nApplication_Configuration_ConfigureForEnterpriseEdition ==>|call| nApplication_Configuration_ApplyColumnstoreIndexing
    nApplication_Configuration_ConfigureForEnterpriseEdition ==>|call| nApplication_Configuration_ApplyFullTextIndexing
    nApplication_Configuration_ConfigureForEnterpriseEdition ==>|call| nApplication_Configuration_ApplyPartitioning
    nApplication_Configuration_ConfigureForEnterpriseEdition ==>|call| nApplication_Configuration_EnableInMemory
    nApplication_Configuration_EnableInMemory -.->|call| ndbo_sp_rename
    nApplication_Configuration_EnableInMemory -.->|read| nsys_filegroups
    nApplication_Configuration_EnableInMemory -.->|read| nsys_tables
    nApplication_Configuration_PrepareForAzureStandard -.->|call| nApplication_Configuration_DisableInMemory
    nApplication_Configuration_PrepareForAzureStandard -.->|call| nApplication_Configuration_RemoveColumnstoreIndexing
    nApplication_Configuration_RemoveAuditing -->|read| nsys_database_audit_specifications
    nApplication_Configuration_RemoveAuditing -->|read| nsys_server_audit_specifications
    nApplication_Configuration_RemoveAuditing -->|read| nsys_server_audits
    nApplication_Configuration_RemoveColumnstoreIndexing -.->|call| nAS
    nApplication_Configuration_RemoveColumnstoreIndexing -.->|read| nsys_indexes
    nApplication_Configuration_RemoveColumnstoreIndexing -.->|read| nsys_tables
    nApplication_Configuration_RemoveRowLevelSecurity -.->|call| nAS
    nApplication_CreateRoleIfNonexistent -->|read| nsys_database_principals
    nApplication_DetermineCustomerAccess -->|read| nApplication_Cities
    nApplication_DetermineCustomerAccess -.->|read| nApplication_Cities
    nApplication_DetermineCustomerAccess -->|read| nApplication_StateProvinces
    nApplication_DetermineCustomerAccess -.->|read| nApplication_StateProvinces
    nDataLoadSimulation_ActivateWebsiteLogons -.->|call| nAS
    nDataLoadSimulation_ActivateWebsiteLogons -.->|read| nApplication_People
    nDataLoadSimulation_ActivateWebsiteLogons -.->|write| nApplication_People
    nDataLoadSimulation_AddCustomers -.->|call| nAS
    nDataLoadSimulation_AddCustomers -.->|write| nApplication_People
    nDataLoadSimulation_AddCustomers -.->|call| nDataLoadSimulation_GetBogativePhoneNumber
    nDataLoadSimulation_AddCustomers -.->|call| nDataLoadSimulation_GetBogativePostalCode
    nDataLoadSimulation_AddCustomers -.->|call| nDataLoadSimulation_GetFicticiousName
    nDataLoadSimulation_AddCustomers -.->|call| nDataLoadSimulation_GetRandomBuyingGroupNotInUse
    nDataLoadSimulation_AddCustomers -.->|call| nDataLoadSimulation_GetRandomCustomerCategory
    nDataLoadSimulation_AddCustomers -.->|call| nDataLoadSimulation_GetRandomSecondaryAddress
    nDataLoadSimulation_AddCustomers -.->|call| nDataLoadSimulation_GetRandomStreet
    nDataLoadSimulation_AddCustomers -.->|write| nSales_Customers
    nDataLoadSimulation_AddSpecialDeals -->|read| nSales_BuyingGroups
    nDataLoadSimulation_AddSpecialDeals -->|write| nSales_SpecialDeals
    nDataLoadSimulation_AddSpecialDeals -->|read| nWarehouse_StockGroups
    nDataLoadSimulation_AddStockItems -->|read| nPurchasing_Suppliers
    nDataLoadSimulation_AddStockItems -->|read| nWarehouse_Colors
    nDataLoadSimulation_AddStockItems -->|read| nWarehouse_PackageTypes
    nDataLoadSimulation_AddStockItems -->|read| nWarehouse_StockGroups
    nDataLoadSimulation_AddStockItems -->|write| nWarehouse_StockItemHoldings
    nDataLoadSimulation_AddStockItems -->|write| nWarehouse_StockItemStockGroups
    nDataLoadSimulation_AddStockItems -->|write| nWarehouse_StockItems
    nDataLoadSimulation_ChangePasswords -.->|call| nAS
    nDataLoadSimulation_ChangePasswords -.->|read| nApplication_People
    nDataLoadSimulation_ChangePasswords -.->|write| nApplication_People
    nDataLoadSimulation_CreateCustomerOrders -.->|call| nAS
    nDataLoadSimulation_CreateCustomerOrders -.->|read| nApplication_People
    nDataLoadSimulation_CreateCustomerOrders -.->|call| nDataLoadSimulation_GetRandomCustomer
    nDataLoadSimulation_CreateCustomerOrders -.->|call| nDataLoadSimulation_GetRandomSalesPersonID
    nDataLoadSimulation_CreateCustomerOrders -.->|read| nSales_Customers
    nDataLoadSimulation_CreateCustomerOrders -.->|read| nSales_OrderLines
    nDataLoadSimulation_CreateCustomerOrders -.->|write| nSales_OrderLines
    nDataLoadSimulation_CreateCustomerOrders -.->|write| nSales_Orders
    nDataLoadSimulation_CreateCustomerOrders -.->|read| nWarehouse_StockItems
    nDataLoadSimulation_DailyProcessToCreateHistory -.->|read| nDataLoadSimulation_SeasonVariation
    nDataLoadSimulation_DailyProcessToCreateHistory -.->|write| nDataLoadSimulation_SeasonVariation
    nDataLoadSimulation_DailyProcessToCreateHistory -.->|read| nSales_Orders
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nApplication_Cities
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad ==>|call| nApplication_Configuration_RemoveRowLevelSecurity
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nApplication_Countries
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nApplication_DeliveryMethods
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nApplication_PaymentMethods
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nApplication_People
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nApplication_StateProvinces
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nApplication_TransactionTypes
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nPurchasing_SupplierCategories
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nPurchasing_Suppliers
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nSales_BuyingGroups
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nSales_CustomerCategories
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nSales_Customers
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nWarehouse_ColdRoomTemperatures
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nWarehouse_Colors
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nWarehouse_PackageTypes
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nWarehouse_StockGroups
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nWarehouse_StockItems
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nsys_procedures
    nDataLoadSimulation_DeactivateTemporalTablesBeforeDataLoad -->|read| nsys_tables
    nDataLoadSimulation_GetAreaCode -.->|call| nAS
    nDataLoadSimulation_GetAreaCode -.->|read| nDataLoadSimulation_AreaCode
    nDataLoadSimulation_GetAreaCode -.->|read| nthe
    nDataLoadSimulation_InvoicePickedOrders -.->|read| nApplication_People
    nDataLoadSimulation_InvoicePickedOrders -.->|call| nDataLoadSimulation_GetRandomEmployeePerson
    nDataLoadSimulation_InvoicePickedOrders -.->|read| nOrderList
    nDataLoadSimulation_InvoicePickedOrders -.->|write| nSales_CustomerTransactions
    nDataLoadSimulation_InvoicePickedOrders -.->|read| nSales_Customers
    nDataLoadSimulation_InvoicePickedOrders -.->|read| nSales_InvoiceLines
    nDataLoadSimulation_InvoicePickedOrders -.->|write| nSales_InvoiceLines
    nDataLoadSimulation_InvoicePickedOrders -.->|read| nSales_Invoices
    nDataLoadSimulation_InvoicePickedOrders -.->|write| nSales_Invoices
    nDataLoadSimulation_InvoicePickedOrders -.->|read| nSales_OrderLines
    nDataLoadSimulation_InvoicePickedOrders -.->|write| nSales_OrderLines
    nDataLoadSimulation_InvoicePickedOrders -.->|read| nSales_Orders
    nDataLoadSimulation_InvoicePickedOrders -.->|write| nSales_Orders
    nDataLoadSimulation_InvoicePickedOrders -.->|read| nStockItemTotals
    nDataLoadSimulation_InvoicePickedOrders -.->|read| nWarehouse_StockItemHoldings
    nDataLoadSimulation_InvoicePickedOrders -.->|write| nWarehouse_StockItemTransactions
    nDataLoadSimulation_InvoicePickedOrders -.->|read| nWarehouse_StockItems
    nDataLoadSimulation_InvoicePickedOrders -.->|write| nsih
    nDataLoadSimulation_MakeTemporalChanges -.->|read| nApplication_Cities
    nDataLoadSimulation_MakeTemporalChanges -.->|write| nApplication_Cities
    nDataLoadSimulation_MakeTemporalChanges -.->|read| nApplication_Countries
    nDataLoadSimulation_MakeTemporalChanges -.->|write| nApplication_Countries
    nDataLoadSimulation_MakeTemporalChanges -.->|write| nApplication_DeliveryMethods
    nDataLoadSimulation_MakeTemporalChanges -.->|write| nApplication_PaymentMethods
    nDataLoadSimulation_MakeTemporalChanges -.->|read| nApplication_People
    nDataLoadSimulation_MakeTemporalChanges -.->|read| nApplication_StateProvinces
    nDataLoadSimulation_MakeTemporalChanges -.->|write| nApplication_StateProvinces
    nDataLoadSimulation_MakeTemporalChanges -.->|write| nApplication_TransactionTypes
    nDataLoadSimulation_MakeTemporalChanges -.->|write| nPurchasing_SupplierCategories
    nDataLoadSimulation_MakeTemporalChanges -.->|write| nSales_CustomerCategories
    nDataLoadSimulation_MakeTemporalChanges -.->|read| nSales_Customers
    nDataLoadSimulation_MakeTemporalChanges -.->|write| nSales_Customers
    nDataLoadSimulation_MakeTemporalChanges -.->|write| nWarehouse_Colors
    nDataLoadSimulation_MakeTemporalChanges -.->|write| nWarehouse_PackageTypes
    nDataLoadSimulation_MakeTemporalChanges -.->|write| nWarehouse_StockGroups
    nDataLoadSimulation_PaySuppliers -->|read| nApplication_People
    nDataLoadSimulation_PaySuppliers -->|read| nPurchasing_SupplierTransactions
    nDataLoadSimulation_PaySuppliers -->|write| nPurchasing_SupplierTransactions
    nDataLoadSimulation_PaySuppliers -->|read| nTransactionsToPay
    nDataLoadSimulation_PaySuppliers -->|write| nTransactionsToPay
    nDataLoadSimulation_PerformStocktake -.->|call| nDataLoadSimulation_GetRandomEmployeePerson
    nDataLoadSimulation_PerformStocktake -.->|call| nDataLoadSimulation_GetRandomStockItemToAdjust
    nDataLoadSimulation_PerformStocktake -.->|read| nWarehouse_StockItemHoldings
    nDataLoadSimulation_PerformStocktake -.->|write| nWarehouse_StockItemHoldings
    nDataLoadSimulation_PerformStocktake -.->|write| nWarehouse_StockItemTransactions
    nDataLoadSimulation_PickStockForCustomerOrders -.->|read| n_StockAlreadyAllocated
    nDataLoadSimulation_PickStockForCustomerOrders -.->|write| n_StockAlreadyAllocated
    nDataLoadSimulation_PickStockForCustomerOrders -.->|read| n_UninvoicedOrders
    nDataLoadSimulation_PickStockForCustomerOrders -.->|write| n_UninvoicedOrders
    nDataLoadSimulation_PickStockForCustomerOrders -.->|read| nApplication_People
    nDataLoadSimulation_PickStockForCustomerOrders -.->|call| nDataLoadSimulation_GetRandomEmployeePerson
    nDataLoadSimulation_PickStockForCustomerOrders -.->|read| nOrderLineList
    nDataLoadSimulation_PickStockForCustomerOrders -.->|write| nSET
    nDataLoadSimulation_PickStockForCustomerOrders -.->|read| nSales_Invoices
    nDataLoadSimulation_PickStockForCustomerOrders -.->|read| nSales_OrderLines
    nDataLoadSimulation_PickStockForCustomerOrders -.->|write| nSales_OrderLines
    nDataLoadSimulation_PickStockForCustomerOrders -.->|read| nSales_Orders
    nDataLoadSimulation_PickStockForCustomerOrders -.->|write| nSales_Orders
    nDataLoadSimulation_PickStockForCustomerOrders -.->|read| nStockAlreadyAllocated
    nDataLoadSimulation_PickStockForCustomerOrders -.->|read| nWarehouse_StockItemHoldings
    nDataLoadSimulation_PlaceSupplierOrders -->|read| nOrderLines
    nDataLoadSimulation_PlaceSupplierOrders -->|write| nOrderLines
    nDataLoadSimulation_PlaceSupplierOrders -->|read| nOrders
    nDataLoadSimulation_PlaceSupplierOrders -->|write| nOrders
    nDataLoadSimulation_PlaceSupplierOrders -->|read| nPurchasing_PurchaseOrderLines
    nDataLoadSimulation_PlaceSupplierOrders -->|write| nPurchasing_PurchaseOrderLines
    nDataLoadSimulation_PlaceSupplierOrders -->|write| nPurchasing_PurchaseOrders
    nDataLoadSimulation_PlaceSupplierOrders -->|read| nPurchasing_Suppliers
    nDataLoadSimulation_PlaceSupplierOrders -->|read| nSales_OrderLines
    nDataLoadSimulation_PlaceSupplierOrders -->|read| nStockItemsToCheck
    nDataLoadSimulation_PlaceSupplierOrders -->|read| nStockItemsToOrder
    nDataLoadSimulation_PlaceSupplierOrders -->|read| nWarehouse_StockItemHoldings
    nDataLoadSimulation_PlaceSupplierOrders -->|read| nWarehouse_StockItems
    nDataLoadSimulation_PopulateDataToCurrentDate ==>|call| nDataLoadSimulation_DailyProcessToCreateHistory
    nDataLoadSimulation_PopulateDataToCurrentDate -->|read| nSales_Orders
    nDataLoadSimulation_ProcessCustomerPayments -->|read| nSales_CustomerTransactions
    nDataLoadSimulation_ProcessCustomerPayments -->|write| nSales_CustomerTransactions
    nDataLoadSimulation_ProcessCustomerPayments -->|read| nTransactionsToReceive
    nDataLoadSimulation_ProcessCustomerPayments -->|write| nTransactionsToReceive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_Cities
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_Cities_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad ==>|call| nApplication_Configuration_ApplyRowLevelSecurity
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_Countries
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_Countries_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_DeliveryMethods
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_DeliveryMethods_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_PaymentMethods
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_PaymentMethods_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_People
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_People_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_StateProvinces
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_StateProvinces_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_TR_Application_Cities_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_TR_Application_Countries_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_TR_Application_DeliveryMethods_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_TR_Application_PaymentMethods_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_TR_Application_People_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_TR_Application_StateProvinces_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_TR_Application_TransactionTypes_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_TransactionTypes
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nApplication_TransactionTypes_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nPurchasing_SupplierCategories
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nPurchasing_SupplierCategories_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nPurchasing_Suppliers
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nPurchasing_Suppliers_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nPurchasing_TR_Purchasing_SupplierCategories_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nPurchasing_TR_Purchasing_Suppliers_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nSales_BuyingGroups
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nSales_BuyingGroups_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nSales_CustomerCategories
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nSales_CustomerCategories_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nSales_Customers
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nSales_Customers_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nSales_TR_Sales_BuyingGroups_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nSales_TR_Sales_CustomerCategories_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nSales_TR_Sales_Customers_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nWarehouse_ColdRoomTemperatures
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nWarehouse_ColdRoomTemperatures_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nWarehouse_Colors
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nWarehouse_Colors_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nWarehouse_PackageTypes
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nWarehouse_PackageTypes_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nWarehouse_StockGroups
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nWarehouse_StockGroups_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nWarehouse_StockItems
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nWarehouse_StockItems_Archive
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nWarehouse_TR_Warehouse_ColdRoomTemperatures_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nWarehouse_TR_Warehouse_Colors_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nWarehouse_TR_Warehouse_PackageTypes_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nWarehouse_TR_Warehouse_StockGroups_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nWarehouse_TR_Warehouse_StockItems_DataLoad_Modify
    nDataLoadSimulation_ReactivateTemporalTablesAfterDataLoad -->|read| nsys_procedures
    nDataLoadSimulation_ReceivePurchaseOrders -.->|read| nApplication_PaymentMethods
    nDataLoadSimulation_ReceivePurchaseOrders -.->|read| nApplication_People
    nDataLoadSimulation_ReceivePurchaseOrders -.->|read| nApplication_TransactionTypes
    nDataLoadSimulation_ReceivePurchaseOrders -.->|read| nPurchaseOrderList
    nDataLoadSimulation_ReceivePurchaseOrders -.->|read| nPurchasing_PurchaseOrderLines
    nDataLoadSimulation_ReceivePurchaseOrders -.->|write| nPurchasing_PurchaseOrderLines
    nDataLoadSimulation_ReceivePurchaseOrders -.->|read| nPurchasing_PurchaseOrders
    nDataLoadSimulation_ReceivePurchaseOrders -.->|write| nPurchasing_PurchaseOrders
    nDataLoadSimulation_ReceivePurchaseOrders -.->|write| nPurchasing_SupplierTransactions
    nDataLoadSimulation_ReceivePurchaseOrders -.->|read| nWarehouse_StockItemHoldings
    nDataLoadSimulation_ReceivePurchaseOrders -.->|write| nWarehouse_StockItemTransactions
    nDataLoadSimulation_ReceivePurchaseOrders -.->|read| nWarehouse_StockItems
    nDataLoadSimulation_ReceivePurchaseOrders -.->|read| npurchase
    nDataLoadSimulation_ReceivePurchaseOrders -.->|write| nsih
    nDataLoadSimulation_RecordColdRoomTemperatures -.->|call| nAS
    nDataLoadSimulation_RecordColdRoomTemperatures -.->|read| nDataLoadSimulation_ColdRoomTemperatures_temp
    nDataLoadSimulation_RecordColdRoomTemperatures -.->|write| nDataLoadSimulation_ColdRoomTemperatures_temp
    nDataLoadSimulation_RecordColdRoomTemperatures -.->|call| nDataLoadSimulation_PopulateColdRoomTemperatures_temp
    nDataLoadSimulation_RecordColdRoomTemperatures -.->|write| nWarehouse_ColdRoomTemperatures
    nDataLoadSimulation_RecordColdRoomTemperatures -.->|read| nearlier
    nDataLoadSimulation_RecordDeliveryVanTemperatures -.->|call| nAS
    nDataLoadSimulation_RecordDeliveryVanTemperatures -.->|write| nWarehouse_VehicleTemperatures
    nDataLoadSimulation_RecordInvoiceDeliveries -.->|call| nAS
    nDataLoadSimulation_RecordInvoiceDeliveries -.->|read| nApplication_Cities
    nDataLoadSimulation_RecordInvoiceDeliveries -.->|read| nApplication_People
    nDataLoadSimulation_RecordInvoiceDeliveries -.->|call| nDataLoadSimulation_GetRandomEmployeePerson
    nDataLoadSimulation_RecordInvoiceDeliveries -.->|read| nInvoiceList
    nDataLoadSimulation_RecordInvoiceDeliveries -.->|read| nSales_Customers
    nDataLoadSimulation_RecordInvoiceDeliveries -.->|read| nSales_Invoices
    nDataLoadSimulation_RecordInvoiceDeliveries -.->|write| nSales_Invoices
    nDataLoadSimulation_UpdateCustomFields -.->|read| n_OtherLanguages
    nDataLoadSimulation_UpdateCustomFields -.->|write| n_OtherLanguages
    nDataLoadSimulation_UpdateCustomFields -.->|call| nAS
    nDataLoadSimulation_UpdateCustomFields -.->|read| nApplication_People
    nDataLoadSimulation_UpdateCustomFields -.->|write| nApplication_People
    nDataLoadSimulation_UpdateCustomFields -.->|read| nApplication_StateProvinces
    nDataLoadSimulation_UpdateCustomFields -.->|read| nEmployeeList
    nDataLoadSimulation_UpdateCustomFields -.->|read| nWarehouse_StockGroups
    nDataLoadSimulation_UpdateCustomFields -.->|read| nWarehouse_StockItemStockGroups
    nDataLoadSimulation_UpdateCustomFields -.->|read| nWarehouse_StockItems
    nDataLoadSimulation_UpdateCustomFields -.->|write| nWarehouse_StockItems
    nDataLoadSimulation_UpdateCustomFields -.->|write| nsi
    nDataLoadSimulation_UpdateCustomFields -.->|read| nsys_syslanguages
    nIntegration_GetMovementUpdates -.->|call| nAS
    nIntegration_GetMovementUpdates -.->|read| nWarehouse_StockItemTransactions
    nIntegration_GetOrderUpdates -.->|call| nAS
    nIntegration_GetOrderUpdates -.->|read| nSales_Customers
    nIntegration_GetOrderUpdates -.->|read| nSales_OrderLines
    nIntegration_GetOrderUpdates -.->|read| nSales_Orders
    nIntegration_GetOrderUpdates -.->|read| nWarehouse_PackageTypes
    nIntegration_GetPurchaseUpdates -.->|call| nAS
    nIntegration_GetPurchaseUpdates -.->|read| nPurchasing_PurchaseOrderLines
    nIntegration_GetPurchaseUpdates -.->|read| nPurchasing_PurchaseOrders
    nIntegration_GetPurchaseUpdates -.->|read| nWarehouse_PackageTypes
    nIntegration_GetPurchaseUpdates -.->|read| nWarehouse_StockItems
    nIntegration_GetSaleUpdates -.->|call| nAS
    nIntegration_GetSaleUpdates -.->|read| nSales_Customers
    nIntegration_GetSaleUpdates -.->|read| nSales_InvoiceLines
    nIntegration_GetSaleUpdates -.->|read| nSales_Invoices
    nIntegration_GetSaleUpdates -.->|read| nWarehouse_PackageTypes
    nIntegration_GetSaleUpdates -.->|read| nWarehouse_StockItems
    nIntegration_GetStockHoldingUpdates -.->|call| nAS
    nIntegration_GetStockHoldingUpdates -.->|read| nWarehouse_StockItemHoldings
    nIntegration_GetTransactionUpdates -.->|call| nAS
    nIntegration_GetTransactionUpdates -.->|read| nPurchasing_SupplierTransactions
    nIntegration_GetTransactionUpdates -.->|read| nSales_CustomerTransactions
    nIntegration_GetTransactionUpdates -.->|read| nSales_Invoices
    nSequences_ReseedAllSequences ==>|call| nSequences_ReseedSequenceBeyondTableValues
    nSequences_ReseedSequenceBeyondTableValues -->|read| nsys_sequences
    nWarehouse_ColdRoomTemperatures -.->|write| nWarehouse_ColdRoomTemperatures
    nWarehouse_ColdRoomTemperatures -.->|read| nWarehouse_ColdRoomTemperatures_Backup
    nWarehouse_ColdRoomTemperatures -.->|call| ndbo_sp_rename
    nWarehouse_ColdRoomTemperatures -.->|read| nsys_tables
    nWarehouse_ColdRoomTemperatures_Staging -.->|read| nWarehouse_ColdRoomTemperatures
    nWarehouse_ColdRoomTemperatures_Staging -.->|write| nWarehouse_ColdRoomTemperatures_Staging
    nWarehouse_ColdRoomTemperatures_Staging -.->|call| ndbo_sp_rename
    nWarehouse_VehicleTemperatures -.->|write| nWarehouse_VehicleTemperatures
    nWarehouse_VehicleTemperatures -.->|read| nWarehouse_VehicleTemperatures_Backup
    nWarehouse_VehicleTemperatures_Staging -.->|read| nWarehouse_VehicleTemperatures
    nWarehouse_VehicleTemperatures_Staging -.->|write| nWarehouse_VehicleTemperatures_Staging
    nWarehouse_VehicleTemperatures_Staging -.->|call| ndbo_sp_rename
    nWebsite_ActivateWebsiteLogon -.->|call| nAS
    nWebsite_ActivateWebsiteLogon -.->|read| nApplication_People
    nWebsite_ActivateWebsiteLogon -.->|write| nApplication_People
    nWebsite_CalculateCustomerPrice -->|read| nSales_Customers
    nWebsite_CalculateCustomerPrice -->|read| nSales_SpecialDeals
    nWebsite_CalculateCustomerPrice -->|read| nWarehouse_StockItemStockGroups
    nWebsite_CalculateCustomerPrice -->|read| nWarehouse_StockItems
    nWebsite_ChangePassword -.->|call| nAS
    nWebsite_ChangePassword -.->|write| nApplication_People
    nWebsite_InsertCustomerOrders -.->|read| n_OrderLines
    nWebsite_InsertCustomerOrders -.->|read| n_Orders
    nWebsite_InsertCustomerOrders -.->|read| n_OrdersToGenerate
    nWebsite_InsertCustomerOrders -.->|write| n_OrdersToGenerate
    nWebsite_InsertCustomerOrders -.->|call| nAS
    nWebsite_InsertCustomerOrders -.->|write| nSales_OrderLines
    nWebsite_InsertCustomerOrders -.->|write| nSales_Orders
    nWebsite_InsertCustomerOrders -.->|read| nWarehouse_StockItems
    nWebsite_InsertCustomerOrders -.->|read| nthe
    nWebsite_InvoiceCustomerOrders -.->|read| n_InvoicesToGenerate
    nWebsite_InvoiceCustomerOrders -.->|write| n_InvoicesToGenerate
    nWebsite_InvoiceCustomerOrders -.->|read| n_OrdersToInvoice
    nWebsite_InvoiceCustomerOrders -.->|call| nAS
    nWebsite_InvoiceCustomerOrders -.->|read| nApplication_TransactionTypes
    nWebsite_InvoiceCustomerOrders -.->|write| nSales_CustomerTransactions
    nWebsite_InvoiceCustomerOrders -.->|read| nSales_Customers
    nWebsite_InvoiceCustomerOrders -.->|read| nSales_InvoiceLines
    nWebsite_InvoiceCustomerOrders -.->|write| nSales_InvoiceLines
    nWebsite_InvoiceCustomerOrders -.->|read| nSales_Invoices
    nWebsite_InvoiceCustomerOrders -.->|write| nSales_Invoices
    nWebsite_InvoiceCustomerOrders -.->|read| nSales_OrderLines
    nWebsite_InvoiceCustomerOrders -.->|read| nSales_Orders
    nWebsite_InvoiceCustomerOrders -.->|read| nStockItemTotals
    nWebsite_InvoiceCustomerOrders -.->|read| nWarehouse_StockItemHoldings
    nWebsite_InvoiceCustomerOrders -.->|write| nWarehouse_StockItemTransactions
    nWebsite_InvoiceCustomerOrders -.->|read| nWarehouse_StockItems
    nWebsite_InvoiceCustomerOrders -.->|write| nsih
    nWebsite_RecordColdRoomTemperatures -.->|read| n_SensorReadings
    nWebsite_RecordColdRoomTemperatures -.->|call| nAS
    nWebsite_RecordColdRoomTemperatures -.->|write| nWarehouse_ColdRoomTemperatures
    nWebsite_RecordVehicleTemperature -.->|call| nAS
    nWebsite_RecordVehicleTemperature -.->|read| nOPENJSON
    nWebsite_RecordVehicleTemperature -.->|write| nWarehouse_VehicleTemperatures
    nWebsite_SearchForCustomers -.->|call| nAS
    nWebsite_SearchForCustomers -.->|read| nApplication_Cities
    nWebsite_SearchForCustomers -->|read| nApplication_Cities
    nWebsite_SearchForCustomers -.->|read| nApplication_People
    nWebsite_SearchForCustomers -->|read| nApplication_People
    nWebsite_SearchForCustomers -.->|read| nFREETEXTTABLE
    nWebsite_SearchForCustomers -.->|read| nSales_Customers
    nWebsite_SearchForCustomers -->|read| nSales_Customers
    nWebsite_SearchForPeople -.->|read| nApplication_People
    nWebsite_SearchForPeople -->|read| nApplication_People
    nWebsite_SearchForPeople -.->|read| nFREETEXTTABLE
    nWebsite_SearchForPeople -.->|read| nPurchasing_Suppliers
    nWebsite_SearchForPeople -->|read| nPurchasing_Suppliers
    nWebsite_SearchForPeople -.->|read| nSales_Customers
    nWebsite_SearchForPeople -->|read| nSales_Customers
    nWebsite_SearchForStockItems -.->|call| nAS
    nWebsite_SearchForStockItems -.->|read| nFREETEXTTABLE
    nWebsite_SearchForStockItems -.->|read| nWarehouse_StockItems
    nWebsite_SearchForStockItems -->|read| nWarehouse_StockItems
    nWebsite_SearchForStockItemsByTags -.->|call| nAS
    nWebsite_SearchForStockItemsByTags -.->|read| nFREETEXTTABLE
    nWebsite_SearchForStockItemsByTags -.->|read| nWarehouse_StockItems
    nWebsite_SearchForStockItemsByTags -->|read| nWarehouse_StockItems
    nWebsite_SearchForSuppliers -.->|read| nApplication_Cities
    nWebsite_SearchForSuppliers -->|read| nApplication_Cities
    nWebsite_SearchForSuppliers -.->|read| nApplication_People
    nWebsite_SearchForSuppliers -->|read| nApplication_People
    nWebsite_SearchForSuppliers -.->|read| nFREETEXTTABLE
    nWebsite_SearchForSuppliers -.->|read| nPurchasing_Suppliers
    nWebsite_SearchForSuppliers -->|read| nPurchasing_Suppliers
```
