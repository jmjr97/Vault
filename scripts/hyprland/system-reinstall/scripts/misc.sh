#!/usr/bin/env bash
# ======================================================================
# Description: misc install script
# File: scripts/misc.sh
# ======================================================================

if [ ! -d ~/.local/share/icons/ ]; then
	mkdir -p ~/.local/share/icons/
fi

cp -r ~/.themes/catppuccin-macchiato-dark-cursors/ ~/.local/share/icons/
cp -r ~/.themes/Vortex-Dark-Icons/ ~/.local/share/icons/

# keyd
if ! pacman -Qi keyd >& /dev/null; then
	sudo pacman -S keyd --needed --noconfirm
fi

if [ ! -d /etc/keyd/ ]; then
	sudo mkdir /etc/keyd/
fi

sudo cp ~/Vault/dotfiles/laptop/keyd /etc/keyd/default.conf
sudo systemctl enable --now keyd
