# Förväntade resultat — MyBank

Resultat från en körning av `01`–`05` i ordning (SQL Server 2022, kört 2026-09-17).
Exakta siffror varierar med dagens datum — t.ex. `MonthsRemaining` och antalet
genererade månader växer över tid.

## Procedurer

```
GenerateHistoricalSalaries: 326 salary transactions created.
ProcessMonthlyLoanPayments: 115 payments created (0 failed - insufficient funds).
ProcessMonthlyLoanPayments: 0 payments created (0 failed - insufficient funds).
Loan granted and deposited into account.
```

- `115` betalningar = 40 (bolån) + 39 (billån) + 36 (privatlån, stannar vid löptidens slut).
- Andra körningen skapar **0** rader — procedurerna är idempotenta.
- `EXEC GrantLoanWithTerms @CustomerID1 = 7, ...` (kund född 2014) avslås:

```
Msg 50004, Level 16 ... Loan denied: customer must be at least 18 years old.
```

## GetCustomerBalance — `@CustomerID = 1`

| CustomerID | FirstName | LastName | TotalBalance |
|---|---|---|---|
| 1 | Anna | Johansson | 1509547.90 |

## UnpaidLoans

| LoanID | Kund | LoanType | LoanAmount | TotalPaid | OutstandingBalance |
|---|---|---|---|---|---|
| 1 | Anna Johansson | Mortgage | 250000.00 | 57996.00 | 192004.00 |
| 1 | Erik Johansson | Mortgage | 250000.00 | 57996.00 | 192004.00 |
| 2 | Karin Nilsson | Car Loan | 30000.00 | 21415.68 | 8584.32 |

Bolånet listas en gång per låntagare (huvud- + medsökande). Privatlånet saknas —
det är färdigamorterat efter 36 månader och filtreras bort av `HAVING`.

## LoansExpiringSoon

| LoanID | Kund | LoanType | LoanDate | MaturityDate | MonthsRemaining |
|---|---|---|---|---|---|
| 2 | Karin Nilsson | Car Loan | 2023-06-15 | 2028-06-15 | 21 |

## MostUsedPaymentMethod

| PaymentMethod | UsageCount |
|---|---|
| Bank Transfer | 330 |
| Card Payment | 3 |
| Direct Debit | 117 |
| Swish | 2 |

## Running balance (showcase-fråga 1, konto 2)

| TransactionDate | Description | Amount | RunningBalance |
|---|---|---|---|
| 2023-06-15 | Monthly Loan Payment | 549.12 | -549.12 |
| 2023-07-15 | Monthly Loan Payment | 549.12 | -1098.24 |
| 2023-08-02 | Bill Payment | 250.00 | -1348.24 |
| 2023-08-15 | Monthly Loan Payment | 549.12 | -1897.36 |

(Löpande saldot är beräknat enbart från transaktionerna — kontots startbalans
ingår inte i summeringen.)
