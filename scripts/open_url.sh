#! /usr/bin/env bash

firefox_id=$(head -n 1 ~/.local/share/applications/last_firefox_id)

if [ -z $firefox_id ]; then
    firefox $1
else
    wmctrl -i -a $firefox_id
    xdotool key --delay 0 ctrl+t
    xdotool getwindowfocus windowfocus --sync type --delay 0 "$1"
    xdotool key --delay 0 KP_Enter
fi
