#!bin/bash

# Change to zsh
chsh -s $(which zsh)

# Install pre-requisite
sudo pacman -S git \
    base-devel \
    yay
yay -S --noconfirm stow \
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
yay -S --noconfirm go \
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
yay -S --noconfirm ttf-jetbrains-mono \
    ttf-jetbrains-mono-nerd

# Command Line Tools
yay -S --noconfirm zsh \
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
yay -S --noconfirm vim \
    neovim \
    zed \
    ghostty \
    postman-bin \
    bruno-bin \
    docker \
    docker-desktop

# Browsers
yay -S --noconfirm discord_arch_electron \
    google-chrome \
    slack-electron \
    spotify-electron-bin \
    obs-studio

# Gaming Apps
yay -S --noconfirm cachyos-gaming-meta \
    cachyos-gaming-applications

# System
yay -S --noconfirm snapper
