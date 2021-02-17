#!/bin/zsh
IFS=:
while read line
do
    read -r origin dest <<< "$line"
    ln -sf "$(eval "echo $origin")" "$(eval "echo $dest")"
    echo "$(eval "echo $origin") -> $(eval "echo $dest")"
done < $1
