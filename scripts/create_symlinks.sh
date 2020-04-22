#!/bin/sh
DOTFILES=~/dotfiles
rm ~/.config/i3/config
ln -s $DOTFILES/i3/config ~/.config/i3/config
rm ~/.zshrc
ln -s $DOTFILES/zsh/.zshrc ~/.zshrc
rm ~/.zprofile
ln -s $DOTFILES/zsh/.zprofile ~/.zprofile
rm ~/.config/polybar/config
ln -s $DOTFILES/polybar/config ~/.config/polybar/config
rm ~/.config/polybar/launch.sh
ln -s $DOTFILES/polybar/launch.sh ~/.config/polybar/launch.sh
rm -r ~/polybar-scripts
ln -s $DOTFILES/polybar/polybar-scripts ~/polybar-scripts
rm ~/.Xresources
ln -s $DOTFILES/X/.Xresources ~/.Xresources
rm -r ~/.Xresources.d
ln -s $DOTFILES/X/.Xresources.d ~/.Xresources.d
rm ~/.config/nvim/init.vim
ln -s $DOTFILES/nvim/init.vim ~/.config/nvim/init.vim
rm -r ~/.config/borgmatic
ln -s $DOTFILES/borgmatic ~/.config/borgmatic
