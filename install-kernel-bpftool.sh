#!/usr/bin/env bash

# use either `net` or `net-next` tree
KERNEL_SOURCE=${KERNEL_SOURCE:-"/mnt/linux.git"}

pushd ${KERNEL_SOURCE}
make -C tools/bpf/bpftool/
sudo make -C tools/bpf/bpftool/ install
popd
