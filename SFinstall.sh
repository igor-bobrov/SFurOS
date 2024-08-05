#!/bin/bash

if [[ $EUID -eq 0 ]]; then
	echo "no root..."
	exit 1
fi

sudo pacman -Syu --noconfirm
sudo pacman -Sy nano git --noconfirm

OK="$(tput setaf 2)[OK]$(tput sgr0)"
ERROR="$(tput setaf 1)[==>ERROR]$(tput sgr0)"
NOTE="$(tput setaf 3)[==>NOTE]$(tput sgr0)"
WARN="$(tput setaf 166)[==>WARN]$(tput sgr0)"
CAT="$(tput setaf 6)[ACTION]$(tput sgr0)"
ORANGE=$(tput setaf 166)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0)

clear

cat << "EOF"
      ::::::::       ::::::::::      :::    :::       :::::::::       ::::::::       ::::::::
    :+:    :+:      :+:             :+:    :+:       :+:    :+:     :+:    :+:     :+:    :+:
   +:+             +:+             +:+    +:+       +:+    +:+     +:+    +:+     +:+
  +#++:++#++      :#::+::#        +#+    +:+       +#++:++#:      +#+    +:+     +#++:++#++
        +#+      +#+             +#+    +#+       +#+    +#+     +#+    +#+            +#+
#+#    #+#      #+#             #+#    #+#       #+#    #+#     #+#    #+#     #+#    #+#
########       ###              ########        ###    ###      ########       ########



EOF

read -p " ${NOTE} Do you want install optionally apps? (y:n)     " initial_choice 

if [[ $initial_choice == "y" || $initial_choice == "Y" ]]; then
    clear

    chmod +x ~/SFurOS/SH/Optionally-apps.sh
    ~/SFurOS/SH/Optionally-apps.sh
elif [[ $initial_choice == "n" || $initial_choice == "N" ]]; then
    echo "Skip..."
else
    echo "Invalid choice. Please enter 'y' or 'n'."
fi

clear

read -p " ${NOTE} Do you want install dwm(dont work now), hyprland or budgue? (d:w:b)    " dhb

clear

echo "${NOTE} Done"
echo "${NOTE} Download standart apps..."

sleep 2

chmod +x ~/SFurOS/SH/Standart-apps.sh
~/SFurOS/SH/Standart-apps.sh

if [[ $dhb == "b" ]]; then
        yay -S amberol --noconfirm
fi

clear

echo "${NOTE} Done"
echo "${NOTE} Download standart apps more..."

sleep 2

cd ~/
# kitty
git clone https://github.com/igor-bobrov/kitty-term.git

chmod +x ~/kitty-term/init.sh
~/kitty-term/init.sh

cd
# Neovim
git clone https://github.com/igor-bobrov/sakari-nvim.git

chmod +x ~/sakari-nvim/init-nvim.sh
~/sakari-nvim/init-nvim.sh

# Base folder
cp -r ~/SFurOS/Images ~/Images
cp -r ~/SFurOS/Books ~/Books
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Music
mkdir -p ~/Videos

# ENV
if [[ $initial_choice == "h" || $initial_choice == "H" ]]; then
    clear
    cd

    git clone https://github.com/igor-bobrov/sakari-hypr.git
    chmod +x ~/sakari-hypr/init.sh
    ~/sakari-hypr/init.sh
elif [[ $initial_choice == "d" || $initial_choice == "D" ]]; then
    clear
    cd

    chmod +x ~/SFurOS/SH/xinit.sh
    ~/SFurOS/SH/xinit.sh

    git clone https://github.com/igor-bobrov/sakari-dwm.git
    chmod +x ~/sakari-dwm/init-dwm.sh
    ~/sakari-dwm/init-dwm.sh    
else
    echo "..."
fi

sudo reboot
