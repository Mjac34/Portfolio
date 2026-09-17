# MyBank

En fiktiv svensk bank implementerad i T-SQL (SQL Server). Skolprojekt från kursen
databasmodellering, Nackademin BI24.

Databasen modellerar kunder, konton, kort, lån, dispositionsrättigheter och
transaktioner — inklusive lagrade procedurer för löneinbetalningar, lånebeviljning
med kreditprövning och månatliga annuitetsbetalningar.

## Struktur

| Fil | Innehåll |
|---|---|
| `01_schema.sql` | Skapar databasen och alla tabeller (PK/FK, CHECK-constraints, soft delete) |
| `02_seed.sql` | Demodata: 10 kunder, 30 konton, 17 kort, 3 lån |
| `03_views.sql` | Rapportvyer (aktiva kunder, lån som förfaller, utestående skulder m.m.) |
| `04_procedures.sql` | Lagrade procedurer — se nedan |
| `05_queries.sql` | Demo-exekveringar + showcase-queries (window functions, CTE, RANK) |
| `bankdatabas.malin_jacobsson.drawio` | ER-diagram (öppnas i draw.io) |

## Kör

```powershell
sqlcmd -S localhost -E -f 65001 -i 01_schema.sql
sqlcmd -S localhost -E -f 65001 -i 02_seed.sql
sqlcmd -S localhost -E -f 65001 -i 03_views.sql
sqlcmd -S localhost -E -f 65001 -i 04_procedures.sql
sqlcmd -S localhost -E -f 65001 -i 05_queries.sql
```

eller kör filerna i ordningsföljd i SSMS / Azure Data Studio.

## Vad procedurerna visar

- **`ProcessMonthlyLoanPayments`** — genererar annuitetsbetalningar per lån
  (amortering + ränta), upp till lånebeloppets löptid. Idempotent via
  `NOT EXISTS`-koll per månad, atomär via `TRAN`/`TRY/CATCH`, och uppdaterar
  saldon bara för nya genomförda betalningar (`OUTPUT`-klausul).
- **`GrantLoanWithTerms`** — beviljar lån efter kreditprövning: ålderskrav,
  inkomstkrav, max antal befintliga lån, minsta saldo. Alla steg körs i en
  transaktion och utbetalningen bokförs som transaktion.
- **`GenerateHistoricalSalaries`** — backfillar månadslöner per lönekonto
  från kontots skapandedatum. Idempotent.
- **`GetCustomerBalance` / `GetTransactionReport`** — enklare rapportprocedurer
  med valfria filterparametrar.

## Showcase-queries (05)

Löpande saldo per konto (`SUM OVER ... ROWS UNBOUNDED PRECEDING`), kundrankning
efter saldo (`RANK`), månatligt kassaflöde per konto (CTE + villkorlig
aggregering), skuld/inkomst-kvot per låntagare och kortportföljsstatus.
