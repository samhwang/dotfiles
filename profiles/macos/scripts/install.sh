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
    kanata \
    nvim \
    opencode \
    sheldon \
    starship \
    stow \
    testcontainers \
    tmux \
    vim \
    zed \
    zellij \
    zsh
# macOS packages
stow --target=$HOME aerospace \
    borders \
    sketchybar
cd ..

cd ~/.dotfiles/profiles
OP_ACCOUNT=my.1password.com op inject -i macos/.config/profiles/private.zshrc.tpl -o macos/.config/profiles/private.zshrc
stow --target=$HOME macos
cd ..

# Install the rest
cd ~/.config/brewfile
brew bundle --verbose --force --cleanup

# Install macos settings
source ./macos-settings.sh
