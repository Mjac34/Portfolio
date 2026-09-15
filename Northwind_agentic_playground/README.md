# Northwind Agentic Playground

## What this is

A small experimental project where I built an **agent crew** to process the classic **Northwind dataset** end-to-end. The goal was to learn how to orchestrate multiple data/AI agents in a pipeline, not to build a production system.

## The agent crew

| Agent | Responsibility |
|---|---|
| **DataLoaderAgent** | Reads CSV files from `csv/` |
| **DataModelingAgent** | Identifies fact/dimension tables and builds a star schema |
| **ModelAgent** | Enriches rows with `_score` and `sales_amount` |
| **AnalysisAgent** | Computes statistics over score and sales |
| **InsightAgent** | Extracts top-N rows as insights |
| **BIExportAgent** | Writes a BI-ready CSV to `output/bi_export.csv` |
| **DocumentationAgent** | Generates a short `output/report.md` |
| **Streamlit app** | `agents/streamlit_app.py` shows the results |

## What I learned

- How to split a data pipeline into discrete, agent-like steps.
- Building a simple star schema from raw CSV files.
- Generating a lightweight semantic model for BI tools.
- Creating a minimal Streamlit front-end for exploration.

## Status

This is a **learning project**. It runs end-to-end and produces a working BI export. A CRM-style dashboard was planned as a follow-up but was not finished — a natural next step.

## How to run

1. Make sure you have Python 3.8+.
2. Place CSV files in `csv/`.
3. Run the agent crew:  
   `python run_agent_crew.py`
4. Open the Streamlit app:  
   `streamlit run agents/streamlit_app.py`
