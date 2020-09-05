#!/bin/bash
# -*- coding: utf-8 -*-
# Sample script to GPG sign Release files
# Copyright © 2002 Colin Walters <walters@debian.org>

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

# Usage:

# You need to create a secret keyring (secring.gpg).  You can use your
# existing one, or create a new one by doing something like the
# following:
# $ GNUPGHOME=/src/debian/mini-dinstall/s3kr1t gnupg --gen-key
#
# You should then put your passphrase in $GNUPGHOME/passphrase.

set -e

if [ -z "$USER" ]; then
   USER=$(id -n -u)
fi

# User variables
# MAKE SURE TO MAKE THIS DIRECTORY 0700!
export GNUPGHOME=$HOME/.gnupg
# You can get the key ID from current user, set a user, or ID.
#KEYID=$(getent passwd $USER | cut -f 5 -d : | cut -f 1 -d ,)
#KEYID=43FE9005 or "Archive signing key"
# You can set the digest here, keeping in mind apt will reject anything less than 256.
DIGEST=SHA512


if [ ! -d "$GNUPGHOME" ]; then
   mkdir -p "$GNUPGHOME"
   chown "$USER" "$GNUPGHOME"
   chmod 0700 "$GNUPGHOME"
fi

GPGOPTS=("--no-tty" "--batch" "--digest-algo" "$DIGEST" "--passphrase-file" "$GNUPGHOME/passphrase")
if [ "$(gpg --version | sed -n 's/gpg (GnuPG) //p' | cut -f1 -d.)" -ge "2" ];then
   GPGOPTS+=("--pinentry-mode" "loopback")
fi
if [ -n "$KEYID" ];then
   GPGOPTS+=("--default-key" "$KEYID")
fi

rm -f Release.gpg.tmp InRelease.tmp
gpg "${GPGOPTS[@]}" --detach-sign -o Release.gpg.tmp "$1"
mv Release.gpg.tmp Release.gpg
gpg "${GPGOPTS[@]}" --clearsign -o InRelease.tmp "$1"
mv InRelease.tmp InRelease
