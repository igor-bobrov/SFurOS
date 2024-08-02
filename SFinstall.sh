#!/bin/bash
# Установка arch linux minimal с dwm by sakari UwU
sudo pacman -Syu —noconfirm

#______________________Содержание________________________________

# необязательные пакеты

# Стандартный пакет
# Работа с файлами
# Полезные вещи + звук
# Установка Xorg
# Виртуальная машина
# работа с сетями
# Защита
# Aur хелперы
# aur Приложения
# dwm

# Настройка
# Удаление



#______________________Работающая_Часть__________________________

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


# Стандартный пакет
sudo pacman -Sy base-devel openssh wget wpa_supplicant wireless_tools nemo dmenu --noconfirm 
sudo pacman -Sy arch-install-scripts libx11 libxinerama libxft webkit2gtk --noconfirm

# Работа с файлами
sudo pacman -Sy viewnior git nano cat vlc libreoffice-still p7zip --noconfirm 

# Полезные вещи + звук  
sudo pacman -Sy xclip htop neofetch alsa-utils pulseaudio pulseaudio-also numlockx --noconfirm

# Установка Xorg 
sudo pacman -Sy xorg xorg-xinit xorg-server --noconfirm

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
# paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd

# aur Приложения
yay -S librewolf-bin --noconfirm
yay -S amberol --noconfirm

# dwm
git clone https://git.suckless.org/dwm
echo 'exec dwm' >> ~/.xinitrc
cd dwm
sudo make clean install
cd

# Настройка
echo 'numlockx on' >> ~/.xinitrc
echo 'sudo pacman -Syu' >> ~/.xinit.rc
echo 'startx' >> ~/.xinit.rc

# kitty
git clone https://github.com/igor-bobrov/kitty-term.git

chmod +x ~/kitty-term/init.sh
~/kitty-term/init.sh

# dwm

# Neovim
git clone https://github.com/igor-bobrov/sakari-nvim.git

chmod +x ~/sakari-nvim/init-nvim.sh
~/sakari-nvim/init-nvim.sh

# Создание основных директорий 
cp -r ~/SFurOS/Images ~/Images
cp -r ~/SFurOS/Books ~/Books
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Music
mkdir -p ~/Videos



# Установка OpenRC




sudo reboot
