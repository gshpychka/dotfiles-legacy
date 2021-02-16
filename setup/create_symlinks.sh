#!/bin/sh
IFS=:
while read line
do
    read -r origin dest <<< "$line"
    ln -sf "$origin" "$dest"
    echo "$origin -> $dest"
done < $1
