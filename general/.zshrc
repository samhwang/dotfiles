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

# Enable Byobu on startup
if type byobu >/dev/null 2>&1; then
    _byobu_sourced=1 . $(which byobu-launch) 2>/dev/null || true
fi

# Load zgenom
source $GENERALCONFIG/zgenom/zgenom.zsh

# PATH for PyPI
PYPI_PATH=""
if [ $CURRENT_OS = "Darwin" ]; then
    PYPI_PATH="${HOME}/Library/Python/3.9/bin"
elif [ $CURRENT_OS = "Linux" ]; then
    PYPI_PATH="$HOME/.local/bin"
fi
export PATH="$PYPI_PATH:$PATH"

# PATH for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source $NVM_DIR/nvm.sh --no-use
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

    echo "FINISH UPDATING. GOING BACK TO PREVIOUS DIRECTORY"
    cd -
    echo "CURRENTLY AT $(pwd)"
}

######################
# Themes and Plugins #
######################
# Load common zsh modules
zgenom ohmyzsh
zgenom ohmyzsh plugins/composer
zgenom ohmyzsh plugins/git
zgenom ohmyzsh plugins/golang
zgenom ohmyzsh plugins/jump
zgenom ohmyzsh plugins/thefuck
zgenom ohmyzsh plugins/composer
zgenom ohmyzsh plugins/z

zgenom prezto
zgenom prezto command-not-found
zgenom prezto history
zgenom prezto terminal

zgenom load zsh-users/zsh-autosuggestions
zgenom load zsh-users/zsh-completions
zgenom load zsh-users/zsh-syntax-highlighting
zgenom load zsh-users/zsh-history-substring-search



# Load P10K theme
zgenom load romkatv/powerlevel10k powerlevel10k
zgenom load ${GENERALCONFIG}/p10k-config-lean.zsh

# Enable completion for zsh-z
autoload -U compinit && compinit

# Load fzf keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Auto terminal title
zstyle ':prezto:module:terminal' auto-title 'yes'
zstyle ':prezto:module:terminal:window-title' format '%s'
zstyle ':prezto:module:terminal:tab-title' format '%s'
zstyle ':prezto:module:terminal:multiplexer-title' format '%s'

# Load specific distro plugins
OS_CONFIG_PATH="$DOTFILEPATH/$CURRENT_OS/$CURRENT_OS.zshrc"
source "$OS_CONFIG_PATH"

# Load extra cowfiles if exist
EXTRACOWS="$GENERALCONFIG/cowfiles"
test -d "${EXTRACOWS}" && export COWPATH="${EXTRACOWS}:$COWPATH"

###########
# Aliases #
###########
# Preferred editor for local and remote sessions
EDITOR='code --wait'
if [[ -n $SSH_CONNECTION ]]; then
    EDITOR='vim'
fi
export EDITOR

# system aliases
alias ll='ls -laF'
alias reload='exec zsh'

# git aliases
alias gs='git status '
alias got='git '
alias get='git '

# Replace vim with nvim
if type nvim >/dev/null 2>&1; then
    alias vim='nvim'
fi

###########
# Cleanup #
###########
