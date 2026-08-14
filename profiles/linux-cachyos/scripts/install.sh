#!/bin/bash

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
stow --target=$HOME agents \
  act \
  bat \
  bottom \
  claude-code \
  cowsay \
  delta \
  fastfetch \
  gh \
  ghostty \
  git \
  gitui \
  hunk \
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
  lact \
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
  noto-fonts-emoji \
  otf-monaspace \
  otf-monaspace-nerdfonts \
  ttf-0xproto-nerd

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
  lazygit \
  git-delta \
  oxker-bin \
  lazydocker \
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
  bruno-bin \
  docker \
  opencode \
  claude-code \
  github-copilot-cli \
  beekeeper-studio-bin \
  rtk-bin \
  aws-cli-v2 \
  aws-session-manager-plugin

# Browsers and other GUI apps
paru -S --noconfirm discord \
  google-chrome \
  slack-electron \
  obs-studio \
  balena-etcher \
  vial-appimage \
  vivaldi \
  zoom \
  nautilus \
  mpv \
  imv \
  localsend \
  pinta \
  bottles

# Gaming Apps
paru -S --noconfirm cachyos-gaming-meta \
  cachyos-gaming-applications \
  lsfg-vk

# System
paru -S --noconfirm snapper \
  simple-scan \
  plymouth \
  greetd \
  accountsservice

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
  noctalia \
  noctalia-greeter \
  vlc \
  vlc-plugins-all

# System configs that live outside $HOME (not stowed; copied to real paths)
# Same steps as `noctalia-greeter-print-greetd-config`
sudo useradd -r -s /usr/bin/nologin -d /var/lib/noctalia-greeter greeter 2>/dev/null || true
sudo cp -a /etc/greetd/config.toml /etc/greetd/config.toml.bak 2>/dev/null || true
sudo install -Dm644 ~/.dotfiles/packages/hypr/etc/greetd/config.toml /etc/greetd/config.toml
sudo install -Dm644 ~/.dotfiles/packages/hypr/var/lib/noctalia-greeter/greeter.toml /var/lib/noctalia-greeter/greeter.toml
sudo chown greeter:greeter /var/lib/noctalia-greeter/greeter.toml

# Replace sddm with greetd as display manager
sudo systemctl disable --now sddm 2>/dev/null || true
sudo systemctl enable --now greetd
