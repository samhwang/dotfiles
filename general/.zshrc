# Setting up environment
export LANG=en_US.UTF-8
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export TERM="xterm-256color"
export COWPATH="${PROJECTS}/cowfiles:$COWPATH"
export PROJECTS="${ZDOTDIR:-${HOME}}/projects"
DOTFILEPATH="${PROJECTS}/dotfiles"
GENERALCONFIG="$DOTFILEPATH/general"
ZSH_CUSTOM="$GENERALCONFIG/oh-my-zsh-custom"
export ZSH="$GENERALCONFIG/oh-my-zsh"

# Load Oh-My-Zsh
source "$GENERALCONFIG/load_omz.sh"

# Load aliases
source "$GENERALCONFIG/alias.sh"
