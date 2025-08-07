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
    yazi \
    zed \
    zellij \
    zsh
# Linux packages
stow --target=$HOME discord \
    hypr \
    lsfg-vk
cd ..

cd ~/.dotfiles/profiles
OP_ACCOUNT=my.1password.com op inject -i linux/.config/profiles/private.zshrc.tpl -o linux/.config/profiles/private.zshrc
stow --target=$HOME linux
cd ..

# Install the rest
