# Setting up environment
export LANG=en_US.UTF-8
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export TERM="xterm-256color"
export PROJECTS="${ZDOTDIR:-${HOME}}/projects"
DOTFILEPATH="${PROJECTS}/dotfiles"
GENERALCONFIG="$DOTFILEPATH/general"
export CURRENT_OS=`uname`

# Load zinit
source $GENERALCONFIG/zinit/zinit.zsh

function load_modules() {
    arr=("$@")
    for module in "${arr[@]}"; do
        LOAD="$GENERALCONFIG/load"
        zinit snippet "$LOAD/$module.sh"
    done
}

# Shared Modules
shared_modules=(
    # Base Modules
    "omz"
    "alias"
    "package"

    # Software Packages, Language and Environment
    "composer"
    "golang"
    "deno"
)
load_modules $shared_modules
unset $shared_modules

disable -f "load_modules"
