#!/bin/bash
# Стандартный пакет
sudo pacman -Sy base-devel openssh wget wpa_supplicant wireless_tools nemo --noconfirm
sudo pacman -Sy arch-install-scripts libx11 libxinerama libxft webkit2gtk --noconfirm
sudo pacman -Sy viewnior vlc libreoffice-still p7zip --noconfirm

# Полезные вещи + звук  
sudo pacman -Sy xclip htop neofetch alsa-utils pulseaudio pulseaudio-alsa numlockx --noconfirm

# работа с сетями
sudo pacman -Sy nmap --noconfirm

# Защита
sudo pacman -Sy veracrypt keepassxc --noconfirm