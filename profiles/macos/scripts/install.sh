#!/bin/bash
set -euo pipefail

# Install pre-requisite
echo "==> INSTALLING XCODE COMMAND LINE TOOLS AND HOMEBREW"
xcode-select --install || true
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git \
    stow \
    curl \
    wget
echo "==> INSTALLING CASKS"
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

inject_profile_secrets macos
stow_profile macos

# Install the rest
echo "==> RUNNING BREW BUNDLE INSTALL"
brew bundle --file="${DOTFILES_DIR}/profiles/macos/.config/profiles/Brewfile" --verbose --force

# Install macos settings
echo "==> APPLYING MACOS SETTINGS"
source ~/.config/profiles/scripts/macos-settings.sh

echo "==> SETUP COMPLETE!"
