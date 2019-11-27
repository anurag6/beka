#!/bin/bash
set -eux
ls -alrt git/
uname -a
cd git/beka
sudo kokoro/setup.sh
glinux-build -name="rodete"

