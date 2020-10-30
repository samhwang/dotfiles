# Setting up environment
export LANG=en_US.UTF-8
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export TERM="xterm-256color"
export PROJECTS="${ZDOTDIR:-${HOME}}/projects"
DOTFILEPATH="${PROJECTS}/dotfiles"
GENERALCONFIG="$DOTFILEPATH/general"
ZSH_CUSTOM="$GENERALCONFIG/oh-my-zsh-custom"
export ZSH="$GENERALCONFIG/oh-my-zsh"

function load_modules() {
    arr=("$@")
    for module in "${arr[@]}"; do
        LOAD="$GENERALCONFIG/load"
        source "$LOAD/$module.sh"
    done
}

base_modules=(
    "omz"
    "alias"
    "package"
)
load_modules $base_modules
unset $base_modules

disable -f "load_modules"
