# macOS-Lyka specific setup

This package contains macOS-Lyka specific setups. Heavily relies on [Homebrew](https://brew.sh)

## Quick Start

```bash
# Install pre-requisite
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install stow
brew install --cask 1password

# Setup SSH Keys and upload to github account
ssh-keygen -t ed25519

# Clone this repo
git clone git@github.com:samhwang/dotfiles.git ~/.dotfiles

# Use stow to restore config
cd .dotfiles

cd profiles
OP_ACCOUNT=my.1password.com op inject -i macos-lyka/.config/profiles/private.zshrc.tpl -o macos-lyka/.config/profiles/private.zshrc
stow --target=$HOME macos-lyka
cd ..

cd packages
stow --target=$HOME *

# Install the rest
cd ~/.config/brewfile
brew bundle --verbose --force --cleanup
```