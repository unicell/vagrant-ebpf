#!/usr/bin/env bash

# dwarfris not needed with elfutils (>= 0.173)
llc -march=bpf -mattr=help |& grep dwarfris

# dwarves 1.15 from Ubuntu Focal
# while 1.16+ required for DWARF to BTF conversion
# sudo apt-get install -qy dwarves

sudo apt-get install -qy elfutils cmake libdw-dev

# git clone https://git.kernel.org/pub/scm/devel/pahole/pahole.git
mkdir -p pahole/build
cd pahole/build
cmake -D__LIB=lib ..
sudo make install
cd -

sudo ldconfig /usr/local/lib

pahole --version
pahole --help | grep BTF
