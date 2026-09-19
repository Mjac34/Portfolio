/* ============================================================
   MyBank - 02_seed.sql
   Populates the database with demo data.
   BirthDate is derived from PersonalNumber.
   Run order: 2 of 5
   ============================================================ */

USE MyBank;
GO

INSERT INTO Customer (FirstName, LastName, Address, PostalCode, City, EMailAddress, PhoneNumber, Gender, PersonalNumber, BirthDate, Income)
VALUES
('Anna','Johansson', 'Storgatan 12', 11151, 'Stockholm', 'anna.johansson@email.se', '+46731123456', 'Female','920314-XXXX', '1992-03-14', 32000.00),
('Erik', 'Johansson', 'Storgatan 12', 11151, 'Stockholm','erik.johansson@email.se', '+46731234567', 'Male', '851130-XXXX', '1985-11-30', 48084.00),
('Karin', 'Nilsson', 'Lilla Vägen 5', 11151, 'Stockholm', 'karin.nilsson@email.se', '+46732345678', 'Female', '800825-XXXX', '1980-08-25', 38750.00),
('Mats', 'Nilsson', 'Lilla Vägen 5', 11151, 'Stockholm', 'mats.nilsson@email.se', '+46732123456', 'Male', '780112-XXXX', '1978-01-12', 74652.00),
('Emma', 'Berg', 'Björkvägen 19', 11151, 'Stockholm', 'emma.berg@email.se', '+46734123456', 'Female', '870614-XXXX', '1987-06-14', 40927.00),
('Fredrik', 'Berg', 'Björkvägen 19', 11151, 'Stockholm', 'fredrik.berg@email.se', '+46734567891', 'Male', '850918-XXXX', '1985-09-18', 49645.00),
('Olivia', 'Berg', 'Björkvägen 19', 11151, 'Stockholm', 'olivia.berg@email.se', '+46734567891', 'Female', '141122-XXXX', '2014-11-22', NULL),
('Ottilia', 'Berg', 'Björkvägen 19', 11151, 'Stockholm', 'ottilia.berg@email.se', '+46734567891', 'Female', '101122-XXXX', '2010-11-22', NULL),
('David', 'Nyström', 'Kungsallén 22', 11151, 'Stockholm', 'david.nystrom@email.se', '+46735678901', 'Male', '890117-XXXX', '1989-01-17', 28941.00),
('Ebba', 'Nyström', 'Kungsallén 22', 11151, 'Stockholm', 'ebba.nystrom@email.se', '+46735432109', 'Female', '910226-XXXX', '1991-02-26', 91782.00);

INSERT INTO Account (AccountType, AccountNumber, Balance, CreationDate)
VALUES
('Checking Account', '49673422509538401850', 12456.00, '20230115'),
('Savings Account', '51297922981220088479', 36412.54, '20230115'),
('Retirement Account', '79824888130941287593', 162034.00, '20230115'),
('Checking Account', '71923056884561810200', 9526.00, '20230218'),
('Checking Account', '09614786354662626134', 8956.00, '20230328'),
('Savings Account', '28054378151376667376', 64957.65, '20230328'),
('Checking Account', '04343400896494493298', 55649.00, '20230714'),
('Savings Account', '04161715655618061902', 67490.00, '20230328'),
('Youth Account', '07217884935424214000', 3154.00, '20230825'),
('Checking Account', '75978212968384388084', 4582.00, '20230115'),
('Checking Account', '78014014705180735110', 3650.00, '20230115'),
('Savings Account', '75631384015146488819', 2740.00, '20230115'),
('Checking Account', '32796882413904752390', 45372.00, '20230502'),
('Checking Account', '34588389337003483388', 5548.00, '20230502'),
('Savings Account', '01782842233456612644', 65981.00, '20230502'),
('Youth Account', '16342353521128418790', 5876.00, '20240913'),
('Savings Account', '37914953367693972173', 10238.00, '20230502'),
('Savings Account', '33850381370430324556', 40120.00, '20230502'),
('Retirement Account', '59660398057937022406', 8570.00, '20230502'),
('Savings Account', '82517491715364501931', 3671.00, '20231119'),
('Retirement Account', '60401343470100934174', 286334.00, '20231119'),
('Retirement Account', '84993598539477344500', 172651.00, '20231119'),
('Business Account', '87725506294623326835', 489624.00, '20231119'),
('Retirement Account', '56899513023443453395', 791.00, '20231223'),
('Retirement Account', '66474011693736579511', 122450.00, '20231223'),
('Retirement Account', '24794263537206065073', 23811.00, '20240131'),
('Retirement Account', '55822177284830768763', 421570.00, '20240131'),
('Savings Account', '58857438634348107505', 35244.00, '20240202'),
('Joint Account', '13447854773671698713', 78652.00, '20240202'),
('Joint Account', '70362948245244205327', 22458.00, '20240202');

INSERT INTO Cards (CardStatus, CardNumber, IssuedDate, ExpiryMonth, ExpiryYear, CreditLimit)
VALUES
('Active', '4967342250953840', '20230115', '12', '2026', 0.00),
('Active', '5129792298122008', '20230714', '01', '2027', 20000.00),
('Active', '7982488813094128', '20230328', '05', '2027', 0.00),
('Active', '7192305688456181', '20230714', '01', '2027', 20000.00),
('Active', '0961478635466262', '20240913', '04', '2027', 0.00),
('Active', '2805437815137666', '20230502', '11', '2028', 10000.00),
('Active', '0434340089649449', '20230502', '11', '2028', 0.00),
('Active', '0416171565561806', '20231119', '06', '2025', 0.00),
('Active', '0721788493542421', '20231223', '06', '2025', 0.00),
('Active', '7597821296838438', '20240131', '03', '2028', 10000.00),
('Suspended', '7801401470518073', '20240202', '02', '2028', 0.00),
('Frozen', '7563138401514648', '20240218', '01', '2027', 0.00),
('Active', '3279688241390475', '20230825', '04', '2026', 0.00),
('Active', '3458838933700348', '20240216', '02', '2028', 0.00),
('Active', '0178284223345661', '20240205', '08', '2028', 50000.00),
('Active', '1634235352112841', '20240218', '09', '2026', 0.00),
('Active', '3791495336769397', '20240205', '08', '2028', 50000.00);

INSERT INTO Disposition (CustomerID, AccountID, CardID, AccountRole)
VALUES
(1, 1, 1, 'Owner'),
(1, 2, NULL, 'Owner'),
(1, 3, NULL, 'Owner'),
(2, 4, 3, 'Owner'),
(2, 6, NULL, 'Owner'),
(2, 19, NULL, 'Owner'),
(3, 5, 5, 'Owner'),
(3, 8, NULL, 'Owner'),
(3, 21, NULL, 'Owner'),
(4, 7, 7, 'Owner'),
(4, 12, NULL, 'Owner'),
(4, 22, NULL, 'Owner'),
(5, 10, 8, 'Owner'),
(5, 15, NULL, 'Owner'),
(5, 24, NULL, 'Owner'),
(5, 29, 2, 'Owner'),
(5, 9, NULL, 'Guardian'),
(6, 11, 9, 'Owner'),
(6, 17, NULL, 'Owner'),
(6, 25, NULL, 'Owner'),
(6, 29, 4, 'Co-owner'),
(6, 16, NULL, 'Guardian'),
(7, 9, 11, 'Owner'),
(8, 16, 10, 'Owner'),
(9, 13, 17, 'Owner'),
(9, 18, NULL, 'Owner'),
(9, 26, NULL, 'Owner'),
(9, 30, 15, 'Owner'),
(10, 14, 16, 'Owner'),
(10, 20, NULL, 'Owner'),
(10, 27, NULL, 'Owner'),
(10, 23, 6, 'Owner'),
(10, 28, NULL, 'Owner'),
(10, 30, 17, 'Co-owner');

INSERT INTO Loan (AccountID, LoanType, LoanAmount, LoanDate, InterestRate, LoanTermMonths)
VALUES
(1, 'Mortgage', 250000.00, '2023-05-01', 3.50, 240),
(2, 'Car Loan', 30000.00, '2023-06-15', 3.75, 60),
(3, 'Personal Loan', 15000.00, '2023-07-20', 4.00, 36);

INSERT INTO LoanDispositions (LoanID, CustomerID, LoanRole)
VALUES
(1, 1, 'Primary'),
(1, 2, 'Co-Borrower'),
(2, 3, 'Primary'),
(3, 4, 'Primary');

INSERT INTO Transactions (AccountID, PaymentMethod, TransactionType, Amount, TransactionDate, Description, TransactionStatus)
VALUES
(1, 'Bank Transfer', 'Deposit', 5000.00, '2023-08-01', 'Monthly Salary', 'Completed'),
(2, 'Card Payment', 'Withdrawal', 250.00, '2023-08-02', 'Bill Payment', 'Completed'),
(3, 'Swish', 'Deposit', 1500.00, '2023-08-03', 'Monthly Salary', 'Completed'),
(4, 'Direct Debit', 'Withdrawal', 1000.00, '2023-08-04', 'Loan Payment', 'Completed'),
(5, 'Card Payment', 'Withdrawal', 300.00, '2023-08-05', 'Shopping', 'Completed'),
(6, 'Bank Transfer', 'Transfer', 2000.00, '2023-08-06', 'Savings', 'Completed'),
(7, 'Swish', 'Deposit', 2500.00, '2023-08-07', 'Freelance Payment', 'Completed'),
(8, 'Card Payment', 'Withdrawal', 150.00, '2023-08-08', 'Restaurant', 'Completed'),
(9, 'Direct Debit', 'Withdrawal', 500.00, '2023-08-09', 'Utility Bill', 'Completed'),
(10, 'Bank Transfer', 'Deposit', 10000.00, '2023-08-10', 'Bonus Payment', 'Completed');
GO
