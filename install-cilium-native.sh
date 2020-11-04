#!/usr/bin/env bash

mkdir -p ~/gocode/src/github.com/cilium
ln -s /mnt/ebpf/cilium/cilium $(pwd)

make
sudo env "PATH=$PATH" make install

sudo mkdir -p /etc/sysconfig/
sudo cp contrib/systemd/cilium.service /etc/systemd/system/
sudo cp contrib/systemd/cilium-docker.service /etc/systemd/system/
sudo cp contrib/systemd/cilium-consul.service /etc/systemd/system/
sudo cp contrib/systemd/cilium  /etc/sysconfig/cilium

sudo usermod -a -G cilium vagrant

sudo systemctl enable cilium-docker
sudo systemctl restart cilium-docker
sudo systemctl enable cilium-consul
sudo systemctl restart cilium-consul
sudo systemctl enable cilium
sudo systemctl restart cilium
