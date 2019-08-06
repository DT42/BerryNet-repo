#!/bin/bash

# Script to install the BerryNet repo onto a
# Debian or Ubuntu system.
#
# curl -sL https://raw.githubusercontent.com/DT42/BerryNet-repo/master/setup.sh | sudo -E bash -
#   or
# wget -qO- https://raw.githubusercontent.com/DT42/BerryNet-repo/master/setup.sh  | sudo -E bash -
#

set -e

get_distribution() {
    echo $(lsb_release -c -s)
}

echo 'Adding the BerryNet signing key to your keyring...'
curl -sL https://raw.githubusercontent.com/DT42/BerryNet-repo/master/berrynetrepo.gpg.key | apt-key add -

echo "Creating apt sources list file for the BerryNet repo..."
dist=$(get_distribution)
if [ $dist == "buster" ]; then
    curl -sL -o /etc/apt/sources.list.d/berrynet.list \
        https://raw.githubusercontent.com/DT42/BerryNet/master/config/berrynet-buster.list
elif [ $dist == "xenial" ]; then
    curl -sL -o /etc/apt/sources.list.d/berrynet.list \
        https://raw.githubusercontent.com/DT42/BerryNet/master/config/berrynet-xenial.list
else
    curl -sL -o /etc/apt/sources.list.d/berrynet.list \
        https://raw.githubusercontent.com/DT42/BerryNet/master/config/berrynet.list
fi

echo 'Running `apt-get update` for you...'
apt-get update
