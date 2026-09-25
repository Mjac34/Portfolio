# Excelakuten

**Automated repair for broken Excel files — with an audit trail.**
Live on Azure Container Apps (scale-to-zero, Sweden Central).

Every organisation has that one Excel file: 106k+ formulas, volatile
`INDIRECT`/`OFFSET` chains, circular references, hidden sheets feeding
visible formulas, hardcoded values pasted over live formulas — and XML
so corrupt that Excel itself wants to "repair" it on every open.
Nobody dares touch it.

Excelakuten is a seven-stage repair pipeline (FastAPI + openpyxl +
LibreOffice): load → diagnose → structure → clean → repair →
validate → export. The output is a new `.xlsx` (the original is never
touched) with three audit sheets: a printable `Rapport` verdict,
a `Granska dessa` sheet listing every flagged problem's exact cell,
and an `Ändringslogg` changelog — uncertain changes per cell, safe
mechanical ones summarised per sheet. What can't be fixed is
flagged — never hidden.

## Highlights

- Corrupt-container repair (illegal XML bytes) and legacy
  `.xls`/`.ods`/CSV ingest via headless LibreOffice
- Diagnostics for hidden sheets, external workbook links, formulas
  reading hidden sheets, and hardcoded values overwriting formulas
- Data cleaning: text dates → dates, Swedish `1 234,56` → numbers,
  duplicate/empty-row removal — while keeping ID columns as text
- Formula repair: `#REF!` handling, circular-reference breaking,
  pattern-based reconstruction, legacy `;`-separator normalisation
- Validation by full LibreOffice recalculation — new errors stop the
  file; per-cell integrity diff against the original
- Range detection: aggregate formulas whose ranges don't cover
  appended rows get flagged — a `SUM(B3:B41)` is valid syntax even
  when it silently misses row 42
- Stateless API (files processed in memory, never stored) with a job
  API that reports per-stage progress in real time

## Correct, not just valid

Validation isn't only "does it compute". A `SUM(B3:B41)` is
perfectly valid Excel even when row 42 was appended later — the
formula keeps returning a number, just the wrong one. Excelakuten
detects aggregate ranges that miss rows appended to the table they
summarise and flags them in the changelog, because *no errors* and
*correct* aren't the same thing.

## Result on the torture file

≈90 seconds: 10,708 text values → numbers · 2,447 text dates → dates ·
4,105 circular references broken · 40,134 formulas syntax-corrected ·
102,132 formulas recalculated with 0 new errors — and 56,651 safe
changes summarised into a handful of changelog rows while the 6
uncertain ones are listed per cell.

## Artefacts

- [Project deck (EN)](excelakuten-linkedin-en.pdf)
- [Projektpresentation (SV)](excelakuten-linkedin-sv.pdf)
- `images/` — UI screenshots

The source code is private (commercial prototype).

## Stack & deployment

Python · FastAPI · openpyxl · LibreOffice · PyYAML.
Deployed on **Azure Container Apps** (Sweden Central): scale-to-zero
container, user-assigned managed identity for ACR pulls, API key as a
Container App secret — infrastructure as code in Bicep
(`infra/main.bicep`, deployed via `az deployment`).
