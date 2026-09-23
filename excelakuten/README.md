# Excelakuten

**Automated repair for broken Excel files — with an audit trail.**
Work in progress; currently in external testing.

Every organisation has that one Excel file: 106k+ formulas, volatile
`INDIRECT`/`OFFSET` chains, circular references, hidden sheets feeding
visible formulas, hardcoded values pasted over live formulas — and XML
so corrupt that Excel itself wants to "repair" it on every open.
Nobody dares touch it.

Excelakuten is a seven-stage repair pipeline (FastAPI + openpyxl +
LibreOffice): load → diagnose → structure → clean → repair →
validate → export. The output is a clean `.xlsx` plus a changelog
sheet listing **every touched cell** with before/after values and the
reason. What can't be fixed is flagged — never hidden.

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
- Stateless API (files processed in memory, never stored) with a job
  API that reports per-stage progress in real time

## Result on the torture file

82 seconds: 10,708 text values → numbers · 2,447 text dates → dates ·
4,105 circular references broken · 40,134 formulas syntax-corrected ·
102,132 formulas recalculated with 0 new errors.

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
