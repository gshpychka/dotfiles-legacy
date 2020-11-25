import pip._vendor.requests as requests
from pip._vendor.requests import HTTPError

try:
    api_url = "https://api.covid19api.com/dayone/country/ukraine/status/{cases}/live"

    data = {}
    for request_type in ["confirmed", "recovered", "deaths"]:
        response = requests.get(api_url.format(cases=request_type))
        response.raise_for_status()
        response = response.json()
        delta = response[-1]["Cases"] - response[-2]["Cases"]
        data[request_type] = delta

    print(f"+{data['confirmed']} -{data['recovered']} x{data['deaths']}")

except HTTPError as http_err:
    print(http_err)
