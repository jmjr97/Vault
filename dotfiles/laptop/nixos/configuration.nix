{ config, lib, pkgs, ... }:

let 
	home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-26.05.tar.gz;
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
		(import "${home-manager}/nixos")
  ];

	home-manager.useUserPackages = true;
	home-manager.useGlobalPkgs = true;
	home-manager.backupFileExtension = "backup";
	home-manager.users.john = import ./home.nix;

  # -- Boot ----------------------------------------------------------------
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # -- Network -------------------------------------------------------------
  networking.hostName = "nixbook"; # Define your hostname.
  networking.wireless.iwd.enable = true;

  # -- Bluetooth -----------------------------------------------------------
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # -- System --------------------------------------------------------------
  time.timeZone = "America/New_York";
  nixpkgs.config.allowUnfree = true;
	users.defaultUserShell = pkgs.fish;

  # -- User ----------------------------------------------------------------
  users.users.john = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  programs.fish.enable = true;

  # -- Packages ------------------------------------------------------------
  environment.systemPackages = with pkgs; [
    # System
    impala
    git
    wget
    keyd
    bluez
    zip
    unzip
    libappindicator
    bat
    btop
    killall
    udisks2
		pavucontrol

    # Desktop
    swaynotificationcenter
    waybar
    hyprlock
    hypridle
    hyprpaper
    hyprpicker
    rofi
    wlogout

    # Terminal
    ghostty
    fish
    starship
    zoxide
    eza
    fzf
    yazi
    fastfetch

    # Applications
    kdePackages.dolphin
    firefox
    dropbox
    bluetui
    lazygit

    # Development
    vim
    neovim
    uv
    gcc
    cargo

    # Languages
    python3
    lua
    go
    nodejs

    # Themes
		nwg-look
  ];

  # -- Theme & Fonts -------------------------------------------------------
  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];

  # -- Services ------------------------------------------------------------
  services.displayManager.ly = {
    enable = true;
  };

  services.udisks2 = {
    enable = true;
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [
          "*"
          "-706a:0002"
        ];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            esc = "capslock";
            leftalt = "leftmeta";
            leftmeta = "leftalt";
            rightalt = "layer(custom)";
          };
          otherlayer = { };
        };
        extraConfig = ''
          					[custom]
          					e = up
          					s = left
          					d = down
          					f = right
          					w = home
          					r = end
          					a = capslock
          				'';
      };
    };
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
