```mermaid
flowchart TD
    classDef pkg fill:#e0e7ff,stroke:#333,color:#000
    classDef cont fill:#f1f5f9,stroke:#333,color:#000
    classDef sql fill:#dbeafe,stroke:#333,color:#000
    classDef df fill:#fed7aa,stroke:#333,color:#000
    classDef expr fill:#fef9c3,stroke:#333,color:#000
    classDef script fill:#fecaca,stroke:#333,color:#000
    classDef conn fill:#ede9fe,stroke:#7c3aed,color:#000,stroke-dasharray:5 4
    classDef ext fill:#fff,stroke:#dc2626,color:#000,stroke-dasharray:5 4
    classDef task fill:#dcfce7,stroke:#333,color:#000
    classDef trap fill:#f4cccc,stroke:#c00,color:#000
    nCalculate_ETL_Cutoff_Time_backup["Calculate ETL Cutoff Time backup"]:::trap
    nDailyETLMain["DailyETLMain"]:::pkg
    nEnsure_Date_Dimension_includes_current_year["Ensure Date Dimension includes current year"]:::sql
    nIntegration_City_Staging["Integration.City_Staging"]:::trap
    nIntegration_Customer_Staging["Integration.Customer_Staging"]:::trap
    nIntegration_Employee_Staging["Integration.Employee_Staging"]:::trap
    nIntegration_GetCityUpdates["Integration.GetCityUpdates"]:::trap
    nIntegration_GetCustomerUpdates["Integration.GetCustomerUpdates"]:::trap
    nIntegration_GetEmployeeUpdates["Integration.GetEmployeeUpdates"]:::trap
    nIntegration_GetLastETLCutoffTime["Integration.GetLastETLCutoffTime"]:::trap
    nIntegration_GetLineageKey["Integration.GetLineageKey"]:::trap
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
    nIntegration_MigrateStagedCityData["Integration.MigrateStagedCityData"]:::trap
    nIntegration_MigrateStagedCustomerData["Integration.MigrateStagedCustomerData"]:::trap
    nIntegration_MigrateStagedEmployeeData["Integration.MigrateStagedEmployeeData"]:::trap
    nIntegration_MigrateStagedMovementData["Integration.MigrateStagedMovementData"]:::trap
    nIntegration_MigrateStagedOrderData["Integration.MigrateStagedOrderData"]:::trap
    nIntegration_MigrateStagedPaymentMethodData["Integration.MigrateStagedPaymentMethodData"]:::trap
    nIntegration_MigrateStagedPurchaseData["Integration.MigrateStagedPurchaseData"]:::trap
    nIntegration_MigrateStagedSaleData["Integration.MigrateStagedSaleData"]:::trap
    nIntegration_MigrateStagedStockHoldingData["Integration.MigrateStagedStockHoldingData"]:::trap
    nIntegration_MigrateStagedStockItemData["Integration.MigrateStagedStockItemData"]:::trap
    nIntegration_MigrateStagedSupplierData["Integration.MigrateStagedSupplierData"]:::trap
    nIntegration_MigrateStagedTransactionData["Integration.MigrateStagedTransactionData"]:::trap
    nIntegration_MigrateStagedTransactionTypeData["Integration.MigrateStagedTransactionTypeData"]:::trap
    nIntegration_Movement_Staging["Integration.Movement_Staging"]:::trap
    nIntegration_Order_Staging["Integration.Order_Staging"]:::trap
    nIntegration_PaymentMethod_Staging["Integration.PaymentMethod_Staging"]:::trap
    nIntegration_PopulateDateDimensionForYear["Integration.PopulateDateDimensionForYear"]:::trap
    nIntegration_Purchase_Staging["Integration.Purchase_Staging"]:::trap
    nIntegration_Sale_Staging["Integration.Sale_Staging"]:::trap
    nIntegration_StockHolding_Staging["Integration.StockHolding_Staging"]:::trap
    nIntegration_StockItem_Staging["Integration.StockItem_Staging"]:::trap
    nIntegration_Supplier_Staging["Integration.Supplier_Staging"]:::trap
    nIntegration_TransactionType_Staging["Integration.TransactionType_Staging"]:::trap
    nIntegration_Transaction_Staging["Integration.Transaction_Staging"]:::trap
    nLoad_City_Dimension["Load City Dimension"]:::cont
    nLoad_City_Dimension_Extract_Updated_City_Data_to_Staging["Load City Dimension.Extract Updated City Data to Staging"]:::df
    nLoad_City_Dimension_Get_Last_City_ETL_Cutoff_Time["Load City Dimension.Get Last City ETL Cutoff Time"]:::sql
    nLoad_City_Dimension_Get_Lineage_Key["Load City Dimension.Get Lineage Key"]:::sql
    nLoad_City_Dimension_Migrate_Staged_City_Data["Load City Dimension.Migrate Staged City Data"]:::sql
    nLoad_City_Dimension_Set_TableName_to_City["Load City Dimension.Set TableName to City"]:::trap
    nLoad_City_Dimension_Truncate_City_Staging["Load City Dimension.Truncate City_Staging"]:::sql
    nLoad_Customer_Dimension["Load Customer Dimension"]:::cont
    nLoad_Customer_Dimension_Extract_Updated_Customer_Data_to_Staging["Load Customer Dimension.Extract Updated Customer Data to Staging"]:::df
    nLoad_Customer_Dimension_Get_Last_Customer_ETL_Cutoff_Time["Load Customer Dimension.Get Last Customer ETL Cutoff Time"]:::sql
    nLoad_Customer_Dimension_Get_Lineage_Key["Load Customer Dimension.Get Lineage Key"]:::sql
    nLoad_Customer_Dimension_Migrate_Staged_Customer_Data["Load Customer Dimension.Migrate Staged Customer Data"]:::sql
    nLoad_Customer_Dimension_Set_TableName_to_Customer["Load Customer Dimension.Set TableName to Customer"]:::trap
    nLoad_Customer_Dimension_Truncate_Customer_Staging["Load Customer Dimension.Truncate Customer_Staging"]:::sql
    nLoad_Employee_Dimension["Load Employee Dimension"]:::cont
    nLoad_Employee_Dimension_Extract_Updated_Employee_Data_to_Staging["Load Employee Dimension.Extract Updated Employee Data to Staging"]:::df
    nLoad_Employee_Dimension_Get_Last_Employee_ETL_Cutoff_Time["Load Employee Dimension.Get Last Employee ETL Cutoff Time"]:::sql
    nLoad_Employee_Dimension_Get_Lineage_Key["Load Employee Dimension.Get Lineage Key"]:::sql
    nLoad_Employee_Dimension_Migrate_Staged_Employee_Data["Load Employee Dimension.Migrate Staged Employee Data"]:::sql
    nLoad_Employee_Dimension_Set_TableName_to_Employee["Load Employee Dimension.Set TableName to Employee"]:::trap
    nLoad_Employee_Dimension_Truncate_Employee_Staging["Load Employee Dimension.Truncate Employee_Staging"]:::sql
    nLoad_Movement_Fact["Load Movement Fact"]:::cont
    nLoad_Movement_Fact_Extract_Updated_Movement_Data_to_Staging["Load Movement Fact.Extract Updated Movement Data to Staging"]:::df
    nLoad_Movement_Fact_Get_Last_Movement_ETL_Cutoff_Time["Load Movement Fact.Get Last Movement ETL Cutoff Time"]:::sql
    nLoad_Movement_Fact_Get_Lineage_Key["Load Movement Fact.Get Lineage Key"]:::sql
    nLoad_Movement_Fact_Migrate_Staged_Movement_Data["Load Movement Fact.Migrate Staged Movement Data"]:::sql
    nLoad_Movement_Fact_Set_TableName_to_Movement["Load Movement Fact.Set TableName to Movement"]:::trap
    nLoad_Movement_Fact_Truncate_Movement_Staging["Load Movement Fact.Truncate Movement_Staging"]:::sql
    nLoad_Order_Fact["Load Order Fact"]:::cont
    nLoad_Order_Fact_Extract_Updated_Order_Data_to_Staging["Load Order Fact.Extract Updated Order Data to Staging"]:::df
    nLoad_Order_Fact_Get_Last_Movement_ETL_Cutoff_Time["Load Order Fact.Get Last Movement ETL Cutoff Time"]:::sql
    nLoad_Order_Fact_Get_Lineage_Key["Load Order Fact.Get Lineage Key"]:::sql
    nLoad_Order_Fact_Migrate_Staged_Order_Data["Load Order Fact.Migrate Staged Order Data"]:::sql
    nLoad_Order_Fact_Set_TableName_to_Order["Load Order Fact.Set TableName to Order"]:::trap
    nLoad_Order_Fact_Truncate_Order_Staging["Load Order Fact.Truncate Order_Staging"]:::sql
    nLoad_Payment_Method_Dimension["Load Payment Method Dimension"]:::cont
    nLoad_Payment_Method_Dimension_Extract_Updated_Payment_Method_Data_to_Staging["Load Payment Method Dimension.Extract Updated Payment Method Data to Staging"]:::df
    nLoad_Payment_Method_Dimension_Get_Last_Payment_Method_ETL_Cutoff_Time["Load Payment Method Dimension.Get Last Payment Method ETL Cutoff Time"]:::sql
    nLoad_Payment_Method_Dimension_Get_Lineage_Key["Load Payment Method Dimension.Get Lineage Key"]:::sql
    nLoad_Payment_Method_Dimension_Migrate_Staged_Payment_Method_Data["Load Payment Method Dimension.Migrate Staged Payment Method Data"]:::sql
    nLoad_Payment_Method_Dimension_Set_TableName_to_Payment_Method["Load Payment Method Dimension.Set TableName to Payment Method"]:::trap
    nLoad_Payment_Method_Dimension_Truncate_PaymentMethod_Staging["Load Payment Method Dimension.Truncate PaymentMethod_Staging"]:::sql
    nLoad_Purchase_Fact["Load Purchase Fact"]:::cont
    nLoad_Purchase_Fact_Extract_Updated_Purchase_Data_to_Staging["Load Purchase Fact.Extract Updated Purchase Data to Staging"]:::df
    nLoad_Purchase_Fact_Get_Last_Movement_ETL_Cutoff_Time["Load Purchase Fact.Get Last Movement ETL Cutoff Time"]:::sql
    nLoad_Purchase_Fact_Get_Lineage_Key["Load Purchase Fact.Get Lineage Key"]:::sql
    nLoad_Purchase_Fact_Migrate_Staged_Purchase_Data["Load Purchase Fact.Migrate Staged Purchase Data"]:::sql
    nLoad_Purchase_Fact_Set_TableName_to_Purchase["Load Purchase Fact.Set TableName to Purchase"]:::trap
    nLoad_Purchase_Fact_Truncate_Purchase_Staging["Load Purchase Fact.Truncate Purchase_Staging"]:::sql
    nLoad_Sale_Fact["Load Sale Fact"]:::cont
    nLoad_Sale_Fact_Extract_Updated_Sale_Data_to_Staging["Load Sale Fact.Extract Updated Sale Data to Staging"]:::df
    nLoad_Sale_Fact_Get_Last_Movement_ETL_Cutoff_Time["Load Sale Fact.Get Last Movement ETL Cutoff Time"]:::sql
    nLoad_Sale_Fact_Get_Lineage_Key["Load Sale Fact.Get Lineage Key"]:::sql
    nLoad_Sale_Fact_Migrate_Staged_Sale_Data["Load Sale Fact.Migrate Staged Sale Data"]:::sql
    nLoad_Sale_Fact_Set_TableName_to_Sale["Load Sale Fact.Set TableName to Sale"]:::trap
    nLoad_Sale_Fact_Truncate_Sale_Staging["Load Sale Fact.Truncate Sale_Staging"]:::sql
    nLoad_Stock_Holding_Fact["Load Stock Holding Fact"]:::cont
    nLoad_Stock_Holding_Fact_Extract_All_Stock_Holding_Data_to_Staging["Load Stock Holding Fact.Extract All Stock Holding Data to Staging"]:::df
    nLoad_Stock_Holding_Fact_Get_Last_Movement_ETL_Cutoff_Time["Load Stock Holding Fact.Get Last Movement ETL Cutoff Time"]:::sql
    nLoad_Stock_Holding_Fact_Get_Lineage_Key["Load Stock Holding Fact.Get Lineage Key"]:::sql
    nLoad_Stock_Holding_Fact_Migrate_Staged_Stock_Holding_Data["Load Stock Holding Fact.Migrate Staged Stock Holding Data"]:::sql
    nLoad_Stock_Holding_Fact_Set_TableName_to_Stock_Holding["Load Stock Holding Fact.Set TableName to Stock Holding"]:::trap
    nLoad_Stock_Holding_Fact_Truncate_StockHolding_Staging["Load Stock Holding Fact.Truncate StockHolding_Staging"]:::sql
    nLoad_Stock_Item_Dimension["Load Stock Item Dimension"]:::cont
    nLoad_Stock_Item_Dimension_Extract_Updated_Stock_Item_Data_to_Staging["Load Stock Item Dimension.Extract Updated Stock Item Data to Staging"]:::df
    nLoad_Stock_Item_Dimension_Get_Last_Stock_Item_ETL_Cutoff_Time["Load Stock Item Dimension.Get Last Stock Item ETL Cutoff Time"]:::sql
    nLoad_Stock_Item_Dimension_Get_Lineage_Key["Load Stock Item Dimension.Get Lineage Key"]:::sql
    nLoad_Stock_Item_Dimension_Migrate_Staged_Stock_Item_Data["Load Stock Item Dimension.Migrate Staged Stock Item Data"]:::sql
    nLoad_Stock_Item_Dimension_Set_TableName_to_Stock_Item["Load Stock Item Dimension.Set TableName to Stock Item"]:::trap
    nLoad_Stock_Item_Dimension_Truncate_StockItem_Staging["Load Stock Item Dimension.Truncate StockItem_Staging"]:::sql
    nLoad_Supplier_Dimension["Load Supplier Dimension"]:::cont
    nLoad_Supplier_Dimension_Extract_Updated_Supplier_Data_to_Staging["Load Supplier Dimension.Extract Updated Supplier Data to Staging"]:::df
    nLoad_Supplier_Dimension_Get_Last_Supplier_ETL_Cutoff_Time["Load Supplier Dimension.Get Last Supplier ETL Cutoff Time"]:::sql
    nLoad_Supplier_Dimension_Get_Lineage_Key["Load Supplier Dimension.Get Lineage Key"]:::sql
    nLoad_Supplier_Dimension_Migrate_Staged_Supplier_Data["Load Supplier Dimension.Migrate Staged Supplier Data"]:::sql
    nLoad_Supplier_Dimension_Set_TableName_to_Supplier["Load Supplier Dimension.Set TableName to Supplier"]:::trap
    nLoad_Supplier_Dimension_Truncate_Supplier_Staging["Load Supplier Dimension.Truncate Supplier_Staging"]:::sql
    nLoad_Transaction_Fact["Load Transaction Fact"]:::cont
    nLoad_Transaction_Fact_Extract_Updated_Transaction_Data_to_Staging["Load Transaction Fact.Extract Updated Transaction Data to Staging"]:::df
    nLoad_Transaction_Fact_Get_Last_Movement_ETL_Cutoff_Time["Load Transaction Fact.Get Last Movement ETL Cutoff Time"]:::sql
    nLoad_Transaction_Fact_Get_Lineage_Key["Load Transaction Fact.Get Lineage Key"]:::sql
    nLoad_Transaction_Fact_Migrate_Staged_Transaction_Data["Load Transaction Fact.Migrate Staged Transaction Data"]:::sql
    nLoad_Transaction_Fact_Set_TableName_to_Transaction["Load Transaction Fact.Set TableName to Transaction"]:::trap
    nLoad_Transaction_Fact_Truncate_Transaction_Staging["Load Transaction Fact.Truncate Transaction_Staging"]:::sql
    nLoad_Transaction_Type_Dimension["Load Transaction Type Dimension"]:::cont
    nLoad_Transaction_Type_Dimension_Extract_Updated_Transaction_Type_Data_to_Staging["Load Transaction Type Dimension.Extract Updated Transaction Type Data to Staging"]:::df
    nLoad_Transaction_Type_Dimension_Get_Last_Transaction_Type_ETL_Cutoff_Time["Load Transaction Type Dimension.Get Last Transaction Type ETL Cutoff Time"]:::sql
    nLoad_Transaction_Type_Dimension_Get_Lineage_Key["Load Transaction Type Dimension.Get Lineage Key"]:::sql
    nLoad_Transaction_Type_Dimension_Migrate_Staged_Transaction_Type_Data["Load Transaction Type Dimension.Migrate Staged Transaction Type Data"]:::sql
    nLoad_Transaction_Type_Dimension_Set_TableName_to_Transaction_Type["Load Transaction Type Dimension.Set TableName to Transaction Type"]:::trap
    nLoad_Transaction_Type_Dimension_Truncate_TransactionType_Staging["Load Transaction Type Dimension.Truncate TransactionType_Staging"]:::sql
    nTrim_Any_Milliseconds["Trim Any Milliseconds"]:::trap
    nconn_WWI_DW_Destination_DB["conn:WWI_DW_Destination_DB"]:::trap
    nconn_WWI_Source_DB["conn:WWI_Source_DB"]:::trap
    nCalculate_ETL_Cutoff_Time_backup -->|precedence| nTrim_Any_Milliseconds
    nEnsure_Date_Dimension_includes_current_year -.->|call| nIntegration_PopulateDateDimensionForYear
    nEnsure_Date_Dimension_includes_current_year -->|precedence| nLoad_City_Dimension
    nEnsure_Date_Dimension_includes_current_year -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_City_Dimension -.->|contains| nLoad_City_Dimension_Extract_Updated_City_Data_to_Staging
    nLoad_City_Dimension -.->|contains| nLoad_City_Dimension_Get_Last_City_ETL_Cutoff_Time
    nLoad_City_Dimension -.->|contains| nLoad_City_Dimension_Get_Lineage_Key
    nLoad_City_Dimension -.->|contains| nLoad_City_Dimension_Migrate_Staged_City_Data
    nLoad_City_Dimension -.->|contains| nLoad_City_Dimension_Set_TableName_to_City
    nLoad_City_Dimension -.->|contains| nLoad_City_Dimension_Truncate_City_Staging
    nLoad_City_Dimension -->|precedence| nLoad_Customer_Dimension
    nLoad_City_Dimension_Extract_Updated_City_Data_to_Staging -.->|write| nIntegration_City_Staging
    nLoad_City_Dimension_Extract_Updated_City_Data_to_Staging -.->|call| nIntegration_GetCityUpdates
    nLoad_City_Dimension_Extract_Updated_City_Data_to_Staging -->|precedence| nLoad_City_Dimension_Migrate_Staged_City_Data
    nLoad_City_Dimension_Extract_Updated_City_Data_to_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_City_Dimension_Extract_Updated_City_Data_to_Staging -.->|connection| nconn_WWI_Source_DB
    nLoad_City_Dimension_Get_Last_City_ETL_Cutoff_Time -.->|call| nIntegration_GetLastETLCutoffTime
    nLoad_City_Dimension_Get_Last_City_ETL_Cutoff_Time -->|precedence| nLoad_City_Dimension_Extract_Updated_City_Data_to_Staging
    nLoad_City_Dimension_Get_Last_City_ETL_Cutoff_Time -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_City_Dimension_Get_Lineage_Key -.->|call| nIntegration_GetLineageKey
    nLoad_City_Dimension_Get_Lineage_Key -->|precedence| nLoad_City_Dimension_Truncate_City_Staging
    nLoad_City_Dimension_Get_Lineage_Key -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_City_Dimension_Migrate_Staged_City_Data -.->|call| nIntegration_MigrateStagedCityData
    nLoad_City_Dimension_Migrate_Staged_City_Data -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_City_Dimension_Set_TableName_to_City -->|precedence| nLoad_City_Dimension_Get_Lineage_Key
    nLoad_City_Dimension_Truncate_City_Staging -.->|read| nIntegration_City_Staging
    nLoad_City_Dimension_Truncate_City_Staging -.->|write| nIntegration_City_Staging
    nLoad_City_Dimension_Truncate_City_Staging -->|precedence| nLoad_City_Dimension_Get_Last_City_ETL_Cutoff_Time
    nLoad_City_Dimension_Truncate_City_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Customer_Dimension -.->|contains| nLoad_Customer_Dimension_Extract_Updated_Customer_Data_to_Staging
    nLoad_Customer_Dimension -.->|contains| nLoad_Customer_Dimension_Get_Last_Customer_ETL_Cutoff_Time
    nLoad_Customer_Dimension -.->|contains| nLoad_Customer_Dimension_Get_Lineage_Key
    nLoad_Customer_Dimension -.->|contains| nLoad_Customer_Dimension_Migrate_Staged_Customer_Data
    nLoad_Customer_Dimension -.->|contains| nLoad_Customer_Dimension_Set_TableName_to_Customer
    nLoad_Customer_Dimension -.->|contains| nLoad_Customer_Dimension_Truncate_Customer_Staging
    nLoad_Customer_Dimension -->|precedence| nLoad_Employee_Dimension
    nLoad_Customer_Dimension_Extract_Updated_Customer_Data_to_Staging -.->|write| nIntegration_Customer_Staging
    nLoad_Customer_Dimension_Extract_Updated_Customer_Data_to_Staging -.->|call| nIntegration_GetCustomerUpdates
    nLoad_Customer_Dimension_Extract_Updated_Customer_Data_to_Staging -->|precedence| nLoad_Customer_Dimension_Migrate_Staged_Customer_Data
    nLoad_Customer_Dimension_Extract_Updated_Customer_Data_to_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Customer_Dimension_Extract_Updated_Customer_Data_to_Staging -.->|connection| nconn_WWI_Source_DB
    nLoad_Customer_Dimension_Get_Last_Customer_ETL_Cutoff_Time -.->|call| nIntegration_GetLastETLCutoffTime
    nLoad_Customer_Dimension_Get_Last_Customer_ETL_Cutoff_Time -->|precedence| nLoad_Customer_Dimension_Extract_Updated_Customer_Data_to_Staging
    nLoad_Customer_Dimension_Get_Last_Customer_ETL_Cutoff_Time -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Customer_Dimension_Get_Lineage_Key -.->|call| nIntegration_GetLineageKey
    nLoad_Customer_Dimension_Get_Lineage_Key -->|precedence| nLoad_Customer_Dimension_Truncate_Customer_Staging
    nLoad_Customer_Dimension_Get_Lineage_Key -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Customer_Dimension_Migrate_Staged_Customer_Data -.->|call| nIntegration_MigrateStagedCustomerData
    nLoad_Customer_Dimension_Migrate_Staged_Customer_Data -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Customer_Dimension_Set_TableName_to_Customer -->|precedence| nLoad_Customer_Dimension_Get_Lineage_Key
    nLoad_Customer_Dimension_Truncate_Customer_Staging -.->|read| nIntegration_Customer_Staging
    nLoad_Customer_Dimension_Truncate_Customer_Staging -.->|write| nIntegration_Customer_Staging
    nLoad_Customer_Dimension_Truncate_Customer_Staging -->|precedence| nLoad_Customer_Dimension_Get_Last_Customer_ETL_Cutoff_Time
    nLoad_Customer_Dimension_Truncate_Customer_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Employee_Dimension -.->|contains| nLoad_Employee_Dimension_Extract_Updated_Employee_Data_to_Staging
    nLoad_Employee_Dimension -.->|contains| nLoad_Employee_Dimension_Get_Last_Employee_ETL_Cutoff_Time
    nLoad_Employee_Dimension -.->|contains| nLoad_Employee_Dimension_Get_Lineage_Key
    nLoad_Employee_Dimension -.->|contains| nLoad_Employee_Dimension_Migrate_Staged_Employee_Data
    nLoad_Employee_Dimension -.->|contains| nLoad_Employee_Dimension_Set_TableName_to_Employee
    nLoad_Employee_Dimension -.->|contains| nLoad_Employee_Dimension_Truncate_Employee_Staging
    nLoad_Employee_Dimension -->|precedence| nLoad_Payment_Method_Dimension
    nLoad_Employee_Dimension_Extract_Updated_Employee_Data_to_Staging -.->|write| nIntegration_Employee_Staging
    nLoad_Employee_Dimension_Extract_Updated_Employee_Data_to_Staging -.->|call| nIntegration_GetEmployeeUpdates
    nLoad_Employee_Dimension_Extract_Updated_Employee_Data_to_Staging -->|precedence| nLoad_Employee_Dimension_Migrate_Staged_Employee_Data
    nLoad_Employee_Dimension_Extract_Updated_Employee_Data_to_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Employee_Dimension_Extract_Updated_Employee_Data_to_Staging -.->|connection| nconn_WWI_Source_DB
    nLoad_Employee_Dimension_Get_Last_Employee_ETL_Cutoff_Time -.->|call| nIntegration_GetLastETLCutoffTime
    nLoad_Employee_Dimension_Get_Last_Employee_ETL_Cutoff_Time -->|precedence| nLoad_Employee_Dimension_Extract_Updated_Employee_Data_to_Staging
    nLoad_Employee_Dimension_Get_Last_Employee_ETL_Cutoff_Time -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Employee_Dimension_Get_Lineage_Key -.->|call| nIntegration_GetLineageKey
    nLoad_Employee_Dimension_Get_Lineage_Key -->|precedence| nLoad_Employee_Dimension_Truncate_Employee_Staging
    nLoad_Employee_Dimension_Get_Lineage_Key -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Employee_Dimension_Migrate_Staged_Employee_Data -.->|call| nIntegration_MigrateStagedEmployeeData
    nLoad_Employee_Dimension_Migrate_Staged_Employee_Data -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Employee_Dimension_Set_TableName_to_Employee -->|precedence| nLoad_Employee_Dimension_Get_Lineage_Key
    nLoad_Employee_Dimension_Truncate_Employee_Staging -.->|read| nIntegration_Employee_Staging
    nLoad_Employee_Dimension_Truncate_Employee_Staging -.->|write| nIntegration_Employee_Staging
    nLoad_Employee_Dimension_Truncate_Employee_Staging -->|precedence| nLoad_Employee_Dimension_Get_Last_Employee_ETL_Cutoff_Time
    nLoad_Employee_Dimension_Truncate_Employee_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Movement_Fact -.->|contains| nLoad_Movement_Fact_Extract_Updated_Movement_Data_to_Staging
    nLoad_Movement_Fact -.->|contains| nLoad_Movement_Fact_Get_Last_Movement_ETL_Cutoff_Time
    nLoad_Movement_Fact -.->|contains| nLoad_Movement_Fact_Get_Lineage_Key
    nLoad_Movement_Fact -.->|contains| nLoad_Movement_Fact_Migrate_Staged_Movement_Data
    nLoad_Movement_Fact -.->|contains| nLoad_Movement_Fact_Set_TableName_to_Movement
    nLoad_Movement_Fact -.->|contains| nLoad_Movement_Fact_Truncate_Movement_Staging
    nLoad_Movement_Fact -->|precedence| nLoad_Order_Fact
    nLoad_Movement_Fact_Extract_Updated_Movement_Data_to_Staging -.->|call| nIntegration_GetMovementUpdates
    nLoad_Movement_Fact_Extract_Updated_Movement_Data_to_Staging -.->|write| nIntegration_Movement_Staging
    nLoad_Movement_Fact_Extract_Updated_Movement_Data_to_Staging -->|precedence| nLoad_Movement_Fact_Migrate_Staged_Movement_Data
    nLoad_Movement_Fact_Extract_Updated_Movement_Data_to_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Movement_Fact_Extract_Updated_Movement_Data_to_Staging -.->|connection| nconn_WWI_Source_DB
    nLoad_Movement_Fact_Get_Last_Movement_ETL_Cutoff_Time -.->|call| nIntegration_GetLastETLCutoffTime
    nLoad_Movement_Fact_Get_Last_Movement_ETL_Cutoff_Time -->|precedence| nLoad_Movement_Fact_Extract_Updated_Movement_Data_to_Staging
    nLoad_Movement_Fact_Get_Last_Movement_ETL_Cutoff_Time -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Movement_Fact_Get_Lineage_Key -.->|call| nIntegration_GetLineageKey
    nLoad_Movement_Fact_Get_Lineage_Key -->|precedence| nLoad_Movement_Fact_Truncate_Movement_Staging
    nLoad_Movement_Fact_Get_Lineage_Key -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Movement_Fact_Migrate_Staged_Movement_Data -.->|call| nIntegration_MigrateStagedMovementData
    nLoad_Movement_Fact_Migrate_Staged_Movement_Data -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Movement_Fact_Set_TableName_to_Movement -->|precedence| nLoad_Movement_Fact_Get_Lineage_Key
    nLoad_Movement_Fact_Truncate_Movement_Staging -.->|read| nIntegration_Movement_Staging
    nLoad_Movement_Fact_Truncate_Movement_Staging -.->|write| nIntegration_Movement_Staging
    nLoad_Movement_Fact_Truncate_Movement_Staging -->|precedence| nLoad_Movement_Fact_Get_Last_Movement_ETL_Cutoff_Time
    nLoad_Movement_Fact_Truncate_Movement_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Order_Fact -.->|contains| nLoad_Order_Fact_Extract_Updated_Order_Data_to_Staging
    nLoad_Order_Fact -.->|contains| nLoad_Order_Fact_Get_Last_Movement_ETL_Cutoff_Time
    nLoad_Order_Fact -.->|contains| nLoad_Order_Fact_Get_Lineage_Key
    nLoad_Order_Fact -.->|contains| nLoad_Order_Fact_Migrate_Staged_Order_Data
    nLoad_Order_Fact -.->|contains| nLoad_Order_Fact_Set_TableName_to_Order
    nLoad_Order_Fact -.->|contains| nLoad_Order_Fact_Truncate_Order_Staging
    nLoad_Order_Fact -->|precedence| nLoad_Purchase_Fact
    nLoad_Order_Fact_Extract_Updated_Order_Data_to_Staging -.->|call| nIntegration_GetOrderUpdates
    nLoad_Order_Fact_Extract_Updated_Order_Data_to_Staging -.->|write| nIntegration_Order_Staging
    nLoad_Order_Fact_Extract_Updated_Order_Data_to_Staging -->|precedence| nLoad_Order_Fact_Migrate_Staged_Order_Data
    nLoad_Order_Fact_Extract_Updated_Order_Data_to_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Order_Fact_Extract_Updated_Order_Data_to_Staging -.->|connection| nconn_WWI_Source_DB
    nLoad_Order_Fact_Get_Last_Movement_ETL_Cutoff_Time -.->|call| nIntegration_GetLastETLCutoffTime
    nLoad_Order_Fact_Get_Last_Movement_ETL_Cutoff_Time -->|precedence| nLoad_Order_Fact_Extract_Updated_Order_Data_to_Staging
    nLoad_Order_Fact_Get_Last_Movement_ETL_Cutoff_Time -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Order_Fact_Get_Lineage_Key -.->|call| nIntegration_GetLineageKey
    nLoad_Order_Fact_Get_Lineage_Key -->|precedence| nLoad_Order_Fact_Truncate_Order_Staging
    nLoad_Order_Fact_Get_Lineage_Key -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Order_Fact_Migrate_Staged_Order_Data -.->|call| nIntegration_MigrateStagedOrderData
    nLoad_Order_Fact_Migrate_Staged_Order_Data -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Order_Fact_Set_TableName_to_Order -->|precedence| nLoad_Order_Fact_Get_Lineage_Key
    nLoad_Order_Fact_Truncate_Order_Staging -.->|read| nIntegration_Order_Staging
    nLoad_Order_Fact_Truncate_Order_Staging -.->|write| nIntegration_Order_Staging
    nLoad_Order_Fact_Truncate_Order_Staging -->|precedence| nLoad_Order_Fact_Get_Last_Movement_ETL_Cutoff_Time
    nLoad_Order_Fact_Truncate_Order_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Payment_Method_Dimension -.->|contains| nLoad_Payment_Method_Dimension_Extract_Updated_Payment_Method_Data_to_Staging
    nLoad_Payment_Method_Dimension -.->|contains| nLoad_Payment_Method_Dimension_Get_Last_Payment_Method_ETL_Cutoff_Time
    nLoad_Payment_Method_Dimension -.->|contains| nLoad_Payment_Method_Dimension_Get_Lineage_Key
    nLoad_Payment_Method_Dimension -.->|contains| nLoad_Payment_Method_Dimension_Migrate_Staged_Payment_Method_Data
    nLoad_Payment_Method_Dimension -.->|contains| nLoad_Payment_Method_Dimension_Set_TableName_to_Payment_Method
    nLoad_Payment_Method_Dimension -.->|contains| nLoad_Payment_Method_Dimension_Truncate_PaymentMethod_Staging
    nLoad_Payment_Method_Dimension -->|precedence| nLoad_Stock_Item_Dimension
    nLoad_Payment_Method_Dimension_Extract_Updated_Payment_Method_Data_to_Staging -.->|call| nIntegration_GetPaymentMethodUpdates
    nLoad_Payment_Method_Dimension_Extract_Updated_Payment_Method_Data_to_Staging -.->|write| nIntegration_PaymentMethod_Staging
    nLoad_Payment_Method_Dimension_Extract_Updated_Payment_Method_Data_to_Staging -->|precedence| nLoad_Payment_Method_Dimension_Migrate_Staged_Payment_Method_Data
    nLoad_Payment_Method_Dimension_Extract_Updated_Payment_Method_Data_to_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Payment_Method_Dimension_Extract_Updated_Payment_Method_Data_to_Staging -.->|connection| nconn_WWI_Source_DB
    nLoad_Payment_Method_Dimension_Get_Last_Payment_Method_ETL_Cutoff_Time -.->|call| nIntegration_GetLastETLCutoffTime
    nLoad_Payment_Method_Dimension_Get_Last_Payment_Method_ETL_Cutoff_Time -->|precedence| nLoad_Payment_Method_Dimension_Extract_Updated_Payment_Method_Data_to_Staging
    nLoad_Payment_Method_Dimension_Get_Last_Payment_Method_ETL_Cutoff_Time -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Payment_Method_Dimension_Get_Lineage_Key -.->|call| nIntegration_GetLineageKey
    nLoad_Payment_Method_Dimension_Get_Lineage_Key -->|precedence| nLoad_Payment_Method_Dimension_Truncate_PaymentMethod_Staging
    nLoad_Payment_Method_Dimension_Get_Lineage_Key -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Payment_Method_Dimension_Migrate_Staged_Payment_Method_Data -.->|call| nIntegration_MigrateStagedPaymentMethodData
    nLoad_Payment_Method_Dimension_Migrate_Staged_Payment_Method_Data -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Payment_Method_Dimension_Set_TableName_to_Payment_Method -->|precedence| nLoad_Payment_Method_Dimension_Get_Lineage_Key
    nLoad_Payment_Method_Dimension_Truncate_PaymentMethod_Staging -.->|read| nIntegration_PaymentMethod_Staging
    nLoad_Payment_Method_Dimension_Truncate_PaymentMethod_Staging -.->|write| nIntegration_PaymentMethod_Staging
    nLoad_Payment_Method_Dimension_Truncate_PaymentMethod_Staging -->|precedence| nLoad_Payment_Method_Dimension_Get_Last_Payment_Method_ETL_Cutoff_Time
    nLoad_Payment_Method_Dimension_Truncate_PaymentMethod_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Purchase_Fact -.->|contains| nLoad_Purchase_Fact_Extract_Updated_Purchase_Data_to_Staging
    nLoad_Purchase_Fact -.->|contains| nLoad_Purchase_Fact_Get_Last_Movement_ETL_Cutoff_Time
    nLoad_Purchase_Fact -.->|contains| nLoad_Purchase_Fact_Get_Lineage_Key
    nLoad_Purchase_Fact -.->|contains| nLoad_Purchase_Fact_Migrate_Staged_Purchase_Data
    nLoad_Purchase_Fact -.->|contains| nLoad_Purchase_Fact_Set_TableName_to_Purchase
    nLoad_Purchase_Fact -.->|contains| nLoad_Purchase_Fact_Truncate_Purchase_Staging
    nLoad_Purchase_Fact -->|precedence| nLoad_Sale_Fact
    nLoad_Purchase_Fact_Extract_Updated_Purchase_Data_to_Staging -.->|call| nIntegration_GetPurchaseUpdates
    nLoad_Purchase_Fact_Extract_Updated_Purchase_Data_to_Staging -.->|write| nIntegration_Purchase_Staging
    nLoad_Purchase_Fact_Extract_Updated_Purchase_Data_to_Staging -->|precedence| nLoad_Purchase_Fact_Migrate_Staged_Purchase_Data
    nLoad_Purchase_Fact_Extract_Updated_Purchase_Data_to_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Purchase_Fact_Extract_Updated_Purchase_Data_to_Staging -.->|connection| nconn_WWI_Source_DB
    nLoad_Purchase_Fact_Get_Last_Movement_ETL_Cutoff_Time -.->|call| nIntegration_GetLastETLCutoffTime
    nLoad_Purchase_Fact_Get_Last_Movement_ETL_Cutoff_Time -->|precedence| nLoad_Purchase_Fact_Extract_Updated_Purchase_Data_to_Staging
    nLoad_Purchase_Fact_Get_Last_Movement_ETL_Cutoff_Time -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Purchase_Fact_Get_Lineage_Key -.->|call| nIntegration_GetLineageKey
    nLoad_Purchase_Fact_Get_Lineage_Key -->|precedence| nLoad_Purchase_Fact_Truncate_Purchase_Staging
    nLoad_Purchase_Fact_Get_Lineage_Key -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Purchase_Fact_Migrate_Staged_Purchase_Data -.->|call| nIntegration_MigrateStagedPurchaseData
    nLoad_Purchase_Fact_Migrate_Staged_Purchase_Data -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Purchase_Fact_Set_TableName_to_Purchase -->|precedence| nLoad_Purchase_Fact_Get_Lineage_Key
    nLoad_Purchase_Fact_Truncate_Purchase_Staging -.->|read| nIntegration_Order_Staging
    nLoad_Purchase_Fact_Truncate_Purchase_Staging -.->|write| nIntegration_Order_Staging
    nLoad_Purchase_Fact_Truncate_Purchase_Staging -->|precedence| nLoad_Purchase_Fact_Get_Last_Movement_ETL_Cutoff_Time
    nLoad_Purchase_Fact_Truncate_Purchase_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Sale_Fact -.->|contains| nLoad_Sale_Fact_Extract_Updated_Sale_Data_to_Staging
    nLoad_Sale_Fact -.->|contains| nLoad_Sale_Fact_Get_Last_Movement_ETL_Cutoff_Time
    nLoad_Sale_Fact -.->|contains| nLoad_Sale_Fact_Get_Lineage_Key
    nLoad_Sale_Fact -.->|contains| nLoad_Sale_Fact_Migrate_Staged_Sale_Data
    nLoad_Sale_Fact -.->|contains| nLoad_Sale_Fact_Set_TableName_to_Sale
    nLoad_Sale_Fact -.->|contains| nLoad_Sale_Fact_Truncate_Sale_Staging
    nLoad_Sale_Fact -->|precedence| nLoad_Stock_Holding_Fact
    nLoad_Sale_Fact_Extract_Updated_Sale_Data_to_Staging -.->|call| nIntegration_GetSaleUpdates
    nLoad_Sale_Fact_Extract_Updated_Sale_Data_to_Staging -.->|write| nIntegration_Sale_Staging
    nLoad_Sale_Fact_Extract_Updated_Sale_Data_to_Staging -->|precedence| nLoad_Sale_Fact_Migrate_Staged_Sale_Data
    nLoad_Sale_Fact_Extract_Updated_Sale_Data_to_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Sale_Fact_Extract_Updated_Sale_Data_to_Staging -.->|connection| nconn_WWI_Source_DB
    nLoad_Sale_Fact_Get_Last_Movement_ETL_Cutoff_Time -.->|call| nIntegration_GetLastETLCutoffTime
    nLoad_Sale_Fact_Get_Last_Movement_ETL_Cutoff_Time -->|precedence| nLoad_Sale_Fact_Extract_Updated_Sale_Data_to_Staging
    nLoad_Sale_Fact_Get_Last_Movement_ETL_Cutoff_Time -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Sale_Fact_Get_Lineage_Key -.->|call| nIntegration_GetLineageKey
    nLoad_Sale_Fact_Get_Lineage_Key -->|precedence| nLoad_Sale_Fact_Truncate_Sale_Staging
    nLoad_Sale_Fact_Get_Lineage_Key -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Sale_Fact_Migrate_Staged_Sale_Data -.->|call| nIntegration_MigrateStagedSaleData
    nLoad_Sale_Fact_Migrate_Staged_Sale_Data -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Sale_Fact_Set_TableName_to_Sale -->|precedence| nLoad_Sale_Fact_Get_Lineage_Key
    nLoad_Sale_Fact_Truncate_Sale_Staging -.->|read| nIntegration_Sale_Staging
    nLoad_Sale_Fact_Truncate_Sale_Staging -.->|write| nIntegration_Sale_Staging
    nLoad_Sale_Fact_Truncate_Sale_Staging -->|precedence| nLoad_Sale_Fact_Get_Last_Movement_ETL_Cutoff_Time
    nLoad_Sale_Fact_Truncate_Sale_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Stock_Holding_Fact -.->|contains| nLoad_Stock_Holding_Fact_Extract_All_Stock_Holding_Data_to_Staging
    nLoad_Stock_Holding_Fact -.->|contains| nLoad_Stock_Holding_Fact_Get_Last_Movement_ETL_Cutoff_Time
    nLoad_Stock_Holding_Fact -.->|contains| nLoad_Stock_Holding_Fact_Get_Lineage_Key
    nLoad_Stock_Holding_Fact -.->|contains| nLoad_Stock_Holding_Fact_Migrate_Staged_Stock_Holding_Data
    nLoad_Stock_Holding_Fact -.->|contains| nLoad_Stock_Holding_Fact_Set_TableName_to_Stock_Holding
    nLoad_Stock_Holding_Fact -.->|contains| nLoad_Stock_Holding_Fact_Truncate_StockHolding_Staging
    nLoad_Stock_Holding_Fact -->|precedence| nLoad_Transaction_Fact
    nLoad_Stock_Holding_Fact_Extract_All_Stock_Holding_Data_to_Staging -.->|call| nIntegration_GetStockHoldingUpdates
    nLoad_Stock_Holding_Fact_Extract_All_Stock_Holding_Data_to_Staging -.->|write| nIntegration_StockHolding_Staging
    nLoad_Stock_Holding_Fact_Extract_All_Stock_Holding_Data_to_Staging -->|precedence| nLoad_Stock_Holding_Fact_Migrate_Staged_Stock_Holding_Data
    nLoad_Stock_Holding_Fact_Extract_All_Stock_Holding_Data_to_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Stock_Holding_Fact_Extract_All_Stock_Holding_Data_to_Staging -.->|connection| nconn_WWI_Source_DB
    nLoad_Stock_Holding_Fact_Get_Last_Movement_ETL_Cutoff_Time -.->|call| nIntegration_GetLastETLCutoffTime
    nLoad_Stock_Holding_Fact_Get_Last_Movement_ETL_Cutoff_Time -->|precedence| nLoad_Stock_Holding_Fact_Extract_All_Stock_Holding_Data_to_Staging
    nLoad_Stock_Holding_Fact_Get_Last_Movement_ETL_Cutoff_Time -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Stock_Holding_Fact_Get_Lineage_Key -.->|call| nIntegration_GetLineageKey
    nLoad_Stock_Holding_Fact_Get_Lineage_Key -->|precedence| nLoad_Stock_Holding_Fact_Truncate_StockHolding_Staging
    nLoad_Stock_Holding_Fact_Get_Lineage_Key -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Stock_Holding_Fact_Migrate_Staged_Stock_Holding_Data -.->|call| nIntegration_MigrateStagedStockHoldingData
    nLoad_Stock_Holding_Fact_Migrate_Staged_Stock_Holding_Data -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Stock_Holding_Fact_Set_TableName_to_Stock_Holding -->|precedence| nLoad_Stock_Holding_Fact_Get_Lineage_Key
    nLoad_Stock_Holding_Fact_Truncate_StockHolding_Staging -.->|read| nIntegration_StockHolding_Staging
    nLoad_Stock_Holding_Fact_Truncate_StockHolding_Staging -.->|write| nIntegration_StockHolding_Staging
    nLoad_Stock_Holding_Fact_Truncate_StockHolding_Staging -->|precedence| nLoad_Stock_Holding_Fact_Get_Last_Movement_ETL_Cutoff_Time
    nLoad_Stock_Holding_Fact_Truncate_StockHolding_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Stock_Item_Dimension -.->|contains| nLoad_Stock_Item_Dimension_Extract_Updated_Stock_Item_Data_to_Staging
    nLoad_Stock_Item_Dimension -.->|contains| nLoad_Stock_Item_Dimension_Get_Last_Stock_Item_ETL_Cutoff_Time
    nLoad_Stock_Item_Dimension -.->|contains| nLoad_Stock_Item_Dimension_Get_Lineage_Key
    nLoad_Stock_Item_Dimension -.->|contains| nLoad_Stock_Item_Dimension_Migrate_Staged_Stock_Item_Data
    nLoad_Stock_Item_Dimension -.->|contains| nLoad_Stock_Item_Dimension_Set_TableName_to_Stock_Item
    nLoad_Stock_Item_Dimension -.->|contains| nLoad_Stock_Item_Dimension_Truncate_StockItem_Staging
    nLoad_Stock_Item_Dimension -->|precedence| nLoad_Supplier_Dimension
    nLoad_Stock_Item_Dimension_Extract_Updated_Stock_Item_Data_to_Staging -.->|call| nIntegration_GetStockItemUpdates
    nLoad_Stock_Item_Dimension_Extract_Updated_Stock_Item_Data_to_Staging -.->|write| nIntegration_StockItem_Staging
    nLoad_Stock_Item_Dimension_Extract_Updated_Stock_Item_Data_to_Staging -->|precedence| nLoad_Stock_Item_Dimension_Migrate_Staged_Stock_Item_Data
    nLoad_Stock_Item_Dimension_Extract_Updated_Stock_Item_Data_to_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Stock_Item_Dimension_Extract_Updated_Stock_Item_Data_to_Staging -.->|connection| nconn_WWI_Source_DB
    nLoad_Stock_Item_Dimension_Get_Last_Stock_Item_ETL_Cutoff_Time -.->|call| nIntegration_GetLastETLCutoffTime
    nLoad_Stock_Item_Dimension_Get_Last_Stock_Item_ETL_Cutoff_Time -->|precedence| nLoad_Stock_Item_Dimension_Extract_Updated_Stock_Item_Data_to_Staging
    nLoad_Stock_Item_Dimension_Get_Last_Stock_Item_ETL_Cutoff_Time -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Stock_Item_Dimension_Get_Lineage_Key -.->|call| nIntegration_GetLineageKey
    nLoad_Stock_Item_Dimension_Get_Lineage_Key -->|precedence| nLoad_Stock_Item_Dimension_Truncate_StockItem_Staging
    nLoad_Stock_Item_Dimension_Get_Lineage_Key -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Stock_Item_Dimension_Migrate_Staged_Stock_Item_Data -.->|call| nIntegration_MigrateStagedStockItemData
    nLoad_Stock_Item_Dimension_Migrate_Staged_Stock_Item_Data -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Stock_Item_Dimension_Set_TableName_to_Stock_Item -->|precedence| nLoad_Stock_Item_Dimension_Get_Lineage_Key
    nLoad_Stock_Item_Dimension_Truncate_StockItem_Staging -.->|read| nIntegration_StockItem_Staging
    nLoad_Stock_Item_Dimension_Truncate_StockItem_Staging -.->|write| nIntegration_StockItem_Staging
    nLoad_Stock_Item_Dimension_Truncate_StockItem_Staging -->|precedence| nLoad_Stock_Item_Dimension_Get_Last_Stock_Item_ETL_Cutoff_Time
    nLoad_Stock_Item_Dimension_Truncate_StockItem_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Supplier_Dimension -.->|contains| nLoad_Supplier_Dimension_Extract_Updated_Supplier_Data_to_Staging
    nLoad_Supplier_Dimension -.->|contains| nLoad_Supplier_Dimension_Get_Last_Supplier_ETL_Cutoff_Time
    nLoad_Supplier_Dimension -.->|contains| nLoad_Supplier_Dimension_Get_Lineage_Key
    nLoad_Supplier_Dimension -.->|contains| nLoad_Supplier_Dimension_Migrate_Staged_Supplier_Data
    nLoad_Supplier_Dimension -.->|contains| nLoad_Supplier_Dimension_Set_TableName_to_Supplier
    nLoad_Supplier_Dimension -.->|contains| nLoad_Supplier_Dimension_Truncate_Supplier_Staging
    nLoad_Supplier_Dimension -->|precedence| nLoad_Transaction_Type_Dimension
    nLoad_Supplier_Dimension_Extract_Updated_Supplier_Data_to_Staging -.->|call| nIntegration_GetSupplierUpdates
    nLoad_Supplier_Dimension_Extract_Updated_Supplier_Data_to_Staging -.->|write| nIntegration_Supplier_Staging
    nLoad_Supplier_Dimension_Extract_Updated_Supplier_Data_to_Staging -->|precedence| nLoad_Supplier_Dimension_Migrate_Staged_Supplier_Data
    nLoad_Supplier_Dimension_Extract_Updated_Supplier_Data_to_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Supplier_Dimension_Extract_Updated_Supplier_Data_to_Staging -.->|connection| nconn_WWI_Source_DB
    nLoad_Supplier_Dimension_Get_Last_Supplier_ETL_Cutoff_Time -.->|call| nIntegration_GetLastETLCutoffTime
    nLoad_Supplier_Dimension_Get_Last_Supplier_ETL_Cutoff_Time -->|precedence| nLoad_Supplier_Dimension_Extract_Updated_Supplier_Data_to_Staging
    nLoad_Supplier_Dimension_Get_Last_Supplier_ETL_Cutoff_Time -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Supplier_Dimension_Get_Lineage_Key -.->|call| nIntegration_GetLineageKey
    nLoad_Supplier_Dimension_Get_Lineage_Key -->|precedence| nLoad_Supplier_Dimension_Truncate_Supplier_Staging
    nLoad_Supplier_Dimension_Get_Lineage_Key -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Supplier_Dimension_Migrate_Staged_Supplier_Data -.->|call| nIntegration_MigrateStagedSupplierData
    nLoad_Supplier_Dimension_Migrate_Staged_Supplier_Data -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Supplier_Dimension_Set_TableName_to_Supplier -->|precedence| nLoad_Supplier_Dimension_Get_Lineage_Key
    nLoad_Supplier_Dimension_Truncate_Supplier_Staging -.->|read| nIntegration_Supplier_Staging
    nLoad_Supplier_Dimension_Truncate_Supplier_Staging -.->|write| nIntegration_Supplier_Staging
    nLoad_Supplier_Dimension_Truncate_Supplier_Staging -->|precedence| nLoad_Supplier_Dimension_Get_Last_Supplier_ETL_Cutoff_Time
    nLoad_Supplier_Dimension_Truncate_Supplier_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Transaction_Fact -.->|contains| nLoad_Transaction_Fact_Extract_Updated_Transaction_Data_to_Staging
    nLoad_Transaction_Fact -.->|contains| nLoad_Transaction_Fact_Get_Last_Movement_ETL_Cutoff_Time
    nLoad_Transaction_Fact -.->|contains| nLoad_Transaction_Fact_Get_Lineage_Key
    nLoad_Transaction_Fact -.->|contains| nLoad_Transaction_Fact_Migrate_Staged_Transaction_Data
    nLoad_Transaction_Fact -.->|contains| nLoad_Transaction_Fact_Set_TableName_to_Transaction
    nLoad_Transaction_Fact -.->|contains| nLoad_Transaction_Fact_Truncate_Transaction_Staging
    nLoad_Transaction_Fact_Extract_Updated_Transaction_Data_to_Staging -.->|call| nIntegration_GetTransactionUpdates
    nLoad_Transaction_Fact_Extract_Updated_Transaction_Data_to_Staging -.->|write| nIntegration_Transaction_Staging
    nLoad_Transaction_Fact_Extract_Updated_Transaction_Data_to_Staging -->|precedence| nLoad_Transaction_Fact_Migrate_Staged_Transaction_Data
    nLoad_Transaction_Fact_Extract_Updated_Transaction_Data_to_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Transaction_Fact_Extract_Updated_Transaction_Data_to_Staging -.->|connection| nconn_WWI_Source_DB
    nLoad_Transaction_Fact_Get_Last_Movement_ETL_Cutoff_Time -.->|call| nIntegration_GetLastETLCutoffTime
    nLoad_Transaction_Fact_Get_Last_Movement_ETL_Cutoff_Time -->|precedence| nLoad_Transaction_Fact_Extract_Updated_Transaction_Data_to_Staging
    nLoad_Transaction_Fact_Get_Last_Movement_ETL_Cutoff_Time -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Transaction_Fact_Get_Lineage_Key -.->|call| nIntegration_GetLineageKey
    nLoad_Transaction_Fact_Get_Lineage_Key -->|precedence| nLoad_Transaction_Fact_Truncate_Transaction_Staging
    nLoad_Transaction_Fact_Get_Lineage_Key -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Transaction_Fact_Migrate_Staged_Transaction_Data -.->|call| nIntegration_MigrateStagedTransactionData
    nLoad_Transaction_Fact_Migrate_Staged_Transaction_Data -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Transaction_Fact_Set_TableName_to_Transaction -->|precedence| nLoad_Transaction_Fact_Get_Lineage_Key
    nLoad_Transaction_Fact_Truncate_Transaction_Staging -.->|read| nIntegration_Transaction_Staging
    nLoad_Transaction_Fact_Truncate_Transaction_Staging -.->|write| nIntegration_Transaction_Staging
    nLoad_Transaction_Fact_Truncate_Transaction_Staging -->|precedence| nLoad_Transaction_Fact_Get_Last_Movement_ETL_Cutoff_Time
    nLoad_Transaction_Fact_Truncate_Transaction_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Transaction_Type_Dimension -->|precedence| nLoad_Movement_Fact
    nLoad_Transaction_Type_Dimension -.->|contains| nLoad_Transaction_Type_Dimension_Extract_Updated_Transaction_Type_Data_to_Staging
    nLoad_Transaction_Type_Dimension -.->|contains| nLoad_Transaction_Type_Dimension_Get_Last_Transaction_Type_ETL_Cutoff_Time
    nLoad_Transaction_Type_Dimension -.->|contains| nLoad_Transaction_Type_Dimension_Get_Lineage_Key
    nLoad_Transaction_Type_Dimension -.->|contains| nLoad_Transaction_Type_Dimension_Migrate_Staged_Transaction_Type_Data
    nLoad_Transaction_Type_Dimension -.->|contains| nLoad_Transaction_Type_Dimension_Set_TableName_to_Transaction_Type
    nLoad_Transaction_Type_Dimension -.->|contains| nLoad_Transaction_Type_Dimension_Truncate_TransactionType_Staging
    nLoad_Transaction_Type_Dimension_Extract_Updated_Transaction_Type_Data_to_Staging -.->|call| nIntegration_GetTransactionTypeUpdates
    nLoad_Transaction_Type_Dimension_Extract_Updated_Transaction_Type_Data_to_Staging -.->|write| nIntegration_TransactionType_Staging
    nLoad_Transaction_Type_Dimension_Extract_Updated_Transaction_Type_Data_to_Staging -->|precedence| nLoad_Transaction_Type_Dimension_Migrate_Staged_Transaction_Type_Data
    nLoad_Transaction_Type_Dimension_Extract_Updated_Transaction_Type_Data_to_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Transaction_Type_Dimension_Extract_Updated_Transaction_Type_Data_to_Staging -.->|connection| nconn_WWI_Source_DB
    nLoad_Transaction_Type_Dimension_Get_Last_Transaction_Type_ETL_Cutoff_Time -.->|call| nIntegration_GetLastETLCutoffTime
    nLoad_Transaction_Type_Dimension_Get_Last_Transaction_Type_ETL_Cutoff_Time -->|precedence| nLoad_Transaction_Type_Dimension_Extract_Updated_Transaction_Type_Data_to_Staging
    nLoad_Transaction_Type_Dimension_Get_Last_Transaction_Type_ETL_Cutoff_Time -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Transaction_Type_Dimension_Get_Lineage_Key -.->|call| nIntegration_GetLineageKey
    nLoad_Transaction_Type_Dimension_Get_Lineage_Key -->|precedence| nLoad_Transaction_Type_Dimension_Truncate_TransactionType_Staging
    nLoad_Transaction_Type_Dimension_Get_Lineage_Key -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Transaction_Type_Dimension_Migrate_Staged_Transaction_Type_Data -.->|call| nIntegration_MigrateStagedTransactionTypeData
    nLoad_Transaction_Type_Dimension_Migrate_Staged_Transaction_Type_Data -.->|connection| nconn_WWI_DW_Destination_DB
    nLoad_Transaction_Type_Dimension_Set_TableName_to_Transaction_Type -->|precedence| nLoad_Transaction_Type_Dimension_Get_Lineage_Key
    nLoad_Transaction_Type_Dimension_Truncate_TransactionType_Staging -.->|read| nIntegration_TransactionType_Staging
    nLoad_Transaction_Type_Dimension_Truncate_TransactionType_Staging -.->|write| nIntegration_TransactionType_Staging
    nLoad_Transaction_Type_Dimension_Truncate_TransactionType_Staging -->|precedence| nLoad_Transaction_Type_Dimension_Get_Last_Transaction_Type_ETL_Cutoff_Time
    nLoad_Transaction_Type_Dimension_Truncate_TransactionType_Staging -.->|connection| nconn_WWI_DW_Destination_DB
    nTrim_Any_Milliseconds -->|precedence| nEnsure_Date_Dimension_includes_current_year
```
