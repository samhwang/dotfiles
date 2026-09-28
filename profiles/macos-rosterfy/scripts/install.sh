#!/bin/bash
set -euo pipefail

# Install pre-requisite
xcode-select --install || true
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git \
    stow \
    curl \
    wget
brew install --cask 1password

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
# macOS packages
stow_platform_packages aerospace

inject_profile_secrets macos-rosterfy
stow_profile macos-rosterfy

# Install the rest
brew bundle --file="${DOTFILES_DIR}/profiles/macos-rosterfy/.config/profiles/Brewfile" --verbose --force

# Install macos settings
source ~/.config/profiles/scripts/macos-settings.sh
