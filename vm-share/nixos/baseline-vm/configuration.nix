{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./packages.nix
  ];

  # -- Boot ------------------------------------------------
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # -- Network ---------------------------------------------
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # -- System ----------------------------------------------
  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];

  # -- Locale ----------------------------------------------
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # -- Services --------------------------------------------
  services.displayManager.ly = {
    enable = true;
    settings = {
      hide_borders = true;
      clock = "%c";
      bigclock = true;
    };
  };

  # services.keyd = {
  # 	enable = true;
  # 	keyboards = {
  # 		default = {
  # 			ids = [ "*" "-706a:0002" ];
  # 			settings = {
  # 				main = {
  # 					capslock = "overload(control, esc)";
  # 					esc = "capslock";
  # 					leftalt = "leftmeta";
  # 					leftmeta = "leftalt";
  # 					rightalt = "layer(custom)";
  # 				};
  # 				otherlayer = {};
  # 			};
  # 			extraConfig = ''
  # 				[custom]
  # 				e = up
  # 				s = left
  # 				d = down
  # 				f = right
  # 				w = home
  # 				r = end
  # 				a = capslock
  # 			'';
  # 		};
  # 	};
  # };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # -- User ------------------------------------------------
  users.users."john" = {
    isNormalUser = true;
    description = "john";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = [ ];
  };

  users.defaultUserShell = pkgs.fish;

  system.stateVersion = "26.05"; # Did you read the comment?
}
