##########################
# Setting up environment #
##########################
export LANG=en_US.UTF-8
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export TERM="xterm-256color"
export PROJECTS="${ZDOTDIR:-${HOME}}/projects"
DOTFILEPATH="${PROJECTS}/dotfiles"
GENERALCONFIG="$DOTFILEPATH/general"

export CURRENT_OS=$(uname)
OS_CONFIG_PATH="$DOTFILEPATH/$CURRENT_OS"
OS_CONFIG_FILE="$OS_CONFIG_PATH/$CURRENT_OS.zshrc"

HISTFILE=$HOME/.zsh_history

DEFAULT_USER='samhwang'

####################################
# Functions for updating utilities #
####################################
source "${GENERALCONFIG}/upgrade.zshrc"

###################################
# Loading scripts for environment #
###################################
# compinit loading
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Load Sheldon
eval "$(sheldon source)"
source "${GENERALCONFIG}/sheldon-completions.zshrc"

# Load fzf keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load extra cowfiles if exist
EXTRACOWS="${GENERALCONFIG}/cowfiles"
test -d "${EXTRACOWS}" && export COWPATH="${EXTRACOWS}:$COWPATH"

# PATH for PyPI
PYPI_PATH="$HOME/.local/bin"
export PATH="$PATH:$PYPI_PATH"
eval "$(register-python-argcomplete pipx)"

# Load Starship
eval "$(starship init zsh)"

# Load thefuck
eval $(thefuck --alias)

# Load mcfly
eval "$(mcfly init zsh)"

# Load fnm
eval $(fnm env)

# Load broot
source ~/.config/broot/launcher/bash/br

# Load console ninja
CONSOLE_NINJA_PATH="$HOME/.console-ninja/.bin"
PATH="$CONSOLE_NINJA_PATH:$PATH"

###########
# Aliases #
###########
source "${GENERALCONFIG}/alias.zshrc"

###########
# Cleanup #
###########

# Load OS Specific config
source "$OS_CONFIG_FILE"
