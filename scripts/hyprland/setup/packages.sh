#!/usr/bin/env bash

install="sudo pacman -S --needed"

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

	hyprland=(
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
	cliphist
	kvantum
	breeze
	archlinux-xdg-menu
	bluetui
	pavucontrol
	)

plasma=(
	kscreen
	kinfocenter
	bluedevil
	kwalletmanager
	kde-gtk-config
	spectacle
	)


while :
do
	clear

	list=("Utility" "Fonts" "Apps" "Hyprland" "Plasma" "Exit")
	script_choice=$(gum choose --header "Install packages:" ${list[*]})

	case "$script_choice" in
		"Utility") $install ${hyprland[*]}
			;;
		"Fonts") $install ${fonts[*]}
			;;
		"Apps") $install ${apps[*]}
			;;
		"Hyprland") $install ${hyprland[*]}
			;;
		"Plasma") $install ${plasma[*]}
			;;
		"Exit") break
			;;
	esac

	read -p "Press enter to continue..."
done

