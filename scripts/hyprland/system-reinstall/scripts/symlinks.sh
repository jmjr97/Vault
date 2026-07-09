#!/usr/bin/env bash
# ======================================================================
# Description: symlink install script
# File: scripts/symlinks.sh
# ======================================================================

ln -s ~/Vault/dotfiles/.themes/ ~/

# shared-configs to .config
shared=(aseprite bat btop fastfetch fish ghostty GIMP lazygit nvim nwg-look rofi satty wlogout yazi)

for item in "${shared[@]}"; do
	if [[ ! -L ~/.config/$item ]]; then
		if [ -d ~/.config/$item ]; then
			rm -r ~/.config/$item
		fi
		ln -s ~/Vault/dotfiles/shared-configs/$item ~/.config
	fi
done

if [[ ! -L ~/.config/starship.toml ]]; then
	if [ -f ~/.config/starship.toml ]; then
		rm -r ~/.config/starship.toml
	fi
	ln -s ~/Vault/dotfiles/shared-configs/starship.toml ~/.config
fi

hypr_dots=(hypr swaync swayosd waybar)

if [ "$system" = "desktop" ]; then
	for item in "${hypr_dots[@]}"; do
		if [[ ! -L ~/.config/$item ]]; then
			if [ -d ~/.config/$item ]; then
				rm -r ~/.config/$item
			fi
			ln -s ~/Vault/dotfiles/desktop/hyprland/$item ~/.config
		fi
	done
else
	for item in "${hypr_dots[@]}"; do
		if [[ ! -L ~/.config/$item ]]; then
			if [ -d ~/.config/$item ]; then
				rm -r ~/.config/$item
			fi
			ln -s ~/Vault/dotfiles/laptop/hyprland/$item ~/.config
		fi
	done
fi
