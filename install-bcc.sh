#!/usr/bin/env bash

if [[ $(lsb_release -cs) == "bionic" ]]; then
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4052245BD4284CDD
    echo "deb https://repo.iovisor.org/apt/$(lsb_release -cs) $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/iovisor.list
fi

# https://github.com/iovisor/bcc/blob/master/INSTALL.md#install-build-dependencies-1
sudo apt install -y bison build-essential cmake flex git libedit-dev \
      libllvm7 llvm-7-dev libclang-7-dev python zlib1g-dev libelf-dev

# /usr/share/bcc/tools, /usr/share/bcc/examples
sudo apt-get install -y bcc-tools libbcc-examples
