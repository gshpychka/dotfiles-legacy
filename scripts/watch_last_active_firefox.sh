#!/usr/bin/env bash

echo '' > $1
last_firefox_id=
xprop -root -spy _NET_ACTIVE_WINDOW | while :
do
    read line

    window_id=$(echo "$line" | cut -d ' ' -f 5 -)
    window_class=$(xprop -id "$window_id" WM_CLASS | cut -d ' ' -f 4)
    if [[ $window_class == \"firefox* ]]
    then
        last_firefox_id=$window_id
        echo "$last_firefox_id" > $1
    fi
done
