#!/bin/bash
set -euo pipefail

# Install pre-requisite
echo "==> INSTALLING XCODE COMMAND LINE TOOLS AND HOMEBREW"
xcode-select --install || true
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

inject_profile_secrets macos-rosterfy
stow_profile macos-rosterfy

# Install the rest
echo "==> RUNNING BREW BUNDLE INSTALL"
brew bundle --file="${DOTFILES_DIR}/profiles/macos-rosterfy/.config/profiles/Brewfile" --verbose --force

# Refresh EKS kubeconfig entries (~/.kube exists via stow_profile above).
# Non-fatal: a fresh machine won't be AWS SSO'd in yet.
echo "==> REFRESHING EKS KUBECONFIG"
"${DOTFILES_DIR}/profiles/macos-rosterfy/scripts/update-kube-config.sh" || echo "Skipped EKS kubeconfig refresh (probably not logged into AWS SSO yet). Run 'aws sso login --profile <profile>' then re-run profiles/macos-rosterfy/scripts/update-kube-config.sh manually."

# Install macos settings
echo "==> APPLYING MACOS SETTINGS"
source ~/.config/profiles/scripts/macos-settings.sh

echo "==> SETUP COMPLETE!"
