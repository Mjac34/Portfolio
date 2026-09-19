# Banking ETL Pipeline — Raw CSVs to Star Schema to Power BI

> An end-to-end data pipeline for loan data: messy bank exports → Python data cleaning → a star-schema warehouse → a Power BI report. Includes an SSIS version of the same flow.

ETL assignment from the Business Intelligence program at Nackademin (BI24).

## What this project demonstrates

- **Data cleaning in pandas** — handling missing values, duplicate keys, comma-formatted numbers, scientific-notation IDs, empty columns
- **Dimensional modeling** — building fact and dimension tables (star schema) from cleansed operational data
- **Orchestration** — a runnable pipeline script plus the same flow as an SSIS package
- **Reporting** — a finished Power BI report on top of the warehouse tables

## Pipeline flow

```
data/raw/            Raw bank exports (accounts, balances, transactions)
      │
      ▼  pipeline.py — cleaning, type conversion, dedup, derived columns
data/cleansed/       Analysis-ready tables
      │
      ▼  pipeline.py — fact & dimension construction
data/warehouse/      Star schema: Fact_LoanBalance, Fact_Transactions,
                     Fact_LoanAccount + Dim_LoanAccount, Dim_Products,
                     Dim_Currency, DimDate
      │
      ▼
powerbi/             MJ Fin2.pbix — finished report
```

The same flow is also implemented as an SSIS package in `ssis/end_to_end.dtsx`.

## Cleaning decisions worth noting

- **AccountNumber** arrived in scientific notation for some rows — normalized back to 12-digit strings with zero-padding
- **Numeric columns with comma separators** converted to float per column with error reporting
- **Derived columns** — `IsActive`/`LoanStatus` built from `CancelledDate`
- **Duplicate detection** before any joins, not after

## Run it

```bash
pip install pandas
python pipeline.py
```

Reads from `data/raw/`, writes to `data/cleansed/` and `data/warehouse/`.

## Files

| Path | Contents |
|---|---|
| `pipeline.py` | The complete cleaning + star-schema pipeline |
| `notebooks/` | The three cleaning notebooks with comments (account, balance, transaction) |
| `data/raw/` | Source CSVs as delivered |
| `data/cleansed/` | Cleaned tables |
| `data/warehouse/` | Fact & dimension CSVs |
| `ssis/end_to_end.dtsx` | SSIS implementation of the same ETL |
| `powerbi/` | Finished report (`.pbix`) + screenshot |
| `_archive/` | Earlier drafts and superseded versions, kept for reference |
