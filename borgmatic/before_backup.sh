#!/bin/sh
if grep -qs '/mnt/big ' /proc/mounts; then
    echo 'Drive already mounted'
else
    echo 'Mounting drive'
    sudo mount /dev/sdb1 /mnt/big
fi
