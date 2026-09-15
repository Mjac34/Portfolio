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
    st.warning("Ingen export finns ännu. Kör först: python run_agent_crew.py")
    st.stop()

df = load_data(CSV_PATH)
if df.empty:
    st.warning(f"CSV-filen finns men är tom: {CSV_PATH}")
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
st.caption("BI-lik översikt över försäljning, kunder, produkter och regioner")

with st.sidebar:
    st.header("Filter")
    if "shipCountry" in df.columns:
        countries = ["Alla"] + sorted(df["shipCountry"].dropna().astype(str).unique().tolist())
        selected_country = st.selectbox("Land", countries)
        if selected_country != "Alla":
            df = df[df["shipCountry"].astype(str) == selected_country]

    if "productName" in df.columns:
        products = ["Alla"] + sorted(df["productName"].dropna().astype(str).unique().tolist())
        selected_product = st.selectbox("Produkt", products)
        if selected_product != "Alla":
            df = df[df["productName"].astype(str) == selected_product]

    if "customer_segment" in df.columns:
        segments = ["Alla"] + sorted(df["customer_segment"].dropna().astype(str).unique().tolist())
        selected_segment = st.selectbox("Kundsegment", segments)
        if selected_segment != "Alla":
            df = df[df["customer_segment"].astype(str) == selected_segment]

    if "sales_amount" in df.columns:
        min_sale = float(df["sales_amount"].min())
        max_sale = float(df["sales_amount"].max())
        if max_sale > min_sale:
            lower, upper = st.slider(
                "Omsättningsintervall",
                min_value=min_sale,
                max_value=max_sale,
                value=(min_sale, max_sale),
                step=max((max_sale - min_sale) / 100, 1.0),
            )
            df = df[(df["sales_amount"] >= lower) & (df["sales_amount"] <= upper)]

    st.markdown("---")
    st.caption("Datamodell")
    st.write("Faktatabell: order_details")
    st.write("Dimensioner: kunder, produkter, order, land, säljarteam")

if df.empty:
    st.warning("Inga rader matchar filtret. Anpassa filtret.")
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
    st.metric("Total omsättning", f"{revenue_total:,.2f}")
with kpi2:
    st.metric("Orderrader", f"{order_count:,}")
with kpi3:
    st.metric("Genomsnittlig ordervärde", f"{avg_order_value:,.2f}")
with kpi4:
    st.metric("Toppprodukt", product_sales.idxmax()[:20] if not product_sales.empty else "-" )

st.markdown("---")

chart_left, chart_right = st.columns(2)
with chart_left:
    monthly = df.groupby(df["orderDate"].dt.to_period("M"))["sales_amount"].sum() if "orderDate" in df.columns else pd.Series(dtype=float)
    if not monthly.empty:
        st.subheader("Omsättning över tid")
        st.line_chart(monthly.rename_axis("Month").reset_index(drop=True))
    else:
        st.info("Ingen tidsdimension för trend")

with chart_right:
    top_customers = customer_sales.sort_values(ascending=False).head(10)
    st.subheader("Topp kunder")
    st.bar_chart(top_customers)

chart3, chart4 = st.columns(2)
with chart3:
    top_products = product_sales.sort_values(ascending=False).head(10)
    st.subheader("Topp produkter")
    st.bar_chart(top_products)

with chart4:
    top_countries = country_sales.sort_values(ascending=False).head(10)
    st.subheader("Land/region")
    st.bar_chart(top_countries)

segment_col, segment_table = st.columns([1.2, 2.8])
with segment_col:
    st.subheader("Kundsegment")
    if not segment_sales.empty:
        st.bar_chart(segment_sales)
    else:
        st.info("Ingen segmentdata tillgänglig")

with segment_table:
    st.subheader("Segmentöversikt")
    if "customer_segment" in df.columns:
        segment_table_df = df.groupby("customer_segment")["sales_amount"].sum().reset_index()
        segment_table_df.columns = ["Segment", "Revenue"]
        segment_table_df["Revenue"] = segment_table_df["Revenue"].map(lambda x: round(float(x), 2))
        st.dataframe(segment_table_df, use_container_width=True, hide_index=True)
    else:
        st.info("Ingen segmentering ännu")

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
    crm_df["status_label"] = crm_df["behavior_signal"].fillna("Risk").map(
        lambda value: "Aktiv" if value == "Aktiv" else "Risk" if value == "Risk" else "Inaktiv"
    )

with st.sidebar:
    if not crm_df.empty:
        st.markdown("---")
        st.subheader("CRM-kundväljare")
        crm_segment_options = ["Alla"] + sorted(crm_df["rfm_segment"].dropna().astype(str).unique().tolist()) if "rfm_segment" in crm_df.columns else ["Alla"]
        selected_segment_filter = st.selectbox("CRM-segment", crm_segment_options)
        if selected_segment_filter != "Alla":
            crm_df = crm_df[crm_df["rfm_segment"].astype(str) == selected_segment_filter].reset_index(drop=True)
        selected_customer_name = st.selectbox("Välj kund", crm_df["customerName"].tolist(), index=0)

st.markdown("---")

if not crm_df.empty:
    st.subheader("CRM - kunddetaljsida")
    if selected_customer_name is None:
        selected_customer_name = crm_df["customerName"].iloc[0]
    selected_customer = crm_df[crm_df["customerName"] == selected_customer_name].iloc[0]

    detail_kpi1, detail_kpi2, detail_kpi3, detail_kpi4 = st.columns(4)
    with detail_kpi1:
        st.metric("Total omsättning", f"{float(selected_customer.get('total_revenue', 0.0)):.2f}")
    with detail_kpi2:
        st.metric("Orderantal", f"{int(selected_customer.get('order_count', 0))}")
    with detail_kpi3:
        st.metric("Genomsnittlig order", f"{float(selected_customer.get('avg_order_value', 0.0)):.2f}")
    with detail_kpi4:
        st.metric("Churn risk", f"{int(selected_customer.get('churn_risk', 0))}/100")

    action_box = st.container()
    with action_box:
        st.markdown("### Nästa bästa åtgärd")
        action = selected_customer.get("next_best_action") or selected_customer.get("recommended_action") or "Kampanj – att bestämmas"
        behavior = selected_customer.get("behavior_signal") or "Okänd"
        recency = selected_customer.get("recency_days")
        status_color = {"Aktiv": "#2ecc71", "Risk": "#f39c12", "Inaktiv": "#e74c3c"}.get(behavior, "#6c757d")
        badge = status_badge(behavior, status_color)
        st.markdown(
            f"<div style='padding:12px 14px; border-radius:10px; background:#f5f5f5; border:1px solid #ddd;'>"
            f"<strong>{action}</strong><br><br>"
            f"Status: {badge}<br>Recency: {recency} dagar sedan senaste köp</div>",
            unsafe_allow_html=True,
        )

    detail_col1, detail_col2 = st.columns([1.5, 1.3])
    with detail_col1:
        st.markdown("### Kundprofil")
        rfm_score = selected_customer.get("rfm_score") or "-"
        rfm_segment = selected_customer.get("rfm_segment") or "-"
        profile_items = {
            "Kundnamn": selected_customer.get("customerName", "-"),
            "Land": selected_customer.get("country", "-"),
            "Segment": selected_customer.get("segment", "-"),
            "Status": behavior,
            "Churn risk": f"{int(selected_customer.get('churn_risk', 0))}/100 ({selected_customer.get('churn_risk_label', 'Low')})",
            "RFM-segment": rfm_segment,
            "RFM-score": rfm_score,
            "Beteende": behavior,
            "Första köp": selected_customer.get("first_purchase_date", "-"),
            "Senaste köp": selected_customer.get("last_purchase_date", "-"),
            "Rekommenderad åtgärd": selected_customer.get("recommended_action", "-"),
        }
        for key, value in profile_items.items():
            if key == "Status":
                st.markdown(f"- **{key}:** {status_badge(str(value), status_color)}", unsafe_allow_html=True)
            else:
                st.markdown(f"- **{key}:** {value}")

    with detail_col2:
        st.markdown("### Produkter köpta")
        products = str(selected_customer.get("products_purchased", "")).split(",") if selected_customer.get("products_purchased") else []
        if products:
            for product in products[:20]:
                st.markdown(f"- {product.strip()}")
        else:
            st.info("Inga produkter registrerade för kunden.")

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
                f"<div style='font-size:0.8rem; opacity:0.9;'>CRM-segment</div>"
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
        st.subheader("RFM-segment")
        if {"r_score", "f_score", "m_score"}.issubset(crm_df.columns):
            segment_counts_chart = crm_df["rfm_segment"].value_counts().sort_index()
            st.bar_chart(segment_counts_chart)
        else:
            st.info("Ingen RFM-segmentdata tillgänglig")

    with rfm_col2:
        st.subheader("RFM-matris")
        if {"r_score", "f_score"}.issubset(crm_df.columns):
            rfm_matrix = pd.crosstab(crm_df["r_score"], crm_df["f_score"]).reindex(index=range(5, 0, -1), columns=range(1, 6), fill_value=0)
            st.dataframe(rfm_matrix.style.background_gradient(cmap="RdYlGn_r"), use_container_width=True)
        else:
            st.info("Ingen RFM-matris tillgänglig")

    st.markdown("---")
    st.subheader("Kundlista")
    st.dataframe(
        crm_df[["customerID", "customerName", "country", "segment", "status_label", "rfm_segment", "rfm_score", "total_revenue", "order_count", "avg_order_value", "next_best_action"]],
        use_container_width=True,
        hide_index=True,
    )
else:
    st.info("Ingen CRM-profil export finns ännu. Kör pipeline först: python run_agent_crew.py")

st.markdown("---")

insights_col1, insights_col2 = st.columns(2)
with insights_col1:
    st.subheader("Executive highlights")
    if not customer_sales.empty:
        st.markdown(f"- Största kund: **{customer_sales.idxmax()}** med **{customer_sales.max():,.2f}** i omsättning.")
    if not product_sales.empty:
        st.markdown(f"- Mest lönsamma produkt: **{product_sales.idxmax()}** med **{product_sales.max():,.2f}**.")
    if not country_sales.empty:
        st.markdown(f"- Högsta omsättning land: **{country_sales.idxmax()}** med **{country_sales.max():,.2f}**.")
    if not segment_sales.empty:
        st.markdown(f"- Största segment: **{segment_sales.idxmax()}** med **{segment_sales.max():,.2f}** i total omsättning.")
    st.markdown(f"- Genomsnittlig ordervärde: **{avg_order_value:,.2f}**.")

with insights_col2:
    st.subheader("Topp 10 kunder")
    top_customer_table = customer_sales.sort_values(ascending=False).head(10).reset_index()
    top_customer_table.columns = ["Customer", "Revenue"]
    top_customer_table["Revenue"] = top_customer_table["Revenue"].map(lambda x: round(float(x), 2))
    st.dataframe(top_customer_table, use_container_width=True, hide_index=True)

st.markdown("---")
with st.expander("Rådata"):
    st.dataframe(df, use_container_width=True)
