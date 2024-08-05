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
made by sakari


      ::::::::       ::::::::::      :::    :::       :::::::::       ::::::::       ::::::::
    :+:    :+:      :+:             :+:    :+:       :+:    :+:     :+:    :+:     :+:    :+:
   +:+             +:+             +:+    +:+       +:+    +:+     +:+    +:+     +:+
  +#++:++#++      :#::+::#        +#+    +:+       +#++:++#:      +#+    +:+     +#++:++#++
        +#+      +#+             +#+    +#+       +#+    +#+     +#+    +#+            +#+
#+#    #+#      #+#             #+#    #+#       #+#    #+#     #+#    #+#     #+#    #+#
########       ###              ########        ###    ###      ########       ########



EOF

echo "${NOTE} Install aur. Please wait..."
sleep 2
chmod +x ~/SFurOS/SH/aur.sh
~/SFurOS/SH/aur.sh

clear
read -p " ${NOTE} Do you want install dwm(dont work now) or budgue(only systemD) or all(dont work)? (d:b:a)    " dhb
clear

clear
chmod +x ~/SFurOS/SH/Optionally-apps.sh
~/SFurOS/SH/Optionally-apps.sh
sleep 2

echo "${NOTE} Done"
echo "${NOTE} Download standart apps..."
sleep 2
chmod +x ~/SFurOS/SH/Standart-apps.sh
~/SFurOS/SH/Standart-apps.sh

clear
echo "${NOTE} Done"
echo "${NOTE} Download standart apps more..."
sleep 2

cd 
git clone https://github.com/igor-bobrov/kitty-term.git
chmod +x ~/kitty-term/init.sh
~/kitty-term/init.sh

cd
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
if [[ $initial_choice == "d" || $initial_choice == "D" ]]; then
    clear
    git clone https://github.com/igor-bobrov/sakari-dwm.git
    chmod +x ~/sakari-dwm/init-dwm.sh
    ~/sakari-dwm/init-dwm.sh    
else
    cd
    chmod +x ~/SFurOS/SH/budgie.sh
    ~/SFurOS/SH/budgie.sh
fi

sudo reboot