#!/bin/bash

# Install pre-requisite
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git \
    stow \
    curl \
    wget
brew install --cask 1password

# Use stow to restore config
cd ~/.dotfiles/packages
stow --target=$HOME *
cd ..

cd ~/.dotfiles/profiles
stow --target=$HOME macos
cd ..

# Install the rest
cd ~/.config/brewfile
brew bundle --verbose --force --cleanup

# Install macos settings
source ./macos-settings.sh
