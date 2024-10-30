#!/usr/bin/env bash

# Variables
user="$(getent group 1000 | cut -d':' -f 1)"
runas=($whoami)

# Check if user is root or not
[ $runas != 'root' ] && printf "${red}command must be run as root...exiting ${nc}\n" && exit 1

# Install all dependencies
apt install qemu-kvm libvirt-clients libvirt-daemon libvirt-daemon-system bridge-utils virtinst virt-manager -yy

# Start the libvirt service
systemctl enable libvirtd
systemctl start libvirtd

# Add user to libvirt groups
usermod -aG libvirt $user
usermod -aG kvm $user
usermod -aG libvirt-qemu $user
