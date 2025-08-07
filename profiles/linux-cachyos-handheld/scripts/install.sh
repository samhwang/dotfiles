#!bin/bash

# Install pre-requisite: Stow and 1Password

# Use stow to restore config
cd ~/.dotfiles/packages
# Generic packages
stow --target=$HOME act \
    bat \
    delta \
    git \
    gitui \
    opencode \
    sheldon \
    starship \
    stow \
    vim \
    zed \
    zsh
# Linux packages
stow --target=$HOME discord \
    lsfg-vk
cd ..

cd ~/.dotfiles/profiles
stow --target=$HOME linux-cachyos-handheld
cd ..

# Install the rest
