-- CubeTriage validation SQL — aw_database
-- kor EFTER load.sql; jamfor kalla vs mal per par
-- orphans ska vara 0; rowcount/checksum ska matcha

-- [rowcount] dbo_DimAccount  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_DimAccount;
SELECT 'target' AS side; SELECT COUNT(*) FROM dbo_DimAccount;

-- [rowcount] dbo_DimCustomer  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_DimCustomer;
SELECT 'target' AS side; SELECT COUNT(*) FROM dbo_DimCustomer;

-- [rowcount] dbo_DimTime  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_DimTime;
SELECT 'target' AS side; SELECT COUNT(*) FROM dbo_DimTime;

-- [rowcount] dbo_DimDepartmentGroup  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_DimDepartmentGroup;
SELECT 'target' AS side; SELECT COUNT(*) FROM dbo_DimDepartmentGroup;

-- [rowcount] DimDestinationCurrency  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM DimDestinationCurrency;
SELECT 'target' AS side; SELECT COUNT(*) FROM DimDestinationCurrency;

-- [rowcount] dbo_DimEmployee  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_DimEmployee;
SELECT 'target' AS side; SELECT COUNT(*) FROM dbo_DimEmployee;

-- [rowcount] dbo_DimGeography  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_DimGeography;
SELECT 'target' AS side; SELECT COUNT(*) FROM dbo_DimGeography;

-- [rowcount] dbo_DimOrganization  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_DimOrganization;
SELECT 'target' AS side; SELECT COUNT(*) FROM dbo_DimOrganization;

-- [rowcount] dbo_DimProduct  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_DimProduct;
SELECT 'target' AS side; SELECT COUNT(*) FROM dbo_DimProduct;

-- [rowcount] dbo_DimPromotion  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_DimPromotion;
SELECT 'target' AS side; SELECT COUNT(*) FROM dbo_DimPromotion;

-- [rowcount] dbo_DimReseller  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_DimReseller;
SELECT 'target' AS side; SELECT COUNT(*) FROM dbo_DimReseller;

-- [rowcount] FactSalesSummary  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM FactSalesSummary;
SELECT 'target' AS side; SELECT COUNT(*) FROM FactSalesSummary;

-- [rowcount] dbo_DimSalesReason  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_DimSalesReason;
SELECT 'target' AS side; SELECT COUNT(*) FROM dbo_DimSalesReason;

-- [rowcount] dbo_DimSalesTerritory  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_DimSalesTerritory;
SELECT 'target' AS side; SELECT COUNT(*) FROM dbo_DimSalesTerritory;

-- [rowcount] dbo_DimScenario  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_DimScenario;
SELECT 'target' AS side; SELECT COUNT(*) FROM dbo_DimScenario;

-- [rowcount] dbo_DimCurrency  (primary table — snowflake chain may deviate vid tomma joiner)
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_DimCurrency;
SELECT 'target' AS side; SELECT COUNT(*) FROM dbo_DimCurrency;

-- [rowcount] Fact Internet Sales 1
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_FactInternetSales;
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales 1;

-- [checksum] Fact Internet Sales 1.Internet Order Quantity
SELECT 'source' AS side; SELECT SUM(OrderQuantity) FROM dbo_FactInternetSales;
SELECT 'target' AS side; SELECT SUM(Internet Order Quantity) FROM Fact Internet Sales 1;

-- [orphans] Fact Internet Sales 1 -> dbo_DimPromotion  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales 1 f LEFT JOIN dbo_DimPromotion d ON f.PromotionKey = d.PromotionKey WHERE d.PromotionKey IS NULL AND f.PromotionKey IS NOT NULL;

-- [orphans] Fact Internet Sales 1 -> dbo_DimSalesTerritory  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales 1 f LEFT JOIN dbo_DimSalesTerritory d ON f.SalesTerritoryKey = d.SalesTerritoryKey WHERE d.SalesTerritoryKey IS NULL AND f.SalesTerritoryKey IS NOT NULL;

-- [orphans] Fact Internet Sales 1 -> dbo_DimProduct  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales 1 f LEFT JOIN dbo_DimProduct d ON f.ProductKey = d.ProductKey WHERE d.ProductKey IS NULL AND f.ProductKey IS NOT NULL;

-- [orphans] Fact Internet Sales 1 -> dbo_DimCustomer  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales 1 f LEFT JOIN dbo_DimCustomer d ON f.CustomerKey = d.CustomerKey WHERE d.CustomerKey IS NULL AND f.CustomerKey IS NOT NULL;

-- [orphans] Fact Internet Sales 1 -> dbo_DimCurrency  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales 1 f LEFT JOIN dbo_DimCurrency d ON f.CurrencyKey = d.CurrencyKey WHERE d.CurrencyKey IS NULL AND f.CurrencyKey IS NOT NULL;

-- [orphans] Fact Internet Sales 1 -> DimOrderDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales 1 f LEFT JOIN DimOrderDateKey-DimTime d ON f.OrderDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.OrderDateKey IS NOT NULL;

-- [orphans] Fact Internet Sales 1 -> DimShipDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales 1 f LEFT JOIN DimShipDateKey-DimTime d ON f.ShipDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.ShipDateKey IS NOT NULL;

-- [orphans] Fact Internet Sales 1 -> DimDueDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales 1 f LEFT JOIN DimDueDateKey-DimTime d ON f.DueDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.DueDateKey IS NOT NULL;

-- [rowcount] Internet Orders
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_FactInternetSales;
SELECT 'target' AS side; SELECT COUNT(*) FROM Internet Orders;

-- [orphans] Internet Orders -> dbo_DimPromotion  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Internet Orders f LEFT JOIN dbo_DimPromotion d ON f.PromotionKey = d.PromotionKey WHERE d.PromotionKey IS NULL AND f.PromotionKey IS NOT NULL;

-- [orphans] Internet Orders -> dbo_DimSalesTerritory  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Internet Orders f LEFT JOIN dbo_DimSalesTerritory d ON f.SalesTerritoryKey = d.SalesTerritoryKey WHERE d.SalesTerritoryKey IS NULL AND f.SalesTerritoryKey IS NOT NULL;

-- [orphans] Internet Orders -> dbo_DimProduct  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Internet Orders f LEFT JOIN dbo_DimProduct d ON f.ProductKey = d.ProductKey WHERE d.ProductKey IS NULL AND f.ProductKey IS NOT NULL;

-- [orphans] Internet Orders -> dbo_DimCustomer  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Internet Orders f LEFT JOIN dbo_DimCustomer d ON f.CustomerKey = d.CustomerKey WHERE d.CustomerKey IS NULL AND f.CustomerKey IS NOT NULL;

-- [orphans] Internet Orders -> dbo_DimCurrency  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Internet Orders f LEFT JOIN dbo_DimCurrency d ON f.CurrencyKey = d.CurrencyKey WHERE d.CurrencyKey IS NULL AND f.CurrencyKey IS NOT NULL;

-- [orphans] Internet Orders -> DimDueDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Internet Orders f LEFT JOIN DimDueDateKey-DimTime d ON f.DueDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.DueDateKey IS NOT NULL;

-- [orphans] Internet Orders -> DimShipDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Internet Orders f LEFT JOIN DimShipDateKey-DimTime d ON f.ShipDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.ShipDateKey IS NOT NULL;

-- [orphans] Internet Orders -> DimOrderDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Internet Orders f LEFT JOIN DimOrderDateKey-DimTime d ON f.OrderDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.OrderDateKey IS NOT NULL;

-- [rowcount] Fact Internet Sales
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_FactInternetSales;
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales;

-- [orphans] Fact Internet Sales -> dbo_DimPromotion  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales f LEFT JOIN dbo_DimPromotion d ON f.PromotionKey = d.PromotionKey WHERE d.PromotionKey IS NULL AND f.PromotionKey IS NOT NULL;

-- [orphans] Fact Internet Sales -> dbo_DimSalesTerritory  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales f LEFT JOIN dbo_DimSalesTerritory d ON f.SalesTerritoryKey = d.SalesTerritoryKey WHERE d.SalesTerritoryKey IS NULL AND f.SalesTerritoryKey IS NOT NULL;

-- [orphans] Fact Internet Sales -> dbo_DimProduct  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales f LEFT JOIN dbo_DimProduct d ON f.ProductKey = d.ProductKey WHERE d.ProductKey IS NULL AND f.ProductKey IS NOT NULL;

-- [orphans] Fact Internet Sales -> dbo_DimCurrency  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales f LEFT JOIN dbo_DimCurrency d ON f.CurrencyKey = d.CurrencyKey WHERE d.CurrencyKey IS NULL AND f.CurrencyKey IS NOT NULL;

-- [orphans] Fact Internet Sales -> DimOrderDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales f LEFT JOIN DimOrderDateKey-DimTime d ON f.OrderDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.OrderDateKey IS NOT NULL;

-- [orphans] Fact Internet Sales -> DimShipDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales f LEFT JOIN DimShipDateKey-DimTime d ON f.ShipDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.ShipDateKey IS NOT NULL;

-- [orphans] Fact Internet Sales -> DimDueDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales f LEFT JOIN DimDueDateKey-DimTime d ON f.DueDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.DueDateKey IS NOT NULL;

-- [orphans] Fact Internet Sales -> dbo_DimCustomer  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales f LEFT JOIN dbo_DimCustomer d ON f.CustomerKey = d.CustomerKey WHERE d.CustomerKey IS NULL AND f.CustomerKey IS NOT NULL;

-- [rowcount] Fact Internet Sales Reason
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_FactInternetSalesReason;
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales Reason;

-- [orphans] Fact Internet Sales Reason -> DimSalesReason  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Internet Sales Reason f LEFT JOIN DimSalesReason d ON f.SalesReasonKey = d.SalesReasonKey WHERE d.SalesReasonKey IS NULL AND f.SalesReasonKey IS NOT NULL;

-- [rowcount] Fact Reseller Sales
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_FactResellerSales;
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales;

-- [checksum] Fact Reseller Sales.Reseller Order Quantity
SELECT 'source' AS side; SELECT SUM(OrderQuantity) FROM dbo_FactResellerSales;
SELECT 'target' AS side; SELECT SUM(Reseller Order Quantity) FROM Fact Reseller Sales;

-- [orphans] Fact Reseller Sales -> dbo_DimEmployee  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales f LEFT JOIN dbo_DimEmployee d ON f.EmployeeKey = d.EmployeeKey WHERE d.EmployeeKey IS NULL AND f.EmployeeKey IS NOT NULL;

-- [orphans] Fact Reseller Sales -> dbo_DimPromotion  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales f LEFT JOIN dbo_DimPromotion d ON f.PromotionKey = d.PromotionKey WHERE d.PromotionKey IS NULL AND f.PromotionKey IS NOT NULL;

-- [orphans] Fact Reseller Sales -> dbo_DimSalesTerritory  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales f LEFT JOIN dbo_DimSalesTerritory d ON f.SalesTerritoryKey = d.SalesTerritoryKey WHERE d.SalesTerritoryKey IS NULL AND f.SalesTerritoryKey IS NOT NULL;

-- [orphans] Fact Reseller Sales -> dbo_DimReseller  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales f LEFT JOIN dbo_DimReseller d ON f.ResellerKey = d.ResellerKey WHERE d.ResellerKey IS NULL AND f.ResellerKey IS NOT NULL;

-- [orphans] Fact Reseller Sales -> dbo_DimProduct  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales f LEFT JOIN dbo_DimProduct d ON f.ProductKey = d.ProductKey WHERE d.ProductKey IS NULL AND f.ProductKey IS NOT NULL;

-- [orphans] Fact Reseller Sales -> dbo_DimCurrency  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales f LEFT JOIN dbo_DimCurrency d ON f.CurrencyKey = d.CurrencyKey WHERE d.CurrencyKey IS NULL AND f.CurrencyKey IS NOT NULL;

-- [orphans] Fact Reseller Sales -> DimOrderDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales f LEFT JOIN DimOrderDateKey-DimTime d ON f.OrderDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.OrderDateKey IS NOT NULL;

-- [orphans] Fact Reseller Sales -> DimShipDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales f LEFT JOIN DimShipDateKey-DimTime d ON f.ShipDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.ShipDateKey IS NOT NULL;

-- [orphans] Fact Reseller Sales -> DimDueDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Reseller Sales f LEFT JOIN DimDueDateKey-DimTime d ON f.DueDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.DueDateKey IS NOT NULL;

-- [rowcount] Reseller Orders
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_FactResellerSales;
SELECT 'target' AS side; SELECT COUNT(*) FROM Reseller Orders;

-- [orphans] Reseller Orders -> dbo_DimReseller  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Reseller Orders f LEFT JOIN dbo_DimReseller d ON f.ResellerKey = d.ResellerKey WHERE d.ResellerKey IS NULL AND f.ResellerKey IS NOT NULL;

-- [orphans] Reseller Orders -> dbo_DimEmployee  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Reseller Orders f LEFT JOIN dbo_DimEmployee d ON f.EmployeeKey = d.EmployeeKey WHERE d.EmployeeKey IS NULL AND f.EmployeeKey IS NOT NULL;

-- [orphans] Reseller Orders -> dbo_DimPromotion  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Reseller Orders f LEFT JOIN dbo_DimPromotion d ON f.PromotionKey = d.PromotionKey WHERE d.PromotionKey IS NULL AND f.PromotionKey IS NOT NULL;

-- [orphans] Reseller Orders -> dbo_DimSalesTerritory  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Reseller Orders f LEFT JOIN dbo_DimSalesTerritory d ON f.SalesTerritoryKey = d.SalesTerritoryKey WHERE d.SalesTerritoryKey IS NULL AND f.SalesTerritoryKey IS NOT NULL;

-- [orphans] Reseller Orders -> dbo_DimProduct  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Reseller Orders f LEFT JOIN dbo_DimProduct d ON f.ProductKey = d.ProductKey WHERE d.ProductKey IS NULL AND f.ProductKey IS NOT NULL;

-- [orphans] Reseller Orders -> dbo_DimCurrency  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Reseller Orders f LEFT JOIN dbo_DimCurrency d ON f.CurrencyKey = d.CurrencyKey WHERE d.CurrencyKey IS NULL AND f.CurrencyKey IS NOT NULL;

-- [orphans] Reseller Orders -> DimOrderDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Reseller Orders f LEFT JOIN DimOrderDateKey-DimTime d ON f.OrderDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.OrderDateKey IS NOT NULL;

-- [orphans] Reseller Orders -> DimShipDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Reseller Orders f LEFT JOIN DimShipDateKey-DimTime d ON f.ShipDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.ShipDateKey IS NOT NULL;

-- [orphans] Reseller Orders -> DimDueDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Reseller Orders f LEFT JOIN DimDueDateKey-DimTime d ON f.DueDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.DueDateKey IS NOT NULL;

-- [rowcount] Fact Sales Summary
SELECT 'source' AS side; SELECT COUNT(*) FROM FactSalesSummary;
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Sales Summary;

-- [checksum] Fact Sales Summary.Order Quantity
SELECT 'source' AS side; SELECT SUM(OrderQuantity) FROM FactSalesSummary;
SELECT 'target' AS side; SELECT SUM(Order Quantity) FROM Fact Sales Summary;

-- [orphans] Fact Sales Summary -> dbo_DimProduct  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Sales Summary f LEFT JOIN dbo_DimProduct d ON f.ProductKey = d.ProductKey WHERE d.ProductKey IS NULL AND f.ProductKey IS NOT NULL;

-- [orphans] Fact Sales Summary -> dbo_DimPromotion  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Sales Summary f LEFT JOIN dbo_DimPromotion d ON f.PromotionKey = d.PromotionKey WHERE d.PromotionKey IS NULL AND f.PromotionKey IS NOT NULL;

-- [orphans] Fact Sales Summary -> dbo_DimSalesTerritory  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Sales Summary f LEFT JOIN dbo_DimSalesTerritory d ON f.SalesTerritoryKey = d.SalesTerritoryKey WHERE d.SalesTerritoryKey IS NULL AND f.SalesTerritoryKey IS NOT NULL;

-- [orphans] Fact Sales Summary -> DimSalesChannel  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Sales Summary f LEFT JOIN DimSalesChannel d ON f.SalesChannel = d.SalesChannel WHERE d.SalesChannel IS NULL AND f.SalesChannel IS NOT NULL;

-- [orphans] Fact Sales Summary -> dbo_DimCurrency  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Sales Summary f LEFT JOIN dbo_DimCurrency d ON f.CurrencyKey = d.CurrencyKey WHERE d.CurrencyKey IS NULL AND f.CurrencyKey IS NOT NULL;

-- [orphans] Fact Sales Summary -> DimOrderDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Sales Summary f LEFT JOIN DimOrderDateKey-DimTime d ON f.OrderDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.OrderDateKey IS NOT NULL;

-- [orphans] Fact Sales Summary -> DimShipDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Sales Summary f LEFT JOIN DimShipDateKey-DimTime d ON f.ShipDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.ShipDateKey IS NOT NULL;

-- [orphans] Fact Sales Summary -> DimDueDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Sales Summary f LEFT JOIN DimDueDateKey-DimTime d ON f.DueDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.DueDateKey IS NOT NULL;

-- [rowcount] Sales Summary
SELECT 'source' AS side; SELECT COUNT(*) FROM FactSalesSummary;
SELECT 'target' AS side; SELECT COUNT(*) FROM Sales Summary;

-- [orphans] Sales Summary -> dbo_DimProduct  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Sales Summary f LEFT JOIN dbo_DimProduct d ON f.ProductKey = d.ProductKey WHERE d.ProductKey IS NULL AND f.ProductKey IS NOT NULL;

-- [orphans] Sales Summary -> dbo_DimPromotion  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Sales Summary f LEFT JOIN dbo_DimPromotion d ON f.PromotionKey = d.PromotionKey WHERE d.PromotionKey IS NULL AND f.PromotionKey IS NOT NULL;

-- [orphans] Sales Summary -> dbo_DimSalesTerritory  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Sales Summary f LEFT JOIN dbo_DimSalesTerritory d ON f.SalesTerritoryKey = d.SalesTerritoryKey WHERE d.SalesTerritoryKey IS NULL AND f.SalesTerritoryKey IS NOT NULL;

-- [orphans] Sales Summary -> DimSalesChannel  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Sales Summary f LEFT JOIN DimSalesChannel d ON f.SalesChannel = d.SalesChannel WHERE d.SalesChannel IS NULL AND f.SalesChannel IS NOT NULL;

-- [orphans] Sales Summary -> dbo_DimCurrency  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Sales Summary f LEFT JOIN dbo_DimCurrency d ON f.CurrencyKey = d.CurrencyKey WHERE d.CurrencyKey IS NULL AND f.CurrencyKey IS NOT NULL;

-- [orphans] Sales Summary -> DimOrderDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Sales Summary f LEFT JOIN DimOrderDateKey-DimTime d ON f.OrderDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.OrderDateKey IS NOT NULL;

-- [orphans] Sales Summary -> DimShipDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Sales Summary f LEFT JOIN DimShipDateKey-DimTime d ON f.ShipDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.ShipDateKey IS NOT NULL;

-- [orphans] Sales Summary -> DimDueDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Sales Summary f LEFT JOIN DimDueDateKey-DimTime d ON f.DueDateKey = d.DateKey WHERE d.DateKey IS NULL AND f.DueDateKey IS NOT NULL;

-- [rowcount] Fact Sales Quota
SELECT 'source' AS side; SELECT COUNT(*) FROM FactSalesQuota;
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Sales Quota;

-- [checksum] Fact Sales Quota.Sales Amount Quota
SELECT 'source' AS side; SELECT SUM(SalesAmountQuota) FROM FactSalesQuota;
SELECT 'target' AS side; SELECT SUM(Sales Amount Quota) FROM Fact Sales Quota;

-- [orphans] Fact Sales Quota -> dbo_DimEmployee  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Sales Quota f LEFT JOIN dbo_DimEmployee d ON f.EmployeeKey = d.EmployeeKey WHERE d.EmployeeKey IS NULL AND f.EmployeeKey IS NOT NULL;

-- [orphans] Fact Sales Quota -> DimOrderDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Sales Quota f LEFT JOIN DimOrderDateKey-DimTime d ON f.CalendarYear = d.DateKey WHERE d.DateKey IS NULL AND f.CalendarYear IS NOT NULL;

-- [rowcount] Fact Finance
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_FactFinance;
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Finance;

-- [orphans] Fact Finance -> dbo_DimScenario  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Finance f LEFT JOIN dbo_DimScenario d ON f.ScenarioKey = d.ScenarioKey WHERE d.ScenarioKey IS NULL AND f.ScenarioKey IS NOT NULL;

-- [orphans] Fact Finance -> dbo_DimOrganization  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Finance f LEFT JOIN dbo_DimOrganization d ON f.OrganizationKey = d.OrganizationKey WHERE d.OrganizationKey IS NULL AND f.OrganizationKey IS NOT NULL;

-- [orphans] Fact Finance -> dbo_DimDepartmentGroup  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Finance f LEFT JOIN dbo_DimDepartmentGroup d ON f.DepartmentGroupKey = d.DepartmentGroupKey WHERE d.DepartmentGroupKey IS NULL AND f.DepartmentGroupKey IS NOT NULL;

-- [orphans] Fact Finance -> dbo_DimAccount  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Finance f LEFT JOIN dbo_DimAccount d ON f.AccountKey = d.AccountKey WHERE d.AccountKey IS NULL AND f.AccountKey IS NOT NULL;

-- [orphans] Fact Finance -> DimOrderDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Finance f LEFT JOIN DimOrderDateKey-DimTime d ON f.DateKey = d.DateKey WHERE d.DateKey IS NULL AND f.DateKey IS NOT NULL;

-- [rowcount] Fact Currency Rate
SELECT 'source' AS side; SELECT COUNT(*) FROM dbo_FactCurrencyRate;
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Currency Rate;

-- [orphans] Fact Currency Rate -> DimDestinationCurrency  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Currency Rate f LEFT JOIN DimDestinationCurrency d ON f.CurrencyKey = d.CurrencyKey WHERE d.CurrencyKey IS NULL AND f.CurrencyKey IS NOT NULL;

-- [orphans] Fact Currency Rate -> DimOrderDateKey-DimTime  (expected 0 — every fact row should hit a dim)
SELECT 'target' AS side; SELECT COUNT(*) FROM Fact Currency Rate f LEFT JOIN DimOrderDateKey-DimTime d ON f.DateKey = d.DateKey WHERE d.DateKey IS NULL AND f.DateKey IS NOT NULL;

-- [rowcount] BridgeDimDestinationCurrency
SELECT 'source' AS side; SELECT COUNT(*) FROM (SELECT DISTINCT DateKey, CurrencyKey FROM dbo_FactCurrencyRate) x;
SELECT 'target' AS side; SELECT COUNT(*) FROM BridgeDimDestinationCurrency;

-- [rowcount] BridgeDimSalesReason
SELECT 'source' AS side; SELECT COUNT(*) FROM (SELECT DISTINCT SalesOrderNumber, SalesReasonKey FROM dbo_FactInternetSalesReason) x;
SELECT 'target' AS side; SELECT COUNT(*) FROM BridgeDimSalesReason;

