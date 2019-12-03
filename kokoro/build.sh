#!/bin/bash
#Should be run through go/benz

set -eux
ls -alrt git/
uname -a
cd git/benz-build-source
sudo kokoro/setup.sh
build-debs -b -L -d rodete

