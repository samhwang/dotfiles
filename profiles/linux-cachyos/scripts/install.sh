#!bin/bash

# Change to zsh
chsh -s $(which zsh)

# Install pre-requisite
sudo pacman -S git \
    base-devel \
    yay
yay -Syu --noconfirm stow \
    1password \
    1password-cli \
    gnome-keyring

# Use stow to restore config
cd ~/.dotfiles/packages
stow --target=$HOME *
cd ..

cd ~/.dotfiles/profiles
stow --target=$HOME macos
cd ..

# Install the rest

# Programming Languages
yay -Syu --noconfirm go \
    rustup \
    zig-bin \
    nodejs \
    deno \
    bun \
    fnm

# Fonts
yay -Syu --noconfirm ttf-jetbrains-mono \
    ttf-jetbrains-mono-nerd

# Command Line Tools
yay -Syu --noconfirm zsh \
    tmux \
    zellij \
    starship \
    sheldon \
    bat \
    ripgrep \
    fd \
    tree-sitter \
    gitui \
    git-delta \
    duf \
    eza \
    fzf \
    rsync \
    zoxide \
    tealdeer \
    yazi \
    bottom


# Editor Tools
yay -Syu --noconfirm vim \
    neovim \
    zed \
    ghostty \
    postman-bin \
    bruno-bin \
    docker \
    docker-desktop

# Browsers
yay -Syu --noconfirm discord \
    google-chrome \
    slack-desktop \
    spotify \
    obs-studio

# Gaming Apps
yay -Syu --noconfirm cachyos-gaming-meta \
    cachyos-gaming-applications

# System
yay -Syu --noconfirm snapper
