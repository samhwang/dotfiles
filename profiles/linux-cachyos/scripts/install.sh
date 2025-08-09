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
# Linux packages
stow --target=$HOME discord \
    hypr \
    lsfg-vk
cd ..

cd ~/.dotfiles/profiles
OP_ACCOUNT=my.1password.com op inject -i linux-cachyos/.config/profiles/private.zshrc.tpl -o linux-cachyos/.config/profiles/private.zshrc
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
    bottom \
    github-cli \
    act \
    nvtop

# Editor Tools
paru -S --noconfirm vim \
    neovim \
    zed \
    ghostty \
    postman-bin \
    bruno-bin \
    docker \
    docker-desktop \
    opencode \
    beekeeper-studio-bin \
    aws-cli-v2

# Browsers and other GUI apps
paru -S --noconfirm discord_arch_electron \
    google-chrome \
    slack-electron \
    spotify \
    obs-studio \
    balena-etcher \
    gimp \
    darktable \
    rawtherapee \
    rapidraw-bin \
    davinci-resolve \
    vial-appimage \
    zoom

# Gaming Apps
paru -S --noconfirm cachyos-gaming-meta \
    cachyos-gaming-applications

# System
paru -S --noconfirm snapper \
    solaar
