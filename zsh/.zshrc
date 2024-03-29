# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# set neovim as default text editor
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

export DIFFPROG="nvim -d"

# Set folder with Pyhon virtualenvs for virtualenvwrapper
export WORKON_HOME="$HOME/venvs"
# export VIRTUALENVWRAPPER_PYTHON="$HOME/.local/pipx/venvs/virtualenvwrapper/bin/python"

# opt out of MS's telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# source $HOME/.local/bin/virtualenvwrapper_lazy.sh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format usininter the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# bgnotify
plugins=(git vi-mode fzf aws zsh-interactive-cd virtualenvwrapper vscode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias imgpaste="xclip -selection clipboard -t image/png -o > image.png"

DEFAULT_USER='gshpychka'

# Run 'ls -a' after 'cd'
function chpwd() {
    emulate -L zsh
    ls -a
    if [ -d .git ]; then
        git status
    fi
}

# `tree` that honors gitignore
function gtree {
    git_ignore_files=("$(git config --get core.excludesfile)" .gitignore ~/.gitignore)
    ignore_pattern="$(grep -hvE '^$|^#' "${git_ignore_files[@]}" 2>/dev/null|sed 's:/$::'|tr '\n' '\|')"
    if git status &> /dev/null && [[ -n "${ignore_pattern}" ]]; then
      tree -I "${ignore_pattern}" "${@}"
    else 
      tree "${@}"
    fi
}

alias vim=nvim

# alias git as hub
# eval "$(hub alias -s)"

# force tmux to launch with 256 colors
alias tmux="tmux -2"

# make sure SSH works no matter which terminal is on the local machine
alias ssh="TERM=xterm-256color ssh"

eval "$(dircolors $HOME/.config/zsh/.dircolors)" 

# fzf keybindings

export FZF_CTRL_T_COMMAND="fd --hidden --exclude 'venvs' --exclude '.*' --exclude 'go' --exclude 'perl5' --exclude '**/cache/**' --exclude '**/Cache/**' --exclude '*.png' --exclude '*.ttf' --full-path --type f"
export FZF_ALT_C_COMMAND="fd --hidden --exclude 'venvs' --exclude '.local' --exclude '.cache' --exclude '.mozilla' --exclude '**/.git/**' --exclude '**/cache/**' --exclude '**/Cache/**' --exclude '.npm/**' --exclude '.npm-global/**' --exclude '*.png' --exclude '*.ttf' --exclude '.daedalus/**' --full-path --type d"
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
"

bindkey 'ã' fzf-cd-widget

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# enable vi-mode
bindkey -v

# SSH agent (key management)
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# 1Password completions
eval "$(op completion zsh)"; compdef _op op

# unsetopt BEEP

export SSH_AUTH_SOCK=~/.1password/agent.sock

export PATH="$PATH:$HOME/.local/bin:$HOME/.local/share/gem/ruby/2.7.0/bin"

# PATH="$PATH:$HOME/.npm-global/bin"; export PATH;
PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

PATH="$PATH:$HOME/.cargo/bin"; export PATH;
source /usr/share/nvm/init-nvm.sh
