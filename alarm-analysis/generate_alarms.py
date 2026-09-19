import os
import numpy as np
import pandas as pd
from datetime import date, datetime, time, timedelta

N_RESIDENTS_TOTAL = 12
N_RESIDENTS_WITH_ALARM = 4

RESIDENTS = {
    1: "still",
    2: "night_waker",
    3: "restless_1",
    4: "restless_2",
}

# Weighting of false alarms per resident. Restless residents generate most of them.
FALSE_RESIDENT_WEIGHTS = {
    "Baseline": [0.05, 0.15, 0.40, 0.40],
    "After":    [0.10, 0.20, 0.35, 0.35],
}

# Weighting of actual bed exits per resident.
TRUE_RESIDENT_WEIGHTS = {
    "Baseline": [0.0, 0.55, 0.225, 0.225],
    "After":    [0.0, 0.55, 0.225, 0.225],
}


def choose_resident(period, alarm_type):
    """Choose a resident based on alarm type and period."""
    if alarm_type == "actual":
        weights = TRUE_RESIDENT_WEIGHTS[period]
    else:
        weights = FALSE_RESIDENT_WEIGHTS[period]
    resident_id = int(np.random.choice(list(RESIDENTS.keys()), p=weights))
    return resident_id, RESIDENTS[resident_id]


def generate():
    """Generate synthetic alarm data for 56 nights (28 before / 28 after repositioning)."""
    np.random.seed(42)
    start = date(2026, 1, 1)

    os.makedirs("data", exist_ok=True)

    records = []
    nightly = []

    for i in range(56):
        current = start + timedelta(days=i)
        period = "Baseline" if i < 28 else "After"

        # Actual bed exits should not be affected by sensor placement
        n_true = int(np.random.poisson(2.4))

        # False alarms: high at baseline, sharply reduced after repositioning
        if period == "Baseline":
            n_false = max(0, int(np.random.poisson(17.6)))
        else:
            # After repositioning: weighted distribution with mean ~1.2 false alarms/night
            n_false = np.random.choice([0, 1, 2, 3], p=[0.20, 0.50, 0.20, 0.10])

        tonight = []

        for _ in range(n_true):
            hour = np.random.choice(
                [22, 23, 0, 1, 2, 3, 4, 5],
                p=[0.05, 0.10, 0.15, 0.20, 0.20, 0.15, 0.10, 0.05]
            )
            resident_id, resident_profile = choose_resident(period, "actual")
            alarm_date = current if hour >= 22 else current + timedelta(days=1)
            dt = datetime.combine(alarm_date, time(hour, np.random.randint(0, 60)))

            # Actual alarms last longer because staff physically attends (> 30 s)
            alarm_duration_s = int(np.random.uniform(120, 600))

            tonight.append({
                "night_id": i + 1,
                "resident_id": resident_id,
                "resident_profile": resident_profile,
                "date": current,
                "period": period,
                "datetime": dt,
                "hour": hour,
                "alarm_type": "actual",
                "triggered_by": "actual_bed_exit",
                "alarm_duration_s": alarm_duration_s,
                "silenced_within_30s": 0,
                "response_min": round(np.random.uniform(3.0, 8.0), 1),
                "awoke_resident": int(np.random.choice([0, 1], p=[0.20, 0.80])),
            })

        for _ in range(n_false):
            if period == "Baseline":
                hour = np.random.choice(
                    [22, 23, 0, 1, 2, 3, 4, 5],
                    p=[0.10, 0.12, 0.16, 0.18, 0.18, 0.15, 0.08, 0.03]
                )
                reason = np.random.choice(
                    ["turning_in_bed", "drinking_water", "blanket_adjustment",
                     "scratching", "staff_passing"],
                    p=[0.35, 0.20, 0.20, 0.20, 0.05]
                )
                woke_prob = [0.40, 0.60]
            else:
                hour = np.random.choice(
                    [22, 23, 0, 1, 2, 3, 4, 5],
                    p=[0.20, 0.20, 0.20, 0.15, 0.15, 0.05, 0.03, 0.02]
                )
                reason = np.random.choice(
                    ["residual_misdetection", "staff_passing"],
                    p=[0.75, 0.25]
                )
                woke_prob = [0.85, 0.15]

            resident_id, resident_profile = choose_resident(period, "false_positive")
            alarm_date = current if hour >= 22 else current + timedelta(days=1)
            dt = datetime.combine(alarm_date, time(hour, np.random.randint(0, 60)))

            # A false alarm is defined as an alarm that is silenced within 30 seconds
            alarm_duration_s = int(np.random.uniform(5, 30))

            tonight.append({
                "night_id": i + 1,
                "resident_id": resident_id,
                "resident_profile": resident_profile,
                "date": current,
                "period": period,
                "datetime": dt,
                "hour": hour,
                "alarm_type": "false_positive",
                "triggered_by": reason,
                "alarm_duration_s": alarm_duration_s,
                "silenced_within_30s": 1,
                "response_min": round(np.random.uniform(1.0, 4.5), 1),
                "awoke_resident": int(np.random.choice([0, 1], p=woke_prob)),
            })

        records.extend(tonight)
        nightly.append({
            "night_id": i + 1,
            "date": current,
            "period": period,
            "weekday": current.strftime("%A"),
            "n_residents_total": N_RESIDENTS_TOTAL,
            "n_residents_with_alarm": N_RESIDENTS_WITH_ALARM,
            "n_true_alarms": n_true,
            "n_false_alarms": n_false,
            "total_alarms": n_true + n_false,
            "staff_interventions": n_true + n_false,
            "total_response_min": round(sum(a["response_min"] for a in tonight), 1),
            "resident_awakenings_est": sum(a["awoke_resident"] for a in tonight),
            "pct_silenced_within_30s": round(
                sum(a["silenced_within_30s"] for a in tonight) / len(tonight) * 100, 1
            ) if tonight else 0.0,
        })

    df_alarms = pd.DataFrame(records)
    df_nights = pd.DataFrame(nightly)

    df_alarms.to_csv("data/alarms.csv", index=False)
    df_nights.to_csv("data/nights.csv", index=False)
    print("data/alarms.csv and data/nights.csv created.")


if __name__ == "__main__":
    generate()
