#!/bin/bash -e -x

# Some google packages will require this as a prerequisite.
addgroup --gid 5000 eng

# Replace install-time package configuration with Rapture.
echo "deb https://rapture-prod.corp.google.com goobuntu-trusty-stable-desktop main" > /etc/apt/sources.list
rm -f /etc/apt/sources.list.d/*
curl https://rapture-prod.corp.google.com/doc/rapture-public-keyring.gpg | apt-key add -

# The postinst for the pbuilder package will fail without this
# preseed. It never actually gets used; this is just to prevent
# it from entering an infinite loop.
sudo debconf-set-selections << EOF
pbuilder pbuilder/mirrorsite string http://archive.ubuntu.com/ubuntu
EOF

apt-get -q update
apt-get -q -y install build-debs rapture-archive-keyring
