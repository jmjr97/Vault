#!/usr/bin/env bash
# ======================================================================
# Description: Arch reinstall script root
# File: main.sh
# ======================================================================

## -- pre-install packages ---------------------------------

if ! pacman -Qi gum >& /dev/null; then
	echo "Gum package missing..."
	sudo pacman -S gum --needed --noconfirm
fi

## -- update mirrors ---------------------------------------

if ! pacman -Qi reflector >& /dev/null; then
	gum style --foreground 220 --margin "0 2" --underline "Reflector package missing..."
	sudo pacman -S reflector --needed --noconfirm
fi

gum style --foreground 220 --margin "0 2" --underline "Update Mirrors"
gum confirm && sudo reflector --verbose --country US --protocol https --latest 20 --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -Syu

## -- setup git --------------------------------------------
./scripts/git.sh

## -- install packages -------------------------------------
./scripts/packages-fonts.sh
./scripts/packages-apps.sh
./scripts/packages-utility.sh

if [ "$1" == "plasma" ]; then
	./scripts/packages-plasma.sh
elif [ "$1" == "hyprland" ]; then
	./scripts/packages-hypr.sh
fi

## -- setup aur --------------------------------------------
./scripts/aur.sh

## -- symlinks ---------------------------------------------
# ./scripts/symlinks.sh

## -- misc -------------------------------------------------
# if [[ $hostname == 'archbook']]; then
# 	./scripts/archbook.sh
# fi
