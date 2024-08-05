#!/bin/bash

# Установка Xorg 
sudo pacman -Sy xorg xorg-xinit xorg-server --noconfirm

# settings
echo 'numlockx on' >> ~/.xinitrc
echo 'sudo pacman -Syu' >> ~/.xinit.rc
