#!/bin/sh

API_KEY=$(op read 'op://API/Ecoflow/appKey' --account my.1password.com 2>/dev/null)
API_SECRET=$(op read 'op://API/Ecoflow/secretKey' --account my.1password.com 2>/dev/null)
DELTA_MAX_SN=$(op read 'op://API/Ecoflow/max_sn' --account my.1password.com 2>/dev/null)
URL="https://api.ecoflow.com/iot-service/open/api/device/queryDeviceQuota?sn=$DELTA_MAX_SN"

response=$(curl -sf "$URL" -H "Content-Type: application/json" -H "appkey: $API_KEY" -H "secretKey: $API_SECRET" 2>/dev/null)

data=$(echo "$response" | jq -r '.data' 2>/dev/null)

if [ -n "$data" ]; then

    remaining_pct=$(echo "$data" | jq -r '.soc' 2>/dev/null)
    remaining_time=$(echo "$data" | jq -r '.remainTime' 2>/dev/null)
    input_watts=$(echo "$data" | jq -r '.wattsInSum' 2>/dev/null)
    output_watts=$(echo "$data" | jq -r '.wattsOutSum' 2>/dev/null)

    echo "%{F#4287f5}Ecoflow: $remaining_pct% In:$input_watts"'W'" Out:$output_watts"'W'
else
    echo ""
fi
