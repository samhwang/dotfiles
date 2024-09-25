##########################
# Setting up environment #
##########################
export LANG=en_US.UTF-8
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export TERM="xterm-256color"

ZSHCONFIG="${HOME}/.config/zsh"

export CURRENT_OS=$(uname)
OS_CONFIG_FILE="$ZSHCONFIG/os/$CURRENT_OS.zshrc"

HISTFILE=${HOME}/.zsh_history

DEFAULT_USER='samhwang'

####################################
# Functions for updating utilities #
####################################
source "${ZSHCONFIG}/upgrade.zshrc"

###################################
# Loading scripts for environment #
###################################
# compinit loading
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Load Sheldon
eval "$(sheldon source)"
source <(sheldon completions --shell zsh)

# Load fzf keybindings
source <(fzf --zsh)

# Load extra cowfiles if exist
EXTRACOWS="${HOME}/.cowsay/cowfiles"
[ -d "${EXTRACOWS}" ] && export COWPATH="${EXTRACOWS}:$COWPATH"

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
source "${HOME}/.config/broot/launcher/bash/br"

# Load console ninja
CONSOLE_NINJA_PATH="${HOME}/.console-ninja/.bin"
PATH="$CONSOLE_NINJA_PATH:$PATH"

# Load brew-wrap
# source "${ZSHCONFIG}/brew-wrap.zshrc"

###########
# Aliases #
###########
source "${ZSHCONFIG}/alias.zshrc"

###########
# Cleanup #
###########

# Load OS Specific config
source "$OS_CONFIG_FILE"

# Private configurations
PRIVATE_CONFIG="${ZSHCONFIG}/private.zshrc"
[ -f "${PRIVATE_CONFIG}" ] && source "${PRIVATE_CONFIG}"

# Load zoxide
eval "$(zoxide init zsh)"
