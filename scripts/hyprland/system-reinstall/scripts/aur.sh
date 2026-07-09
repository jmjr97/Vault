#!/usr/bin/env bash
# ======================================================================
# Description: bash install script
# File: scripts/bash.sh
# ======================================================================

if ! pacman -Qi yay >& /dev/null; then
	echo "\nInstalling AUR Helper."
	cd "/tmp"
	git clone https://aur.archlinux.org/yay.git

	cd /tmp/yay
	makepkg -si
fi
