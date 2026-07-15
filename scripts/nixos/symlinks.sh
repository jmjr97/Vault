#!/usr/bin/env bash
# ======================================================================
# File: nixos symlinks
# ======================================================================

# -- Hyprland ----------------------------------------------
ln -s ~/Vault/dotfiles/laptop/hyprland/hypr/ ~/.config/
ln -s ~/Vault/dotfiles/laptop/hyprland/waybar/ ~/.config/
ln -s ~/Vault/dotfiles/laptop/hyprland/swaync/ ~/.config/
ln -s ~/Vault/dotfiles/laptop/hyprland/swayosd/ ~/.config/
ln -s ~/Vault/dotfiles/shared-configs/rofi/ ~/.config/
ln -s ~/Vault/dotfiles/shared-configs/wlogout/ ~/.config/

# -- Terminal ----------------------------------------------
ln -s ~/Vault/dotfiles/shared-configs/fish/ ~/.config/
ln -s ~/Vault/dotfiles/shared-configs/ghostty/ ~/.config/
ln -s ~/Vault/dotfiles/shared-configs/starship.toml ~/.config/

# -- Applications ------------------------------------------
ln -s ~/Vault/dotfiles/shared-configs/bat/ ~/.config/
ln -s ~/Vault/dotfiles/shared-configs/btop/ ~/.config/
ln -s ~/Vault/dotfiles/shared-configs/fastfetch/ ~/.config/
ln -s ~/Vault/dotfiles/shared-configs/nwg-look/ ~/.config/
ln -s ~/Vault/dotfiles/shared-configs/satty/ ~/.config/
ln -s ~/Vault/dotfiles/shared-configs/yazi/ ~/.config/

# -- Dev ---------------------------------------------------
ln -s ~/Vault/dotfiles/shared-configs/nvim/ ~/.config/
ln -s ~/Vault/dotfiles/shared-configs/lazygit/ ~/.config/

# -- Dropbox -----------------------------------------------
ln -s ~/Dropbox/home/Documents/ ~/
ln -s ~/Dropbox/home/Pictures/ ~/

# -- Desktop Files -----------------------------------------
ln -s ~/Vault/dotfiles/applications/scripts/ ~/.local/share/applications/
ln -s ~/Vault/dotfiles/applications/nvim.desktop ~/.local/share/applications/
ln -s ~/Vault/dotfiles/applications/localsend.desktop ~/.local/share/applications/
ln -s ~/Vault/dotfiles/applications/dice-roller.desktop ~/.local/share/applications/
ln -s ~/Vault/dotfiles/applications/wild-magic.desktop ~/.local/share/applications/

# -- Misc --------------------------------------------------
ln -s ~/Vault/dotfiles/.themes/ ~/
