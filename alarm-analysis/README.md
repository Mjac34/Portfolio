# Alarm analysis: 92% fewer false alarms with correct motion-sensor placement

> **Based on real patterns from elderly care.**  
> All data is synthetic and used only to illustrate a BI analysis.

## Background

In a dementia care unit, a motion alarm was aimed at the resident's bed. It went off every time the resident turned, adjusted the blanket, scratched or drank water. Staff were told to turn the alarm around, which led to it being placed under the bed aimed at the door — and then it triggered every time staff looked in.

After repositioning to a floor-level bed-exit sensor, which only triggers when the resident actually leaves the bed, false alarms dropped sharply.

## Dataset

- `data/alarms.csv` – one row per alarm, with resident, profile, type, cause, timestamp, alarm duration and estimated wake-up.
- `data/nights.csv` – aggregated nightly values over 56 nights (28 before / 28 after).

## Assumptions

- **Residents:** 12 residents in total on a night shift, of which 4 have motion alarms.
- **Resident profiles (among those with alarms):**
  - 1 resident who almost never moves.
  - 1 resident who gets up once per night (e.g. to use the toilet).
  - 2 residents who are restless and move a lot.
- **What is a false alarm?** An alarm that is silenced within 30 seconds, because staff then judge that no action is needed.
- **Time period:** night-time (21–07), 28 nights before and 28 nights after the sensor was moved.

## Key results

- **Fewer false alarms:** ~92% reduction from baseline to after.
- **Less disrupted sleep:** fewer unnecessary wake-ups for residents and staff.
- **Time saving:** approximately 19 staff hours saved over 28 nights.
- **Actual alarms unchanged:** real bed exits are still detected.

## Run the app

```bash
pip install -r requirements.txt
python larmanalys.py
streamlit run app.py
```

You can also open `larmanalys.ipynb` in Jupyter to walk through the analysis step by step.

## Limitations

- Synthetic data, one unit, no control group.
- The result illustrates analytical method rather than scientific proof.
- The number of residents, sensor placements and response times are estimates chosen to clearly demonstrate the difference.
