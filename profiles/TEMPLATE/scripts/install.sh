#!/bin/bash

# Install pre-requisite: Stow and 1Password

DOTFILES_DIR="${HOME}/.dotfiles"
source "${DOTFILES_DIR}/profiles/lib/install-common.sh"

# Use stow to restore config
# Generic packages
stow_generic_packages agents \
    act \
    bat \
    bottom \
    claude-clode \
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
    television \
    testcontainers \
    tmux \
    vim \
    zed \
    zellij \
    zsh
update_cowsay_submodule
# UNCOMMENT ONE OF THESE BLOCKS FOR THE OS THAT IS INSTALLED ON
# Linux packages
# stow_platform_packages discord \
#     hypr \
#     lsfg-vk
# # macOS packages
# stow_platform_packages aerospace

inject_profile_secrets TEMPLATE
stow_profile TEMPLATE

# Install the rest
