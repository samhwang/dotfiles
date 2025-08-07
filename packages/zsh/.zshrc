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
if type sheldon > /dev/null; then
    eval "$(sheldon source)"
    source <(sheldon completions --shell zsh)
fi

# Load fzf keybindings
if type fzf > /dev/null; then
    source <(fzf --zsh)
fi

# Load extra cowfiles if exist
if type cowsay > /dev/null; then
    EXTRACOWS="${HOME}/.cowsay/cowfiles"
    [ -d "${EXTRACOWS}" ] && export COWPATH="${EXTRACOWS}:$COWPATH"
fi

# PATH for PyPI
PYPI_PATH="$HOME/.local/bin"
export PATH="$PATH:$PYPI_PATH"
if type pipx > /dev/null; then
    eval "$(register-python-argcomplete pipx)"
fi

# Load Starship
if type starship > /dev/null; then
    eval "$(starship init zsh)"
fi

# Load mcfly
if type mcfly > /dev/null; then
    eval "$(mcfly init zsh)"
fi

# Load fnm
if type fnm > /dev/null; then
    eval $(fnm env)
fi

# Load console ninja
CONSOLE_NINJA_PATH="${HOME}/.console-ninja/.bin"
PATH="$CONSOLE_NINJA_PATH:$PATH"

# Load brew-wrap
if type brew > /dev/null; then
    source "${ZSHCONFIG}/brew-wrap.zshrc"
fi

# Load yazi
source "${ZSHCONFIG}/yazi.zshrc"

# Load Docker completions
if type docker > /dev/null; then
    source "${ZSHCONFIG}/docker-desktop.zshrc"
fi

# Load zoxide
if type zoxide > /dev/null; then
    eval "$(zoxide init zsh)"
fi

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
