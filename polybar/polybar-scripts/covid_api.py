#!/usr/env/bin python
import pip._vendor.requests as requests
from pip._vendor.requests import HTTPError
import subprocess

try:
    api_key = subprocess.check_output(
            "op read op://API/COVID/key --account my.1password.com", shell=True, text=True
    )[:-1]
    # api_url = "https://api.covid19api.com/dayone/country/ukraine/status/{cases}/live"
    api_url = "https://apigw.nubentos.com:443/t/nubentos.com/ncovapi/2.0.0/today{cases}"
    params = {"country": "Ukraine"}
    headers = {"Authorization": f"Bearer {api_key}"}

    data = {}
    for request_type in ["Cases", "Deaths"]:
        response = requests.get(
            api_url.format(cases=request_type), params=params, headers=headers
        )
        response.raise_for_status()
        response = response.json()
        delta = response[0]["data"]
        data[request_type] = delta

    print(f"+{data['Cases']} x{data['Deaths']}")

except HTTPError as http_err:
    print(http_err)
