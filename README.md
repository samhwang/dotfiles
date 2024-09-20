# Dotfile

My bash and git config file.

This is my usual dev environment setup. It didn't exist before due to me not knowing I can store files in a repo and then symlink it out for uses back then.

## macOS Quick Start

```bash
# Install XCode Command Line Utilities
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Clone this repo
git clone git@github.com:samhwang/dotfiles.git

# Brew bundle to install packages
cd Darwin
brew bundle --verbose --cleanup
cd ..

# Stow to restore config
stow --target=$HOME --dotfile root
```
