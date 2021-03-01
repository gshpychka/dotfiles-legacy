#!/bin/sh

bg_filepath="$HOME/media/wallpapers/mars_wallpaper.png"

if test -f "$bg_filepath"; then
    feh --no-fehbg --bg-fill --no-xinerama $bg_filepath
fi
