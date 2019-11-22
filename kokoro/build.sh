#!/bin/bash -e -x
cd git/benz-build-source
sudo kokoro/setup.sh
build-debs -L -d rodete

