if [ $CURRENT_OS = "Darwin" ]; then
    alias pkg_up="brew update; brew upgrade; brew cleanup;"
elif [ $CURRENT_OS = "Linux" ]; then
    alias pkg_up="sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y;"
fi