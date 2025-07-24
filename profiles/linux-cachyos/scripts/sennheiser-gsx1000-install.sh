#!/bin/bash

# Taken from https://github.com/evilphish/sennheiser-gsx-1000/blob/master/install.sh
# and https://github.com/g1sbi/sennheiser-gsx-1000-pipewire-fix
# and trimmed out the bits I don't need

set -e

sudo -v

echo "Installing GSX1000"

echo "Installing udev rule"
if [ -d /lib/udev/rules.d/ ]; then
  echo "Udev located in /lib"
  sudo cp ./lib/99-gsx1000.rules /lib/udev/rules.d/
elif [ -d /etc/udev/rules.d/ ]; then
  echo "Udev located in /etc"
  sudo cp ./lib/99-gsx1000.rules /etc/udev/rules.d/
else
  echo "Udev rules route not found, hence cancelling installation"
  echo "Expected locations: /etc/udev/rules.d/ OR /lib/udev/rules.d/"
fi

echo "Installing udev hwdb"
sudo cp ./lib/sennheiser-gsx.hwdb /etc/udev/hwdb.d/

echo "Installing pulsaudio profiles"
read -p "Should we install the channelswap-fix, see https://github.com/evilphish/sennheiser-gsx-1000/issues/9 (y for yes, n [default])? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo cp -r ./lib/sennheiser-gsx1000-channelswap.conf /usr/share/alsa-card-profile/mixer/profile-sets/sennheiser-gsx1000.conf
  echo "- installed channel-swap mix"
else
  sudo cp -r ./lib/sennheiser-gsx1000.conf /usr/share/alsa-card-profile/mixer/profile-sets
  echo "- installed normal channel mix"
fi

echo "Reloading udev rules"
sudo systemd-hwdb update
sudo udevadm control -R
sudo udevadm trigger
