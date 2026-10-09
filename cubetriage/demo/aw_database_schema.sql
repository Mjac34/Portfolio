-- star schema DDL — types resolved from canonical column_types

CREATE TABLE [dbo_DimAccount] (
  [AccountKey] INT PRIMARY KEY,
  [AccountType] NVARCHAR(255),
  [AccountCodeAlternateKey] NVARCHAR(255),
  [Level1] NVARCHAR(255),
  [Level2] NVARCHAR(255)
);

CREATE TABLE [dbo_DimCustomer] (
  [CustomerKey] INT PRIMARY KEY,
  [PostalCode] NVARCHAR(255),
  [EnglishCountryRegionName] NVARCHAR(255),
  [StateProvinceName] NVARCHAR(255),
  [BirthDate] NVARCHAR(255),
  [City] NVARCHAR(255),
  [SimpleDateFirstPurchase] NVARCHAR(255),
  [Phone] NVARCHAR(255),
  [EmailAddress] NVARCHAR(255),
  [YearlyIncome] NVARCHAR(255),
  [TotalChildren] NVARCHAR(255),
  [NumberCarsOwned] NVARCHAR(255),
  [NumberChildrenAtHome] NVARCHAR(255),
  [EnglishEducation] NVARCHAR(255),
  [EnglishOccupation] NVARCHAR(255),
  [MaritalStatusDesc] NVARCHAR(255),
  [GenderDesc] NVARCHAR(255),
  [HouseOwnerDesc] NVARCHAR(255),
  [CommuteDistance] NVARCHAR(255),
  [CommuteDistanceSort] NVARCHAR(255),
  [AddressLine1] NVARCHAR(255)
);

CREATE TABLE [dbo_DimTime] (
  [DateKey] INT PRIMARY KEY,
  [FiscalYearDesc] NVARCHAR(255),
  [CalendarQuarterDesc] NVARCHAR(255),
  [FiscalQuarterDesc] NVARCHAR(255),
  [CalendarSemesterDesc] NVARCHAR(255),
  [FiscalSemesterDesc] NVARCHAR(255),
  [DayNumberOfWeek] INT,
  [EnglishDayNameOfWeek] NVARCHAR(255),
  [DayNumberOfMonth] NVARCHAR(255),
  [DayNumberOfYear] NVARCHAR(255),
  [CalendarWeekDesc] NVARCHAR(255),
  [MonthName] NVARCHAR(255),
  [CalendarYearDesc] NVARCHAR(255),
  [FiscalSemesterOfYear] NVARCHAR(255),
  [CalendarSemesterOfYear] NVARCHAR(255),
  [FiscalQuarterOfYear] NVARCHAR(255),
  [CalendarQuarterOfYear] NVARCHAR(255),
  [EnglishMonthName] NVARCHAR(255),
  [FiscalWeekDesc] NVARCHAR(255),
  [CalendarWeek] NVARCHAR(255),
  [FiscalWeek] NVARCHAR(255)
  -- roles: Order Date Key - Dim Time, Ship Date Key - Dim Time, Due Date Key - Dim Time, Due Date Key - Dim Time, Ship Date Key - Dim Time, Order Date Key - Dim Time, Order Date Key - Dim Time, Ship Date Key - Dim Time, Due Date Key - Dim Time, Order Date Key - Dim Time, Ship Date Key - Dim Time, Due Date Key - Dim Time, Order Date Key - Dim Time, Ship Date Key - Dim Time, Due Date Key - Dim Time, Order Date Key - Dim Time, Ship Date Key - Dim Time, Due Date Key - Dim Time, Order Date Key - Dim Time, Ship Date Key - Dim Time, Due Date Key - Dim Time, Order Date Key - Dim Time, Order Date Key - Dim Time, Order Date Key - Dim Time (join via same key)
);

CREATE TABLE [dbo_DimDepartmentGroup] (
  [DepartmentGroupKey] INT PRIMARY KEY,
  [Level1] NVARCHAR(255),
  [Level2] NVARCHAR(255)
);

CREATE TABLE [DimDestinationCurrency] (
  [CurrencyKey] INT PRIMARY KEY,
  [CurrencyName] NVARCHAR(255),
  [LCID] NVARCHAR(255)
  -- roles: Destination Currency, Destination Currency, Destination Currency, Destination Currency, Destination Currency (join via same key)
);

CREATE TABLE [dbo_DimEmployee] (
  [EmployeeKey] INT PRIMARY KEY,
  [DepartmentName] NVARCHAR(255),
  [SalesPersonFlagDesc] NVARCHAR(255),
  [Title] NVARCHAR(255),
  [SimpleHireDate] NVARCHAR(255),
  [SickLeaveHours] NVARCHAR(255),
  [BirthDate] NVARCHAR(255),
  [VacationHours] NVARCHAR(255),
  [LoginID] NVARCHAR(255),
  [BaseRate] NVARCHAR(255),
  [EmailAddress] NVARCHAR(255),
  [PayFrequencyDesc] NVARCHAR(255),
  [Phone] NVARCHAR(255),
  [SalariedFlagDesc] NVARCHAR(255),
  [EmergencyContactName] NVARCHAR(255),
  [EmergencyContactPhone] NVARCHAR(255),
  [GenderDesc] NVARCHAR(255),
  [MaritalStatusDesc] NVARCHAR(255),
  [SalesTerritoryKey] NVARCHAR(255),
  [EmployeeNationalIDAlternateKey] NVARCHAR(255),
  [ParentEmployeeNationalIDAlternateKey] NVARCHAR(255),
  [EmployeeStatus] NVARCHAR(255),
  [SimpleStartDate] NVARCHAR(255),
  [SimpleEndDate] NVARCHAR(255),
  [HireYear] NVARCHAR(255),
  [Level1] NVARCHAR(255),
  [Level2] NVARCHAR(255)
);

CREATE TABLE [dbo_DimGeography] (
  [GeographyKey] INT PRIMARY KEY,
  [City] NVARCHAR(255),
  [StateProvinceName] NVARCHAR(255),
  [EnglishCountryRegionName] NVARCHAR(255),
  [PostalCode] NVARCHAR(255)
);

CREATE TABLE [dbo_DimOrganization] (
  [OrganizationKey] INT PRIMARY KEY,
  [CurrencyAlternateKey] NVARCHAR(255),
  [Level1] NVARCHAR(255),
  [Level2] NVARCHAR(255)
);

CREATE TABLE [dbo_DimProduct] (
  [ProductKey] INT PRIMARY KEY,
  [StandardCost] NVARCHAR(255),
  [EnglishProductCategoryName] NVARCHAR(255),
  [Color] NVARCHAR(255),
  [SafetyStockLevel] NVARCHAR(255),
  [ReorderPoint] NVARCHAR(255),
  [ListPrice] NVARCHAR(255),
  [Size] NVARCHAR(255),
  [SizeRange] NVARCHAR(255),
  [WeightDesc] NVARCHAR(255),
  [DaysToManufacture] NVARCHAR(255),
  [DealerPrice] NVARCHAR(255),
  [ClassDesc] NVARCHAR(255),
  [StyleDesc] NVARCHAR(255),
  [ModelNameAssembly] NVARCHAR(255),
  [ProductLineName] NVARCHAR(255),
  [EnglishProductSubcategoryName] NVARCHAR(255),
  [StatusDesc] NVARCHAR(255),
  [SimpleStartDate] NVARCHAR(255),
  [SimpleEndDate] NVARCHAR(255),
  [ProductKey] INT
);

CREATE TABLE [dbo_DimPromotion] (
  [PromotionKey] INT PRIMARY KEY,
  [DiscountPctDesc] NVARCHAR(255),
  [MaxQtyDesc] NVARCHAR(255),
  [EnglishPromotionType] NVARCHAR(255),
  [MinQty] NVARCHAR(255),
  [EnglishPromotionCategory] NVARCHAR(255),
  [SimpleEndDate] NVARCHAR(255),
  [SimpleStartDate] NVARCHAR(255)
);

CREATE TABLE [dbo_DimReseller] (
  [ResellerKey] INT PRIMARY KEY,
  [ProductLine] NVARCHAR(255),
  [Phone] NVARCHAR(255),
  [LastOrderYearDesc] NVARCHAR(255),
  [BusinessType] NVARCHAR(255),
  [FirstOrderYearDesc] NVARCHAR(255),
  [NumberEmployees] NVARCHAR(255),
  [YearOpened] NVARCHAR(255),
  [AnnualSales] NVARCHAR(255),
  [AnnualRevenue] NVARCHAR(255),
  [BankName] NVARCHAR(255),
  [MinPaymentAmountDesc] NVARCHAR(255),
  [MinPaymentTypeDesc] NVARCHAR(255),
  [OrderFrequencyDesc] NVARCHAR(255),
  [OrderMonthDesc] NVARCHAR(255),
  [GeographyKey] INT,
  [AddressLine1] NVARCHAR(255)
);

CREATE TABLE [FactSalesSummary] (
  [SalesChannel] NVARCHAR(255) PRIMARY KEY
  -- roles: Sales Channel, Sales Channel (join via same key)
);

CREATE TABLE [dbo_DimSalesReason] (
  [SalesReasonKey] INT PRIMARY KEY,
  [SalesReasonReasonType] NVARCHAR(255)
  -- roles: Sales Reason, Sales Reason, Sales Reason, Sales Reason (join via same key)
);

CREATE TABLE [dbo_DimSalesTerritory] (
  [SalesTerritoryKey] NVARCHAR(255) PRIMARY KEY,
  [SalesTerritoryCountry] NVARCHAR(255),
  [SalesTerritoryGroup] NVARCHAR(255)
);

CREATE TABLE [dbo_DimScenario] (
  [ScenarioKey] INT PRIMARY KEY
);

CREATE TABLE [dbo_DimCurrency] (
  [CurrencyKey] INT PRIMARY KEY,
  [CurrencyName] NVARCHAR(255)
);

CREATE TABLE [Fact Internet Sales 1] (
  [PromotionKey] INT REFERENCES [dbo_DimPromotion] ([PromotionKey]),
  [SalesTerritoryKey] NVARCHAR(255) REFERENCES [dbo_DimSalesTerritory] ([SalesTerritoryKey]),
  [ProductKey] INT REFERENCES [dbo_DimProduct] ([ProductKey]),
  [CustomerKey] INT REFERENCES [dbo_DimCustomer] ([CustomerKey]),
  [CurrencyKey] INT REFERENCES [dbo_DimCurrency] ([CurrencyKey]),
  [OrderDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [ShipDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [DueDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [SalesOrderNumber] NVARCHAR(255)  -- degenerate,
  [SalesOrderLineNumber] INT  -- degenerate,
  [Internet Sales Amount] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Internet Order Quantity] INT  -- sum,
  [Internet Extended Amount] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Internet Tax Amount] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Internet Freight Cost] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Internet Unit Price] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Internet Total Product Cost] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Internet Standard Product Cost] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Internet Transaction Count] DECIMAL(19,4)  -- count
);

CREATE TABLE [Internet Orders] (
  [PromotionKey] INT REFERENCES [dbo_DimPromotion] ([PromotionKey]),
  [SalesTerritoryKey] NVARCHAR(255) REFERENCES [dbo_DimSalesTerritory] ([SalesTerritoryKey]),
  [ProductKey] INT REFERENCES [dbo_DimProduct] ([ProductKey]),
  [CustomerKey] INT REFERENCES [dbo_DimCustomer] ([CustomerKey]),
  [CurrencyKey] INT REFERENCES [dbo_DimCurrency] ([CurrencyKey]),
  [DueDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [ShipDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [OrderDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [SalesOrderNumber] NVARCHAR(255)  -- degenerate,
  [SalesOrderLineNumber] INT  -- degenerate,
  [Internet Order Count] NVARCHAR(255)  -- count_distinct
);

CREATE TABLE [Fact Internet Sales] (
  [PromotionKey] INT REFERENCES [dbo_DimPromotion] ([PromotionKey]),
  [SalesTerritoryKey] NVARCHAR(255) REFERENCES [dbo_DimSalesTerritory] ([SalesTerritoryKey]),
  [ProductKey] INT REFERENCES [dbo_DimProduct] ([ProductKey]),
  [CurrencyKey] INT REFERENCES [dbo_DimCurrency] ([CurrencyKey]),
  [OrderDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [ShipDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [DueDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [CustomerKey] INT REFERENCES [dbo_DimCustomer] ([CustomerKey]),
  [SalesOrderNumber] NVARCHAR(255)  -- degenerate,
  [SalesOrderLineNumber] INT  -- degenerate,
  [Customer Count] INT  -- count_distinct
);

CREATE TABLE [Fact Internet Sales Reason] (
  [SalesReasonKey] INT REFERENCES [dbo_DimSalesReason] ([SalesReasonKey]),
  [SalesOrderNumber] NVARCHAR(255) REFERENCES [DimInternetSalesOrderDetails] ([Key]),
  [Sales Reason Count] DECIMAL(19,4)  -- count
);

CREATE TABLE [Fact Reseller Sales] (
  [EmployeeKey] INT REFERENCES [dbo_DimEmployee] ([EmployeeKey]),
  [PromotionKey] INT REFERENCES [dbo_DimPromotion] ([PromotionKey]),
  [SalesTerritoryKey] NVARCHAR(255) REFERENCES [dbo_DimSalesTerritory] ([SalesTerritoryKey]),
  [ResellerKey] INT REFERENCES [dbo_DimReseller] ([ResellerKey]),
  [ProductKey] INT REFERENCES [dbo_DimProduct] ([ProductKey]),
  [CurrencyKey] INT REFERENCES [dbo_DimCurrency] ([CurrencyKey]),
  [OrderDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [ShipDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [DueDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [SalesOrderNumber] NVARCHAR(255)  -- degenerate,
  [SalesOrderLineNumber] INT  -- degenerate,
  [CarrierTrackingNumber] NVARCHAR(255)  -- degenerate,
  [CustomerPONumber] NVARCHAR(255)  -- degenerate,
  [Reseller Sales Amount] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Reseller Order Quantity] INT  -- sum,
  [Reseller Extended Amount] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Reseller Tax Amount] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Reseller Freight Cost] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Discount Amount] FLOAT  -- sum [calc: unresolved],
  [Reseller Unit Price] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Unit Price Discount Percent] FLOAT  -- none,
  [Reseller Total Product Cost] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Reseller Standard Product Cost] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Reseller Transaction Count] DECIMAL(19,4)  -- count
);

CREATE TABLE [Reseller Orders] (
  [ResellerKey] INT REFERENCES [dbo_DimReseller] ([ResellerKey]),
  [EmployeeKey] INT REFERENCES [dbo_DimEmployee] ([EmployeeKey]),
  [PromotionKey] INT REFERENCES [dbo_DimPromotion] ([PromotionKey]),
  [SalesTerritoryKey] NVARCHAR(255) REFERENCES [dbo_DimSalesTerritory] ([SalesTerritoryKey]),
  [ProductKey] INT REFERENCES [dbo_DimProduct] ([ProductKey]),
  [CurrencyKey] INT REFERENCES [dbo_DimCurrency] ([CurrencyKey]),
  [OrderDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [ShipDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [DueDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [SalesOrderNumber] NVARCHAR(255)  -- degenerate,
  [SalesOrderLineNumber] INT  -- degenerate,
  [CarrierTrackingNumber] NVARCHAR(255)  -- degenerate,
  [CustomerPONumber] NVARCHAR(255)  -- degenerate,
  [Reseller Order Count] NVARCHAR(255)  -- count_distinct
);

CREATE TABLE [Fact Sales Summary] (
  [ProductKey] INT REFERENCES [dbo_DimProduct] ([ProductKey]),
  [PromotionKey] INT REFERENCES [dbo_DimPromotion] ([PromotionKey]),
  [SalesTerritoryKey] NVARCHAR(255) REFERENCES [dbo_DimSalesTerritory] ([SalesTerritoryKey]),
  [SalesChannel] NVARCHAR(255) REFERENCES [FactSalesSummary] ([SalesChannel]),
  [CurrencyKey] INT REFERENCES [dbo_DimCurrency] ([CurrencyKey]),
  [OrderDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [ShipDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [DueDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [SalesOrderNumber] NVARCHAR(255)  -- degenerate,
  [SalesOrderLineNumber] INT  -- degenerate,
  [CarrierTrackingNumber] NVARCHAR(255)  -- degenerate,
  [CustomerPONumber] NVARCHAR(255)  -- degenerate,
  [Order Quantity] INT  -- sum,
  [Unit Price] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Extended Amount] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Standard Product Cost] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Total Product Cost] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Sales Amount] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Tax Amount] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Freight Cost] DECIMAL(19,4)  -- sum [calc: unresolved],
  [Transaction Count] DECIMAL(19,4)  -- count
);

CREATE TABLE [Sales Summary] (
  [ProductKey] INT REFERENCES [dbo_DimProduct] ([ProductKey]),
  [PromotionKey] INT REFERENCES [dbo_DimPromotion] ([PromotionKey]),
  [SalesTerritoryKey] NVARCHAR(255) REFERENCES [dbo_DimSalesTerritory] ([SalesTerritoryKey]),
  [SalesChannel] NVARCHAR(255) REFERENCES [FactSalesSummary] ([SalesChannel]),
  [CurrencyKey] INT REFERENCES [dbo_DimCurrency] ([CurrencyKey]),
  [OrderDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [ShipDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [DueDateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [SalesOrderNumber] NVARCHAR(255)  -- degenerate,
  [SalesOrderLineNumber] INT  -- degenerate,
  [CarrierTrackingNumber] NVARCHAR(255)  -- degenerate,
  [CustomerPONumber] NVARCHAR(255)  -- degenerate,
  [Order Count] NVARCHAR(255)  -- count_distinct
);

CREATE TABLE [Fact Sales Quota] (
  [EmployeeKey] INT REFERENCES [dbo_DimEmployee] ([EmployeeKey]),
  [CalendarYear] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [Sales Amount Quota] FLOAT  -- sum
);

CREATE TABLE [Fact Finance] (
  [ScenarioKey] INT REFERENCES [dbo_DimScenario] ([ScenarioKey]),
  [OrganizationKey] INT REFERENCES [dbo_DimOrganization] ([OrganizationKey]),
  [DepartmentGroupKey] INT REFERENCES [dbo_DimDepartmentGroup] ([DepartmentGroupKey]),
  [AccountKey] INT REFERENCES [dbo_DimAccount] ([AccountKey]),
  [DateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [Amount] FLOAT  -- none
);

CREATE TABLE [Fact Currency Rate] (
  [CurrencyKey] INT REFERENCES [DimDestinationCurrency] ([CurrencyKey]),
  [DateKey] INT REFERENCES [dbo_DimTime] ([DateKey]),
  [Average Rate] FLOAT  -- none,
  [End of Day Rate] FLOAT  -- none
);

-- bridge Fact Currency Rate: Fact Internet Sales 1 <-> DimDestinationCurrency
CREATE TABLE BridgeDimDestinationCurrency (
  [DateKey] INT  -- fact side,
  [CurrencyKey] INT  -- dim side
);

-- bridge Fact Internet Sales Reason: Fact Internet Sales 1 <-> dbo_DimSalesReason
CREATE TABLE BridgeDimSalesReason (
  [SalesOrderNumber] NVARCHAR(255)  -- fact side,
  [SalesReasonKey] INT  -- dim side
);

-- columns without type info (generated/unmapped), placeholders used: Internet Transaction Count, Level1, Level2, Reseller Transaction Count, Sales Reason Count, Transaction Count
