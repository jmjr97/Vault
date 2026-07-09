#!/usr/bin/env bash
# ======================================================================
# Description: pacman package install script
# File: scripts/packages.sh
# ======================================================================

utility=(
	git
	reflector
	fish
	starship
	zoxide
	fzf
	ripgrep
	eza
	fd
	bc
	npm
	go
	pacman-contrib
	libappindicator
	base-devel
	zip
	unzip
	man
	inetutils
	cmake
	gum
)

fonts=(
	ttf-firacode-nerd
	ttf-jetbrains-mono-nerd
	noto-fonts
	noto-fonts-cjk
	noto-fonts-emoji
	noto-fonts-extra
)

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

install_package() {
	sudo pacman -S --needed --noconfirm $@
}

install_package ${utility[*]}
install_package ${fonts[*]}
install_package ${apps[*]}
install_package ${hypr[*]}
