#!/usr/bin/env bash
# ======================================================================
# Description: Arch reinstall script root
# File: main.sh
# ======================================================================

system=$1

if [ "$system" = "desktop" ]; then
	echo "Desktop configuration selected:"
elif [ "$system" = "laptop" ]; then
	echo "Laptop configuration selected:"
else
	echo "Error: Enter laptop or desktop"
	exit 1
fi

export system

##########################
## pre-install packages ##
##########################

if ! pacman -Qi reflector >& /dev/null; then
	sudo pacman -S reflector --needed --noconfirm
fi

####################
## update mirrors ##
####################

echo -e "\nUpdate pacman mirrors:"
gum confirm && sudo reflector --verbose --country US --latest 20 --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -Syu

# setup git and clone repos
./scripts/git.sh

# install packages
./scripts/packages.sh

# system_specific

# setup aur
./scripts/aur.sh

# symlinks
./scripts/symlinks.sh

# misc
./scripts/misc.sh
