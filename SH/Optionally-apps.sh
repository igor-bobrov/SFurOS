#!/bin/bash

# опенсурс github-cli
sudo pacman -Sy github-cli

# 
sudo pacman -S discord
sudo pacman -S telegram-desktop
sudo pacman -S krita

# Nvidia
echo "Nvidia drivers"
sudo pacman -Sy nvidia-settings nvidia-dkms nvidia-utils opencl-nvidia 

# Intel
echo "Intel drivers"
sudo pacman -Sy mesa 

