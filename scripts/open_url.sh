#! /usr/bin/env bash

firefox_id=$(head -n 1 ~/.local/share/applications/last_firefox_id)

if [ -z $firefox_id ]; then
    firefox $1
else
    wmctrl -i -a $firefox_id
    xdotool key ctrl+t
    xdotool getwindowfocus windowfocus --sync type "$1"
    xdotool key KP_Enter
fi
