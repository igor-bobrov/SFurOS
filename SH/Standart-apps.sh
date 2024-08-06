#!/bin/bash
sudo pacman -Sy base-devel openssh wget wpa_supplicant wireless_tools nemo --noconfirm
sudo pacman -Sy arch-install-scripts libx11 libxinerama libxft webkit2gtk --noconfirm
sudo pacman -Sy viewnior vlc libreoffice-still p7zip --noconfirm

# sound and more
sudo pacman -Sy xclip htop neofetch alsa-utils pulseaudio pulseaudio-alsa numlockx --noconfirm

sudo pacman -Sy nmap --noconfirm
sudo pacman -Sy veracrypt keepassxc --noconfirm

yay -S librewolf-bin --noconfirm