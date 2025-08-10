#!bin/bash

# Install pre-requisite: Stow and 1Password

# Use stow to restore config
cd ~/.dotfiles/packages
# Generic packages
stow --target=$HOME act \
    bat \
    delta \
    git \
    sheldon \
    starship \
    stow \
    zsh
# Linux packages
stow --target=$HOME discord \
    lsfg-vk
cd ..

cd ~/.dotfiles/profiles
stow --target=$HOME linux-cachyos-handheld
cd ..

# Gaming Apps
paru -S --noconfirm cachyos-gaming-meta \
    cachyos-gaming-applications \
    discord \
    lsfg-vk
