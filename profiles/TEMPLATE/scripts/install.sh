#!bin/bash

# Install pre-requisite: Stow and 1Password

# Use stow to restore config
cd ~/.dotfiles/packages
# Generic packages
stow --target=$HOME act \
    bat \
    bottom \
    cowsay \
    delta \
    fastfetch \
    gh \
    ghostty \
    git \
    gitui \
    nvim \
    opencode \
    sheldon \
    starship \
    stow \
    testcontainers \
    vim \
    zed \
    zellij \
    zsh
# UNCOMMENT ONE OF THESE BLOCKS FOR THE OS THAT IS INSTALLED ON
# Linux packages
# stow --target=$HOME discord \
#     hypr \
#     lsfg-vk
# # macOS packages
# stow --target=$HOME aerospace
cd ..

cd ~/.dotfiles/profiles
OP_ACCOUNT=my.1password.com op inject -i TEMPLATE/.config/profiles/private.zshrc.tpl -o TEMPLATE/.config/profiles/private.zshrc
stow --target=$HOME TEMPLATE
cd ..

# Install the rest
