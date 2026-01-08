#! /usr/bin/env bash

set -euo pipefail

# Packages that require special setup/hooks - not yet in config.toml

# install pipewire (requires systemctl --user)
sudo apt update -y
sudo apt install pipewire-audio wireplumber pipewire-pulse pipewire-alsa libspa-0.2-bluetooth
systemctl --user --now enable wireplumber.service

# do this since tailscale conflicts with NetworkManager over /etc/resolv.conf
# requires manual /etc/NetworkManager/NetworkManager.conf edit
sudo apt install openresolv

# Manual steps needed after installing openresolv:
# sudo nano /etc/NetworkManager/NetworkManager.conf
# paste:
# [main]
# rc-manager=resolvconf
# sudo systemctl restart NetworkManager
# sudo tailscale up --reset

sudo apt autoremove -y
