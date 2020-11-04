#!/usr/bin/env bash

# https://docs.cilium.io/en/stable/bpf/#compiling-iproute2
pushd /mnt/ebpf
git clone git://git.kernel.org/pub/scm/network/iproute2/iproute2.git
#git clone git://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git

./configure
make

popd
