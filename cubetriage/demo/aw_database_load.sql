-- CubeTriage load SQL — aw_database
-- generated; verify before running (validation.sql)

INSERT INTO dbo_DimAccount (AccountKey, AccountType, AccountCodeAlternateKey, Level1, Level2)
SELECT dbo_DimAccount.AccountKey, dbo_DimAccount.AccountType, dbo_DimAccount.AccountCodeAlternateKey, NULL AS Level1, NULL AS Level2
FROM dbo_DimAccount;

INSERT INTO dbo_DimCustomer (CustomerKey, PostalCode, EnglishCountryRegionName, StateProvinceName, BirthDate, City, SimpleDateFirstPurchase, Phone, EmailAddress, YearlyIncome, TotalChildren, NumberCarsOwned, NumberChildrenAtHome, EnglishEducation, EnglishOccupation, MaritalStatusDesc, GenderDesc, HouseOwnerDesc, CommuteDistance, CommuteDistanceSort, AddressLine1)
SELECT dbo_DimCustomer.CustomerKey, dbo_DimGeography.PostalCode, dbo_DimGeography.EnglishCountryRegionName, dbo_DimGeography.StateProvinceName, dbo_DimCustomer.BirthDate, dbo_DimGeography.City, dbo_DimCustomer.SimpleDateFirstPurchase, dbo_DimCustomer.Phone, dbo_DimCustomer.EmailAddress, dbo_DimCustomer.YearlyIncome, dbo_DimCustomer.TotalChildren, dbo_DimCustomer.NumberCarsOwned, dbo_DimCustomer.NumberChildrenAtHome, dbo_DimCustomer.EnglishEducation, dbo_DimCustomer.EnglishOccupation, dbo_DimCustomer.MaritalStatusDesc, dbo_DimCustomer.GenderDesc, dbo_DimCustomer.HouseOwnerDesc, dbo_DimCustomer.CommuteDistance, dbo_DimCustomer.CommuteDistanceSort, dbo_DimCustomer.AddressLine1
FROM dbo_DimCustomer JOIN dbo_DimGeography ON dbo_DimCustomer.PostalCode = dbo_DimGeography.PostalCode;

INSERT INTO dbo_DimTime (DateKey, FiscalYearDesc, CalendarQuarterDesc, FiscalQuarterDesc, CalendarSemesterDesc, FiscalSemesterDesc, DayNumberOfWeek, EnglishDayNameOfWeek, DayNumberOfMonth, DayNumberOfYear, CalendarWeekDesc, MonthName, CalendarYearDesc, FiscalSemesterOfYear, CalendarSemesterOfYear, FiscalQuarterOfYear, CalendarQuarterOfYear, EnglishMonthName, FiscalWeekDesc, CalendarWeek, FiscalWeek)
SELECT dbo_DimTime.DateKey, dbo_DimTime.FiscalYearDesc, dbo_DimTime.CalendarQuarterDesc, dbo_DimTime.FiscalQuarterDesc, dbo_DimTime.CalendarSemesterDesc, dbo_DimTime.FiscalSemesterDesc, dbo_DimTime.DayNumberOfWeek, dbo_DimTime.EnglishDayNameOfWeek, dbo_DimTime.DayNumberOfMonth, dbo_DimTime.DayNumberOfYear, dbo_DimTime.CalendarWeekDesc, dbo_DimTime.MonthName, dbo_DimTime.CalendarYearDesc, dbo_DimTime.FiscalSemesterOfYear, dbo_DimTime.CalendarSemesterOfYear, dbo_DimTime.FiscalQuarterOfYear, dbo_DimTime.CalendarQuarterOfYear, dbo_DimTime.EnglishMonthName, dbo_DimTime.FiscalWeekDesc, dbo_DimTime.CalendarWeek, dbo_DimTime.FiscalWeek
FROM dbo_DimTime;

INSERT INTO dbo_DimDepartmentGroup (DepartmentGroupKey, Level1, Level2)
SELECT dbo_DimDepartmentGroup.DepartmentGroupKey, NULL AS Level1, NULL AS Level2
FROM dbo_DimDepartmentGroup;

INSERT INTO DimDestinationCurrency (CurrencyKey, CurrencyName, LCID)
SELECT DimDestinationCurrency.CurrencyKey, DimDestinationCurrency.CurrencyName, DimDestinationCurrency.LCID
FROM DimDestinationCurrency;

INSERT INTO dbo_DimEmployee (EmployeeKey, DepartmentName, SalesPersonFlagDesc, Title, SimpleHireDate, SickLeaveHours, BirthDate, VacationHours, LoginID, BaseRate, EmailAddress, PayFrequencyDesc, Phone, SalariedFlagDesc, EmergencyContactName, EmergencyContactPhone, GenderDesc, MaritalStatusDesc, SalesTerritoryKey, EmployeeNationalIDAlternateKey, ParentEmployeeNationalIDAlternateKey, EmployeeStatus, SimpleStartDate, SimpleEndDate, HireYear, Level1, Level2)
SELECT dbo_DimEmployee.EmployeeKey, dbo_DimEmployee.DepartmentName, dbo_DimEmployee.SalesPersonFlagDesc, dbo_DimEmployee.Title, dbo_DimEmployee.SimpleHireDate, dbo_DimEmployee.SickLeaveHours, dbo_DimEmployee.BirthDate, dbo_DimEmployee.VacationHours, dbo_DimEmployee.LoginID, dbo_DimEmployee.BaseRate, dbo_DimEmployee.EmailAddress, dbo_DimEmployee.PayFrequencyDesc, dbo_DimEmployee.Phone, dbo_DimEmployee.SalariedFlagDesc, dbo_DimEmployee.EmergencyContactName, dbo_DimEmployee.EmergencyContactPhone, dbo_DimEmployee.GenderDesc, dbo_DimEmployee.MaritalStatusDesc, dbo_DimEmployee.SalesTerritoryKey, dbo_DimEmployee.EmployeeNationalIDAlternateKey, dbo_DimEmployee.ParentEmployeeNationalIDAlternateKey, dbo_DimEmployee.EmployeeStatus, dbo_DimEmployee.SimpleStartDate, dbo_DimEmployee.SimpleEndDate, dbo_DimEmployee.HireYear, NULL AS Level1, NULL AS Level2
FROM dbo_DimEmployee;

INSERT INTO dbo_DimGeography (GeographyKey, City, StateProvinceName, EnglishCountryRegionName, PostalCode)
SELECT dbo_DimGeography.GeographyKey, dbo_DimGeography.City, dbo_DimGeography.StateProvinceName, dbo_DimGeography.EnglishCountryRegionName, dbo_DimGeography.PostalCode
FROM dbo_DimGeography;

INSERT INTO dbo_DimOrganization (OrganizationKey, CurrencyAlternateKey, Level1, Level2)
SELECT dbo_DimOrganization.OrganizationKey, dbo_DimOrganization.CurrencyAlternateKey, NULL AS Level1, NULL AS Level2
FROM dbo_DimOrganization;

INSERT INTO dbo_DimProduct (ProductKey, StandardCost, EnglishProductCategoryName, Color, SafetyStockLevel, ReorderPoint, ListPrice, Size, SizeRange, WeightDesc, DaysToManufacture, DealerPrice, ClassDesc, StyleDesc, ModelNameAssembly, ProductLineName, EnglishProductSubcategoryName, StatusDesc, SimpleStartDate, SimpleEndDate)
SELECT dbo_DimProduct.ProductKey, dbo_DimProduct.StandardCost, dbo_DimProductCategory.EnglishProductCategoryName, dbo_DimProduct.Color, dbo_DimProduct.SafetyStockLevel, dbo_DimProduct.ReorderPoint, dbo_DimProduct.ListPrice, dbo_DimProduct.Size, dbo_DimProduct.SizeRange, dbo_DimProduct.WeightDesc, dbo_DimProduct.DaysToManufacture, dbo_DimProduct.DealerPrice, dbo_DimProduct.ClassDesc, dbo_DimProduct.StyleDesc, dbo_DimProduct.ModelNameAssembly, dbo_DimProduct.ProductLineName, dbo_DimProductSubcategory.EnglishProductSubcategoryName, dbo_DimProduct.StatusDesc, dbo_DimProduct.SimpleStartDate, dbo_DimProduct.SimpleEndDate
FROM dbo_DimProduct JOIN dbo_DimProductCategory ON dbo_DimProduct.ProductCategoryKey = dbo_DimProductCategory.ProductCategoryKey JOIN dbo_DimProductSubcategory ON dbo_DimProduct.ProductSubcategoryKey = dbo_DimProductSubcategory.ProductSubcategoryKey;

INSERT INTO dbo_DimPromotion (PromotionKey, DiscountPctDesc, MaxQtyDesc, EnglishPromotionType, MinQty, EnglishPromotionCategory, SimpleEndDate, SimpleStartDate)
SELECT dbo_DimPromotion.PromotionKey, dbo_DimPromotion.DiscountPctDesc, dbo_DimPromotion.MaxQtyDesc, dbo_DimPromotion.EnglishPromotionType, dbo_DimPromotion.MinQty, dbo_DimPromotion.EnglishPromotionCategory, dbo_DimPromotion.SimpleEndDate, dbo_DimPromotion.SimpleStartDate
FROM dbo_DimPromotion;

INSERT INTO dbo_DimReseller (ResellerKey, ProductLine, Phone, LastOrderYearDesc, BusinessType, FirstOrderYearDesc, NumberEmployees, YearOpened, AnnualSales, AnnualRevenue, BankName, MinPaymentAmountDesc, MinPaymentTypeDesc, OrderFrequencyDesc, OrderMonthDesc, GeographyKey, AddressLine1)
SELECT dbo_DimReseller.ResellerKey, dbo_DimReseller.ProductLine, dbo_DimReseller.Phone, dbo_DimReseller.LastOrderYearDesc, dbo_DimReseller.BusinessType, dbo_DimReseller.FirstOrderYearDesc, dbo_DimReseller.NumberEmployees, dbo_DimReseller.YearOpened, dbo_DimReseller.AnnualSales, dbo_DimReseller.AnnualRevenue, dbo_DimReseller.BankName, dbo_DimReseller.MinPaymentAmountDesc, dbo_DimReseller.MinPaymentTypeDesc, dbo_DimReseller.OrderFrequencyDesc, dbo_DimReseller.OrderMonthDesc, dbo_DimReseller.GeographyKey, dbo_DimReseller.AddressLine1
FROM dbo_DimReseller;

INSERT INTO FactSalesSummary (SalesChannel)
SELECT FactSalesSummary.SalesChannel
FROM FactSalesSummary;

INSERT INTO dbo_DimSalesReason (SalesReasonKey, SalesReasonReasonType)
SELECT dbo_DimSalesReason.SalesReasonKey, dbo_DimSalesReason.SalesReasonReasonType
FROM dbo_DimSalesReason;

INSERT INTO dbo_DimSalesTerritory (SalesTerritoryKey, SalesTerritoryCountry, SalesTerritoryGroup)
SELECT dbo_DimSalesTerritory.SalesTerritoryKey, dbo_DimSalesTerritory.SalesTerritoryCountry, dbo_DimSalesTerritory.SalesTerritoryGroup
FROM dbo_DimSalesTerritory;

INSERT INTO dbo_DimScenario (ScenarioKey)
SELECT dbo_DimScenario.ScenarioKey
FROM dbo_DimScenario;

INSERT INTO dbo_DimCurrency (CurrencyKey, CurrencyName)
SELECT dbo_DimCurrency.CurrencyKey, dbo_DimCurrency.CurrencyName
FROM dbo_DimCurrency;

INSERT INTO Fact Internet Sales 1 (PromotionKey, SalesTerritoryKey, ProductKey, CustomerKey, CurrencyKey, OrderDateKey, ShipDateKey, DueDateKey, SalesOrderNumber, SalesOrderLineNumber, Internet Order Quantity)
SELECT PromotionKey, SalesTerritoryKey, ProductKey, CustomerKey, CurrencyKey, OrderDateKey, ShipDateKey, DueDateKey, SalesOrderNumber, SalesOrderLineNumber, (OrderQuantity) AS [Internet Order Quantity]
FROM dbo_FactInternetSales;

INSERT INTO Internet Orders (PromotionKey, SalesTerritoryKey, ProductKey, CustomerKey, CurrencyKey, DueDateKey, ShipDateKey, OrderDateKey, SalesOrderNumber, SalesOrderLineNumber, Internet Order Count)
SELECT PromotionKey, SalesTerritoryKey, ProductKey, CustomerKey, CurrencyKey, DueDateKey, ShipDateKey, OrderDateKey, SalesOrderNumber, SalesOrderLineNumber, (SalesOrderNumber) AS [Internet Order Count]
FROM dbo_FactInternetSales;

INSERT INTO Fact Internet Sales (PromotionKey, SalesTerritoryKey, ProductKey, CurrencyKey, OrderDateKey, ShipDateKey, DueDateKey, CustomerKey, SalesOrderNumber, SalesOrderLineNumber, Customer Count)
SELECT PromotionKey, SalesTerritoryKey, ProductKey, CurrencyKey, OrderDateKey, ShipDateKey, DueDateKey, CustomerKey, SalesOrderNumber, SalesOrderLineNumber, (CustomerKey) AS [Customer Count]
FROM dbo_FactInternetSales;

INSERT INTO Fact Internet Sales Reason (SalesReasonKey, SalesOrderNumber)
SELECT SalesReasonKey, SalesOrderNumber
FROM dbo_FactInternetSalesReason;

INSERT INTO Fact Reseller Sales (EmployeeKey, PromotionKey, SalesTerritoryKey, ResellerKey, ProductKey, CurrencyKey, OrderDateKey, ShipDateKey, DueDateKey, SalesOrderNumber, SalesOrderLineNumber, CarrierTrackingNumber, CustomerPONumber, Reseller Order Quantity, Unit Price Discount Percent)
SELECT EmployeeKey, PromotionKey, SalesTerritoryKey, ResellerKey, ProductKey, CurrencyKey, OrderDateKey, ShipDateKey, DueDateKey, SalesOrderNumber, SalesOrderLineNumber, CarrierTrackingNumber, CustomerPONumber, (OrderQuantity) AS [Reseller Order Quantity], (UnitPriceDiscountPct) AS [Unit Price Discount Percent]
FROM dbo_FactResellerSales;

INSERT INTO Reseller Orders (ResellerKey, EmployeeKey, PromotionKey, SalesTerritoryKey, ProductKey, CurrencyKey, OrderDateKey, ShipDateKey, DueDateKey, SalesOrderNumber, SalesOrderLineNumber, CarrierTrackingNumber, CustomerPONumber, Reseller Order Count)
SELECT ResellerKey, EmployeeKey, PromotionKey, SalesTerritoryKey, ProductKey, CurrencyKey, OrderDateKey, ShipDateKey, DueDateKey, SalesOrderNumber, SalesOrderLineNumber, CarrierTrackingNumber, CustomerPONumber, (SalesOrderNumber) AS [Reseller Order Count]
FROM dbo_FactResellerSales;

INSERT INTO Fact Sales Summary (ProductKey, PromotionKey, SalesTerritoryKey, SalesChannel, CurrencyKey, OrderDateKey, ShipDateKey, DueDateKey, SalesOrderNumber, SalesOrderLineNumber, CarrierTrackingNumber, CustomerPONumber, Order Quantity)
SELECT ProductKey, PromotionKey, SalesTerritoryKey, SalesChannel, CurrencyKey, OrderDateKey, ShipDateKey, DueDateKey, SalesOrderNumber, SalesOrderLineNumber, CarrierTrackingNumber, CustomerPONumber, (OrderQuantity) AS [Order Quantity]
FROM FactSalesSummary;

INSERT INTO Sales Summary (ProductKey, PromotionKey, SalesTerritoryKey, SalesChannel, CurrencyKey, OrderDateKey, ShipDateKey, DueDateKey, SalesOrderNumber, SalesOrderLineNumber, CarrierTrackingNumber, CustomerPONumber, Order Count)
SELECT ProductKey, PromotionKey, SalesTerritoryKey, SalesChannel, CurrencyKey, OrderDateKey, ShipDateKey, DueDateKey, SalesOrderNumber, SalesOrderLineNumber, CarrierTrackingNumber, CustomerPONumber, (SalesOrderNumber) AS [Order Count]
FROM FactSalesSummary;

INSERT INTO Fact Sales Quota (EmployeeKey, CalendarYear, Sales Amount Quota)
SELECT EmployeeKey, CalendarYear, (SalesAmountQuota) AS [Sales Amount Quota]
FROM FactSalesQuota;

INSERT INTO Fact Finance (ScenarioKey, OrganizationKey, DepartmentGroupKey, AccountKey, DateKey, Amount)
SELECT ScenarioKey, OrganizationKey, DepartmentGroupKey, AccountKey, DateKey, Amount
FROM dbo_FactFinance;

INSERT INTO Fact Currency Rate (CurrencyKey, DateKey, Average Rate, End of Day Rate)
SELECT CurrencyKey, DateKey, (AverageRate) AS [Average Rate], (EndOfDayRate) AS [End of Day Rate]
FROM dbo_FactCurrencyRate;

INSERT INTO BridgeDimDestinationCurrency (DateKey, CurrencyKey)
SELECT DISTINCT DateKey, CurrencyKey
FROM dbo_FactCurrencyRate;

INSERT INTO BridgeDimSalesReason (SalesOrderNumber, SalesReasonKey)
SELECT DISTINCT SalesOrderNumber, SalesReasonKey
FROM dbo_FactInternetSalesReason;

-- NOTES (read these)
-- Dim Account: parent-child Level columns require hierarchy flattening — NULL placeholders
-- Dim Department Group: parent-child Level columns require hierarchy flattening — NULL placeholders
-- Dim Employee: parent-child Level columns require hierarchy flattening — NULL placeholders
-- Dim Organization: parent-child Level columns require hierarchy flattening — NULL placeholders
-- Fact Internet Sales 1: 8 calculated/sourceless measures require manual SQL: Internet Sales Amount, Internet Extended Amount, Internet Tax Amount, Internet Freight Cost, Internet Unit Price
-- Fact Internet Sales Reason: 1 calculated/sourceless measures require manual SQL: Sales Reason Count
-- Fact Reseller Sales: 9 calculated/sourceless measures require manual SQL: Reseller Sales Amount, Reseller Extended Amount, Reseller Tax Amount, Reseller Freight Cost, Discount Amount
-- Fact Sales Summary: 8 calculated/sourceless measures require manual SQL: Unit Price, Extended Amount, Standard Product Cost, Total Product Cost, Sales Amount
