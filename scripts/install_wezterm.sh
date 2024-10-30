#!/usr/bin/env bash

[ -x "$(command -v curl)" ] || sudo apt-get install curl -y
[ -x "$(command -v gnupg2)" ] || sudo apt-get install gnupg2 -y

# Add the wezterm repo
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

# Update the repos
sudo apt-get update

# Install wezterm
sudo apt-get install wezterm -y
