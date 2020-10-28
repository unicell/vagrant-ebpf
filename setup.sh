#!/usr/bin/env bash

if [[ $(lsb_release -cs) == "bionic" ]]; then
    echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-7 main" | sudo tee -a /etc/apt/sources.list
fi

# for image-image build-dep
echo "deb-src http://archive.ubuntu.com/ubuntu/ $(lsb_release -cs) main restricted" | sudo tee -a /etc/apt/sources.list
sudo apt-get update

sudo apt-get -y build-dep linux-image-$(uname -r)
sudo apt-get install -qy vim git tig

# for kernel and ebpf in general
sudo apt-get install -qy libelf-dev libcap-dev flex bison
sudo apt-get install -qy clang llvm gcc-multilib linux-tools-$(uname -r) linux-headers-$(uname -r)

if [[ $(lsb_release -cs) == "bionic" ]]; then
    sudo apt-get install -qy clang-7 llvm-7
    #sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-7 50
    #sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-7 50
    #sudo update-alternatives --install /usr/bin/clang-cpp clang-cpp /usr/bin/clang-cpp-7 50
fi

# for bpftool
sudo apt-get install -y linux-tools-$(uname -r)
# for bpftool build dependency
sudo apt-get install -y binutils-dev binutils-multiarch-dev libiberty-dev

# for cloudflare/bpftools
sudo apt-get install -y libreadline-dev
#virtualenv venv
#source ./venv/bin/activate
#pip install pcappy

# for xdp-tutorial
sudo apt-get install -y pkg-config libpcap-dev
