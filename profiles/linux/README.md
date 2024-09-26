# Linux specific setup

This package contains Linux specific setups.

## Quick Start

```bash
# Install pre-requisite: Stow and 1Password

# Setup SSH Keys and upload to github account
ssh-keygen -t ed25519

# Clone this repo
git clone git@github.com:samhwang/dotfiles.git ~/.dotfiles

# Use stow to restore config
cd .dotfiles

cd profiles
stow --target=$HOME linux
cd ..

cd packages
stow --target=$HOME *

# Install the rest of deps
```
