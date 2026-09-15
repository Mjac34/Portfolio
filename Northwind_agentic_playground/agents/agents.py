"""Simple agent implementations for a sequential agent-crew pipeline.

Agents:
- DataLoaderAgent: loads CSV files from a folder and returns rows
- ModelAgent: applies a simple transformation / scoring to rows
- AnalysisAgent: computes basic summary statistics over scores
- InsightAgent: selects top-N items and produces simple insights
- BIExportAgent: exports the final rows to a CSV for BI consumption
- DocumentationAgent: writes a short pipeline documentation file

Each agent accepts the previous agent's output (a dict) and returns a dict consumed by the next.
"""

import os
import glob
import csv
import statistics
import json
import logging
from datetime import datetime
from typing import Any, Dict, List

logger = logging.getLogger(__name__)

class Agent:
    def __init__(self, name: str):
        self.name = name

    def run(self, input_data: Any) -> Any:
        raise NotImplementedError


class DataLoaderAgent(Agent):
    def __init__(self, csv_dir: str = "csv"):
        super().__init__("DataLoaderAgent")
        self.csv_dir = csv_dir

    def run(self, input_data=None) -> Dict[str, Any]:
        tables: Dict[str, List[Dict[str, str]]] = {}
        data: List[Dict[str, str]] = []
        pattern = os.path.join(self.csv_dir, "*.csv")
        files = glob.glob(pattern)
        for path in files:
            try:
                table_name = os.path.splitext(os.path.basename(path))[0].lower()
                rows = []
                with open(path, newline='', encoding='utf-8') as fh:
                    reader = csv.DictReader(fh)
                    for row in reader:
                        rows.append(row)
                        data.append(row)
                tables[table_name] = rows
            except Exception:
                logger.exception(f"{self.name}: failed reading {path}")
        logger.info(f"{self.name}: loaded {len(data)} rows from {self.csv_dir}")
        return {"rows": data, "tables": tables, "source_files": files}


class DataModelingAgent(Agent):
    def __init__(self):
        super().__init__("DataModelingAgent")

    @staticmethod
    def _normalise_key(name: str) -> str:
        if not name:
            return ""
        return name.lower().replace(" ", "").replace("_", "")

    def _candidate_keys(self, rows: List[Dict[str, Any]]) -> List[str]:
        if not rows:
            return []
        keys = set()
        for row in rows:
            for key in row.keys():
                if "id" in self._normalise_key(key):
                    keys.add(key)
        return sorted(keys)

    def _choose_fact_table(self, tables: Dict[str, List[Dict[str, Any]]]) -> str:
        ranked = []
        for name, rows in tables.items():
            score = 0
            if "order" in name:
                score += 30
            if "detail" in name:
                score += 15
            if "fact" in name:
                score += 20
            if "transaction" in name:
                score += 20
            score += len(rows)
            ranked.append((score, name))
        if not ranked:
            return "fact_table"
        return max(ranked, key=lambda item: item[0])[1]

    def _build_relationships(self, fact_name: str, tables: Dict[str, List[Dict[str, Any]]]) -> List[Dict[str, str]]:
        relationships = []
        fact_rows = tables.get(fact_name, [])
        if not fact_rows:
            return relationships
        fact_keys = self._candidate_keys(fact_rows)
        for dim_name, rows in tables.items():
            if dim_name == fact_name or not rows:
                continue
            dim_keys = self._candidate_keys(rows)
            for fact_key in fact_keys:
                for dim_key in dim_keys:
                    if self._normalise_key(fact_key) == self._normalise_key(dim_key):
                        relationships.append({
                            "fact_table": fact_name,
                            "fact_key": fact_key,
                            "dimension_table": dim_name,
                            "dimension_key": dim_key,
                            "relationship_type": "one_to_many",
                        })
        return relationships

    @staticmethod
    def _as_float(value: Any) -> float:
        try:
            return float(value)
        except (TypeError, ValueError):
            return 0.0

    def _build_enriched_fact_table(self, tables: Dict[str, List[Dict[str, Any]]], fact_name: str) -> List[Dict[str, Any]]:
        fact_rows = tables.get(fact_name, [])
        if not fact_rows:
            return []

        def index_by_key(rows: List[Dict[str, Any]], key: str) -> Dict[str, Dict[str, Any]]:
            idx = {}
            for row in rows:
                value = row.get(key)
                if value is not None and value != "":
                    idx[str(value)] = row
            return idx

        orders = index_by_key(tables.get("orders", []), "orderID")
        products = index_by_key(tables.get("products", []), "productID")
        customers = index_by_key(tables.get("customers", []), "customerID")
        employees = index_by_key(tables.get("employees", []), "employeeID")
        categories = index_by_key(tables.get("categories", []), "categoryID")
        suppliers = index_by_key(tables.get("suppliers", []), "supplierID")
        shippers = index_by_key(tables.get("shippers", []), "shipperID")

        enriched: List[Dict[str, Any]] = []
        for row in fact_rows:
            enriched_row = dict(row)
            order_id = str(row.get("orderID", ""))
            product_id = str(row.get("productID", ""))
            order = orders.get(order_id, {})
            product = products.get(product_id, {})
            customer = customers.get(str(order.get("customerID", "")), {})
            employee = employees.get(str(order.get("employeeID", "")), {})
            category = categories.get(str(product.get("categoryID", "")), {})
            supplier = suppliers.get(str(product.get("supplierID", "")), {})
            shipper = shippers.get(str(order.get("shipVia", "")), {})

            enriched_row["orderDate"] = order.get("orderDate")
            enriched_row["customerID"] = order.get("customerID")
            enriched_row["customerName"] = customer.get("companyName") or customer.get("contactName")
            enriched_row["shipCountry"] = order.get("shipCountry")
            enriched_row["shipCity"] = order.get("shipCity")
            enriched_row["employeeID"] = order.get("employeeID")
            enriched_row["employeeName"] = (employee.get("firstName") + " " + employee.get("lastName")).strip() if employee.get("firstName") or employee.get("lastName") else None
            enriched_row["productName"] = product.get("productName")
            enriched_row["categoryID"] = product.get("categoryID")
            enriched_row["categoryName"] = category.get("categoryName")
            enriched_row["supplierID"] = product.get("supplierID")
            enriched_row["supplierName"] = supplier.get("companyName")
            enriched_row["shipperName"] = shipper.get("companyName")

            unit_price = self._as_float(row.get("unitPrice"))
            quantity = self._as_float(row.get("quantity"))
            discount = self._as_float(row.get("discount"))
            sales_amount = unit_price * quantity * (1 - discount)
            enriched_row["sales_amount"] = sales_amount
            enriched_row["_score"] = sales_amount
            enriched.append(enriched_row)

        return enriched

    def run(self, input_data: Dict[str, Any]) -> Dict[str, Any]:
        tables = input_data.get("tables", {})
        if not tables:
            rows = input_data.get("rows", [])
            tables = {"fact_table": rows}

        fact_name = self._choose_fact_table(tables)
        fact_rows = self._build_enriched_fact_table(tables, fact_name)
        dimension_tables = {name: rows for name, rows in tables.items() if name != fact_name}
        relationships = self._build_relationships(fact_name, tables)

        star_schema = {
            "fact_table": fact_name,
            "dimension_tables": sorted(dimension_tables.keys()),
            "relationships": relationships,
        }

        semantic_model = {
            "business_name": "Northwind sales semantic model",
            "model_type": "star_schema",
            "fact_table": fact_name,
            "granularity": "order_line",
            "dimensions": [
                {"name": "dim_orders", "key": "orderID", "source_table": "orders"},
                {"name": "dim_products", "key": "productID", "source_table": "products"},
                {"name": "dim_customers", "key": "customerID", "source_table": "customers"},
                {"name": "dim_employees", "key": "employeeID", "source_table": "employees"},
                {"name": "dim_categories", "key": "categoryID", "source_table": "categories"},
                {"name": "dim_suppliers", "key": "supplierID", "source_table": "suppliers"},
                {"name": "dim_shippers", "key": "shipVia", "source_table": "shippers"},
            ],
            "measures": [
                {"name": "sales_amount", "type": "decimal", "definition": "unitPrice * quantity * (1 - discount)"},
                {"name": "order_quantity", "type": "integer", "definition": "SUM(quantity)"},
                {"name": "distinct_orders", "type": "integer", "definition": "DISTINCTCOUNT(orderID)"},
                {"name": "avg_line_value", "type": "decimal", "definition": "sales_amount / order_quantity"},
            ],
            "segmentations": [
                {
                    "name": "customer_value_segment",
                    "entity": "customer",
                    "logic": "Based on total revenue per customer: High Value >= 75th percentile, Medium Value >= 50th percentile, Low Value else",
                    "labels": ["High Value", "Medium Value", "Low Value"],
                }
            ],
            "relationships": relationships,
        }

        output = {
            "rows": fact_rows,
            "tables": tables,
            "fact_table": fact_rows,
            "star_schema": star_schema,
            "semantic_model": semantic_model,
            "dimensions": dimension_tables,
            "source_files": input_data.get("source_files", []),
        }
        logger.info(f"{self.name}: built star schema with fact table '{fact_name}' and {len(dimension_tables)} dimensions")
        return output


class ModelAgent(Agent):
    def __init__(self):
        super().__init__("ModelAgent")

    @staticmethod
    def _find_numeric_value(row: Dict[str, Any]) -> float:
        lowered_map = {str(k).lower(): v for k, v in row.items()}
        for key in ["unitprice", "price", "totalprice", "amount", "salesamount", "quantity", "qty", "unitsinstock", "unitsonorder"]:
            if key in lowered_map and lowered_map[key] not in (None, ""):
                try:
                    return float(lowered_map[key])
                except (TypeError, ValueError):
                    continue
        return sum(len(str(v)) for v in row.values())

    @staticmethod
    def _safe_float(value: Any) -> float:
        try:
            return float(value)
        except (TypeError, ValueError):
            return 0.0

    @staticmethod
    def _percentile(values: list[float], percentile: float) -> float:
        if not values:
            return 0.0
        ordered = sorted(values)
        if len(ordered) == 1:
            return ordered[0]
        position = (len(ordered) - 1) * percentile
        lower = int(position)
        upper = min(lower + 1, len(ordered) - 1)
        weight = position - lower
        return ordered[lower] + (ordered[upper] - ordered[lower]) * weight

    def run(self, input_data: Dict[str, Any]) -> Dict[str, Any]:
        rows = input_data.get("rows", [])
        customer_totals: dict[str, float] = {}
        for row in rows:
            try:
                unit_price = self._safe_float(row.get('unitPrice'))
                quantity = self._safe_float(row.get('quantity'))
                discount = self._safe_float(row.get('discount'))
                sales_amount = unit_price * quantity * (1 - discount)
                row['sales_amount'] = sales_amount
                row['_score'] = sales_amount
                customer_key = str(row.get('customerID') or row.get('customerName') or 'Unknown')
                customer_totals[customer_key] = customer_totals.get(customer_key, 0.0) + sales_amount
            except Exception:
                row['_score'] = 0
                row['sales_amount'] = 0

        values = list(customer_totals.values())
        p50 = self._percentile(values, 0.50)
        p75 = self._percentile(values, 0.75)

        for row in rows:
            customer_key = str(row.get('customerID') or row.get('customerName') or 'Unknown')
            total = customer_totals.get(customer_key, 0.0)
            if total >= p75:
                row['customer_segment'] = 'High Value'
            elif total >= p50:
                row['customer_segment'] = 'Medium Value'
            else:
                row['customer_segment'] = 'Low Value'

        logger.info(f"{self.name}: scored {len(rows)} rows and assigned customer segments")
        return {"rows": rows, "star_schema": input_data.get("star_schema"), "semantic_model": input_data.get("semantic_model")}


class CRMCustomerProfileAgent(Agent):
    def __init__(self, output_path: str = "output/customer_profiles.csv"):
        super().__init__("CRMCustomerProfileAgent")
        self.output_path = output_path

    @staticmethod
    def _safe_float(value: Any) -> float:
        try:
            return float(value)
        except (TypeError, ValueError):
            return 0.0

    @staticmethod
    def _safe_date(value: Any):
        if value in (None, "", "nan"):
            return None
        try:
            return value
        except Exception:
            return None

    @staticmethod
    def _parse_date(value: Any):
        if value in (None, "", "nan"):
            return None
        candidate = str(value).strip()
        if not candidate:
            return None
        for fmt in ("%Y-%m-%d %H:%M:%S.%f", "%Y-%m-%d %H:%M:%S", "%Y-%m-%d", "%Y/%m/%d"):
            try:
                return datetime.strptime(candidate, fmt)
            except ValueError:
                continue
        try:
            if candidate.endswith("Z"):
                candidate = candidate[:-1] + "+00:00"
            return datetime.fromisoformat(candidate)
        except ValueError:
            return None

    @staticmethod
    def _bucket_score(value: float, ordered: List[float], reverse: bool = False, high_is_best: bool = True) -> int:
        if not ordered:
            return 3
        if len(ordered) == 1:
            return 5
        max_index = len(ordered) - 1
        if high_is_best:
            if value >= ordered[min(int(len(ordered) * 0.8), max_index)]:
                return 5
            if value >= ordered[min(int(len(ordered) * 0.6), max_index)]:
                return 4
            if value >= ordered[min(int(len(ordered) * 0.4), max_index)]:
                return 3
            if value >= ordered[min(int(len(ordered) * 0.2), max_index)]:
                return 2
            return 1
        if value <= ordered[min(int(len(ordered) * 0.2), max_index)]:
            return 5
        if value <= ordered[min(int(len(ordered) * 0.4), max_index)]:
            return 4
        if value <= ordered[min(int(len(ordered) * 0.6), max_index)]:
            return 3
        if value <= ordered[min(int(len(ordered) * 0.8), max_index)]:
            return 2
        return 1

    @staticmethod
    def _rfm_segment(r_score: int, f_score: int, m_score: int) -> str:
        if r_score >= 4 and f_score >= 4 and m_score >= 4:
            return "Champions"
        if r_score >= 3 and f_score >= 4 and m_score >= 4:
            return "Loyal Customers"
        if r_score >= 3 and f_score >= 3 and m_score >= 3:
            return "Potential Loyalists"
        if r_score >= 4 and f_score <= 2:
            return "Recent Customers"
        if r_score <= 2 and f_score >= 4 and m_score >= 4:
            return "At Risk"
        if r_score <= 2 and f_score <= 2:
            return "Lost"
        if r_score <= 2 and f_score >= 3:
            return "Hibernating"
        return "Needs Attention"

    @staticmethod
    def _decide_next_best_action(segment: str, order_count: int, avg_order_value: float, recency_days: float) -> str:
        segment_name = (segment or "Low Value").strip()
        if segment_name == "High Value":
            if recency_days > 120:
                return "Retention – VIP-återaktivering"
            if avg_order_value > 5000:
                return "Upsell – premium assortment"
            return "Upsell – cross-sell till högvärdiga produkter"
        if segment_name == "Medium Value":
            if recency_days > 90:
                return "Retention – kampanj för att återaktivera"
            if order_count >= 3:
                return "Kampanj – nästa köp via riktat erbjudande"
            return "Kampanj – introduktionserbjudande"
        if recency_days > 150:
            return "Retention – win-back kampanj"
        if order_count <= 2:
            return "Kampanj – ny kundupplevelse"
        return "Retention – återkommande kundaktivering"

    def run(self, input_data: Dict[str, Any]) -> Dict[str, Any]:
        rows = input_data.get("rows", [])
        profiles: Dict[str, Dict[str, Any]] = {}

        for row in rows:
            customer_id = str(row.get("customerID") or row.get("customerName") or "Unknown")
            if customer_id not in profiles:
                profiles[customer_id] = {
                    "customerID": customer_id,
                    "customerName": row.get("customerName") or customer_id,
                    "country": row.get("shipCountry") or row.get("country") or "Unknown",
                    "segment": row.get("customer_segment") or "Unknown",
                    "total_revenue": 0.0,
                    "order_count": 0,
                    "order_ids": set(),
                    "first_purchase_date": None,
                    "last_purchase_date": None,
                    "products_purchased": set(),
                }

            profile = profiles[customer_id]
            profile["total_revenue"] += self._safe_float(row.get("sales_amount"))
            profile["order_ids"].add(str(row.get("orderID") or "unknown-order"))
            profile["products_purchased"].add(str(row.get("productName") or row.get("productID") or "unknown-product"))

            order_date = row.get("orderDate")
            if order_date not in (None, "", "nan"):
                profile["first_purchase_date"] = min(str(order_date), profile["first_purchase_date"]) if profile["first_purchase_date"] else str(order_date)
                profile["last_purchase_date"] = max(str(order_date), profile["last_purchase_date"]) if profile["last_purchase_date"] else str(order_date)

            if row.get("customer_segment"):
                profile["segment"] = row.get("customer_segment")

        final_profiles = []
        reference_date = None
        for row in rows:
            order_date = self._parse_date(row.get("orderDate"))
            if order_date is not None:
                if reference_date is None or order_date > reference_date:
                    reference_date = order_date
        if reference_date is None:
            reference_date = datetime.now()

        for customer_id, profile in profiles.items():
            order_count = len(profile["order_ids"])
            total_revenue = float(profile["total_revenue"])
            avg_order_value = total_revenue / order_count if order_count else 0.0
            last_purchase = self._parse_date(profile.get("last_purchase_date"))
            recency_days = (reference_date - last_purchase).days if last_purchase else 9999
            behavior_signal = "Aktiv" if recency_days <= 90 else "Risk" if recency_days <= 180 else "Inaktiv"
            next_best_action = self._decide_next_best_action(profile["segment"], order_count, avg_order_value, recency_days)
            recommendation = next_best_action
            churn_risk = 0
            if behavior_signal == "Aktiv":
                churn_risk = max(0, min(30, int(30 - (recency_days * 0.2))))
            elif behavior_signal == "Risk":
                churn_risk = max(31, min(70, int(35 + (recency_days * 0.2))))
            else:
                churn_risk = max(71, min(100, int(70 + (recency_days * 0.18))))
            if churn_risk >= 80:
                churn_risk_label = "Critical"
            elif churn_risk >= 60:
                churn_risk_label = "High"
            elif churn_risk >= 35:
                churn_risk_label = "Medium"
            else:
                churn_risk_label = "Low"
            final_profiles.append({
                "customerID": profile["customerID"],
                "customerName": profile["customerName"],
                "country": profile["country"],
                "segment": profile["segment"],
                "total_revenue": round(total_revenue, 2),
                "order_count": order_count,
                "avg_order_value": round(avg_order_value, 2),
                "first_purchase_date": profile["first_purchase_date"],
                "last_purchase_date": profile["last_purchase_date"],
                "products_purchased": ", ".join(sorted(profile["products_purchased"])),
                "recommended_action": recommendation,
                "next_best_action": recommendation,
                "behavior_signal": behavior_signal,
                "recency_days": recency_days,
                "churn_risk": churn_risk,
                "churn_risk_label": churn_risk_label,
            })

        revenue_values = sorted(p["total_revenue"] for p in final_profiles)
        frequency_values = sorted(p["order_count"] for p in final_profiles)
        recency_values = sorted(p["recency_days"] for p in final_profiles)
        for profile in final_profiles:
            profile["r_score"] = self._bucket_score(profile["recency_days"], recency_values, high_is_best=False)
            profile["f_score"] = self._bucket_score(profile["order_count"], frequency_values, high_is_best=True)
            profile["m_score"] = self._bucket_score(profile["total_revenue"], revenue_values, high_is_best=True)
            profile["rfm_score"] = int(f"{profile['r_score']}{profile['f_score']}{profile['m_score']}")
            profile["rfm_label"] = f"{profile['r_score']}{profile['f_score']}{profile['m_score']}"
            profile["rfm_segment"] = self._rfm_segment(profile["r_score"], profile["f_score"], profile["m_score"])
            if profile["behavior_signal"] == "Aktiv" and profile["segment"] == "High Value":
                profile["status_label"] = "Aktiv"
            elif profile["behavior_signal"] == "Risk":
                profile["status_label"] = "Risk"
            else:
                profile["status_label"] = "Inaktiv"

        final_profiles.sort(key=lambda p: p["total_revenue"], reverse=True)

        os.makedirs(os.path.dirname(self.output_path), exist_ok=True)
        with open(self.output_path, "w", newline="", encoding="utf-8") as fh:
            writer = csv.DictWriter(fh, fieldnames=[
                "customerID", "customerName", "country", "segment", "total_revenue",
                "order_count", "avg_order_value", "first_purchase_date", "last_purchase_date",
                "products_purchased", "recommended_action", "next_best_action", "behavior_signal",
                "recency_days", "churn_risk", "churn_risk_label", "r_score", "f_score", "m_score",
                "rfm_score", "rfm_label", "rfm_segment", "status_label"
            ])
            writer.writeheader()
            writer.writerows(final_profiles)

        return {
            "rows": rows,
            "customer_profiles": final_profiles,
            "customer_profiles_path": self.output_path,
            "star_schema": input_data.get("star_schema"),
            "semantic_model": input_data.get("semantic_model"),
        }


class AnalysisAgent(Agent):
    def __init__(self):
        super().__init__("AnalysisAgent")

    def run(self, input_data: Dict[str, Any]) -> Dict[str, Any]:
        rows = input_data.get("rows", [])
        scores = [float(r.get('_score', 0)) for r in rows]
        summary: Dict[str, Any] = {}
        if scores:
            summary = {
                "count": len(scores),
                "min": min(scores),
                "max": max(scores),
                "mean": statistics.mean(scores),
                "median": statistics.median(scores),
            }
        else:
            summary = {"count": 0}
        logger.info(f"{self.name}: computed summary {summary}")
        return {
            "rows": rows,
            "summary": summary,
            "star_schema": input_data.get("star_schema"),
            "semantic_model": input_data.get("semantic_model"),
        }


class InsightAgent(Agent):
    def __init__(self, top_n: int = 5):
        super().__init__("InsightAgent")
        self.top_n = top_n

    @staticmethod
    def _safe_float(value: Any) -> float:
        try:
            return float(value)
        except (TypeError, ValueError):
            return 0.0

    def run(self, input_data: Dict[str, Any]) -> Dict[str, Any]:
        rows = input_data.get("rows", [])
        sorted_rows = sorted(rows, key=lambda r: float(r.get('_score', 0)), reverse=True)
        top = sorted_rows[: self.top_n]

        product_totals = {}
        customer_totals = {}
        country_totals = {}
        for row in rows:
            revenue = self._safe_float(row.get('sales_amount'))
            if revenue == 0:
                product = row.get('productName') or row.get('productID') or 'Unknown product'
                quantity = self._safe_float(row.get('quantity'))
                unit_price = self._safe_float(row.get('unitPrice'))
                discount = self._safe_float(row.get('discount'))
                revenue = unit_price * quantity * (1 - discount)

            product_name = row.get('productName') or row.get('productID') or 'Unknown product'
            customer_name = row.get('customerID') or row.get('customerName') or 'Unknown customer'
            country_name = row.get('shipCountry') or row.get('country') or 'Unknown country'

            product_totals[product_name] = product_totals.get(product_name, 0.0) + revenue
            customer_totals[customer_name] = customer_totals.get(customer_name, 0.0) + revenue
            country_totals[country_name] = country_totals.get(country_name, 0.0) + revenue

        top_products = [
            {"product": key, "sales_amount": round(value, 2)}
            for key, value in sorted(product_totals.items(), key=lambda item: item[1], reverse=True)[: self.top_n]
        ]
        top_customers = [
            {"customer": key, "sales_amount": round(value, 2)}
            for key, value in sorted(customer_totals.items(), key=lambda item: item[1], reverse=True)[: self.top_n]
        ]
        top_countries = [
            {"country": key, "sales_amount": round(value, 2)}
            for key, value in sorted(country_totals.items(), key=lambda item: item[1], reverse=True)[: self.top_n]
        ]

        insights = {
            "top_n": top,
            "message": f"Top {self.top_n} items by _score",
            "top_products": top_products,
            "top_customers": top_customers,
            "top_countries": top_countries,
        }
        logger.info(f"{self.name}: derived {len(top)} top items and {len(top_products)} product insights")
        return {
            "rows": rows,
            "summary": input_data.get("summary"),
            "insights": insights,
            "star_schema": input_data.get("star_schema"),
            "semantic_model": input_data.get("semantic_model"),
        }


class BIExportAgent(Agent):
    def __init__(self, out_path: str = "output/bi_export.csv"):
        super().__init__("BIExportAgent")
        self.out_path = out_path

    def run(self, input_data: Dict[str, Any]) -> Dict[str, Any]:
        rows = input_data.get("rows", [])
        if not rows:
            logger.info(f"{self.name}: no rows to export")
            return {"exported": 0, "path": self.out_path, "semantic_model": input_data.get("semantic_model")}
        # union of keys
        keys = set()
        for r in rows:
            keys.update(r.keys())
        keys = list(keys)
        os.makedirs(os.path.dirname(self.out_path), exist_ok=True)
        try:
            with open(self.out_path, 'w', newline='', encoding='utf-8') as fh:
                writer = csv.DictWriter(fh, fieldnames=keys)
                writer.writeheader()
                for r in rows:
                    writer.writerow(r)
            logger.info(f"{self.name}: exported {len(rows)} rows to {self.out_path}")
            return {
                "exported": len(rows),
                "path": self.out_path,
                "semantic_model": input_data.get("semantic_model"),
                "star_schema": input_data.get("star_schema"),
            }
        except Exception:
            logger.exception(f"{self.name}: failed writing {self.out_path}")
            return {
                "exported": 0,
                "path": self.out_path,
                "semantic_model": input_data.get("semantic_model"),
                "star_schema": input_data.get("star_schema"),
            }


class DocumentationAgent(Agent):
    def __init__(self, doc_path: str = "output/pipeline_documentation.md"):
        super().__init__("DocumentationAgent")
        self.doc_path = doc_path

    def run(self, input_data: Dict[str, Any]) -> Dict[str, Any]:
        summary = input_data.get("summary", {})
        insights = input_data.get("insights", {})
        semantic_model = input_data.get("semantic_model") or input_data.get("star_schema") or {}
        doc_lines: List[str] = []
        doc_lines.append("# Pipeline documentation\n")
        doc_lines.append("Agents run in sequence: DataLoaderAgent -> DataModelingAgent -> ModelAgent -> AnalysisAgent -> InsightAgent -> BIExportAgent -> DocumentationAgent\n")
        doc_lines.append("## Semantic model\n")
        doc_lines.append(json.dumps(semantic_model if isinstance(semantic_model, dict) else {}, indent=2))
        doc_lines.append("\n## Summary\n")
        doc_lines.append(json.dumps(summary, indent=2))
        doc_lines.append("\n## Insights\n")
        doc_lines.append(json.dumps(insights if isinstance(insights, dict) else {}, indent=2))
        os.makedirs(os.path.dirname(self.doc_path), exist_ok=True)
        try:
            with open(self.doc_path, 'w', encoding='utf-8') as fh:
                fh.write("\n".join(doc_lines))
            logger.info(f"{self.name}: wrote documentation to {self.doc_path}")
            return {"doc_path": self.doc_path, "semantic_model": semantic_model}
        except Exception:
            logger.exception(f"{self.name}: failed writing {self.doc_path}")
            return {"doc_path": self.doc_path, "semantic_model": semantic_model}
