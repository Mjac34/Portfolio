# Northwind Agentic Playground

## What this is

A learning project that processes the classic **Northwind dataset** end-to-end as a hybrid
deterministic + AI pipeline: a sequential **agent crew** computes all numbers in plain Python,
while an **LLM** writes the narrative insights and answers natural-language questions through
tool calls (any OpenAI-compatible provider — Groq, Gemini, OpenAI, Azure OpenAI).

The design principle: *deterministic code owns the numbers, the model owns interpretation and
dialogue.* The LLM never computes metrics — it selects tools and phrases answers.

## The agent crew

| Agent | Responsibility |
|---|---|
| **DataLoaderAgent** | Reads CSV files from `csv/` |
| **DataModelingAgent** | Identifies fact/dimension tables and builds a star schema |
| **ModelAgent** | Enriches rows with `_score` and `sales_amount` |
| **CRMCustomerProfileAgent** | RFM segmentation, churn-risk scoring, next-best-action per customer |
| **AnalysisAgent** | Computes statistics over score and sales |
| **InsightAgent** | Extracts top-N products/customers/countries |
| **LLMInsightAgent** | LLM-written executive summary, insights and recommendations |
| **BIExportAgent** | Writes a BI-ready CSV to `output/bi_export.csv` |
| **DocumentationAgent** | Generates `output/pipeline_documentation.md` incl. the AI narrative |

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
- Building a star schema and a lightweight semantic model from raw CSVs.
- RFM segmentation and churn scoring for CRM analytics.
- Combining deterministic computation with an LLM where it adds value:
  narrative generation and tool-selecting question answering — without letting
  the model invent numbers.
