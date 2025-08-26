#!/bin/bash

sudo systemctl enable systemd-networkd
sudo systemctl start systemd-networkd

# connect to wifi
# nmcli device wifi list
# nmcli device wifi connect wifi_name password wifi_password

sudo pacman -Syu stow ttf-cascadia-code-nerd ttf-font-awesome otf-font-awesome noto-fonts-emoji glxinfo sof-firmware waybar hyprpaper hyprlock hypridle hyprshot brightnessctl krita firefox tmux git neovim lazygit dotnet-sdk zip unzip ranger cmake btop pulseaudio pavucontrol obs-studio libva-intel-driver libva-utils mesa swaync nextcloud-client libreoffice-fresh syncthing xournalpp nautilus gnome-disk-utility dosfstools

sudo pacman -S --needed base-devel
mkdir -p ~/Git/yay
git clone https://aur.archlinux.org/yay.git ~/Git/yay
cd ~/Git/yay
makepkg -si

yay -S clang npm unityhub blender-lts-bin prettier patchelf visual-studio-code-bin obs-studio system76-keyboard-configurator system76-power gitkraken

sudo systemctl enable com.system76.PowerDaemon.service
sudo systemctl start com.system76.PowerDaemon.service

systemctl --user enable syncthing.service
systemctl --user start syncthing.serice

git config --global user.name EricWRogers
git config --global user.email ericwilliamrogers@gmail.com

stow hyprland
stow hyprlock
stow hyprpaper
stow kitty
stow wofi
stow backgrounds
stow hyprmocha
stow nvim
stow waybar

rm ~/.bashrc
stow bash-confs
source ~/.bashrc
