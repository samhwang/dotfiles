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
    claude-code \
    cowsay \
    delta \
    fastfetch \
    gemini \
    gh \
    ghostty \
    git \
    gitui \
    lact \
    nvim \
    opencode \
    sheldon \
    starship \
    stow \
    television \
    testcontainers \
    tmux \
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
OP_ACCOUNT=my.1password.com op inject -i linux-cachyos/.config/profiles/private.zsh.tpl -o linux-cachyos/.config/profiles/private.zsh
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
    python-pipx \
    docker \
    docker-compose \
    docker-buildx

# Fonts
paru -S --noconfirm ttf-jetbrains-mono \
    ttf-jetbrains-mono-nerd \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji

# Vietnamese keyboard
paru -S --noconfirm fcitx5 \
    fcitx5-gtk \
    fctix5-bamboo

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
    nvtop \
    direnv \
    television \
    tree-sitter \
    tree-sitter-cli \
    btop \
    jq \
    dust \
    bluetui

# Editor Tools
paru -S --noconfirm vim \
    neovim \
    zed \
    ghostty \
    postman-bin \
    bruno-bin \
    docker \
    opencode \
    claude-code \
    gemini-cli \
    github-copilot-cli \
    beekeeper-studio-bin \
    codename-goose-bin \
    aws-cli-v2 \
    aws-session-manager-plugin

# Browsers and other GUI apps
paru -S --noconfirm discord \
    google-chrome \
    slack-electron \
    spotify \
    obs-studio \
    balena-etcher \
    vial-appimage \
    vivaldi \
    zoom \
    nautilus \
    mpv \
    imv \
    localsend \
    pinta

# Gaming Apps
paru -S --noconfirm cachyos-gaming-meta \
    cachyos-gaming-applications \
    lsfg-vk

# System
paru -S --noconfirm snapper \
    simple-scan \
    sddm \
    plymouth

# For Logitech mice
paru -S --noconfirm solaar

# For Ergodox EZ
paru -S --noconfirm zsa-keymapp-bin

# For Brother printer & scanner
paru -S --noconfirm brother-mfc-l2750dw

# Photography apps
paru -S --noconfirm gimp \
    darktable \
    rawtherapee \
    rapidraw-bin \
    davinci-resolve \
    handbrake \
    vuescan-bin

# VPN things
paru -S --noconfirm tailscale \
    nordvpn-bin \
    nordvpn-gui

# Hyprland packages
paru -S --noconfirm hyprland \
    hyprpicker \
    hyprpolkitagent \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    egl-wayland \
    hyprsunset \
    pipewire \
    wireplumber \
    pipewire-alsa \
    pipewire-jack \
    pipewire-pulse \
    qt5-wayland \
    qt6-wayland \
    grim \
    slurp \
    satty \
    gpu-screen-recorder \
    wl-clipboard \
    cliphist \
    playerctl \
    udiskie \
    uwsm \
    quickshell \
    noctalia-shell \
    vlc \
    vlc-plugins-all
