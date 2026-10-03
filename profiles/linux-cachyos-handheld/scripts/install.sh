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
paru -S --noconfirm stow

DOTFILES_DIR="${HOME}/.dotfiles"
source "${DOTFILES_DIR}/profiles/lib/install-common.sh"

# Use stow to restore config
# Generic packages
stow_generic_packages bat \
    delta \
    git \
    sheldon \
    starship \
    stow \
    zsh
# Linux packages
stow_platform_packages discord \
    lsfg-vk

stow_profile linux-cachyos-handheld

# Gaming Apps
echo "==> INSTALLING GAMING APPS"
paru -S --noconfirm cachyos-gaming-meta \
    cachyos-gaming-applications \
    discord \
    lsfg-vk

echo "==> SETUP COMPLETE!"
