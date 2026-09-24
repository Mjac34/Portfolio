"""Export GoatCounter pageviews to stats/visits.csv (gitignored).

Setup:
    1. Create an API key: mjac34.goatcounter.com -> [username] -> API
    2. Set it as an environment variable, then run the script:

        $env:GOATCOUNTER_TOKEN = "..."   # PowerShell
        set GOATCOUNTER_TOKEN=...        # cmd
        python export_stats.py
"""

import json
import os
import sys
import time
import urllib.request
from pathlib import Path

SITE = "mjac34"
API = f"https://{SITE}.goatcounter.com/api/v0"
OUT = Path(__file__).parent / "stats" / "visits.csv"


def request(path, method="GET"):
    token = os.environ.get("GOATCOUNTER_TOKEN")
    if not token:
        sys.exit("GOATCOUNTER_TOKEN not set — create a key at "
                 f"https://{SITE}.goatcounter.com -> username -> API")
    req = urllib.request.Request(
        API + path,
        method=method,
        headers={
            "Authorization": f"Bearer {token}",
            "Content-Type": "application/json",
        },
    )
    return urllib.request.urlopen(req, timeout=30)


def main():
    with request("/export", "POST") as resp:
        export_id = json.load(resp)["id"]

    while True:
        with request(f"/export/{export_id}") as resp:
            status = json.load(resp)
        if status.get("finished_at"):
            break
        time.sleep(2)

    with request(f"/export/{export_id}/download") as resp:
        csv_data = resp.read()

    OUT.parent.mkdir(exist_ok=True)
    OUT.write_bytes(csv_data)
    print(f"Wrote {OUT} ({len(csv_data)} bytes)")


if __name__ == "__main__":
    main()
