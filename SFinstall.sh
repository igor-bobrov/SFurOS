#!/bin/bash
# Установка arch linux minimal с dwm by sakari UwU
sudo pacman -Syu —-noconfirm

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


chmod +x ~/SfyrOS/SH/optionally-apps.sh
~/SfyrOS/SH/optionally-apps.sh

chmod +x ~/SH/SfurOS/standart-apps.sh
~/SfurOS/SH/standart-apps.sh

# dwm
git clone https://github.com/igor-bobrov/sakari-dwm.git

chmod +x ~/sakari-dwm/init-dwm.sh
~/sakari-dwm/init-dwm.sh

# settings
echo 'numlockx on' >> ~/.xinitrc
echo 'sudo pacman -Syu' >> ~/.xinit.rc
echo 'startx' >> ~/.xinit.rc

# kitty
git clone https://github.com/igor-bobrov/kitty-term.git

chmod +x ~/kitty-term/init.sh
~/kitty-term/init.sh

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
