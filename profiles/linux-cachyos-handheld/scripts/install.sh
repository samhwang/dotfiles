#!bin/bash

# Install pre-requisite: Stow and 1Password

# Use stow to restore config
cd ~/.dotfiles/packages
stow --target=$HOME *
cd ..

cd ~/.dotfiles/profiles
OP_ACCOUNT=my.1password.com op inject -i linux/.config/profiles/private.zshrc.tpl -o linux/.config/profiles/private.zshrc
stow --target=$HOME linux
cd ..

# Install the rest
