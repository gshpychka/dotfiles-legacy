#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut fown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Clear output of pomobar module
rm ~/pomobar.db
echo "0" > ~/.pomobaroutput

# Launch polybar using the confid location ~/.config/polybar/config
polybar left &
polybar right &
echo "Lanched polybar"
