# Dotfile

Setting myself up for success, this will bootstrap any macOS machine that I come across. The name of the game is `Lean, mean, fighting machine`.

## macOS Quick Start

```bash
# Install XCode Command Line Utilities
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Clone this repo
git clone git@github.com:samhwang/dotfiles.git ~/.dotfiles

# Install stow to then work with other packages
brew install stow

# Stow to restore config
cd .dotfiles/packages
stow --target=$HOME *

# Install the rest
cd ~/.config/brewfile
brew bundle --verbose --force --cleanup
```
