#!/usr/bin/env bash

# for cilium
# https://github.com/cilium/cilium/blob/master/Documentation/operations/system_requirements.rst

# extract source
sudo mkdir -p /src
sudo chown vagrant:vagrant /src
bash -c "$(curl -fsSL https://raw.githubusercontent.com/cilium/image-tools/master/images/iproute2/checkout-iproute2.sh)"

# build binaries
sudo mkdir -p /out/linux/amd64/bin
sudo chown vagrant:vagrant /out/linux/amd64/bin
bash -c "$(curl -fsSL https://raw.githubusercontent.com/cilium/image-tools/master/images/iproute2/build-iproute2-native.sh)"

sudo cp -a /out/linux/amd64/bin/{ip,tc,ss} /usr/local/bin/
