if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

# Created by `userpath` on 2020-09-02 10:57:50
export PATH="$PATH:/home/gshpychka/.local/bin"
