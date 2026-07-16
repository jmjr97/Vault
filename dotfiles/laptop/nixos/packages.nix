{ pkgs, ... }:

{
  # -- Programs ------------------------------------------------------
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  programs.fish.enable = true;

  # -- Packages ------------------------------------------------------
  environment.systemPackages = with pkgs; [
    # -- System --
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
    xauth

    # -- Desktop --
    swaynotificationcenter
    waybar
    hyprlock
    hypridle
    hyprpaper
    hyprpicker
    rofi
    wlogout

    # -- Terminal --
    ghostty
    fish
    starship
    zoxide
    eza
    fzf
    yazi
    fastfetch

    # -- Applications --
    kdePackages.dolphin
    firefox
    obsidian
    dropbox
    bluetui
    lazygit

    # -- Development --
    vim
    neovim
    uv
    gcc
    cargo

    # -- Languages --
    python3
    lua
    luarocks
    go
    nodejs

    # -- Themes --
    nwg-look
    qt6Packages.qtstyleplugin-kvantum
    qt6Packages.qt6ct
    hyprcursor
  ];
}
