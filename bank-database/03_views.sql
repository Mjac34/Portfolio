/* ============================================================
   MyBank - 03_views.sql
   Reporting views. Run order: 3 of 5
   ============================================================ */

USE MyBank;
GO

-- Customers holding at least one account with a positive balance
CREATE VIEW ActiveCustomers AS
SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName
FROM Customer c
JOIN Disposition d ON c.CustomerID = d.CustomerID
JOIN Account a ON d.AccountID = a.AccountID
WHERE a.Balance > 0 AND c.IsDeleted = 0;
GO

-- Number of customers that have a card connected to a disposition
CREATE VIEW CustomersWithCreditCards AS
SELECT COUNT(DISTINCT CustomerID) AS CreditCardUsers
FROM Disposition
WHERE CardID IS NOT NULL;
GO

-- Customers holding more than one account
CREATE VIEW CustomersWithMultipleAccounts AS
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(d.AccountID) AS AccountCount
FROM Customer c
JOIN Disposition d ON c.CustomerID = d.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(d.AccountID) > 1;
GO

-- Total loan amount per customer (via LoanDispositions - the actual borrowers)
CREATE VIEW CustomersWithLoans AS
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(l.LoanAmount) AS TotalLoan
FROM Customer c
JOIN LoanDispositions ld ON c.CustomerID = ld.CustomerID
JOIN Loan l ON ld.LoanID = l.LoanID
GROUP BY c.CustomerID, c.FirstName, c.LastName;
GO

-- Transaction count per account for the last month
CREATE VIEW MostTransactionsLastMonth AS
SELECT AccountID, COUNT(TransactionID) AS TransactionCount
FROM Transactions
WHERE TransactionDate >= DATEADD(MONTH, -1, GETDATE())
GROUP BY AccountID;
GO

-- Usage count per payment method
CREATE VIEW MostUsedPaymentMethod AS
SELECT PaymentMethod, COUNT(*) AS UsageCount
FROM Transactions
GROUP BY PaymentMethod;
GO

-- Loans reaching their calculated maturity date within the next 24 months
CREATE VIEW LoansExpiringSoon AS
SELECT
    l.LoanID,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    l.LoanType,
    l.LoanAmount,
    l.LoanDate,
    DATEADD(MONTH, l.LoanTermMonths, l.LoanDate) AS MaturityDate,
    DATEDIFF(MONTH, GETDATE(), DATEADD(MONTH, l.LoanTermMonths, l.LoanDate)) AS MonthsRemaining
FROM Loan l
JOIN LoanDispositions ld ON l.LoanID = ld.LoanID
JOIN Customer c ON ld.CustomerID = c.CustomerID
WHERE DATEADD(MONTH, l.LoanTermMonths, l.LoanDate)
      BETWEEN GETDATE() AND DATEADD(MONTH, 24, GETDATE());
GO

-- Loans with an outstanding balance (original amount minus completed payments)
CREATE VIEW UnpaidLoans AS
SELECT
    l.LoanID,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    l.LoanType,
    l.LoanAmount,
    COALESCE(SUM(t.Amount), 0) AS TotalPaid,
    l.LoanAmount - COALESCE(SUM(t.Amount), 0) AS OutstandingBalance
FROM Loan l
JOIN LoanDispositions ld ON l.LoanID = ld.LoanID
JOIN Customer c ON ld.CustomerID = c.CustomerID
LEFT JOIN Transactions t
    ON t.AccountID = l.AccountID
    AND t.TransactionStatus = 'Completed'
    AND t.Description IN ('Loan Payment', 'Monthly Loan Payment')
WHERE l.IsDeleted = 0
GROUP BY l.LoanID, c.CustomerID, c.FirstName, c.LastName, l.LoanType, l.LoanAmount
HAVING l.LoanAmount - COALESCE(SUM(t.Amount), 0) > 0;
GO
