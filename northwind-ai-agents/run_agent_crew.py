"""Entry point to run the agent crew pipeline.

Usage:
  python run_agent_crew.py

This script instantiates the agents in the requested order and runs them sequentially so that
each agent consumes the output of the previous agent.
"""

import json
import logging
from pathlib import Path

from agents.agents import (
    DataLoaderAgent,
    DataModelingAgent,
    ModelAgent,
    CRMCustomerProfileAgent,
    AnalysisAgent,
    InsightAgent,
    LLMInsightAgent,
    BIExportAgent,
    DocumentationAgent,
)
from agents.orchestrator import AgentCrew


def main():
    logging.basicConfig(level=logging.INFO, format="%(asctime)s [%(levelname)s] %(message)s")

    crew = AgentCrew([
        DataLoaderAgent(csv_dir="csv"),
        DataModelingAgent(),
        ModelAgent(),
        CRMCustomerProfileAgent(output_path="output/customer_profiles.csv"),
        AnalysisAgent(),
        InsightAgent(top_n=5),
        LLMInsightAgent(),
        BIExportAgent(out_path="output/bi_export.csv"),
        DocumentationAgent(doc_path="output/pipeline_documentation.md"),
    ])

    result = crew.run()
    semantic_model = result.get("semantic_model") or result.get("star_schema") or {}

    output_dir = Path("output")
    output_dir.mkdir(exist_ok=True)
    semantic_path = output_dir / "semantic_model.json"
    semantic_path.write_text(json.dumps(semantic_model, indent=2), encoding="utf-8")

    print("Pipeline finished.")
    print("Final result keys:", list(result.keys()))
    print("Semantic model saved to:", str(semantic_path))


if __name__ == "__main__":
    main()
