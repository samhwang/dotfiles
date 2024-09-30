####################################
# Functions for updating utilities #
####################################

CURRENT_OS=$(uname)

function update_packages() {
    if [ $CURRENT_OS = "Darwin" ]; then
        brew update
        brew upgrade
        brew cu -ay
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
    cd "${HOME}/.dotfiles"
    echo "CURRENTLY AT $(pwd)"

    echo "UPDATING DOTFILES SUBMODULES"
    git submodule update --recursive --remote

    echo "FINISH UPDATING. GOING BACK TO PREVIOUS DIRECTORY"
    cd $CURRENT_PATH
    echo "CURRENTLY AT $(pwd)"
}
