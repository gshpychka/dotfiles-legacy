sudo pacman -S reflector rsync
sudo reflector --verbose --sort rate --save /etc/pacman.d/mirrorlist
