if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

ZDOTDIR=$HOME/.config/zsh
DOTFILES=$HOME/dotfiles
