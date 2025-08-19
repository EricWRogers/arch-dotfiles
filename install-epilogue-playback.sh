#!/bin/bash

yay -Syu playback-appimage
sudo -Syu fuse glibc
sudo usermod -a -G uucp $USER
groups $USER
sudo udevadm control --reload-rules
sudo udevadm trigger



