if [ $CURRENT_OS = "Darwin" ]; then
    alias update_packages="brew update; brew upgrade; brew cleanup;"
elif [ $CURRENT_OS = "Linux" ]; then
    alias update_packages="sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y;"
fi

function pkg_up() {
    echo "UPDATING SYSTEM PACKAGES";
    update_packages;

    echo "GOING TO DOTFILES DIRECTORY";
    cd $DOTFILEPATH;
    echo "CURRENTLY AT `pwd`";

    echo "UPDATING DOTFILES SUBMODULES";
    git submodule update --recursive --remote;
    
    echo "FINISH UPDATING. GOING BACK TO PREVIOUS DIRECTORY";
    cd -;
    echo "CURRENTLY AT `pwd`";
}
