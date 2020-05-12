bat=$(sudo g930-battery-percentage 2> /dev/null)
if $bat > 0;
    then echo "$bat";
fi
