#!/bin/bash

sudo pacman -Syu stow ttf-cascadia-code-nerd ttf-font-awesome otf-font-awesome noto-fonts-emoji glxinfo sof-firmwared krita firefox tmux git neovim lazygit dotnet-sdk zip unzip ranger cmake btop obs-studio mesa swaync nextcloud-client libreoffice-fresh syncthing xournalpp nautilus gnome-disk-utility dosfstools

yay -S clang npm unityhub blender-lts-bin prettier patchelf visual-studio-code-bin obs-studio system76-keyboard-configurator gitkraken

systemctl --user enable syncthing.service
systemctl --user start syncthing.serice

git config --global user.name EricWRogers
git config --global user.email ericwilliamrogers@gmail.com

stow kitty
stow backgrounds
stow nvim

rm ~/.bashrc
stow bash-confs
source ~/.bashrc
