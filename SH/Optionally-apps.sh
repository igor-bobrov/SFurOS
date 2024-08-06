#!/bin/bash
read -p " ${NOTE} Do you want install helper for github?? (y:n)    " gh
read -p " ${NOTE} Do you want install discord? (y:n)    " discord
read -p " ${NOTE} Do you want install krita? (y:n)    " krita
read -p " ${NOTE} Do you want install telegram? (y:n)    " telegram
read -p " ${NOTE} Do you want install game-setup? (y:n)    " game-setup
read -p " ${NOTE} Do you want install drivers (n)vidia, (a)md(dont work), (i)ntel or (o)pen-source-intel-nvidia? (n:a:i:o)    " drivers
read -p " ${NOTE} Do you want install (q)ume or (v)irtual-box or both? (q:v:b)    " vm
read -p " ${NOTE} Do you want install vs-code? (y:n)    " vs
echo " ${WARN} web-browsers(standart: librewolf)"
read -p " ${NOTE} Do you want install google? (y:n)    " gb

if [[ $gh == "y"]]; then
    # опенсурс github-cli
    sudo pacman -Sy github-cli --noconfirm
fi
if [[ $discord == "y"]]; then
    sudo pacman -Sy discord --noconfirm
fi
if [[ $telegram == "y"]]; then
    sudo pacman -Sy telegram-desktop --noconfirm
fi
if [[ $krita == "y"]]; then
    sudo pacman -Sy krita --noconfirm
fi
if [[ $drivers == "y" || $drivers == "o"]]; then
    # Nvidia
    sudo pacman -Sy nvidia-settings nvidia-dkms nvidia-utils opencl-nvidia --noconfirm
fi
if [[ $drivers == "i" || $drivers == "o"]]; then
    # Intel
    sudo pacman -Sy mesa --noconfirm
fi
if [[ $vm == "q" || $vm == "b"]]; then
    # Виртуальная машина
    sudo pacman -Sy virt-manager qemu dnsmasq edk2-ovmf iptables --noconfirm
fi
if [[ $vm == "v" || $vm == "b"]]; then
    # Виртуальная машина
    
fi
if [[ $vs == "y"]]; then
    sudo pacman -Sy vscode --noconfirm
fi
