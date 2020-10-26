#!/usr/bin/env bash

KERNEL_SOURCE=${KERNEL_SOURCE:-"/mnt/linux.git"}

pushd ${KERNEL_SOURCE}
make -C tools/bpf/bpftool/
sudo make -C tools/bpf/bpftool/ install
popd
