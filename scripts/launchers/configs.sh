#!/usr/bin/env bash

proj=(Hyprland Neovim Scripts Configs)
conf=(fish ghostty yazi)

proj_choice=$(gum choose --header "Select Project:" ${proj[*]})
# choice=$(gum choose --header "Select Project:" "Hyprland Neovim Scripts")

case "$proj_choice" in
	"Hyprland") nvim --cmd "cd ~/.config/hypr/" +"lua Snacks.picker.files()"
	;;
	"Neovim") nvim --cmd "cd ~/.config/nvim/" +"lua Snacks.picker.files()"
	;;
	"Scripts") nvim --cmd "cd ~/Vault/scripts/" +"lua Snacks.picker.files()"
	;;
	"Configs") conf_choice=$(gum choose --header "Select Config:" ${conf[*]})
	;;
esac

if [ conf_choice != nil ]; then
	case "$conf_choice" in
		"fish") nvim ~/.config/fish/config.fish
		;;
		"ghostty") nvim ~/.config/ghostty/config.ghostty
		;;
		"yazi") nvim --cmd "cd ~/.config/yazi/" +"lua Snacks.picker.files()"
		;;
	esac
fi

echo -ne '\n'
