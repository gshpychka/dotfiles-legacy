#!/bin/sh

bg_filepath="$HOME/media/wallpapers/desktop_wallpaper.jpg"

if test -f "$bg_filepath"; then
    feh --no-fehbg --bg-fill --no-xinerama $bg_filepath
fi
