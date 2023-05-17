##########################
# Setting up environment #
##########################
export LANG=en_US.UTF-8
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export TERM="xterm-256color"
export PROJECTS="${ZDOTDIR:-${HOME}}/projects"
DOTFILEPATH="${PROJECTS}/dotfiles"
GENERALCONFIG="$DOTFILEPATH/general"
export ZSH="$GENERALCONFIG/ohmyzsh"
ZSH_CUSTOM="$GENERALCONFIG/custom-omz"
export CURRENT_OS=$(uname)
OS_CONFIG_PATH="$DOTFILEPATH/$CURRENT_OS/$CURRENT_OS.zshrc"
HISTFILE=$HOME/.zsh_history
DEFAULT_USER='samhwang'
DISABLE_MAGIC_FUNCTIONS=true # Make copying into zsh faster
zle_highlight=('paste:none') # Disable highlight
zstyle ':omz:update' mode disabled  # disable automatic OMZ updates

####################################
# Functions for updating utilities #
####################################
function update_packages() {
    if [ $CURRENT_OS = "Darwin" ]; then
        brew update
        brew upgrade
        brew cleanup
    elif [ $CURRENT_OS = "Linux" ]; then
        sudo apt update
        sudo apt upgrade --yes
        sudo apt autoremove --yes
    fi
}

function pkg_up() {
    CURRENT_PATH=`pwd`
    echo "UPDATING SYSTEM PACKAGES"
    update_packages

    echo "GOING TO DOTFILES DIRECTORY"
    cd $DOTFILEPATH
    echo "CURRENTLY AT $(pwd)"

    echo "UPDATING DOTFILES SUBMODULES"
    git submodule update --recursive --remote

    echo "FINISH UPDATING. GOING BACK TO PREVIOUS DIRECTORY"
    cd $CURRENT_PATH
    echo "CURRENTLY AT $(pwd)"
}

###################################
# Loading scripts for environment #
###################################
# compinit loading
autoload -Uz compinit && compinit

source "$OS_CONFIG_PATH"
source "$ZSH/oh-my-zsh.sh"

# Load fzf keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load extra cowfiles if exist
EXTRACOWS="${GENERALCONFIG}/cowfiles"
test -d "${EXTRACOWS}" && export COWPATH="${EXTRACOWS}:$COWPATH"

# PATH for PyPI
PYPI_PATH=""
if [ $CURRENT_OS = "Darwin" ]; then
    PYPI_PATH="${HOME}/Library/Python/3.9/bin"
elif [ $CURRENT_OS = "Linux" ]; then
    PYPI_PATH="$HOME/.local/bin"
fi
export PATH="$PYPI_PATH:$PATH"

# Load Starship
eval "$(starship init zsh)"

# Load thefuck
eval $(thefuck --alias)

# Load fnm
eval $(fnm env)

###########
# Aliases #
###########
# Replace vim with nvim
if type nvim >/dev/null 2>&1; then
    alias vim='nvim'
fi

# Replace cat with bat
if type bat >/dev/null 2>&1; then
    alias cat="bat"
fi

# Replace ls with exa
if type exa >/dev/null 2>&1; then
    alias ls="exa"
fi

# Replace grep with ripgrep
if type rg >/dev/null 2>&1; then
    alias grep="rg"
fi

# Preferred editor for local and remote sessions
export EDITOR='vim'

# system aliases
alias ll='ls -laF'

# git aliases
alias gs='git status '
alias got='git '
alias get='git '

# reload zsh modules
alias reload="source ~/.zshrc"

###########
# Cleanup #
###########
