#!/bin/bash

sudo systemctl enable systemd-networkd
sudo systemctl start systemd-networkd

# connect to wifi
# nmcli device wifi list
# nmcli device wifi connect wifi_name password wifi_password

sudo pacman -Syu ttf-font-awesome otf-font-awesome noto-fonts-emoji
sudo pacman -S sof-firmware
sudo pacman -S waybar hyprpaper hypridle
sudo pacman -S krita firefox tmux git neovim lazygit

git config --global user.name EricWRogers
git config --global user.email ericwilliamrogers@gmail.com
