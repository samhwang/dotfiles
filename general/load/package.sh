if [ $CURRENT_OS = "Darwin" ]; then
    alias update_packages="brew update; brew upgrade; brew cleanup;"
elif [ $CURRENT_OS = "Linux" ]; then
    alias update_packages="sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y;"
fi

function pkg_up() {
    set -x;
    update_packages;
    git --git-dir $DOTFILEPATH/.git submodule update --recursive --remote;
}
