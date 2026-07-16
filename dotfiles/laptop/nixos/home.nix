{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/Vault/dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in

{
  home.username = "john";
  home.homeDirectory = "/home/john";
  home.stateVersion = "26.05";
  home.packages = [ ];

  # -- Hyprland ---------------------------------------------
  xdg.configFile."hypr" = {
    source = create_symlink "${dotfiles}/laptop/hyprland/hypr/";
    recursive = true;
  };

  xdg.configFile."waybar" = {
    source = create_symlink "${dotfiles}/laptop/hyprland/waybar/";
    recursive = true;
  };

  xdg.configFile."swaync" = {
    source = create_symlink "${dotfiles}/laptop/hyprland/swaync/";
    recursive = true;
  };

  xdg.configFile."swayosd" = {
    source = create_symlink "${dotfiles}/laptop/hyprland/swayosd/";
    recursive = true;
  };

  xdg.configFile."rofi" = {
    source = create_symlink "${dotfiles}/shared-configs/rofi/";
    recursive = true;
  };

  xdg.configFile."wlogout" = {
    source = create_symlink "${dotfiles}/shared-configs/wlogout/";
    recursive = true;
  };

  # -- Terminal ---------------------------------------------
  xdg.configFile."fish" = {
    source = create_symlink "${dotfiles}/shared-configs/fish/";
    recursive = true;
  };

  xdg.configFile."ghostty" = {
    source = create_symlink "${dotfiles}/shared-configs/ghostty/";
    recursive = true;
  };

  xdg.configFile."starship.toml" = {
    source = create_symlink "${dotfiles}/shared-configs/starship.toml";
    recursive = true;
  };

  # -- Dev --------------------------------------------------
  xdg.configFile."nvim" = {
    source = create_symlink "${dotfiles}/shared-configs/nvim/";
    recursive = true;
  };

  xdg.configFile."lazygit" = {
    source = create_symlink "${dotfiles}/shared-configs/lazygit/";
    recursive = true;
  };

  # -- Applications -----------------------------------------
  xdg.configFile."bat" = {
    source = create_symlink "${dotfiles}/shared-configs/bat/";
    recursive = true;
  };

  xdg.configFile."btop" = {
    source = create_symlink "${dotfiles}/shared-configs/btop/";
    recursive = true;
  };

  xdg.configFile."nwg-look" = {
    source = create_symlink "${dotfiles}/shared-configs/nwg-look/";
    recursive = true;
  };

  xdg.configFile."satty" = {
    source = create_symlink "${dotfiles}/shared-configs/satty/";
    recursive = true;
  };

  xdg.configFile."yazi" = {
    source = create_symlink "${dotfiles}/shared-configs/yazi/";
    recursive = true;
  };

  # -- Themes ----------------------------------------------
  home.file.".themes" = {
    source = create_symlink "${dotfiles}/.themes/";
    recursive = true;
  };

  home.file.".local/share/icons/catppuccin-macchiato-dark-cursors" = {
    source = create_symlink "${dotfiles}/.themes/.cursors/catppuccin-macchiato-dark-cursors/";
    recursive = true;
  };

  home.file.".local/share/icons/Vortex-Dark-Icons" = {
    source = create_symlink "${dotfiles}/.themes/.icons/Vortex-Dark-Icons/";
    recursive = true;
  };

  # -- Dropbox ----------------------------------------------
  home.file."Documents" = {
    source = create_symlink /home/john/Dropbox/home/Documents;
    recursive = true;
  };

  home.file."Pictures" = {
    source = create_symlink /home/john/Dropbox/home/Pictures;
    recursive = true;
  };

  # -- Desktop Files ----------------------------------------
  home.file.".local/share/applications/nvim.desktop" = {
    source = create_symlink "${dotfiles}/applications/nvim.desktop";
    recursive = true;
  };

  home.file.".local/share/applications/localsend.desktop" = {
    source = create_symlink "${dotfiles}/applications/localsend.desktop";
    recursive = true;
  };

  home.file.".local/share/applications/dice-roller.desktop" = {
    source = create_symlink "${dotfiles}/applications/dice-roller.desktop";
    recursive = true;
  };

  home.file.".local/share/applications/wild-magic.desktop" = {
    source = create_symlink "${dotfiles}/applications/wild-magic.desktop";
    recursive = true;
  };

  home.file.".local/share/applications/scripts" = {
    source = create_symlink "${dotfiles}/applications/scripts/";
    recursive = true;
  };

  # -- Fastfetch --------------------------------------------
  home.file.".config/fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "type": "kitty",
        "source": " ",
        "width": 40,
        "height": 20,
        "padding": {
          "left": 2,
          "right": 2
        }
      },
      "display": {
        "separator": " \u001b[38;2;203;166;247m\u001b[0m ",
        "constants": [
          "\u001b[38;2;242;205;205m─────────────────\u001b[0m" // {$1}, used in Custom module
        ],
        "key": { "type": "icon", "paddingLeft": 2 }
      },
      "modules": [
        {
          "type": "custom",
          // {#1} is equivalent to `\u001b[1m`. {#} is equivalent to `\u001b[m`
          "format": "\u001b[38;2;242;205;205m┌\u001b[0m{$1} \u001b[38;2;203;166;247mHardware Information\u001b[0m {$1}\u001b[38;2;242;205;205m┐\u001b[0m"
        },
        { "type": "host", "keyColor": "#f5c2e7" },
        { "type": "cpu", "keyColor": "#f5c2e7" },
        { "type": "gpu", "keyColor": "#f5c2e7" },
        { "type": "memory", "keyColor": "#f5c2e7" },
        {
          "type": "custom",
          "format": "\u001b[38;2;242;205;205m└\u001b[0m{$1}\u001b[38;2;242;205;205m──────────────────────\u001b[0m{$1}\u001b[38;2;242;205;205m┘\u001b[0m"
        },
        { "type": "custom", "format": "" },
        {
          "type": "custom",
          "format": "\u001b[38;2;242;205;205m┌\u001b[0m{$1} \u001b[38;2;203;166;247mSoftware Information\u001b[0m {$1}\u001b[38;2;242;205;205m┐\u001b[0m"
        },
        { "type": "os", "keyColor": "#f5c2e7" },
        { "type": "kernel", "keyColor": "#f5c2e7" },
        { "type": "lm", "keyColor": "#f5c2e7" },
        { "type": "de", "keyColor": "#f5c2e7" },
        { "type": "wm", "keyColor": "#f5c2e7" },
        { "type": "shell", "keyColor": "#f5c2e7" },
        { "type": "terminal", "keyColor": "#f5c2e7" },
        { "type": "font", "keyColor": "#f5c2e7" },
        { "type": "theme", "keyColor": "#f5c2e7" },
        { "type": "icons", "keyColor": "#f5c2e7" },
        { "type": "packages", "keyColor": "#f5c2e7" },
        { "type": "uptime", "keyColor": "#f5c2e7" },
        {
          "type": "custom", // InformationEnd
          "format": "\u001b[38;2;242;205;205m└\u001b[0m{$1}\u001b[38;2;242;205;205m──────────────────────\u001b[0m{$1}\u001b[38;2;242;205;205m┘\u001b[0m"
        },
        { "type": "colors", "symbol": "circle", "paddingLeft": 21 }
      ]
    }
    	'';

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/john/etc/profile.d/hm-session-vars.sh
  #
}
