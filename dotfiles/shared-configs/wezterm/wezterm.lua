-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Modify theme tab colors
-- local scheme_name = "Catppuccin Mocha"
local scheme_name = "Catppuccin Macchiato"
local scheme = wezterm.color.get_builtin_schemes()[scheme_name]
config.colors = scheme

scheme.tab_bar = {
  active_tab = {
    bg_color = '#8aadf4',
    fg_color = '#24273a'
  },
  inactive_tab = {
    bg_color = '#24273a',
    fg_color = '#8aadf4'
  },
}

-- Look and Feel
config.colors = {
  cursor_bg = '#8aadf4',
  cursor_fg = '#1e1e2e',
}
config.enable_wayland = false
config.prefer_egl = false
config.color_scheme = scheme_name
-- config.font = wezterm.font('Hack Nerd Font')
config.font = wezterm.font_with_fallback {
  'Firacode Nerd Font',
  'JetBrains Mono Nerd Font',
}
config.max_fps = 120
config.font_size = 13
config.enable_tab_bar = true
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.initial_cols = 120
config.initial_rows = 38
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
  left = 5,
  right = 5,
  top = 2,
  bottom = 2,
}
config.warn_about_missing_glyphs = false
config.window_background_opacity = 0.9
-- config.kde_window_background_blur = true

-- Keybinds
config.disable_default_key_bindings = true
config.leader = { key = ';', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = 's',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'f',
    mods = 'LEADER',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'LeftArrow',
    mods = 'CTRL',
    action = wezterm.action{ActivatePaneDirection = "Left"},
  },
  {
    key = 'DownArrow',
    mods = 'CTRL',
    action = wezterm.action{ActivatePaneDirection = "Down"},
  },
  {
    key = 'UpArrow',
    mods = 'CTRL',
    action = wezterm.action{ActivatePaneDirection = "Up"},
  },
  {
    key = 'RightArrow',
    mods = 'CTRL',
    action = wezterm.action{ActivatePaneDirection = "Right"},
  },
  {
    key = 'q',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentTab{confirm=true},
  },
  {
    key = 't',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = ';',
    mods = 'LEADER',
    action = wezterm.action.PaneSelect,
  },
  {
    key = 'i',
    mods = 'LEADER',
    action = wezterm.action.ShowTabNavigator,
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ShowLauncher,
  },
  {
    key = 'w',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 'w',
    mods = 'ALT',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 'e',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'e',
    mods = 'ALT',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.CopyTo 'Clipboard',
  },
  {
    key = 'v',
    mods = 'LEADER',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
  {
    key = 'h',
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { "Left", 5 }
  },
  {
    key = 'l',
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { "Right", 5 }
  },
  {
    key = 'k',
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { "Up", 1 }
  },
  {
    key = 'j',
    mods = 'CTRL|ALT',
    action = wezterm.action.AdjustPaneSize { "Down", 1 }
  },
  {
    key = 'o',
    mods = 'LEADER',
    action = wezterm.action.PaneSelect {
      mode = 'SwapWithActive',
    }
  },
}
return config
