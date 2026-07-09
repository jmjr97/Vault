#!/usr/bin/env bash

BLUE="\e[34m"

echo -e "${BLUE}Run pacman Update"
gum confirm && pac_check=true || pac_check=false
if [[ $pac_check == true ]]; then
	echo ""
	sudo pacman -Syu
fi

echo -e "\n${BLUE}Run AUR Updates"
gum confirm && aur_check=true || aur_check=false
if [[ $aur_check == true ]]; then
	echo ""
	yay -Syu
fi

echo ""
read -p "Press enter to continue..."
