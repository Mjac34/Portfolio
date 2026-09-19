"""Natural-language query agent over the pipeline outputs.

The LLM decides which tool to call; tools read the exported
CSVs deterministically. The LLM never computes numbers itself — it only
selects tools and phrases the answer.
"""
import csv
import json
import logging
import os
from datetime import datetime, timezone
from typing import Any, Callable, Dict, List

try:
    from . import llm_client
except ImportError:
    import llm_client

logger = logging.getLogger(__name__)

OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "..", "output")


def _load_csv(name: str) -> List[Dict[str, str]]:
    path = os.path.join(OUTPUT_DIR, name)
    if not os.path.exists(path):
        return []
    with open(path, encoding="utf-8") as fh:
        return list(csv.DictReader(fh))


def _f(value: Any) -> float:
    try:
        return float(value)
    except (TypeError, ValueError):
        return 0.0


def get_top_customers(n: int = 5) -> List[Dict[str, Any]]:
    rows = sorted(_load_csv("customer_profiles.csv"),
                  key=lambda r: _f(r.get("total_revenue")), reverse=True)[:int(n)]
    return [{"customer": r["customerName"], "revenue": _f(r["total_revenue"]),
             "segment": r.get("rfm_segment"), "country": r.get("country")} for r in rows]


def get_customer_profile(name: str) -> Dict[str, Any]:
    for r in _load_csv("customer_profiles.csv"):
        if name.lower() in (r.get("customerName") or "").lower():
            return r
    return {"error": f"No customer matching '{name}'"}


def get_segment_summary() -> Dict[str, Any]:
    segments: Dict[str, Dict[str, Any]] = {}
    for r in _load_csv("customer_profiles.csv"):
        seg = r.get("rfm_segment") or "Unknown"
        s = segments.setdefault(seg, {"count": 0, "total_revenue": 0.0})
        s["count"] += 1
        s["total_revenue"] += _f(r.get("total_revenue"))
    for s in segments.values():
        s["total_revenue"] = round(s["total_revenue"], 2)
    return segments


def get_churn_risk_customers(min_risk: int = 60) -> List[Dict[str, Any]]:
    rows = [r for r in _load_csv("customer_profiles.csv")
            if _f(r.get("churn_risk")) >= min_risk]
    rows.sort(key=lambda r: _f(r.get("churn_risk")), reverse=True)
    return [{"customer": r["customerName"], "churn_risk": _f(r["churn_risk"]),
             "segment": r.get("rfm_segment"),
             "recommended_action": r.get("recommended_action")} for r in rows]


def get_product_mix_for_top_customers(n_customers: int = 5, top_products: int = 10) -> List[Dict[str, Any]]:
    """Product mix for the top-N revenue customers vs the whole customer base.

    overrepresentation_index > 1 means the product is overrepresented among
    top customers relative to its overall sales share.
    """
    profiles = sorted(_load_csv("customer_profiles.csv"),
                      key=lambda r: _f(r.get("total_revenue")), reverse=True)[:int(n_customers)]
    if not profiles:
        return []
    top_ids = {r["customerID"] for r in profiles}
    top_names = {r["customerName"] for r in profiles}

    per_product_top: Dict[str, float] = {}
    per_product_all: Dict[str, float] = {}
    for row in _load_csv("bi_export.csv"):
        amount = _f(row.get("sales_amount"))
        product = row.get("productName") or "Unknown product"
        per_product_all[product] = per_product_all.get(product, 0.0) + amount
        if row.get("customerID") in top_ids or row.get("customerName") in top_names:
            per_product_top[product] = per_product_top.get(product, 0.0) + amount

    top_rev = sum(per_product_top.values()) or 1.0
    all_rev = sum(per_product_all.values()) or 1.0
    result = []
    for product, amount in sorted(per_product_top.items(), key=lambda kv: kv[1], reverse=True)[:int(top_products)]:
        share_top = amount / top_rev
        share_all = per_product_all.get(product, 0.0) / all_rev
        result.append({
            "product": product,
            "revenue_from_top_customers": round(amount, 2),
            "share_of_top_customers": round(share_top, 3),
            "share_overall": round(share_all, 3),
            "overrepresentation_index": round(share_top / share_all, 2) if share_all else None,
        })
    return result


def get_sales_by_employee_segment(top_per_segment: int = 3) -> Dict[str, Any]:
    """Revenue per sales employee within each customer segment."""
    by_segment: Dict[str, Dict[str, float]] = {}
    for row in _load_csv("bi_export.csv"):
        employee = row.get("employeeName") or "Unknown employee"
        segment = row.get("customer_segment") or "Unknown segment"
        by_segment.setdefault(segment, {})
        by_segment[segment][employee] = by_segment[segment].get(employee, 0.0) + _f(row.get("sales_amount"))
    return {
        segment: [
            {"employee": name, "revenue": round(revenue, 2)}
            for name, revenue in sorted(employees.items(), key=lambda kv: kv[1], reverse=True)[:int(top_per_segment)]
        ]
        for segment, employees in sorted(by_segment.items())
    }


def get_region_growth(top_n: int = 10) -> List[Dict[str, Any]]:
    """Revenue growth per shipping country: first half vs second half of the period."""
    from datetime import datetime

    rows = _load_csv("bi_export.csv")
    dated = []
    for row in rows:
        try:
            dt = datetime.fromisoformat(str(row.get("orderDate", "")).split()[0])
        except (ValueError, IndexError):
            continue
        dated.append((dt, row.get("shipCountry") or "Unknown", _f(row.get("sales_amount"))))
    if not dated:
        return []

    midpoint = min(d for d, _, _ in dated) + (max(d for d, _, _ in dated) - min(d for d, _, _ in dated)) / 2
    early: Dict[str, float] = {}
    late: Dict[str, float] = {}
    for dt, country, amount in dated:
        target = early if dt <= midpoint else late
        target[country] = target.get(country, 0.0) + amount

    growth = []
    for country in set(early) | set(late):
        e, l = early.get(country, 0.0), late.get(country, 0.0)
        growth.append({
            "country": country,
            "first_half_revenue": round(e, 2),
            "second_half_revenue": round(l, 2),
            "growth_pct": round((l - e) / e * 100, 1) if e else None,
        })
    growth.sort(key=lambda g: (g["growth_pct"] is not None, g["growth_pct"] or 0), reverse=True)
    return growth[:int(top_n)]


TOOLS: List[Dict[str, Any]] = [
    {"type": "function", "function": {
        "name": "get_top_customers",
        "description": "List the top customers by total revenue",
        "parameters": {"type": "object", "properties": {
            "n": {"type": "integer", "description": "How many customers to return", "default": 5}}}},
    },
    {"type": "function", "function": {
        "name": "get_customer_profile",
        "description": "Get the full CRM profile (RFM, churn risk, recommended action) for one customer",
        "parameters": {"type": "object", "properties": {
            "name": {"type": "string", "description": "Customer name (partial match ok)"}},
            "required": ["name"]}},
    },
    {"type": "function", "function": {
        "name": "get_segment_summary",
        "description": "Count and total revenue per RFM customer segment",
        "parameters": {"type": "object", "properties": {}}},
    },
    {"type": "function", "function": {
        "name": "get_churn_risk_customers",
        "description": "List customers at risk of churning, sorted by risk score",
        "parameters": {"type": "object", "properties": {
            "min_risk": {"type": "integer", "description": "Minimum churn risk 0-100", "default": 60}}}},
    },
    {"type": "function", "function": {
        "name": "get_product_mix_for_top_customers",
        "description": ("Product mix for the top-N revenue customers compared to overall sales. "
                        "Use for questions about what products top/best customers buy or which "
                        "products are overrepresented among them. overrepresentation_index > 1 "
                        "means overrepresented."),
        "parameters": {"type": "object", "properties": {
            "n_customers": {"type": "integer", "description": "How many top customers to include", "default": 5},
            "top_products": {"type": "integer", "description": "How many products to return", "default": 10}}}},
    },
    {"type": "function", "function": {
        "name": "get_sales_by_employee_segment",
        "description": ("Revenue per sales employee broken down by customer segment. "
                        "Use for questions about which sales reps drive revenue per segment."),
        "parameters": {"type": "object", "properties": {
            "top_per_segment": {"type": "integer", "description": "Top employees to return per segment", "default": 3}}}},
    },
    {"type": "function", "function": {
        "name": "get_region_growth",
        "description": ("Revenue growth per shipping country/region over time — compares the "
                        "first half of the period to the second half. Use for questions about "
                        "which regions/countries are growing or shrinking."),
        "parameters": {"type": "object", "properties": {
            "top_n": {"type": "integer", "description": "How many regions to return", "default": 10}}}},
    },
]

_TOOL_IMPL: Dict[str, Callable[..., Any]] = {
    "get_top_customers": get_top_customers,
    "get_customer_profile": get_customer_profile,
    "get_segment_summary": get_segment_summary,
    "get_churn_risk_customers": get_churn_risk_customers,
    "get_product_mix_for_top_customers": get_product_mix_for_top_customers,
    "get_sales_by_employee_segment": get_sales_by_employee_segment,
    "get_region_growth": get_region_growth,
}

_SYSTEM_PROMPT = (
    "You answer questions about Northwind sales and CRM data using the provided tools. "
    "Always call a tool to get data — never invent numbers. Answer concisely in the "
    "same language the user used."
)


QUESTION_LOG = os.path.join(OUTPUT_DIR, "question_log.jsonl")


def _log_question(entry: Dict[str, Any]) -> None:
    """Append a question + tool-call trace to the meta log (JSONL)."""
    try:
        os.makedirs(OUTPUT_DIR, exist_ok=True)
        with open(QUESTION_LOG, "a", encoding="utf-8") as fh:
            fh.write(json.dumps(entry, default=str) + "\n")
    except OSError:
        logger.exception("Failed writing question log")


def ask(question: str, max_rounds: int = 4) -> str:
    entry: Dict[str, Any] = {
        "ts": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "question": question,
        "tool_calls": [],
        "answer": None,
    }
    try:
        if not llm_client.is_configured():
            entry["answer"] = "LLM_API_KEY is not set — add it to .env to use the query agent."
            return entry["answer"]
        messages: List[Dict[str, Any]] = [
            {"role": "system", "content": _SYSTEM_PROMPT},
            {"role": "user", "content": question},
        ]
        for _ in range(max_rounds):
            message = llm_client.chat(messages, tools=TOOLS)
            if not getattr(message, "tool_calls", None):
                entry["answer"] = message.content or "(no answer)"
                return entry["answer"]
            messages.append(message)
            for call in message.tool_calls:
                entry["tool_calls"].append({
                    "name": call.function.name,
                    "arguments": call.function.arguments,
                })
                impl = _TOOL_IMPL.get(call.function.name)
                try:
                    args = json.loads(call.function.arguments or "{}")
                    result = impl(**args) if impl else {"error": "unknown tool"}
                except Exception as exc:
                    result = {"error": str(exc)}
                messages.append({
                    "role": "tool", "tool_call_id": call.id,
                    "content": json.dumps(result, default=str),
                })
        entry["answer"] = "The agent did not finish within the tool-call limit."
        return entry["answer"]
    finally:
        entry["answered"] = entry["answer"] is not None
        _log_question(entry)


class QueryAgent:
    """Thin wrapper so the Streamlit app can call the agent like the crew."""

    def run(self, question: str) -> str:
        return ask(question)
