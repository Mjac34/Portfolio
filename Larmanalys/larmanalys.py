import os
import matplotlib
matplotlib.use("Agg")  # save figures without opening a window
import matplotlib.pyplot as plt
import pandas as pd
import generate_alarms as ga

# 1. Generate data

ga.generate()

# 2. Load aggregated data

nights = pd.read_csv("data/nights.csv")
alarms = pd.read_csv("data/alarms.csv")
nights["date"] = pd.to_datetime(nights["date"])

# 3. Calculate key metrics

baseline = nights[nights.period == "Baseline"]
after = nights[nights.period == "After"]

n_residents_total = int(nights["n_residents_total"].iloc[0])
n_residents_with_alarm = int(nights["n_residents_with_alarm"].iloc[0])

false_b = baseline.n_false_alarms.mean()
false_a = after.n_false_alarms.mean()
reduction = (false_b - false_a) / false_b

true_b = baseline.n_true_alarms.mean()
true_a = after.n_true_alarms.mean()

time_false_b = alarms[(alarms.alarm_type == "false_positive") & (alarms.period == "Baseline")]["response_min"].sum()
time_false_a = alarms[(alarms.alarm_type == "false_positive") & (alarms.period == "After")]["response_min"].sum()
hours_saved_28 = (time_false_b - time_false_a) / 60

awake_b = baseline["resident_awakenings_est"].mean()
awake_a = after["resident_awakenings_est"].mean()

print("=" * 55)
print("Results: motion alarm before and after repositioning")
print("=" * 55)
print(f"Total residents: {n_residents_total}")
print(f"Residents with motion alarm: {n_residents_with_alarm}")
print(f"Time period: night-time, 28 + 28 nights")
print(f"Definition of false alarm: alarm silenced within 30 seconds")
print("-" * 55)
print(f"False alarms per night: before = {false_b:.1f}, after = {false_a:.1f}")
print(f"Reduction: {reduction * 100:.0f}%")
print(f"Actual alarms per night: before = {true_b:.1f}, after = {true_a:.1f}")
print(f"Staff hours saved over 28 nights: {hours_saved_28:.0f} h")
print(f"Estimated resident awakenings per night: before = {awake_b:.1f}, after = {awake_a:.1f}")
print("=" * 55)

# 4. Create figures

os.makedirs("figures", exist_ok=True)

fig, ax = plt.subplots(figsize=(10, 5))
for period, color in [("Baseline", "coral"), ("After", "seagreen")]:
    df = nights[nights.period == period]
    ax.plot(df.date, df.n_false_alarms, label=period, marker="o", color=color)

intervention_date = nights["date"].iloc[28]
ax.axvline(intervention_date, color="red", linestyle="--", label="Sensor moved")
ax.set_title("False alarms per night (Jan–Feb 2026)")
ax.set_xlabel("Date")
ax.set_ylabel("Number of false alarms")
ax.legend()
fig.tight_layout()
fig.savefig("figures/false_alarms_per_night.png")
plt.close(fig)

fig, ax = plt.subplots(figsize=(8, 5))
summary = nights.groupby("period")[["n_true_alarms", "n_false_alarms"]].mean()
summary = summary.reindex(["Baseline", "After"])
summary.plot(kind="bar", ax=ax, color=["steelblue", "coral"], rot=0)
ax.set_title("Average number of alarms per night")
ax.set_ylabel("Count")
ax.legend(["Actual alarms", "False alarms"])
ax.set_xlabel("Period")
fig.tight_layout()
fig.savefig("figures/alarms_summary.png")
plt.close(fig)

print("\nFigures saved in the figures/ folder")
