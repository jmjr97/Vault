#!/usr/bin/env bash

# vars
install="sudo pacman -S --needed"

#######
# git #
#######

if [ ! -f ~/.gitconfig ]; then
	git config --global user.name 'John Majka Jr.'
	git config --global user.email 'jmjr97@gmail.com'
fi

if [ -d ~/.ssh ]; then
	if [ ! -d ~/Code ]; then
		mkdir ~/Code
	fi

	git clone git@github.com:jmjr97/Vault.git ~/Vault
	git clone git@github.com:jmjr97/jmjr97.github.io.git ~/Code/homepage
	git clone git@github.com:jmjr97/my-code.git ~/Code/my-code
fi

################
# script setup #
################

echo "Update pacman mirrors:"
gum confirm && sudo reflector --verbose --country US --latest 20 --sort rate --save /etc/pacman.d/mirrorlist

echo "Updating system:"
sudo pacman -Syu

if ! pacman -Qi gum >& /dev/null; then
	echo "Installing gum for script."
	sudo pacman -S gum --needed --noconfirm
fi

############
# packages #
############

utility=(git reflector fish starship zoxide fzf ripgrep eza fd bc npm go
pacman-contrib libappindicator base-devel zip unzip man inetutils
cmake)

fonts=(ttf-firacode-nerd ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk
noto-fonts-emoji noto-fonts-extra)

apps=(ghostty yazi firefox lazygit neovim tree-sitter-cli obsidian gimp
fastfetch bat btop gnome-disk-utility kalk kclock gwenview)

hypr=(hypridle hyprpaper hyprpolkitagent hyprshot satty hyprpicker swaync
swayosd waybar rofi rofi-calc nwg-look kvantum archlinux-xdg-menu bluetui
pavucontrol)

########################
# package installation #
########################

echo -e "\nInstalling Utilities:"
gum confirm && $install ${utility[*]}

echo -e "\nInstalling Fonts:"
gum confirm && $install ${fonts[*]}

echo -e "\nInstalling Apps:"
gum confirm && $install ${apps[*]}

echo -e "\nInstalling Hyprland Ecosystem:"
gum confirm && $install ${hypr[*]}

#############
# aur setup #
#############

if ! pacman -Qi yay >& /dev/null; then
	echo "\nInstalling AUR Helper."
	cd "/tmp"
	git clone https://aur.archlinux.org/yay.git

	cd /tmp/yay
	makepkg -si
fi

############
# symlinks #
############

ln -s ~/Vault/dotfiles/.themes ~/

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

Archbox_Setup() {
	for item in "${hypr_dots[@]}"; do
		if [[ ! -L ~/.config/$item ]]; then
			if [ -d ~/.config/$item ]; then
				rm -r ~/.config/$item
			fi
			ln -s ~/Vault/dotfiles/archbox/hyprland/$item ~/.config
		fi
	done
}

Archbook_Setup() {
	for item in "${hypr_dots[@]}"; do
		if [[ ! -L ~/.config/$item ]]; then
			if [ -d ~/.config/$item ]; then
				rm -r ~/.config/$item
			fi
			ln -s ~/Vault/dotfiles/archbook/hyprland/$item ~/.config
		fi
	done


	if ! pacman -Qi keyd >& /dev/null; then
		sudo pacman -S keyd --needed --noconfirm
	fi

	sudo cp ~/Vault/dotfiles/archbook/keyd /etc/keyd/
	sudo systemctl enable --now keyd
}

system=(archbox archbook)
current_system=$(gum choose --header "Which system:" ${system[*]})

case $current_system in
	archbox) Archbox_Setup
		;;
	archbook) Archbook_Setup
		;;
esac

######################
# misc configuration #
######################

if [ ! -d ~/.local/share/icons ]; then
	mkdir ~/.local/share/icons
fi

cp -r ~/.themes/catppuccin-macchiato-dark-cursors/ ~/.local/share/icons/
cp -r ~/.themes/Vortex-Dark-Icons/ ~/.local/share/icons/
