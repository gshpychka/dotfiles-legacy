#!/bin/sh
IFS=:
while read line
do
    read -r origin dest <<< "$line"
    ln -sf "$(eval "echo $origin")" "$(eval "echo $dest")"
    echo "$origin -> $dest"
done < $1
