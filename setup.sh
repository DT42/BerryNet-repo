#!/bin/bash

# Script to install the BerryNet repo onto a
# Debian or Ubuntu system.
#
# Run as root or insert `sudo -E` before `bash`:
#
# curl -sL https://raw.githubusercontent.com/DT42/BerryNet-repo/master/setup.sh | bash -
#   or
# wget -qO- https://raw.githubusercontent.com/DT42/BerryNet-repo/master/setup.sh  | bash -
#

set -e

echo 'Adding the BerryNet signing key to your keyring...'
curl -sL https://raw.githubusercontent.com/DT42/BerryNet-repo/master/berrynetrepo.gpg.key | apt-key add -

echo "Creating apt sources list file for the BerryNet repo..."
curl -sL -o /etc/apt/sources.list.d/berrynet.list \
    https://raw.githubusercontent.com/DT42/BerryNet/master/config/berrynet.list

echo 'Running `apt-get update` for you...'
apt-get update
