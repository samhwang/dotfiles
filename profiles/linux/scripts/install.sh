#!bin/bash

# Install pre-requisite: Stow and 1Password

# Use stow to restore config
cd ~/.dotfiles/packages
stow --target=$HOME *
cd ..

cd ~/.dotfiles/profiles
stow --target=$HOME macos
cd ..

# Install the rest
