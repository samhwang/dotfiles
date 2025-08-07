#!bin/bash

# Install pre-requisite: Stow and 1Password

# Use stow to restore config
cd ~/.dotfiles/packages
stow --target=$HOME *
cd ..

cd ~/.dotfiles/profiles
OP_ACCOUNT=my.1password.com op inject -i TEMPLATE/.config/profiles/private.zshrc.tpl -o TEMPLATE/.config/profiles/private.zshrc
stow --target=$HOME TEMPLATE
cd ..

# Install the rest
