USE master
IF EXISTS(SELECT * FROM sys.databases WHERE name = 'ETL_Assignment1')
BEGIN
   ALTER DATABASE ETL_Assignment1 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
   DROP DATABASE [ETL_Assignment1]
 ;
END
-- Please run the following step 1 to 3 before starting the assignment 1
CREATE DATABASE ETL_Assignment1
COLLATE Latin1_General_CS_AS; -- Troublemaker! Different COLLATE from SQL Server generated errors when comparing/joining. See sp_ETLRun

USE ETL_Assignment1;
-- Verify whether the database is case sensitive
SELECT CASE WHEN 'A' = 'a' THEN 'NOT CASE SENSITIVE' ELSE 'CASE SENSITIVE' END;

-- STEP 1: Create reference tables and populate with sample data

-- 1. Interest Rates (monthly base rates)
CREATE TABLE InterestRates (
    RateID INT IDENTITY(1,1) PRIMARY KEY,
    EffectiveDate DATE NOT NULL,
    BaseInterestRate DECIMAL(5, 2) NOT NULL
);

INSERT INTO InterestRates (EffectiveDate, BaseInterestRate)
VALUES
  ('2025-04-01', 11.50),
  ('2025-05-01', 11.75);

-- 2. Energy Class Margin
CREATE TABLE EnergyClassMargin (
    EnergyClass VARCHAR(20) PRIMARY KEY,
    MarginRate DECIMAL(5, 2) NOT NULL
);

INSERT INTO EnergyClassMargin (EnergyClass, MarginRate)
VALUES
  ('Electric', 0.35),
  ('Hybrid',   0.50),
  ('Gasoline', 0.70),
  ('Diesel',   0.90);

-- 3. Credit Risk Tier Adjustments
CREATE TABLE CreditRiskTier (
    RiskTier VARCHAR(20) PRIMARY KEY,
    RiskAdjustment DECIMAL(5, 2) NOT NULL
);

INSERT INTO CreditRiskTier (RiskTier, RiskAdjustment)
VALUES
  ('Excellent', -0.40),
  ('Good', -0.15),
  ('Average', 0.25),
  ('Poor', 0.60);

-- 4. Depreciation Rates
CREATE TABLE DepreciationRates (
    MinYear INT,
    MaxYear INT,
    DepreciationRate DECIMAL(5,2)
);

INSERT INTO DepreciationRates (MinYear, MaxYear, DepreciationRate)
VALUES
  (0, 1, 0.10),
  (2, 3, 0.20),
  (4, 6, 0.35),
  (7, 99, 0.50);

-- STEP 2: Monthly Vehicle Data (Staging Table)

CREATE TABLE CarInformation_202505 (
    RecordID INT PRIMARY KEY,
    CarModel VARCHAR(100),
    EnergyClass VARCHAR(20),
    ManufactureYear INT,
    BasePrice DECIMAL(10,2),
    FileMonth DATE,
    CustomerRiskTier VARCHAR(20)
);

INSERT INTO CarInformation_202505
    (RecordID, CarModel, EnergyClass, ManufactureYear, BasePrice, FileMonth, CustomerRiskTier)
VALUES
    (1, 'EcoCar X1', 'Electric', 2023, 35000.00, '2025-05-01', 'Excellent'),
    (2, 'Speedster G2', 'Gasoline', 2020, 27000.00, '2025-05-01', 'Good'),
    (3, 'FamilyVan D3', 'Diesel', 2018, 22000.00, '2025-05-01', 'Average'),
    (4, 'Compact EV4', 'Electric', 2024, 32000.00, '2025-05-01', 'Poor'),
    (5, 'Hybrid Cruiser', 'Hybrid', 2021, 31000.00, '2025-05-01', 'Good');

-- STEP 3 The query from the business analyst

SELECT
    c.RecordID,
    c.CarModel,
    c.EnergyClass,
    c.ManufactureYear,
    c.BasePrice,
    c.CustomerRiskTier,
    -- Calculate Final Interest Rate
    ir.BaseInterestRate + ecm.MarginRate + crt.RiskAdjustment AS FinalInterestRate,
    -- Calculate Estimated Monthly Payment (simple interest-only formula)
    (c.BasePrice * (ir.BaseInterestRate + ecm.MarginRate + crt.RiskAdjustment) / 100) / 12 AS EstimatedMonthlyPayment,
    -- Calculate Depreciated Value based on vehicle age and matching depreciation rate
    c.BasePrice * (1 - dr.DepreciationRate) AS DepreciatedValue,
    -- Calculate Estimated Profit (basic model)
    (
        ((c.BasePrice * (ir.BaseInterestRate + ecm.MarginRate + crt.RiskAdjustment) / 100)) -
        (c.BasePrice - (c.BasePrice * (1 - dr.DepreciationRate)))
    ) AS EstimatedProfit,
    c.FileMonth
FROM CarInformation_202505 c
JOIN InterestRates ir
    ON YEAR(c.FileMonth) = YEAR(ir.EffectiveDate)
   AND MONTH(c.FileMonth) = MONTH(ir.EffectiveDate)
JOIN EnergyClassMargin ecm
    ON c.EnergyClass = ecm.EnergyClass
JOIN CreditRiskTier crt
    ON c.CustomerRiskTier = crt.RiskTier
JOIN DepreciationRates dr
    ON (YEAR(c.FileMonth) - c.ManufactureYear) BETWEEN dr.MinYear AND dr.MaxYear;

------------------------------------------------------------------------------------------------------------------------------
-- For your test
-- DROP TABLE CarInformation_202506;


CREATE TABLE CarInformation_202506 (
    RecordID INT PRIMARY KEY,
    CarModel VARCHAR(100),
    EnergyClass VARCHAR(20),
    ManufactureYear INT,
    BasePrice DECIMAL(10,2),
    FileMonth DATE,
    CustomerRiskTier VARCHAR(20)
);

-- DROP TABLE CarInformation_202506;
INSERT INTO CarInformation_202506
    (RecordID, CarModel, EnergyClass, ManufactureYear, BasePrice, FileMonth, CustomerRiskTier)
VALUES
    (1, 'EcoCar X1', 'Electric', 2023, 35000.00, '2025-06-01', 'Excellent'),
    (2, 'Speedster G2', 'Gasoline', 2020, 27000.00, '2025-06-01', 'Good'),
    (3, 'FamilyVan D3', 'Diesel', 2018, 21000.00, '2025-06-01', 'Average'),
    (4, 'Compact EV4', 'Electric', 2024, 32500.00, '2025-06-01', 'Excellent'),
    (5, 'Hybrid Cruiser', 'Hybrid', 2021, 31000.00, '2025-06-01', 'Good'),
    (6, 'VoltRunner X2', 'Electric', 2024, 36000.00, '2025-06-01', 'Excellent'),
    (7, 'CityDrive LX', 'Hybrid', 2022, 29500.00, '2025-06-01', 'Good'),
    (8, 'PowerTruck D9', 'Diesel', 2016, 28000.00, '2025-06-01', 'Average'),
    (9, 'SpeedKing G3', 'Gasoline', 2021, 25000.00, '2025-06-01', 'Poor'),
    (10, 'EcoFlex Mini', 'Electric', 2023, 33000.00, '2025-06-01', 'Good');

INSERT INTO InterestRates (EffectiveDate, BaseInterestRate)
VALUES
  ('2025-06-01', 12.10);

-- Create logging table to track execution details
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ETL_Log') -- If logging table not exist, create it
CREATE TABLE ETL_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    LogDate DATETIME DEFAULT GETDATE(),
    Message NVARCHAR(1000),
    Status VARCHAR(20) -- Info, Warning, Error
);


-- Stored Procedure: sp_RunETL
-- Purpose: Automates ETL process for Assignment 1, processing monthly vehicle data
-- Inputs: @FileMonth (DATE) - the month to process
-- Outputs: Creates LoanProfitEstimates_yyyymm table with enriched data
-- Features: Dynamic table selection, data validation, interest rate fallback, logging, email 
GO

CREATE PROCEDURE sp_RunETL
    @FileMonth DATE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Declare variables
        DECLARE @YearMonth NVARCHAR(6) = FORMAT(@FileMonth, 'yyyyMM'); -- e.g., '202505'
        DECLARE @SourceTable NVARCHAR(128) = 'CarInformation_' + @YearMonth;
        DECLARE @TargetTable NVARCHAR(128) = 'LoanProfitEstimates_' + @YearMonth;
        DECLARE @SQL NVARCHAR(MAX);
        DECLARE @ErrorMessage NVARCHAR(MAX);
        DECLARE @RowCount INT;
        DECLARE @BaseInterestRate DECIMAL(5,2);

        -- Step 1: Log start and verify source table existence
        INSERT INTO ETL_Log (Message, Status)
        VALUES ('Starting ETL for ' + CONVERT(VARCHAR, @FileMonth, 120), 'Info');

        IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = @SourceTable)
        BEGIN
            SET @ErrorMessage = 'Source table ' + @SourceTable + ' missing for ' + CONVERT(VARCHAR, @FileMonth, 120) + '.';
            INSERT INTO ETL_Log (Message, Status)
            VALUES (@ErrorMessage, 'Error');
            RAISERROR (@ErrorMessage, 16, 1);
            RETURN;
        END;

        -- Step 2: Validate and transform data
        -- Create temporary table for validated data (staging)
        IF OBJECT_ID('tempdb..#ValidatedCarData') IS NOT NULL DROP TABLE #ValidatedCarData;
        CREATE TABLE #ValidatedCarData (
            RecordID INT PRIMARY KEY,
            CarModel VARCHAR(100) COLLATE Latin1_General_CS_AS, -- Added COLLATE to remove error due to database using Latin1 and server using a different collation
            EnergyClass VARCHAR(20) COLLATE Latin1_General_CS_AS,
            ManufactureYear INT,
            BasePrice DECIMAL(10,2),
            FileMonth DATE,
            CustomerRiskTier VARCHAR(20) COLLATE Latin1_General_CS_AS
        );

        -- Validate and transform data from source table
        SET @SQL = N'
        INSERT INTO #ValidatedCarData (RecordID, CarModel, EnergyClass, ManufactureYear, BasePrice, FileMonth, CustomerRiskTier)
        SELECT 
            RecordID,
            ISNULL(CarModel, ''Unknown''), -- Handle NULL values
            CASE 
                WHEN EnergyClass IN (SELECT EnergyClass FROM EnergyClassMargin) THEN EnergyClass
                ELSE ''Unknown'' -- Invalid EnergyClass
            END,
            CASE 
                WHEN ManufactureYear BETWEEN 1900 AND YEAR(@FileMonth) THEN ManufactureYear
                ELSE YEAR(@FileMonth) -- Ensure valid year
            END,
            CASE 
                WHEN BasePrice > 0 THEN BasePrice
                ELSE 0 -- Ensure positive price
            END,
            @FileMonth, -- Set correct FileMonth
            CASE 
                WHEN CustomerRiskTier IN (SELECT RiskTier FROM CreditRiskTier) THEN CustomerRiskTier
                ELSE ''Average'' -- Invalid RiskTier
            END
        FROM ' + QUOTENAME(@SourceTable) + ';';

        EXEC sp_executesql @SQL, N'@FileMonth DATE', @FileMonth;
        SET @RowCount = @@ROWCOUNT;
        INSERT INTO ETL_Log (Message, Status)
        VALUES ('Validated ' + CAST(@RowCount AS NVARCHAR(10)) + ' rows from ' + @SourceTable, 'Info');

        -- Log invalid rows for data quality monitoring
        SET @SQL = N'
        SELECT RecordID, CarModel, EnergyClass, ManufactureYear, BasePrice, FileMonth, CustomerRiskTier
        FROM ' + QUOTENAME(@SourceTable) + '
        WHERE EnergyClass NOT IN (SELECT EnergyClass FROM EnergyClassMargin)
           OR CustomerRiskTier NOT IN (SELECT RiskTier FROM CreditRiskTier)
           OR ManufactureYear > YEAR(@FileMonth)
           OR BasePrice <= 0;';

        DECLARE @InvalidRows TABLE (RecordID INT, CarModel VARCHAR(100), EnergyClass VARCHAR(20), ManufactureYear INT, BasePrice DECIMAL(10,2), FileMonth DATE, CustomerRiskTier VARCHAR(20));
        INSERT INTO @InvalidRows EXEC sp_executesql @SQL, N'@FileMonth DATE', @FileMonth;

        IF EXISTS (SELECT 1 FROM @InvalidRows)
        BEGIN
            SET @RowCount = (SELECT COUNT(*) FROM @InvalidRows);
            INSERT INTO ETL_Log (Message, Status)
            VALUES ('Found ' + CAST(@RowCount AS NVARCHAR(10)) + ' invalid rows in ' + @SourceTable, 'Warning');
        END;

        -- Step 3: Fetch interest rate with fallback logic
        SELECT @BaseInterestRate = BaseInterestRate
        FROM InterestRates
        WHERE EffectiveDate = @FileMonth;

        IF @BaseInterestRate IS NULL
        BEGIN
            SELECT TOP 1 @BaseInterestRate = BaseInterestRate
            FROM InterestRates
            WHERE EffectiveDate <= @FileMonth
            ORDER BY EffectiveDate DESC;

            IF @BaseInterestRate IS NOT NULL
            BEGIN
                INSERT INTO ETL_Log (Message, Status)
                VALUES ('Base interest rate missing for ' + CONVERT(VARCHAR, @FileMonth, 120) + '. Using fallback rate: ' + CAST(@BaseInterestRate AS VARCHAR), 'Warning');
            END
            ELSE
            BEGIN
                SET @ErrorMessage = 'No interest rate found for ' + CONVERT(VARCHAR, @FileMonth, 120) + '.';
                INSERT INTO ETL_Log (Message, Status)
                VALUES (@ErrorMessage, 'Error');
                RAISERROR (@ErrorMessage, 16, 1);
                RETURN;
            END;
        END
        ELSE
        BEGIN
            INSERT INTO ETL_Log (Message, Status)
            VALUES ('Using interest rate: ' + CAST(@BaseInterestRate AS VARCHAR) + ' for ' + CONVERT(VARCHAR, @FileMonth, 120), 'Info');
        END;

        -- Step 4: Create and populate target table
        SET @SQL = N'
        IF OBJECT_ID(''' + @TargetTable + ''') IS NOT NULL DROP TABLE ' + QUOTENAME(@TargetTable) + ';
        CREATE TABLE ' + QUOTENAME(@TargetTable) + ' (
            RecordID INT PRIMARY KEY,
            CarModel VARCHAR(100),
            EnergyClass VARCHAR(20),
            ManufactureYear INT,
            BasePrice DECIMAL(10,2),
            CustomerRiskTier VARCHAR(20),
            FinalInterestRate DECIMAL(5,2),
            EstimatedMonthlyPayment DECIMAL(10,2),
            DepreciatedValue DECIMAL(10,2),
            EstimatedProfit DECIMAL(10,2),
            FileMonth DATE
        );';

        EXEC sp_executesql @SQL;
        INSERT INTO ETL_Log (Message, Status)
        VALUES ('Created table ' + @TargetTable, 'Info');

        -- Populate target table with enriched data
        SET @SQL = N'
        INSERT INTO ' + QUOTENAME(@TargetTable) + '
            (RecordID, CarModel, EnergyClass, ManufactureYear, BasePrice, CustomerRiskTier, 
             FinalInterestRate, EstimatedMonthlyPayment, DepreciatedValue, EstimatedProfit, FileMonth)
        SELECT
            c.RecordID,
            c.CarModel,
            c.EnergyClass,
            c.ManufactureYear,
            c.BasePrice,
            c.CustomerRiskTier,
            @BaseInterestRate + ecm.MarginRate + crt.RiskAdjustment AS FinalInterestRate,
            (c.BasePrice * (@BaseInterestRate + ecm.MarginRate + crt.RiskAdjustment) / 100) / 12 AS EstimatedMonthlyPayment,
            c.BasePrice * (1 - dr.DepreciationRate) AS DepreciatedValue,
            (
                (c.BasePrice * (@BaseInterestRate + ecm.MarginRate + crt.RiskAdjustment) / 100) -
                (c.BasePrice - (c.BasePrice * (1 - dr.DepreciationRate)))
            ) AS EstimatedProfit,
            c.FileMonth
        FROM #ValidatedCarData c
        JOIN EnergyClassMargin ecm ON c.EnergyClass = ecm.EnergyClass
        JOIN CreditRiskTier crt ON c.CustomerRiskTier = crt.RiskTier
        JOIN DepreciationRates dr ON (YEAR(c.FileMonth) - c.ManufactureYear) BETWEEN dr.MinYear AND dr.MaxYear;';

        EXEC sp_executesql @SQL, N'@BaseInterestRate DECIMAL(5,2)', @BaseInterestRate;
        SET @RowCount = @@ROWCOUNT;
        INSERT INTO ETL_Log (Message, Status)
        VALUES ('Loaded ' + CAST(@RowCount AS NVARCHAR(10)) + ' rows into ' + @TargetTable, 'Info');

        -- Step 5: Send confirmation email
		-- Attempts to send an email via sp_send_dbmail with ETL job details (completion date, rows processed, output table).
		-- Checks for the existence of 'YourMailProfile' in msdb.dbo.sysmail_profile.
		-- If the profile is configured, sends the email to the specified recipient.
		-- If not configured (e.g., in environments without Database Mail), logs a warning in ETL_Log to ensure the job completes successfully.
        DECLARE @EmailBody NVARCHAR(1000) = 'ETL job completed for ' + CONVERT(VARCHAR, @FileMonth, 120) + CHAR(13) +
                                           'Rows processed: ' + CAST(@RowCount AS NVARCHAR(10)) + CHAR(13) +
                                           'Output table: ' + @TargetTable;
        DECLARE @Subject NVARCHAR(100) = 'ETL Job Completion for ' + @YearMonth;

        IF EXISTS (SELECT 1 FROM msdb.dbo.sysmail_profile WHERE name = 'YourMailProfile')
        BEGIN
            EXEC msdb.dbo.sp_send_dbmail
                @profile_name = 'YourMailProfile', -- Replace with your mail profile
                @recipients = 'analyst@bank.com', -- Replace with recipient's email
                @subject = @Subject,
                @body = @EmailBody;
            INSERT INTO ETL_Log (Message, Status)
            VALUES ('Sent email notification for ' + @TargetTable, 'Info');
        END
        ELSE
        BEGIN
            INSERT INTO ETL_Log (Message, Status)
            VALUES ('Skipped email: Mail profile not configured', 'Warning');
        END;

        -- Log completion
        INSERT INTO ETL_Log (Message, Status)
        VALUES ('ETL completed for ' + CONVERT(VARCHAR, @FileMonth, 120), 'Info');
    END TRY
    BEGIN CATCH
        SET @ErrorMessage = 'ETL failed for ' + CONVERT(VARCHAR, @FileMonth, 120) + ': ' + ERROR_MESSAGE();
        INSERT INTO ETL_Log (Message, Status)
        VALUES (@ErrorMessage, 'Error');
        THROW;
    END CATCH;
END;
GO

-- Test for May 2025
EXEC sp_RunETL @FileMonth = '20250501';
SELECT * FROM LoanProfitEstimates_202505;
SELECT * FROM ETL_Log;

-- Test for June 2025
EXEC sp_RunETL @FileMonth = '20250601';
SELECT * FROM LoanProfitEstimates_202506;
SELECT * FROM ETL_Log;


