/* ============================================================
   MyBank - 01_schema.sql
   Creates the database and all tables.
   Run order: 1 of 5
   ============================================================ */

USE master;
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'MyBank')
BEGIN
    ALTER DATABASE MyBank SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE MyBank;
END
GO

CREATE DATABASE MyBank;
GO

USE MyBank;
GO

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Address NVARCHAR(100) NOT NULL,
    PostalCode INT NOT NULL,
    City NVARCHAR(50) NOT NULL,
    EMailAddress NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL,
    Gender VARCHAR(6) NOT NULL,
    PersonalNumber VARCHAR(11) UNIQUE NOT NULL,
    BirthDate DATE NOT NULL,
    Income DECIMAL(10,2) NULL,
    IsDeleted BIT DEFAULT 0,
    CONSTRAINT chk_Gender CHECK (Gender IN ('Male', 'Female', 'Other'))
);

CREATE TABLE Cards (
    CardID INT PRIMARY KEY IDENTITY(1,1),
    CardStatus VARCHAR(10) NOT NULL,
    CardNumber VARCHAR(16) UNIQUE NOT NULL,
    IssuedDate DATE NOT NULL,
    ExpiryMonth CHAR(2) NOT NULL,
    ExpiryYear CHAR(4) NOT NULL,
    CreditLimit DECIMAL(10,2) NULL,
    IsDeleted BIT DEFAULT 0,
    CONSTRAINT chk_CardStatus CHECK (CardStatus IN ('Active', 'Inactive', 'Suspended', 'Frozen'))
);

CREATE TABLE Account (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    AccountType VARCHAR(20) NOT NULL,
    AccountNumber CHAR(20) UNIQUE NOT NULL,
    Balance DECIMAL(10,2) NOT NULL,
    CreationDate DATE NOT NULL,
    IsDeleted BIT DEFAULT 0,
    CONSTRAINT chk_AccountType CHECK (AccountType IN ('Checking Account', 'Savings Account', 'Business Account', 'Youth Account', 'Retirement Account', 'Joint Account'))
);

CREATE TABLE Loan (
    LoanID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT NOT NULL,
    LoanType VARCHAR(20) NOT NULL,
    LoanAmount DECIMAL(10,2) NOT NULL,
    LoanDate DATE NOT NULL,
    InterestRate DECIMAL(5,2) NOT NULL DEFAULT 3.5,
    LoanTermMonths INT NOT NULL DEFAULT 120,
    IsDeleted BIT DEFAULT 0,
    CONSTRAINT chk_LoanType CHECK (LoanType IN ('Mortgage', 'Car Loan', 'Personal Loan', 'Business Loan')),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT NOT NULL,
    PaymentMethod VARCHAR(20) NULL,
    TransactionType VARCHAR(20) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    TransactionDate DATETIME NOT NULL,
    Description VARCHAR(25) NOT NULL,
    TransactionStatus VARCHAR(10) NOT NULL,
    IsDeleted BIT DEFAULT 0,
    CONSTRAINT chk_PaymentMethod CHECK (PaymentMethod IN ('Card Payment', 'Swish', 'Bank Transfer', 'Direct Debit')),
    CONSTRAINT chk_TransactionType CHECK (TransactionType IN ('Deposit', 'Withdrawal', 'Transfer', 'Card Payment', 'Bill Payment', 'Interest', 'Fee', 'Loan Payment')),
    CONSTRAINT chk_Description CHECK (Description IN ('Monthly Salary', 'Child Support', 'Loan Payment', 'Monthly Loan Payment', 'Loan Disbursement', 'Shopping', 'Utility Bill', 'Bonus Payment', 'Freelance Payment', 'Restaurant', 'Savings', 'Bill Payment')),
    CONSTRAINT chk_TransactionStatus CHECK (TransactionStatus IN ('Completed', 'Pending', 'Failed')),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

CREATE TABLE LoanDispositions (
    LoanDispositionID INT IDENTITY PRIMARY KEY,
    LoanID INT NOT NULL,
    CustomerID INT NOT NULL,
    LoanRole VARCHAR(20) NOT NULL,
    CONSTRAINT chk_LoanRole CHECK (LoanRole IN ('Primary', 'Co-Borrower')),
    FOREIGN KEY (LoanID) REFERENCES Loan(LoanID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Disposition (
    DispositionID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    AccountID INT NOT NULL,
    CardID INT NULL,
    AccountRole VARCHAR(10) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
    FOREIGN KEY (CardID) REFERENCES Cards(CardID),
    CONSTRAINT chk_AccountRole CHECK (AccountRole IN ('Owner', 'Co-owner', 'Guardian'))
);

CREATE TABLE CardSecurity (
    CardID INT PRIMARY KEY,
    CVV2Hash VARBINARY(64) NOT NULL,
    CONSTRAINT FK_CardSecurity_Cards FOREIGN KEY (CardID) REFERENCES Cards(CardID)
);
GO
