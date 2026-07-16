{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

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
  users.defaultUserShell = pkgs.fish;

  nixpkgs.config.allowUnfree = true;

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
    lm_sensors

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
    # nix-search-tv

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
    luarocks
    go
    nodejs

    # Themes
    # nwg-look
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
          custom = {
            e = "up";
            s = "left";
            d = "down";
            f = "right";
            w = "home";
            r = "end";
            a = "capslock";
          };
        };
      };
    };
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "0xProto Nerd Font Mono";
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

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "26.05"; # Did you read the comment?
}
