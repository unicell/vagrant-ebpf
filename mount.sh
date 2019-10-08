#!/usr/bin/env bash
NFS_HOST=${NFS_HOST:-"192.168.56.102"}

sudo apt-get install -qy nfs-common

sudo mkdir -p /mnt/linux.git
sudo mount ${NFS_HOST}:/mnt/linux.git /mnt/linux.git

sudo mkdir -p /mnt/ebpf
sudo mount ${NFS_HOST}:/mnt/ebpf /mnt/ebpf
