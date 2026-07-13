#!/usr/bin/env bash
# ======================================================================
# Description: pacman package install script
# File: scripts/packages.sh
# ======================================================================

hypr=(
	hypridle
	hyprpaper
	hyprpolkitagent
	hyprshot
	satty
	hyprpicker
	swaync
	swayosd
	waybar
	rofi
	rofi-calc
	nwg-look
	kvantum
	archlinux-xdg-menu
	bluetui
	pavucontrol
)

sudo pacman -S --needed --noconfirm ${hypr[*]}
