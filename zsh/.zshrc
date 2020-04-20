# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt autocd beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gshpychka/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

path+=('/usr/lib/w3m/w3mimgdisplay')
export path

