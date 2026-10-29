#!/usr/bin/env bash
# ======================================================================
# Description: misc install script
# File: scripts/misc.sh
# ======================================================================

echo "in archbook.sh"

if [ ! -d ~/.local/share/icons ]; then
	mkdir -p "~/.local/share/icons"
fi

cp -r "~/Vault/dotfiles/.themes/catppuccin-macchiato-dark-cursors" "~/.local/share/icons"

# keyd
if ! pacman -Qi keyd >& /dev/null; then
	sudo pacman -S keyd --needed --noconfirm
fi

if [ ! -d /etc/keyd/ ]; then
	sudo mkdir /etc/keyd
fi

if [ ! -f /etc/keyd/default.conf ]; then
	sudo cp ~/Vault/dotfiles/laptop/keyd /etc/keyd/default.conf
fi

sudo systemctl enable --now keyd
