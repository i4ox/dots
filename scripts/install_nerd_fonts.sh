#!/usr/bin/env bash

# Check if dependencies is installed or not
[ -x "$(command -v wget)" ] || sudo apt-get install wget -y
[ -x "$(command -v unzip)" ] || sudo apt-get install unzip -y

# Download CascadiaCode with NerdFont Patch
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip

# Unzip the archive
unzip CascadiaCode.zip -d cc

# Install the font
sudo mkdir /usr/share/fonts/CascadiaCode
sudo cp cc/*.ttf /usr/share/fonts/CascadiaCode
sudo fc-cache --force

# Delete the tmp files
rm -rf cc CascadiaCode.zip
