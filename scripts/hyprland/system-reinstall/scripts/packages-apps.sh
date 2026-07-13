#!/usr/bin/env bash
# ======================================================================
# Description: pacman package install script
# File: scripts/packages-apps.sh
# ======================================================================

apps=(
	ghostty
	yazi
	firefox
	lazygit
	neovim
	tree-sitter-cli
	obsidian
	gimp
	fastfetch
	bat
	btop
	gnome-disk-utility
	kalk
	kclock
	gwenview
)

sudo pacman -S --needed --noconfirm ${apps[*]}
