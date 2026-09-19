"""Ask the Northwind data questions in natural language.

Usage:
    python ask.py "vilka kunder riskerar att churna?"

Requires output/customer_profiles.csv (run run_agent_crew.py first) and
LLM_API_KEY in .env for the LLM calls.
"""
import sys

from agents.query_agent import ask


def main() -> None:
    sys.stdout.reconfigure(encoding="utf-8")
    question = " ".join(sys.argv[1:]) or input("Question: ")
    print(ask(question))


if __name__ == "__main__":
    main()
