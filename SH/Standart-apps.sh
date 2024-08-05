#!/bin/bash

# Стандартный пакет
sudo pacman -Sy base-devel openssh wget wpa_supplicant wireless_tools nemo dmenu --noconfirm
sudo pacman -Sy arch-install-scripts libx11 libxinerama libxft webkit2gtk --noconfirm
sudo pacman -Sy viewnior vlc libreoffice-still vscode p7zip --noconfirm

# Полезные вещи + звук  
sudo pacman -Sy xclip htop neofetch alsa-utils pulseaudio pulseaudio-alsa numlockx --noconfirm

# Виртуальная машина
sudo pacman -Sy virt-manager qemu dnsmasq edk2-ovmf iptables --noconfirm

# работа с сетями
sudo pacman -Sy nmap --noconfirm

# Защита
sudo pacman -Sy veracrypt keepassxc --noconfirm

# Aur хелперы
# Yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd

# aur Приложения
yay -S librewolf-bin --noconfirm
