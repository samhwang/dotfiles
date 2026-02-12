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
    python-pipx \
    docker \
    docker-compose \
    docker-buildx

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
    nvtop \
    direnv

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
    beekeeper-studio-bin \
    codename-goose-bin \
    aws-cli-v2 \
    aws-session-manager-plugin

# Browsers and other GUI apps
paru -S --noconfirm discord_arch_electron \
    google-chrome \
    slack-electron \
    spotify \
    obs-studio \
    balena-etcher \
    vial-appimage \
    vivaldi \
    zoom

# Gaming Apps
paru -S --noconfirm cachyos-gaming-meta \
    cachyos-gaming-applications \
    lsfg-vk

# System
paru -S --noconfirm snapper \
    simple-scan

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
    hyprpaper \
    hyprlock \
    hypridle \
    hyprpicker \
    hyprpolkitagent \
    xdg-desktop-portal-hyprland \
    hyprsunset \
    hyprshot \
    rofi \
    waybar \
    wlogout \
    dunst \
    pipewire \
    wireplumber \
    qt5-wayland \
    qt6-wayland \
    grim \
    slurp \
    wl-clipboard \
    grimblast \
    cliphist \
    playerctl \
    udiskie

