#!/usr/bin/env bash
# ======================================================================
# Description: pacman package install script
# File: scripts/packages-fonts.sh
# ======================================================================

fonts=(
	ttf-firacode-nerd
	ttf-jetbrains-mono-nerd
	noto-fonts
	noto-fonts-cjk
	noto-fonts-emoji
	noto-fonts-extra
)

sudo pacman -S --needed --noconfirm ${fonts[*]}
