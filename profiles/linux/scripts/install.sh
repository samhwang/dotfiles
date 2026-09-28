#!/bin/bash
set -euo pipefail

# Install pre-requisite: Stow and 1Password

DOTFILES_DIR="${HOME}/.dotfiles"
source "${DOTFILES_DIR}/profiles/lib/install-common.sh"

# Use stow to restore config
# Generic packages
stow_generic_packages act \
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
    tmux \
    vim \
    zed \
    zellij \
    zsh
update_cowsay_submodule
# Linux packages
stow_platform_packages discord \
    hypr \
    lsfg-vk

inject_profile_secrets linux
stow_profile linux

# Install the rest

echo "==> SETUP COMPLETE!"
