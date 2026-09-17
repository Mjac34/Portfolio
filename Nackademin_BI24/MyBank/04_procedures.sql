/* ============================================================
   MyBank - 04_procedures.sql
   Stored procedures. Run order: 4 of 5
   ============================================================ */

USE MyBank;
GO

/* ------------------------------------------------------------
   GetCustomerBalance - total balance across a customer's accounts
   ------------------------------------------------------------ */
CREATE PROCEDURE GetCustomerBalance
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT c.CustomerID, c.FirstName, c.LastName, SUM(a.Balance) AS TotalBalance
    FROM Customer c
    JOIN Disposition d ON c.CustomerID = d.CustomerID
    JOIN Account a ON d.AccountID = a.AccountID
    WHERE c.CustomerID = @CustomerID
    GROUP BY c.CustomerID, c.FirstName, c.LastName;
END;
GO

/* ------------------------------------------------------------
   GetTransactionReport - filterable transaction report.
   All parameters optional (NULL = no filter on that column).
   ------------------------------------------------------------ */
CREATE PROCEDURE GetTransactionReport
    @CustomerID INT = NULL,
    @StartDate DATE = NULL,
    @EndDate DATE = NULL,
    @TransactionType VARCHAR(20) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT t.TransactionID, c.CustomerID, c.FirstName, c.LastName,
           t.TransactionType, t.Amount, t.TransactionDate
    FROM Transactions t
    JOIN Account a ON t.AccountID = a.AccountID
    JOIN Disposition d ON a.AccountID = d.AccountID
    JOIN Customer c ON d.CustomerID = c.CustomerID
    WHERE (@CustomerID IS NULL OR c.CustomerID = @CustomerID)
      AND (@StartDate IS NULL OR t.TransactionDate >= @StartDate)
      AND (@EndDate IS NULL OR t.TransactionDate <= @EndDate)
      AND (@TransactionType IS NULL OR t.TransactionType = @TransactionType)
    ORDER BY t.TransactionDate DESC;
END;
GO

/* ------------------------------------------------------------
   GenerateHistoricalSalaries
   Inserts one 'Monthly Salary' deposit per checking account and
   month (on the 25th), from the account's creation month up to
   today. Idempotent: already generated months are skipped.
   Updates balances only by the amounts inserted in this run.
   ------------------------------------------------------------ */
CREATE PROCEDURE GenerateHistoricalSalaries
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewSalaries TABLE (AccountID INT, Amount DECIMAL(10,2));

    BEGIN TRY
        BEGIN TRAN;

        INSERT INTO Transactions (AccountID, PaymentMethod, TransactionType, Amount, TransactionDate, Description, TransactionStatus)
        OUTPUT INSERTED.AccountID, INSERTED.Amount INTO @NewSalaries
        SELECT
            a.AccountID,
            'Bank Transfer',
            'Deposit',
            c.Income,
            DATEADD(DAY, 25, EOMONTH(a.CreationDate, n.number)),  -- 25th each month
            'Monthly Salary',
            'Completed'
        FROM Account a
        JOIN Disposition d ON a.AccountID = d.AccountID AND d.AccountRole = 'Owner'
        JOIN Customer c ON d.CustomerID = c.CustomerID
        CROSS APPLY (
            SELECT TOP (DATEDIFF(MONTH, a.CreationDate, GETDATE()) + 1)
                ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS number
            FROM master.sys.all_objects
        ) n
        WHERE a.AccountType = 'Checking Account'
          AND c.Income IS NOT NULL
          AND DATEADD(DAY, 25, EOMONTH(a.CreationDate, n.number)) <= GETDATE()
          AND NOT EXISTS (
              SELECT 1
              FROM Transactions t
              WHERE t.AccountID = a.AccountID
                AND t.Description = 'Monthly Salary'
                AND YEAR(t.TransactionDate) = YEAR(DATEADD(DAY, 25, EOMONTH(a.CreationDate, n.number)))
                AND MONTH(t.TransactionDate) = MONTH(DATEADD(DAY, 25, EOMONTH(a.CreationDate, n.number)))
          );

        -- Add only the salary amounts inserted by this run
        UPDATE a
        SET a.Balance = a.Balance + s.NewSalary
        FROM Account a
        JOIN (
            SELECT AccountID, SUM(Amount) AS NewSalary
            FROM @NewSalaries
            GROUP BY AccountID
        ) s ON a.AccountID = s.AccountID;

        COMMIT TRAN;

        DECLARE @Inserted INT = (SELECT COUNT(*) FROM @NewSalaries);
        PRINT CONCAT('GenerateHistoricalSalaries: ', @Inserted, ' salary transactions created.');
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        THROW;
    END CATCH
END;
GO

/* ------------------------------------------------------------
   GrantLoanWithTerms
   Grants a loan after automatic credit checks (age, income,
   existing loans, balance). Runs atomically: loan, borrower
   links, disbursement transaction and balance update either
   all succeed or nothing is written.
   ------------------------------------------------------------ */
CREATE PROCEDURE GrantLoanWithTerms
    @CustomerID1 INT,
    @CustomerID2 INT = NULL,
    @LoanAmount DECIMAL(10,2),
    @LoanType VARCHAR(20),
    @InterestRate DECIMAL(5,2) = 3.5,
    @LoanTermMonths INT = 120
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @AccountID INT, @LoanID INT, @TotalIncome DECIMAL(10,2),
            @ExistingLoans INT, @AccountBalance DECIMAL(10,2),
            @DateOfBirth DATE;

    -- Input validation
    IF NOT EXISTS (SELECT 1 FROM Customer WHERE CustomerID = @CustomerID1 AND IsDeleted = 0)
        THROW 50001, 'Loan denied: primary customer does not exist.', 1;

    IF @CustomerID2 IS NOT NULL AND
       (@CustomerID2 = @CustomerID1 OR
        NOT EXISTS (SELECT 1 FROM Customer WHERE CustomerID = @CustomerID2 AND IsDeleted = 0))
        THROW 50002, 'Loan denied: invalid co-borrower.', 1;

    -- Pick the customer's checking account (fallback: oldest account)
    SELECT TOP 1 @AccountID = a.AccountID, @AccountBalance = a.Balance
    FROM Account a
    JOIN Disposition d ON a.AccountID = d.AccountID
    WHERE d.CustomerID = @CustomerID1 AND d.AccountRole = 'Owner'
    ORDER BY CASE WHEN a.AccountType = 'Checking Account' THEN 0 ELSE 1 END, a.CreationDate;

    IF @AccountID IS NULL
        THROW 50003, 'Loan denied: customer has no account.', 1;

    -- Exact age check: must have turned 18
    SELECT @DateOfBirth = BirthDate FROM Customer WHERE CustomerID = @CustomerID1;
    IF @DateOfBirth IS NULL OR DATEADD(YEAR, 18, @DateOfBirth) > CAST(GETDATE() AS DATE)
        THROW 50004, 'Loan denied: customer must be at least 18 years old.', 1;

    -- Combined income of applicant(s)
    SELECT @TotalIncome = COALESCE(SUM(Income), 0)
    FROM Customer
    WHERE CustomerID IN (@CustomerID1, @CustomerID2);

    IF @TotalIncome < (@LoanAmount / 3)
        THROW 50005, 'Loan denied: insufficient combined income.', 1;

    SELECT @ExistingLoans = COUNT(*) FROM LoanDispositions WHERE CustomerID = @CustomerID1;
    IF @ExistingLoans > 3
        THROW 50006, 'Loan denied: too many existing loans.', 1;

    IF @AccountBalance < (@LoanAmount * 0.05)
        THROW 50007, 'Loan denied: insufficient account balance.', 1;

    -- All checks passed: create the loan atomically
    BEGIN TRY
        BEGIN TRAN;

        INSERT INTO Loan (AccountID, LoanType, LoanAmount, LoanDate, InterestRate, LoanTermMonths)
        VALUES (@AccountID, @LoanType, @LoanAmount, GETDATE(), @InterestRate, @LoanTermMonths);

        SET @LoanID = SCOPE_IDENTITY();

        INSERT INTO LoanDispositions (LoanID, CustomerID, LoanRole)
        VALUES (@LoanID, @CustomerID1, 'Primary');

        IF @CustomerID2 IS NOT NULL
            INSERT INTO LoanDispositions (LoanID, CustomerID, LoanRole)
            VALUES (@LoanID, @CustomerID2, 'Co-Borrower');

        -- Book the disbursement so the ledger matches the balance change
        INSERT INTO Transactions (AccountID, PaymentMethod, TransactionType, Amount, TransactionDate, Description, TransactionStatus)
        VALUES (@AccountID, 'Bank Transfer', 'Deposit', @LoanAmount, GETDATE(), 'Loan Disbursement', 'Completed');

        UPDATE Account
        SET Balance = Balance + @LoanAmount
        WHERE AccountID = @AccountID;

        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        THROW;
    END CATCH

    SELECT @LoanID AS NewLoanID;
    PRINT 'Loan granted and deposited into account.';
END;
GO

/* ------------------------------------------------------------
   ProcessMonthlyLoanPayments
   Creates one 'Monthly Loan Payment' transaction per elapsed
   month (annuity amount), capped at the loan term. Idempotent:
   months already booked are skipped. Balances are reduced only
   for payments created in this run. Atomic per call.
   ------------------------------------------------------------ */
CREATE PROCEDURE ProcessMonthlyLoanPayments
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewPayments TABLE (AccountID INT, Amount DECIMAL(10,2), TransactionStatus VARCHAR(10));

    BEGIN TRY
        BEGIN TRAN;

        ;WITH LoanPayments AS (
            SELECT
                l.LoanID,
                l.AccountID,
                l.LoanAmount,
                l.InterestRate,
                l.LoanTermMonths,
                l.LoanDate,
                DATEDIFF(MONTH, l.LoanDate, GETDATE()) AS MonthsElapsed,
                -- Annuity payment: amount * r / (1 - (1 + r)^-n)
                (l.LoanAmount * (l.InterestRate / 12 / 100)) /
                (1 - POWER(1 + (l.InterestRate / 12 / 100), -l.LoanTermMonths)) AS MonthlyPayment
            FROM Loan l
            WHERE l.IsDeleted = 0
        )
        INSERT INTO Transactions (AccountID, PaymentMethod, TransactionType, Amount, TransactionDate, Description, TransactionStatus)
        OUTPUT INSERTED.AccountID, INSERTED.Amount, INSERTED.TransactionStatus INTO @NewPayments
        SELECT
            lp.AccountID,
            'Direct Debit',
            'Loan Payment',
            lp.MonthlyPayment,
            DATEADD(MONTH, n.number, lp.LoanDate),
            'Monthly Loan Payment',
            CASE WHEN a.Balance >= lp.MonthlyPayment THEN 'Completed' ELSE 'Failed' END
        FROM LoanPayments lp
        CROSS APPLY (
            SELECT TOP (CASE WHEN lp.MonthsElapsed > lp.LoanTermMonths
                             THEN lp.LoanTermMonths ELSE lp.MonthsElapsed END)
                ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS number
            FROM master.dbo.spt_values
        ) n
        JOIN Account a ON lp.AccountID = a.AccountID
        WHERE lp.MonthsElapsed > 0
          AND NOT EXISTS (
              SELECT 1
              FROM Transactions t
              WHERE t.AccountID = lp.AccountID
                AND t.Description = 'Monthly Loan Payment'
                AND YEAR(t.TransactionDate) = YEAR(DATEADD(MONTH, n.number, lp.LoanDate))
                AND MONTH(t.TransactionDate) = MONTH(DATEADD(MONTH, n.number, lp.LoanDate))
          );

        -- Reduce balances only by payments created (and completed) in this run
        UPDATE a
        SET a.Balance = a.Balance - p.NewPayments
        FROM Account a
        JOIN (
            SELECT AccountID, SUM(Amount) AS NewPayments
            FROM @NewPayments
            WHERE TransactionStatus = 'Completed'
            GROUP BY AccountID
        ) p ON a.AccountID = p.AccountID;

        COMMIT TRAN;

        DECLARE @Inserted INT = (SELECT COUNT(*) FROM @NewPayments),
                @Failed INT = (SELECT COUNT(*) FROM @NewPayments WHERE TransactionStatus = 'Failed');
        PRINT CONCAT('ProcessMonthlyLoanPayments: ', @Inserted, ' payments created (', @Failed, ' failed - insufficient funds).');
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        THROW;
    END CATCH
END;
GO
