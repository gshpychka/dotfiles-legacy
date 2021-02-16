#!/bin/sh
while read line
do
    systemctl enable $line
    echo "Enabled $line"
done < $1
