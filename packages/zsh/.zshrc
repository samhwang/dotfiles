##########################
# Setting up environment #
##########################
export LANG=en_US.UTF-8
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export TERM="xterm-256color"

ZSHCONFIG="${HOME}/.config/zsh"

HISTFILE=${HOME}/.zsh_history

DEFAULT_USER='samhwang'

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

# Load console ninja
CONSOLE_NINJA_PATH="${HOME}/.console-ninja/.bin"
PATH="$CONSOLE_NINJA_PATH:$PATH"

# Load brew-wrap
# source "${ZSHCONFIG}/brew-wrap.zshrc"

# Load yazi
source "${ZSHCONFIG}/yazi.zshrc"

# Load zoxide
eval "$(zoxide init zsh)"

# Functions for updating utilities
UPGRADE_FUNC="${ZSHCONFIG}/upgrade.zshrc"
[ -f "${UPGRADE_FUNC}" ] && source "${UPGRADE_FUNC}"

# Aliases
ALIAS_CONFIG="${ZSHCONFIG}/alias.zshrc"
[ -f "${ALIAS_CONFIG}" ] && source "${ALIAS_CONFIG}"

# Private configurations
PRIVATE_CONFIG="${ZSHCONFIG}/private.zshrc"
[ -f "${PRIVATE_CONFIG}" ] && source "${PRIVATE_CONFIG}"

### PROFILES
# Load Profile config
export PROFILE_CONFIG_PATH="${HOME}/.config/profiles"
PROFILE_CONFIG="${PROFILE_CONFIG_PATH}/profile.zshrc"
[ -f "${PROFILE_CONFIG}" ] && source "${PROFILE_CONFIG}"

# Load private profile config
PRIVATE_PROFILE_CONFIG="${PROFILE_CONFIG_PATH}/private.zshrc"
[ -f "${PRIVATE_PROFILE_CONFIG}" ] && source "${PRIVATE_PROFILE_CONFIG}"
