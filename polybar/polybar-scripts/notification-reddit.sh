#!/bin/sh

KEY=$(op read 'op://API/Reddit unread/password' --account my.1password.com)
USERNAME=$(op read 'op://API/Reddit unread/username' --account my.1password.com)
URL="https://www.reddit.com/message/unread/.json?feed=$KEY&user=$USERNAME"
USERAGENT="polybar-scripts/notification-reddit:v1.0 u/$USERNAME"

notifications=$(curl -sf --user-agent "$USERAGENT" "$URL" | jq '.["data"]["children"] | length')

if [ -n "$notifications" ] && [ "$notifications" -gt 0 ]; then
    echo "$notifications unread"
else
    echo ""
fi
