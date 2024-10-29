#!/usr/bin/env bash

# Function for output
function echo_info() {
    echo "* $@"
}

# This script require the root user
RUN_BY="root"
I_AM=`/usr/bin/id -un`
if [ $I_AM != "$RUN_BY" ]; then
    echo "Program must be run by user \"$RUN_BY\""
    exit
fi

# Change repos to SID branch and upgrade Debian
echo_info "Checking if sid repos is used..."
if ! grep -q "sid" "/etc/apt/sources.list"; then
    echo_info "sid repos not used. Change repos to sid"
    echo 'deb http://deb.debian.org/debian/ sid main contrib non-free non-free-firmware' > /etc/apt/sources.list
    echo 'deb-src http://deb.debian.org/debian/ sid main contrib non-free non-free-firmware' >> /etc/apt/sources.list
    dpkg --add-architecture i386 && apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y
fi

# Install the Ansible
echo_info "Checking if ansible is installed..."
if ! [ -x "$(command -v ansible-playbook)" ]; then
    echo_info "ansible not installed. Installing now"
    apt-get install ansible -y
fi

# Run the Ansible playbook
echo_info "Running ansible playbook..."
ansible-playbook playbook.yml

# Enable all symlinks for dotfiles
echo_info "Enable all symlinks..."
stow -D .
stow .

echo_info "DON'T FORGET SETUP WALLPAPER FOR betterlockscreen AND nitrogen"
echo_info "AND SETUP THE ARC THEME AND PAPIRUS ICONS WITH lxappearance and kvantum"
echo_info "ALSO IN /etc/sudoers CONFIGURE shutdown AND reboot TO RUN WITHOUT PASSWORD"
