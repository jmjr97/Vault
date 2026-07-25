{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

	# -- Boot ------------------------------------------------
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

	# -- Networking ------------------------------------------
  networking.hostName = "nixos-vm"; # Define your hostname.
  networking.networkmanager.enable = true;

	# -- System ----------------------------------------------
  time.timeZone = "America/New_York";
	nixpkgs.config.allowUnfree = true;

	environment.sessionVariables = rec {
		QT_QPA_PLATFORM = "wayland";
		QT_QPA_PLATFORMTHEME = "qt6ct";
	};

	# -- User ------------------------------------------------
	users.users.john = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
		shell = pkgs.fish;
    packages = with pkgs; [
      tree
    ];
  };

	# -- Programs --------------------------------------------
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
		withUWSM = true;
	};

	programs.waybar.enable = true;
	programs.fish.enable = true;

	# -- Packages --------------------------------------------
	environment.systemPackages = with pkgs; [
		# System
		ly
		vim
		git
 		wget
		zip
		unzip
		bat
		btop
		killall

		# Desktop
		waybar
		rofi
		wlogout

		# Terminal
		ghostty
		starship
		zoxide
		eza
		fzf
		yazi

		# Applications
		firefox
		kdePackages.dolphin

		# Dev

		# Languages

		# Themes
		qt6Packages.qt6ct
		qt6Packages.qtstyleplugin-kvantum
		catppuccin-kvantum
	];

	fonts.packages = with pkgs; [
		nerd-fonts._0xproto
	];

	# -- Services --------------------------------------------
	services.displayManager.ly = {
		enable = true;
	};

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

	nix.settings.experimental-features = [
		"nix-command"
	];

  system.stateVersion = "26.05"; # Did you read the comment?
}

