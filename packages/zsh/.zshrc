##########################
# Setting up environment #
##########################
export LANG=en_US.UTF-8
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"

ZSHCONFIG="${HOME}/.config/zsh"

HISTFILE=${HOME}/.zsh_history

DEFAULT_USER='samhwang'

###################################
# Loading scripts for environment #
###################################
# compinit loading
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

source "${ZSHCONFIG}/sheldon.zsh"
source "${ZSHCONFIG}/fzf.zsh"
source "${ZSHCONFIG}/cowsay.zsh"
source "${ZSHCONFIG}/starship.zsh"

# PATH for PyPI
PYPI_PATH="$HOME/.local/bin"
export PATH="$PATH:$PYPI_PATH"
source "${ZSHCONFIG}/pipx.zsh"

# Load mcfly
source "${ZSHCONFIG}/mcfly.zsh"

# Load console ninja
CONSOLE_NINJA_PATH="${HOME}/.console-ninja/.bin"
PATH="$CONSOLE_NINJA_PATH:$PATH"

# Load brew-wrap
source "${ZSHCONFIG}/brew-wrap.zsh"

# Load Docker completions
source "${ZSHCONFIG}/docker-desktop.zsh"

# Load zoxide
source "${ZSHCONFIG}/zoxide.zsh"

# Load direnv
source "${ZSHCONFIG}/direnv.zsh"

# Load fnm
source "${ZSHCONFIG}/fnm.zsh"

# Functions for updating utilities
source "${ZSHCONFIG}/upgrade.zsh"

# Bypass Apple Quarantine scripts
source "${ZSHCONFIG}/bypass-quarantine.zsh"

# Aliases
source "${ZSHCONFIG}/alias.zsh"

# Private configurations
PRIVATE_CONFIG="${ZSHCONFIG}/private.zsh"
[ -f "${PRIVATE_CONFIG}" ] && source "${PRIVATE_CONFIG}"

### PROFILES
# Load Profile config
export PROFILE_CONFIG_PATH="${HOME}/.config/profiles"
PROFILE_CONFIG="${PROFILE_CONFIG_PATH}/profile.zsh"
[ -f "${PROFILE_CONFIG}" ] && source "${PROFILE_CONFIG}"

# Load private profile config
PRIVATE_PROFILE_CONFIG="${PROFILE_CONFIG_PATH}/private.zsh"
[ -f "${PRIVATE_PROFILE_CONFIG}" ] && source "${PRIVATE_PROFILE_CONFIG}"

# Load Zellij only if we're running Ghostty
ZELLIJ_AUTOLOAD="${ZSHCONFIG}/zellij.zsh"
[ -f "${ZELLIJ_AUTOLOAD}" ] && source "${ZELLIJ_AUTOLOAD}"

source "${ZSHCONFIG}/television.zsh"
