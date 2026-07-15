{ config, pkgs, ... }:

{
	home.username = "john";
	home.homeDirectory = "/home/john";
	home.stateVersion = "26.05"; 

	# -- Hyprland ---------------------------------------------
	# home.file.".config/hypr".source = /home/john/Vault/dotfiles/laptop/hyprland/hypr;
	# home.file.".config/waybar".source = /home/john/Vault/dotfiles/laptop/hyprland/waybar;
	# home.file.".config/swaync".source = /home/john/Vault/dotfiles/laptop/hyprland/swaync;
	# home.file.".config/swayosd".source = /home/john/Vault/dotfiles/laptop/hyprland/swayosd;
	# home.file.".config/rofi".source = /home/john/Vault/dotfiles/shared-configs/rofi;
	# home.file.".config/wlogout".source = /home/john/Vault/dotfiles/shared-configs/wlogout;

	# -- Terminal ---------------------------------------------
	# home.file.".config/fish".source = /home/john/Vault/dotfiles/shared-configs/fish;
	# home.file.".config/ghostty".source = /home/john/Vault/dotfiles/shared-configs/ghostty;
	# home.file.".config/starship.toml".source = /home/john/Vault/dotfiles/shared-configs/starship.toml;

	# -- Dev --------------------------------------------------
	# home.file.".config/nvim".source = /home/john/Vault/dotfiles/shared-configs/nvim;
	# home.file.".config/lazygit".source = /home/john/Vault/dotfiles/shared-configs/lazygit;

	# -- Applications -----------------------------------------
	# home.file.".config/bat".source = /home/john/Vault/dotfiles/shared-configs/bat;
	# home.file.".config/btop".source = /home/john/Vault/dotfiles/shared-configs/btop;
	# home.file.".config/fastfetch".source = /home/john/Vault/dotfiles/shared-configs/fastfetch;
	# home.file.".config/nwg-look".source = /home/john/Vault/dotfiles/shared-configs/nwg-look;
	# home.file.".config/satty".source = /home/john/Vault/dotfiles/shared-configs/satty;
	# home.file.".config/yazi".source = /home/john/Vault/dotfiles/shared-configs/yazi;

	# -- Misc -------------------------------------------------
	# home.file.".themes".source = /home/john/Vault/dotfiles/.themes;

	# -- Dropbox ----------------------------------------------
	# home.file."Documents".source = /home/john/Dropbox/home/Documents;
	# home.file."Pictures".source = /home/john/Dropbox/home/Pictures;

	# -- Desktop Files ----------------------------------------
	# home.file.".local/share/applications/nvim.desktop".source = /home/john/Vault/dotfiles/applications/nvim.desktop;
	# home.file.".local/share/applications/localsend.desktop".source = /home/john/Vault/dotfiles/applications/localsend.desktop;
	# home.file.".local/share/applications/dice-roller.desktop".source = /home/john/Vault/dotfiles/applications/dice-roller.desktop;
	# home.file.".local/share/applications/wild-magic.desktop".source = /home/john/Vault/dotfiles/applications/wild-magic.desktop;

	# home.file.".local/share/applications/scripts".source = /home/john/Vault/dotfiles/applications/scripts;
}
