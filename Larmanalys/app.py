import streamlit as st
import pandas as pd
import plotly.express as px

st.set_page_config(page_title="Alarm analysis – false alarms", layout="wide")
st.title("Motion alarm: from sleep disruption to 92% fewer false alarms")
st.caption("Based on a simulated case built on real operational patterns from elderly care.")

nights = pd.read_csv("data/nights.csv")
alarms = pd.read_csv("data/alarms.csv")
nights["date"] = pd.to_datetime(nights["date"])
alarms["datetime"] = pd.to_datetime(alarms["datetime"])

baseline = nights[nights.period == "Baseline"]
after = nights[nights.period == "After"]

n_residents_total = int(nights["n_residents_total"].iloc[0])
n_residents_with_alarm = int(nights["n_residents_with_alarm"].iloc[0])

false_b = baseline.n_false_alarms.mean()
false_a = after.n_false_alarms.mean()
reduction = (false_b - false_a) / false_b

time_false_b = alarms[(alarms.alarm_type == "false_positive") & (alarms.period == "Baseline")]["response_min"].sum()
time_false_a = alarms[(alarms.alarm_type == "false_positive") & (alarms.period == "After")]["response_min"].sum()
hours_saved_28nights = (time_false_b - time_false_a) / 60

st.markdown("### Key metrics")
c1, c2, c3, c4, c5 = st.columns(5)
c1.metric("False alarms/night – before", f"{false_b:.1f}")
c2.metric("False alarms/night – after", f"{false_a:.1f}")
c3.metric("Reduction", f"{reduction * 100:.0f}%")
c4.metric("Staff hours saved (28 nights)", f"{hours_saved_28nights:.0f} h")
c5.metric("Residents with motion alarm", f"{n_residents_with_alarm}")

with st.expander("Method and assumptions"):
    st.markdown(
        f"""
        - **Total residents:** {n_residents_total}
        - **Residents with motion alarm:** {n_residents_with_alarm}
        - **Time period:** night-time (21–07), 28 nights before and 28 nights after repositioning
        - **Definition of a false alarm:** an alarm that is silenced within 30 seconds
        - **Data basis:** a simulated case built on real operational patterns from elderly care
        - **Assumption:** actual bed exits are not affected by the sensor placement
        """
    )

st.markdown("---")

col1, col2 = st.columns(2)
with col1:
    fig = px.line(
        nights, x="date", y="n_false_alarms", color="period",
        title="False alarms per night (Jan–Feb 2026)", markers=True
    )
    fig.update_xaxes(tickformat="%b %d")
    intervention = nights["date"].iloc[28]
    fig.add_scatter(
        x=[intervention, intervention],
        y=[0, nights["n_false_alarms"].max()],
        mode="lines",
        line=dict(color="red", dash="dash"),
        name="Sensor moved",
        showlegend=True
    )
    st.plotly_chart(fig, use_container_width=True)

with col2:
    summary = nights.groupby("period")[["n_true_alarms", "n_false_alarms"]].mean().reset_index()
    summary = summary.rename(columns={
        "n_true_alarms": "Actual alarms",
        "n_false_alarms": "False alarms"
    })
    fig2 = px.bar(
        summary, x="period", y=["Actual alarms", "False alarms"],
        title="Average number of alarms per night",
        barmode="group",
        category_orders={"period": ["Baseline", "After"]}
    )
    st.plotly_chart(fig2, use_container_width=True)

st.markdown("### Average false alarms per hour and night")
hours = [21, 22, 23, 0, 1, 2, 3, 4, 5, 6, 7]
hour_labels = [f"{h:02d}" for h in hours]

nights_per_period = nights.groupby("period").size()
false_alarms = alarms[alarms.alarm_type == "false_positive"].copy()

# Count false alarms per hour and period, divide by number of nights
hourly_counts = false_alarms.groupby(["period", "hour"]).size().reset_index(name="n_false")
hourly_counts["avg_false_per_night"] = hourly_counts["n_false"] / hourly_counts["period"].map(nights_per_period)

# Fill all hours so the chart is complete 21–07
all_hours = pd.DataFrame(
    [(p, h) for p in ["Baseline", "After"] for h in hours],
    columns=["period", "hour"]
)
all_hours["hour_label"] = all_hours["hour"].map(dict(zip(hours, hour_labels)))
hourly_counts["hour_label"] = hourly_counts["hour"].map(dict(zip(hours, hour_labels)))

hourly = all_hours.merge(hourly_counts, on=["period", "hour", "hour_label"], how="left")
hourly["avg_false_per_night"] = hourly["avg_false_per_night"].fillna(0)

fig3 = px.line(
    hourly,
    x="hour_label",
    y="avg_false_per_night",
    color="period",
    title="Average false alarms per hour and night",
    markers=True,
    category_orders={"hour_label": hour_labels},
    labels={"avg_false_per_night": "Avg false alarms / hour", "hour_label": "Hour"}
)
fig3.update_xaxes(type="category")
st.plotly_chart(fig3, use_container_width=True)

st.markdown("### Table: nights with most false alarms (baseline)")
top_nights = (
    baseline.nlargest(5, "n_false_alarms")
    .sort_values("date")
    [["date", "n_false_alarms", "n_true_alarms", "resident_awakenings_est"]]
    .copy()
)
top_nights["date"] = top_nights["date"].dt.strftime("%y-%m-%d")
top_nights = top_nights.reset_index(drop=True)
st.dataframe(top_nights, use_container_width=True, hide_index=True)

st.markdown("---")
st.info(
    "With the right motion-sensor placement, alarms triggered by turning in bed, "
    "adjusting the blanket or drinking water are avoided. Fewer unnecessary night-time "
    "wake-ups mean better sleep for both residents and staff, and fewer unnecessary "
    "check rounds."
)
