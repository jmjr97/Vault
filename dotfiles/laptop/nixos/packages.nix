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
    hyprpolkitagent
    libappindicator
    bat
    btop
    killall
    udisks2
    pavucontrol
    lm_sensors

    # -- Desktop --
    swaynotificationcenter
    swayosd
    waybar
    hyprlock
    hypridle
    hyprpaper
    hyprpicker
    rofi
    rofi-calc
    wlogout
    satty

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
    thunar
    firefox
    obsidian
    dropbox
    bluetui
    lazygit
    gnome-disk-utility
    kdePackages.kalk
    kdePackages.kclock
    kdePackages.gwenview

    # -- Development --
    vim
    neovim
    # tree-sitter-cli
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
