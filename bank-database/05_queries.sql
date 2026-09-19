/* ============================================================
   MyBank - 05_queries.sql
   Demo executions + showcase queries.
   Run order: 5 of 5
   ============================================================ */

USE MyBank;
GO

/* ====================== DEMO: PROCEDURES ====================== */

-- Total balance for one customer
EXEC GetCustomerBalance @CustomerID = 1;

-- Transaction report: all parameters optional
EXEC GetTransactionReport @CustomerID = 1, @TransactionType = 'Deposit';
EXEC GetTransactionReport;  -- everything, unfiltered

-- Backfill salaries and loan payments (both idempotent - safe to rerun)
EXEC GenerateHistoricalSalaries;
EXEC ProcessMonthlyLoanPayments;
EXEC ProcessMonthlyLoanPayments;  -- second run creates 0 new rows

-- Loan applications: one approved path, one solo applicant with co-borrower
EXEC GrantLoanWithTerms
    @CustomerID1 = 1,
    @CustomerID2 = 2,
    @LoanAmount = 50000,
    @LoanType = 'Car Loan',
    @InterestRate = 3.9,
    @LoanTermMonths = 72;

-- Expected to fail: applicant under 18 (customer 7, born 2014)
-- EXEC GrantLoanWithTerms @CustomerID1 = 7, @LoanAmount = 10000, @LoanType = 'Personal Loan';

/* ====================== SHOWCASE QUERIES ====================== */

-- 1. Running balance per account (window function)
SELECT
    a.AccountNumber,
    t.TransactionDate,
    t.Description,
    t.Amount,
    t.TransactionType,
    SUM(CASE WHEN t.TransactionType IN ('Deposit') THEN t.Amount ELSE -t.Amount END)
        OVER (PARTITION BY t.AccountID ORDER BY t.TransactionDate, t.TransactionID
              ROWS UNBOUNDED PRECEDING) AS RunningBalance
FROM Transactions t
JOIN Account a ON t.AccountID = a.AccountID
WHERE t.TransactionStatus = 'Completed'
ORDER BY a.AccountNumber, t.TransactionDate;

-- 2. Customers ranked by total balance (RANK + aggregation)
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    SUM(a.Balance) AS TotalBalance,
    RANK() OVER (ORDER BY SUM(a.Balance) DESC) AS BalanceRank
FROM Customer c
JOIN Disposition d ON c.CustomerID = d.CustomerID
JOIN Account a ON d.AccountID = a.AccountID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY BalanceRank;

-- 3. Monthly cash flow per account (CTE + conditional aggregation)
WITH MonthlyFlow AS (
    SELECT
        AccountID,
        YEAR(TransactionDate) AS Yr,
        MONTH(TransactionDate) AS Mo,
        SUM(CASE WHEN TransactionType = 'Deposit' THEN Amount ELSE 0 END) AS MoneyIn,
        SUM(CASE WHEN TransactionType <> 'Deposit' THEN Amount ELSE 0 END) AS MoneyOut
    FROM Transactions
    WHERE TransactionStatus = 'Completed'
    GROUP BY AccountID, YEAR(TransactionDate), MONTH(TransactionDate)
)
SELECT AccountID, Yr, Mo, MoneyIn, MoneyOut, MoneyIn - MoneyOut AS NetFlow
FROM MonthlyFlow
ORDER BY AccountID, Yr, Mo;

-- 4. Debt-to-income: total loans vs yearly income per borrower
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Income,
    SUM(l.LoanAmount) AS TotalDebt,
    CAST(SUM(l.LoanAmount) / NULLIF(c.Income * 12, 0) AS DECIMAL(5,2)) AS DebtToIncomeRatio
FROM Customer c
JOIN LoanDispositions ld ON c.CustomerID = ld.CustomerID
JOIN Loan l ON ld.LoanID = l.LoanID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.Income
ORDER BY DebtToIncomeRatio DESC;

-- 5. Card portfolio health (GROUP BY + FILTER-style conditional counts)
SELECT
    CardStatus,
    COUNT(*) AS Cards,
    SUM(CASE WHEN CreditLimit > 0 THEN 1 ELSE 0 END) AS WithCreditLimit,
    SUM(CreditLimit) AS TotalCreditLimit
FROM Cards
WHERE IsDeleted = 0
GROUP BY CardStatus;
GO
