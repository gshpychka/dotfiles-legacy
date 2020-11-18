bat=$(~/venvs/bluetooth/bin/python3 ~/dotfiles/polybar/polybar-scripts/bluetooth_battery.py CC:98:8B:C0:E2:1C 2> /dev/null)
if [[ $bat != "0" ]]
    then echo "$bat";
fi
