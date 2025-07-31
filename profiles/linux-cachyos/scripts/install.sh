#!bin/bash

# Change to zsh
chsh -s $(which zsh)

# Install pre-requisite
sudo pacman -S git \
    base-devel \
    yay \
    paru
paru -S --noconfirm stow \
    1password \
    1password-cli \
    gnome-keyring \
    pass

# Use stow to restore config
cd ~/.dotfiles/packages
stow --target=$HOME *
cd ..

cd ~/.dotfiles/profiles
stow --target=$HOME linux-cachyos
cd ..

# Install the rest

# Programming Languages
paru -S --noconfirm go \
    rustup \
    zig-bin \
    nodejs \
    npm \
    deno \
    bun \
    fnm \
    python \
    python-pipx

# Fonts
paru -S --noconfirm ttf-jetbrains-mono \
    ttf-jetbrains-mono-nerd

# Command Line Tools
paru -S --noconfirm zsh \
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
    mcfly \
    zoxide \
    tealdeer \
    yazi \
    bottom \
    github-cli \
    act

# Editor Tools
paru -S --noconfirm vim \
    neovim \
    zed \
    ghostty \
    postman-bin \
    bruno-bin \
    docker \
    docker-desktop \
    opencode

# Browsers and other GUI apps
paru -S --noconfirm discord_arch_electron \
    google-chrome \
    slack-electron \
    spotify-electron-bin \
    obs-studio \
    balena-etcher

# Gaming Apps
paru -S --noconfirm cachyos-gaming-meta \
    cachyos-gaming-applications

# System
paru -S --noconfirm snapper \
    solaar
