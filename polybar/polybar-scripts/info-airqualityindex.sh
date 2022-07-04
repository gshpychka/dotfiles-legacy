#!/bin/sh

TOKEN=$(op read op://API/AQI/key --account my.1password.com)
CITY="ukraine/kiyiv/vulicya-simyi-kulzhenkiv--31"

API="https://api.waqi.info/feed"

aqi=$(curl -sf "$API/$CITY/?token=$TOKEN")

if [ -n "$aqi" ]; then
    if [ "$(echo "$aqi" | jq -r '.status')" = "ok" ]; then
        aqi=$(echo "$aqi" | jq '.data.aqi')

        if [ "$aqi" -lt 50 ]; then
            echo "%{F#009966}AQI: $aqi"
        elif [ "$aqi" -lt 100 ]; then
            echo "%{F#ffde33}AQI: $aqi"
        elif [ "$aqi" -lt 150 ]; then
            echo "%{F#ff9933}AQI: $aqi"
        elif [ "$aqi" -lt 200 ]; then
            echo "%{F#cc0033}AQI: $aqi"
        elif [ "$aqi" -lt 300 ]; then
            echo "%{F#660099}AQI: $aqi"
        else
            echo "%{F#7e0023}AQI: $aqi"
        fi
    else
        echo "$aqi" | jq -r '.data'
    fi
fi
