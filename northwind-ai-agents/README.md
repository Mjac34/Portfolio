# Northwind Agentic Playground

## What this is

A learning project that processes the classic **Northwind dataset** end-to-end as a hybrid
deterministic + AI pipeline: a sequential **agent crew** computes all numbers in plain Python,
while an **LLM** writes the narrative insights and answers natural-language questions through
tool calls (any OpenAI-compatible provider — Groq, Gemini, OpenAI, Azure OpenAI).

The design principle: *deterministic code owns the numbers, the model owns interpretation and
dialogue.* The LLM never computes metrics — it selects tools and phrases answers. "Agent" here
means a discrete, inspectable pipeline stage — strictly speaking only the LLM steps are agentic.

## The agent crew

| Agent | Responsibility |
|---|---|
| **DataLoaderAgent** | Reads CSV files from `csv/` |
| **DataModelingAgent** | Identifies fact/dimension tables and builds a star schema |
| **ModelAgent** | Enriches rows with `_score` and `sales_amount` |
| **CRMCustomerProfileAgent** | RFM segmentation, churn-risk scoring, next-best-action per customer |
| **AnalysisAgent** | Computes statistics over score and sales |
| **InsightAgent** | Extracts top-N products/customers/countries |
| **FlowAnalysisAgent** | Decomposes the revenue change between period halves into drivers per dimension |
| **LLMInsightAgent** | LLM-written executive summary, insights and recommendations |
| **BIExportAgent** | Writes a BI-ready CSV to `output/bi_export.csv` |
| **DocumentationAgent** | Generates `output/pipeline_documentation.md` incl. the AI narrative |

## Orchestration & observability

`agents/orchestrator.py` supervises the run (the "OrchestratorAgent" role — a layer around
the crew, not an agent in it). Each run produces:

- `output/audit_trail.jsonl` — append-only event log: pipeline start/finish, per-agent
  start/finish/fail with durations and output keys, all keyed by `run_id`
- `output/pipeline_health.json` — per-run health summary: status, duration, per-agent status
- `output/question_log.jsonl` — meta log of every question asked via the query agent,
  including which tools it chose to call

## The query agent

`agents/query_agent.py` is a tool-using LLM agent: it receives a question in natural
language, decides which tool to call (top customers, customer profile, segment summary,
churn-risk list), reads the deterministic CSV output, and formulates the answer.

Try it via CLI (`python ask.py "which customers are about to churn?"`) or in the
"Ask the data" section of the Streamlit dashboard.

## Setup

1. Python 3.10+, `pip install -r requirements.txt`
2. Create an API key at your provider (e.g. https://console.groq.com — free tier) and put
   it in `.env` (see `.env.example`). Without a key the pipeline still runs — `LLMInsightAgent`
   falls back to a template narrative and the query agent is disabled.
3. Run the pipeline: `python run_agent_crew.py`
4. Open the dashboard: `streamlit run agents/streamlit_app.py`

## What I learned

- Splitting a data pipeline into discrete, agent-like steps.
- Adding an observability layer: audit trail, pipeline-health manifest and a meta log
  over which questions the query agent receives and which tools it picks.
- Building a star schema and a lightweight semantic model from raw CSVs.
- RFM segmentation and churn scoring for CRM analytics.
- Combining deterministic computation with an LLM where it adds value:
  narrative generation and tool-selecting question answering — without letting
  the model invent numbers.
