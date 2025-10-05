# CachyOS specific setup

This package contains CachyOS specific setups, and is meant to be run on a clean
installation with KDE Plasma as the default DE.

## Quick Start

```bash
# Setup SSH Keys and upload to github account
ssh-keygen -t ed25519

# Clone this repo
git clone git@github.com:samhwang/dotfiles.git ~/.dotfiles

# Run install script
bash ~/.dotfiles/profiles/linux-cachyos/scripts/install.sh
```

## Install Lossless Framegen
- Login Steam, download [`Lossless Scaling`](https://store.steampowered.com/app/993090/Lossless_Scaling/)
- Then in GitHub, go to [`lsfg-vk`](https://github.com/PancakeTAS/lsfg-vk) => Releases => Download the file with `.tar.zst` suffix
- Open Terminal, Go to the downloads folder => Run:

```shell
paru -U lsfg-vk-<VERSION>x86_64.tar.zst
```
