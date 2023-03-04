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
HISTFILE=$HOME/.zsh_history
DEFAULT_USER='samhwang'
DISABLE_MAGIC_FUNCTIONS=true # Make copying into zsh faster
zle_highlight=('paste:none') # Disable highlight

# Load zgenom
source $GENERALCONFIG/zgenom/zgenom.zsh

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

function load_zsh_modules() {
    echo "Saving zgenom static script"

    ######################
    # Themes and Plugins #
    ######################
    # Load common zsh modules
    zgenom prezto
    zgenom prezto command-not-found
    zgenom prezto history

    zgenom load agkozak/zsh-z
    zgenom load zsh-users/zsh-autosuggestions
    zgenom load zsh-users/zsh-completions
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load zsh-users/zsh-history-substring-search

    # Load P10K theme
    # zgenom load romkatv/powerlevel10k powerlevel10k
    # zgenom load ${GENERALCONFIG}/p10k-config-lean.zsh

    # Load fzf keybindings
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

    # Z settings
    autoload -U compinit && compinit
    zstyle ':completion:*' menu select

    # Auto terminal title
    zstyle ':prezto:module:terminal' auto-title 'yes'
    zstyle ':prezto:module:terminal:window-title' format '%s'
    zstyle ':prezto:module:terminal:tab-title' format '%s'
    zstyle ':prezto:module:terminal:multiplexer-title' format '%s'

    # Load specific distro plugins
    OS_CONFIG_PATH="$DOTFILEPATH/$CURRENT_OS/$CURRENT_OS.zshrc"
    source "$OS_CONFIG_PATH"

    zgenom reset
    zgenom save
    zgenom compile "${DOTFILEPATH}/.zshrc"
    zgenom compile "${OS_CONFIG_PATH}"
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
    zgenom selfupdate
    zgenom update
    zgenom clean
    zgenom save
    zgenom compile "${DOTFILEPATH}/.zshrc"
    zgenom compile "${OS_CONFIG_PATH}"

    echo "FINISH UPDATING. GOING BACK TO PREVIOUS DIRECTORY"
    cd $CURRENT_PATH
    echo "CURRENTLY AT $(pwd)"
}

###################################
# Loading scripts for environment #
###################################
if ! zgenom saved; then
    load_zsh_modules
fi

# Bind key for zsh history substring search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

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

# PATH for nvm
export NVM_DIR="$GENERALCONFIG/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source $NVM_DIR/nvm.sh --no-use
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load Starship
eval "$(starship init zsh)"

# Load thefuck
eval $(thefuck --alias)

###########
# Aliases #
###########
# Replace vim with nvim
if type nvim >/dev/null 2>&1; then
    alias vim='nvim'
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
alias reload="load_zsh_modules"

###########
# Cleanup #
###########
