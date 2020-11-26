import pip._vendor.requests as requests
from pip._vendor.requests import HTTPError

try:
    # api_url = "https://api.covid19api.com/dayone/country/ukraine/status/{cases}/live"
    api_url = "https://apigw.nubentos.com:443/t/nubentos.com/ncovapi/2.0.0/today{cases}"
    params = {"country": "Ukraine"}
    headers = {"Authorization": "Bearer 6eaec066-7088-33c9-b3c2-c9bbdddc5ae0"}

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
