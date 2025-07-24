#!/bin/bash

# Taken from https://github.com/evilphish/sennheiser-gsx-1000/blob/master/uninstall.sh
# and https://github.com/g1sbi/sennheiser-gsx-1000-pipewire-fix
# and trimmed out the bits I don't need

set -e

sudo -v

echo "Uninstalling GSX1000"

sudo rm -f /lib/udev/rules.d/99-pulseaudio-gsx1000.rules
sudo rm -f /etc/udev/rules.d/99-pulseaudio-gsx1000.rules
sudo rm -f /usr/share/alsa-card-profile/mixer/profile-sets/sennheiser-gsx1000.conf

echo "Reloading udev rules"
sudo systemd-hwdb update
sudo udevadm control -R
sudo udevadm trigger
