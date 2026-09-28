#!/bin/bash
set -euo pipefail

# Install pre-requisite: Stow and 1Password

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

inject_profile_secrets linux-cachyos-handheld
stow_profile linux-cachyos-handheld

# Gaming Apps
echo "==> INSTALLING GAMING APPS"
paru -S --noconfirm cachyos-gaming-meta \
    cachyos-gaming-applications \
    discord \
    lsfg-vk

echo "==> SETUP COMPLETE!"
