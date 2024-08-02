#!/bin/bash
# Установка arch linux minimal с dwm by sakari UwU

echo 'ручная установка будет до принятия/отклонения intel драйверов, а также прочтите соглашение!'
cat ~/SFurOS/licence
cat ~/SFurOS/README.md
sudo pacman -Syu --noconfirm
sudo pacman -Sy nano cat --noconfirm


# Предупреждение
echo "Этот скрипт удалит systemd. Убедитесь, что у вас есть резервная копия данных!"
read -p "Вы уверены, что хотите продолжить? (y/n): " confirm

if [[ "$confirm" != "y" ]]; then
    echo "Отмена."
    exit 1
fi

lsblk


echo "Введите название диска с корневой системой, а после прожмите ctrl + X => shift + Y => enter"

read -p "Вы уверены, что хотите продолжить? (y/n): " confirm

if [[ "$confirm" != "y" ]]; then
    echo "Отмена."
    exit 1
fi

nano disk_name.txt

# Чтение названия диска из файла
DISK_NAME=$(cat ~/disk_name.txt)

# Проверка, что переменная не пустая
if [ -z "$DISK_NAME" ]; then
    echo "Название диска не указано. Пожалуйста, введите название диска в disk_name.txt."
    exit 1
fi

# Пример использования названия диска (можно заменить на нужную команду)
echo "Выбранный диск: $DISK_NAME"
# Здесь можно добавить команды для работы с диском, например, монтирование или проверка состоян>




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

# Мессенджеры и необязательная хрень
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
sudo pacman -Sy viewnior git neovim kitty vlc libreoffice-still p7zip --noconfirm 

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

# Конфиг kitty
mkdir -p ~/.config/kitty
cat <<EOL > ~/.config/kitty/kitty.conf
# Выбор темы и цвета
background #1d1f21
foreground #c5c8c6
cursor_color #4B0082
selection_background #4B0082
selection_foreground #FFF0F5
background_opacity 0.98

# Настройка сочетаний клавиш
copy_to_clipboard true
map ctrl + c copy
map ctrl + v paste
map ctrl + z undo

# Настройки шрифта
font_family       Fira Code
font_size         12.0
bold_font         Fira Code Bold

# Проведение разделителей
padding_left      10
padding_right     10
padding_top       10
padding_bottom    10

EOL

# Копирование конфигов dwm

# Конфиги на Neovim
cd
mkdir -p ~/.config/nvim/lua/config
cp ~/sakari-nvim/init.lua ~/.config/nvim/
cp ~/sakari-nvim/colorscheme.lua ~/.config/nvim/lua/
cp ~/sakari-nvim/keymaps.lua ~/.config/nvim/lua/
cp ~/sakari-nvim/lsp.lua ~/.config/nvim/lua/
cp ~/sakari-nvim/options.lua ~/.config/nvim/lua/
cp ~/sakari-nvim/plugins.lua ~/.config/nvim/lua/
cp ~/sakari-nvim/config/nvim-cmp.lua ~/.config/nvim/



# Создание основных директорий 
cp -r ~/SFurOS/Images ~/Images
cp -r ~/SFurOS/Books ~/Books
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Music
mkdir -p ~/Videos



# Установка OpenRC



# Удаление 
sudo pacman -Rns vim --noconfirm




sudo reboot
