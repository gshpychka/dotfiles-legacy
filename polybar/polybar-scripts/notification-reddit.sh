#!/bin/sh

URL="https://www.reddit.com/message/unread/.json?feed=933907b6263352daf255a24823000adbf6dc23f0&user=Glebun"
USERAGENT="polybar-scripts/notification-reddit:v1.0 u/Glebun"

notifications=$(curl -sf --user-agent "$USERAGENT" "$URL" | jq '.["data"]["children"] | length')

if [ -n "$notifications" ] && [ "$notifications" -gt 0 ]; then
    echo "$notifications unread"
else
    echo ""
fi
