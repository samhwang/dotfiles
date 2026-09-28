#!/bin/bash
set -euo pipefail

# Change to zsh
echo "==> CHANGING DEFAULT SHELL TO ZSH"
chsh -s "$(which zsh)" || true

# Install pre-requisite
echo "==> BOOTSTRAPPING PACMAN/PARU PREREQUISITES"
sudo pacman -S git \
  base-devel \
  yay \
  paru
paru -S --noconfirm stow \
  1password \
  1password-cli \
  gnome-keyring \
  pass

DOTFILES_DIR="${HOME}/.dotfiles"
source "${DOTFILES_DIR}/profiles/lib/install-common.sh"

# Use stow to restore config
# Generic packages
stow_generic_packages agents \
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
update_cowsay_submodule
# Linux packages
stow_platform_packages discord \
  hypr \
  lact \
  lsfg-vk

inject_profile_secrets linux-cachyos
stow_profile linux-cachyos

# Install the rest

# Programming Languages
echo "==> INSTALLING PROGRAMMING LANGUAGES"
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
echo "==> INSTALLING FONTS"
paru -S --noconfirm ttf-jetbrains-mono \
  ttf-jetbrains-mono-nerd \
  noto-fonts \
  noto-fonts-cjk \
  noto-fonts-emoji \
  otf-monaspace \
  otf-monaspace-nerdfonts \
  ttf-0xproto-nerd

# Vietnamese keyboard
echo "==> INSTALLING VIETNAMESE KEYBOARD SUPPORT"
paru -S --noconfirm fcitx5 \
  fcitx5-gtk \
  fctix5-bamboo

# Command Line Tools
echo "==> INSTALLING COMMAND LINE TOOLS"
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
  bluetui \
  go-task \
  just \
  make

# Editor Tools
echo "==> INSTALLING EDITOR TOOLS"
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
  aws-session-manager-plugin \
  android-studio

# Browsers and other GUI apps
echo "==> INSTALLING BROWSERS AND OTHER GUI APPS"
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
echo "==> INSTALLING GAMING APPS"
paru -S --noconfirm cachyos-gaming-meta \
  cachyos-gaming-applications \
  lsfg-vk

# Statlocker Companion (Deadlock stat manager)
echo "==> INSTALLING STATLOCKER COMPANION"
mkdir -p ~/.local/bin
curl -fL -o ~/.local/bin/statlocker-companion.AppImage https://updates.statlocker.gg/companion/download/statlocker-companion_amd64.AppImage
chmod +x ~/.local/bin/statlocker-companion.AppImage

# System
echo "==> INSTALLING SYSTEM PACKAGES"
paru -S --noconfirm snapper \
  simple-scan \
  plymouth \
  greetd \
  accountsservice

# For Logitech mice
echo "==> INSTALLING LOGITECH MICE SUPPORT"
paru -S --noconfirm solaar

# For Ergodox EZ
echo "==> INSTALLING ERGODOX EZ SUPPORT"
paru -S --noconfirm zsa-keymapp-bin

# For Brother printer & scanner
echo "==> INSTALLING BROTHER PRINTER & SCANNER SUPPORT"
paru -S --noconfirm brother-mfc-l2750dw

# Photography apps
echo "==> INSTALLING PHOTOGRAPHY APPS"
paru -S --noconfirm gimp \
  darktable \
  rawtherapee \
  rapidraw-bin \
  davinci-resolve \
  handbrake \
  vuescan-bin

# VPN things
echo "==> INSTALLING VPN TOOLS"
paru -S --noconfirm tailscale \
  nordvpn-bin \
  nordvpn-gui

# Hyprland packages
echo "==> INSTALLING HYPRLAND PACKAGES"
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
echo "==> INSTALLING GREETD/NOCTALIA-GREETER SYSTEM CONFIGS"
sudo useradd -r -s /usr/bin/nologin -d /var/lib/noctalia-greeter greeter 2>/dev/null || true
sudo cp -a /etc/greetd/config.toml /etc/greetd/config.toml.bak 2>/dev/null || true
sudo install -Dm644 ~/.dotfiles/packages/hypr/etc/greetd/config.toml /etc/greetd/config.toml
sudo install -Dm644 ~/.dotfiles/packages/hypr/var/lib/noctalia-greeter/greeter.toml /var/lib/noctalia-greeter/greeter.toml
sudo chown greeter:greeter /var/lib/noctalia-greeter/greeter.toml

# Replace sddm with greetd as display manager
echo "==> SWITCHING DISPLAY MANAGER FROM SDDM TO GREETD"
sudo systemctl disable --now sddm 2>/dev/null || true
sudo systemctl enable --now greetd

echo "==> SETUP COMPLETE!"
