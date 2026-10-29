#!/usr/bin/env bash
# ======================================================================
# Description: laptop install script
# File: scripts/symlinks.sh
# ======================================================================

# keyd
if ! pacman -Qi keyd >& /dev/null; then
	sudo pacman -S keyd --needed --noconfirm
fi

sudo cp /home/john/Vault/dotfiles/laptop/keyd /etc/keyd/default.conf

sudo systemctl enable --now keyd
