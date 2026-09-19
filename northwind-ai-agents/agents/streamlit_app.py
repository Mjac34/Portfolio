from pathlib import Path

import pandas as pd
import streamlit as st

PROJECT_ROOT = Path(__file__).resolve().parent.parent
CSV_PATH = PROJECT_ROOT / "output" / "bi_export.csv"
CRM_PATH = PROJECT_ROOT / "output" / "customer_profiles.csv"


@st.cache_data
def load_data(path: Path) -> pd.DataFrame:
    if not path.exists():
        return pd.DataFrame()
    df = pd.read_csv(path)
    return df


def status_badge(label: str, color: str) -> str:
    return (
        "<span style='display:inline-block; padding:4px 12px; border-radius:999px; "
        f"background:{color}; color:white; font-weight:600; font-size:0.85rem;'>{label}</span>"
    )


st.set_page_config(page_title="Northwind Executive Dashboard", layout="wide")

if not CSV_PATH.exists():
    st.warning("No export yet. Run first: python run_agent_crew.py")
    st.stop()

df = load_data(CSV_PATH)
if df.empty:
    st.warning(f"CSV file exists but is empty: {CSV_PATH}")
    st.stop()

# Derive business fields if missing
if "sales_amount" not in df.columns:
    price = pd.to_numeric(df["unitPrice"], errors="coerce") if "unitPrice" in df.columns else pd.Series(0.0, index=df.index)
    qty = pd.to_numeric(df["quantity"], errors="coerce") if "quantity" in df.columns else pd.Series(0.0, index=df.index)
    discount = pd.to_numeric(df["discount"], errors="coerce") if "discount" in df.columns else pd.Series(0.0, index=df.index)
    df["sales_amount"] = price * qty * (1 - discount)

if "orderDate" in df.columns:
    df["orderDate"] = pd.to_datetime(df["orderDate"], errors="coerce")

if "_score" not in df.columns:
    df["_score"] = pd.to_numeric(df.get("sales_amount", 0), errors="coerce").fillna(0)

st.title("Northwind Executive Dashboard")
st.caption("BI-style overview of sales, customers, products and regions")

with st.sidebar:
    st.header("Filters")
    if "shipCountry" in df.columns:
        countries = ["All"] + sorted(df["shipCountry"].dropna().astype(str).unique().tolist())
        selected_country = st.selectbox("Country", countries)
        if selected_country != "All":
            df = df[df["shipCountry"].astype(str) == selected_country]

    if "productName" in df.columns:
        products = ["All"] + sorted(df["productName"].dropna().astype(str).unique().tolist())
        selected_product = st.selectbox("Product", products)
        if selected_product != "All":
            df = df[df["productName"].astype(str) == selected_product]

    if "customer_segment" in df.columns:
        segments = ["All"] + sorted(df["customer_segment"].dropna().astype(str).unique().tolist())
        selected_segment = st.selectbox("Customer segment", segments)
        if selected_segment != "All":
            df = df[df["customer_segment"].astype(str) == selected_segment]

    if "sales_amount" in df.columns:
        min_sale = float(df["sales_amount"].min())
        max_sale = float(df["sales_amount"].max())
        if max_sale > min_sale:
            lower, upper = st.slider(
                "Revenue range",
                min_value=min_sale,
                max_value=max_sale,
                value=(min_sale, max_sale),
                step=max((max_sale - min_sale) / 100, 1.0),
            )
            df = df[(df["sales_amount"] >= lower) & (df["sales_amount"] <= upper)]

    st.markdown("---")
    st.caption("Data model")
    st.write("Fact table: order_details")
    st.write("Dimensions: customers, products, orders, country, sales team")

if df.empty:
    st.warning("No rows match the filter. Adjust the filters.")
    st.stop()

# KPI metrics
revenue_total = float(df["sales_amount"].sum()) if "sales_amount" in df.columns else 0.0
order_count = int(df["orderID"].nunique()) if "orderID" in df.columns else len(df)
avg_order_value = float(df.groupby("orderID")["sales_amount"].sum().mean()) if "orderID" in df.columns and "sales_amount" in df.columns else 0.0
return_metric = float(df["sales_amount"].sum() / max(order_count, 1)) if order_count else 0.0

customer_sales = df.groupby("customerID")["sales_amount"].sum() if "customerID" in df.columns and "sales_amount" in df.columns else pd.Series(dtype=float)
product_sales = df.groupby("productName")["sales_amount"].sum() if "productName" in df.columns and "sales_amount" in df.columns else pd.Series(dtype=float)
country_sales = df.groupby("shipCountry")["sales_amount"].sum() if "shipCountry" in df.columns and "sales_amount" in df.columns else pd.Series(dtype=float)
segment_sales = df.groupby("customer_segment")["sales_amount"].sum() if "customer_segment" in df.columns else pd.Series(dtype=float)

kpi1, kpi2, kpi3, kpi4 = st.columns(4)
with kpi1:
    st.metric("Total revenue", f"{revenue_total:,.2f}")
with kpi2:
    st.metric("Order rows", f"{order_count:,}")
with kpi3:
    st.metric("Avg order value", f"{avg_order_value:,.2f}")
with kpi4:
    st.metric("Top product", product_sales.idxmax()[:20] if not product_sales.empty else "-" )

st.markdown("---")

chart_left, chart_right = st.columns(2)
with chart_left:
    monthly = df.groupby(df["orderDate"].dt.to_period("M"))["sales_amount"].sum() if "orderDate" in df.columns else pd.Series(dtype=float)
    if not monthly.empty:
        st.subheader("Revenue over time")
        st.line_chart(monthly.rename_axis("Month").reset_index(drop=True))
    else:
        st.info("No time dimension for trend")

with chart_right:
    top_customers = customer_sales.sort_values(ascending=False).head(10)
    st.subheader("Top customers")
    st.bar_chart(top_customers)

chart3, chart4 = st.columns(2)
with chart3:
    top_products = product_sales.sort_values(ascending=False).head(10)
    st.subheader("Top products")
    st.bar_chart(top_products)

with chart4:
    top_countries = country_sales.sort_values(ascending=False).head(10)
    st.subheader("Country/region")
    st.bar_chart(top_countries)

segment_col, segment_table = st.columns([1.2, 2.8])
with segment_col:
    st.subheader("Customer segments")
    if not segment_sales.empty:
        st.bar_chart(segment_sales)
    else:
        st.info("No segment data available")

with segment_table:
    st.subheader("Segment overview")
    if "customer_segment" in df.columns:
        segment_table_df = df.groupby("customer_segment")["sales_amount"].sum().reset_index()
        segment_table_df.columns = ["Segment", "Revenue"]
        segment_table_df["Revenue"] = segment_table_df["Revenue"].map(lambda x: round(float(x), 2))
        st.dataframe(segment_table_df, use_container_width=True, hide_index=True)
    else:
        st.info("No segmentation yet")

crm_df = load_data(CRM_PATH)
crm_df = crm_df.copy() if not crm_df.empty else pd.DataFrame()
selected_customer_name = None
if not crm_df.empty:
    for col in ["total_revenue", "order_count", "avg_order_value"]:
        if col in crm_df.columns:
            crm_df[col] = pd.to_numeric(crm_df[col], errors="coerce").fillna(0)
    crm_df["customerName"] = crm_df["customerName"].fillna("Unknown customer").astype(str)
    crm_df = crm_df.sort_values("total_revenue", ascending=False).reset_index(drop=True)
    for col in ["r_score", "f_score", "m_score", "rfm_score", "recency_days"]:
        if col in crm_df.columns:
            crm_df[col] = pd.to_numeric(crm_df[col], errors="coerce").fillna(0)
    crm_df["status_label"] = crm_df["behavior_signal"].fillna("At Risk")

with st.sidebar:
    if not crm_df.empty:
        st.markdown("---")
        st.subheader("CRM customer picker")
        crm_segment_options = ["All"] + sorted(crm_df["rfm_segment"].dropna().astype(str).unique().tolist()) if "rfm_segment" in crm_df.columns else ["All"]
        selected_segment_filter = st.selectbox("CRM segment", crm_segment_options)
        if selected_segment_filter != "All":
            crm_df = crm_df[crm_df["rfm_segment"].astype(str) == selected_segment_filter].reset_index(drop=True)
        selected_customer_name = st.selectbox("Select customer", crm_df["customerName"].tolist(), index=0)

st.markdown("---")

if not crm_df.empty:
    st.subheader("CRM - customer detail")
    if selected_customer_name is None:
        selected_customer_name = crm_df["customerName"].iloc[0]
    selected_customer = crm_df[crm_df["customerName"] == selected_customer_name].iloc[0]

    detail_kpi1, detail_kpi2, detail_kpi3, detail_kpi4 = st.columns(4)
    with detail_kpi1:
        st.metric("Total revenue", f"{float(selected_customer.get('total_revenue', 0.0)):.2f}")
    with detail_kpi2:
        st.metric("Order count", f"{int(selected_customer.get('order_count', 0))}")
    with detail_kpi3:
        st.metric("Avg order", f"{float(selected_customer.get('avg_order_value', 0.0)):.2f}")
    with detail_kpi4:
        st.metric("Churn risk", f"{int(selected_customer.get('churn_risk', 0))}/100")

    action_box = st.container()
    with action_box:
        st.markdown("### Next best action")
        action = selected_customer.get("next_best_action") or selected_customer.get("recommended_action") or "Campaign – to be decided"
        behavior = selected_customer.get("behavior_signal") or "Unknown"
        recency = selected_customer.get("recency_days")
        status_color = {"Active": "#2ecc71", "At Risk": "#f39c12", "Inactive": "#e74c3c"}.get(behavior, "#6c757d")
        badge = status_badge(behavior, status_color)
        st.markdown(
            f"<div style='padding:12px 14px; border-radius:10px; background:#f5f5f5; border:1px solid #ddd;'>"
            f"<strong>{action}</strong><br><br>"
            f"Status: {badge}<br>Recency: {recency} days since last purchase</div>",
            unsafe_allow_html=True,
        )

    detail_col1, detail_col2 = st.columns([1.5, 1.3])
    with detail_col1:
        st.markdown("### Customer profile")
        rfm_score = selected_customer.get("rfm_score") or "-"
        rfm_segment = selected_customer.get("rfm_segment") or "-"
        profile_items = {
            "Customer": selected_customer.get("customerName", "-"),
            "Country": selected_customer.get("country", "-"),
            "Segment": selected_customer.get("segment", "-"),
            "Status": behavior,
            "Churn risk": f"{int(selected_customer.get('churn_risk', 0))}/100 ({selected_customer.get('churn_risk_label', 'Low')})",
            "RFM segment": rfm_segment,
            "RFM score": rfm_score,
            "Behavior": behavior,
            "First purchase": selected_customer.get("first_purchase_date", "-"),
            "Last purchase": selected_customer.get("last_purchase_date", "-"),
            "Recommended action": selected_customer.get("recommended_action", "-"),
        }
        for key, value in profile_items.items():
            if key == "Status":
                st.markdown(f"- **{key}:** {status_badge(str(value), status_color)}", unsafe_allow_html=True)
            else:
                st.markdown(f"- **{key}:** {value}")

    with detail_col2:
        st.markdown("### Products purchased")
        products = str(selected_customer.get("products_purchased", "")).split(",") if selected_customer.get("products_purchased") else []
        if products:
            for product in products[:20]:
                st.markdown(f"- {product.strip()}")
        else:
            st.info("No products registered for this customer.")

    st.markdown("---")

    segment_palette = {
        "Champions": "#1f9d55",
        "Loyal Customers": "#2ecc71",
        "Potential Loyalists": "#7bd389",
        "Recent Customers": "#5dade2",
        "Needs Attention": "#f5b041",
        "At Risk": "#e67e22",
        "Hibernating": "#a569bd",
        "Lost": "#c0392b",
    }

    known_segments = [
        "Champions",
        "Loyal Customers",
        "Potential Loyalists",
        "Recent Customers",
        "Needs Attention",
        "At Risk",
        "Hibernating",
        "Lost",
    ]
    segment_counts = crm_df["rfm_segment"].value_counts().reindex(known_segments, fill_value=0) if "rfm_segment" in crm_df.columns else pd.Series(dtype=int)
    segment_cards = st.columns(len(segment_counts)) if not segment_counts.empty else [st.container()]
    for idx, segment_name in enumerate(segment_counts.index):
        with segment_cards[idx]:
            count = int(segment_counts.loc[segment_name])
            color = segment_palette.get(segment_name, "#6c757d")
            st.markdown(
                f"<div style='padding:14px 12px; border-radius:12px; background:{color}; color:white; text-align:center; min-height:110px;'>"
                f"<div style='font-size:0.8rem; opacity:0.9;'>CRM segment</div>"
                f"<div style='font-size:1.6rem; font-weight:700; margin-top:8px;'>{segment_name}</div>"
                f"<div style='font-size:1.8rem; font-weight:700; margin-top:10px;'>{count}</div>"
                f"</div>",
                unsafe_allow_html=True,
            )

    st.markdown("---")

    risk_trend_df = crm_df.copy()
    if "last_purchase_date" in risk_trend_df.columns:
        risk_trend_df["last_purchase_date"] = pd.to_datetime(risk_trend_df["last_purchase_date"], errors="coerce")
        risk_trend_df = risk_trend_df.dropna(subset=["last_purchase_date"])
        if not risk_trend_df.empty:
            risk_trend_df["last_purchase_month"] = risk_trend_df["last_purchase_date"].dt.to_period("M").astype(str)
            risk_trend = risk_trend_df.groupby("last_purchase_month")["churn_risk"].mean().sort_index()
            st.subheader("Churn-risk trend")
            st.line_chart(risk_trend)

    rfm_col1, rfm_col2 = st.columns([1.3, 1.7])
    with rfm_col1:
        st.subheader("RFM segments")
        if {"r_score", "f_score", "m_score"}.issubset(crm_df.columns):
            segment_counts_chart = crm_df["rfm_segment"].value_counts().sort_index()
            st.bar_chart(segment_counts_chart)
        else:
            st.info("No RFM segment data available")

    with rfm_col2:
        st.subheader("RFM matrix")
        if {"r_score", "f_score"}.issubset(crm_df.columns):
            rfm_matrix = pd.crosstab(crm_df["r_score"], crm_df["f_score"]).reindex(index=range(5, 0, -1), columns=range(1, 6), fill_value=0)
            st.dataframe(rfm_matrix.style.background_gradient(cmap="RdYlGn_r"), use_container_width=True)
        else:
            st.info("No RFM matrix available")

    st.markdown("---")
    st.subheader("Customer list")
    st.dataframe(
        crm_df[["customerID", "customerName", "country", "segment", "status_label", "rfm_segment", "rfm_score", "total_revenue", "order_count", "avg_order_value", "next_best_action"]],
        use_container_width=True,
        hide_index=True,
    )
else:
    st.info("No CRM profile export yet. Run the pipeline first: python run_agent_crew.py")

st.markdown("---")

insights_col1, insights_col2 = st.columns(2)
with insights_col1:
    st.subheader("Executive highlights")
    if not customer_sales.empty:
        st.markdown(f"- Largest customer: **{customer_sales.idxmax()}** with **{customer_sales.max():,.2f}** in revenue.")
    if not product_sales.empty:
        st.markdown(f"- Most profitable product: **{product_sales.idxmax()}** with **{product_sales.max():,.2f}**.")
    if not country_sales.empty:
        st.markdown(f"- Highest revenue country: **{country_sales.idxmax()}** with **{country_sales.max():,.2f}**.")
    if not segment_sales.empty:
        st.markdown(f"- Largest segment: **{segment_sales.idxmax()}** with **{segment_sales.max():,.2f}** in total revenue.")
    st.markdown(f"- Average order value: **{avg_order_value:,.2f}**.")

with insights_col2:
    st.subheader("Top 10 customers")
    top_customer_table = customer_sales.sort_values(ascending=False).head(10).reset_index()
    top_customer_table.columns = ["Customer", "Revenue"]
    top_customer_table["Revenue"] = top_customer_table["Revenue"].map(lambda x: round(float(x), 2))
    st.dataframe(top_customer_table, use_container_width=True, hide_index=True)

st.markdown("---")
with st.expander("Raw data"):
    st.dataframe(df, use_container_width=True)

st.markdown("---")
st.header("Ask the data")
try:
    from agents import llm_client
    from agents.query_agent import ask
except ImportError:
    import llm_client
    from query_agent import ask

if not llm_client.is_configured():
    st.info("Set LLM_API_KEY in .env to enable the natural-language query agent.")
else:
    st.caption("Natural-language questions answered by an LLM that selects which "
               "data tool to call — numbers always come from the exported CSVs.")
    if "chat_history" not in st.session_state:
        st.session_state.chat_history = []
    for msg in st.session_state.chat_history:
        with st.chat_message(msg["role"]):
            st.markdown(msg["content"])
    if question := st.chat_input("e.g. 'which customers are about to churn?'"):
        st.session_state.chat_history.append({"role": "user", "content": question})
        with st.chat_message("user"):
            st.markdown(question)
        with st.chat_message("assistant"):
            with st.spinner("Thinking…"):
                answer = ask(question)
            st.markdown(answer)
        st.session_state.chat_history.append({"role": "assistant", "content": answer})
