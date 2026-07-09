-- ======================================================================
-- Config: Hyprland
-- File: ~/.config/hypr/configs/hypr-startup.lua
-- Platform: desktop
-- Link: https://github.com/hyprwm/Hyprland
-- ======================================================================

hl.on('hyprland.start', function()
	hl.exec_cmd('hyprpm reload')
	hl.exec_cmd('waybar')
	hl.exec_cmd('hyprpaper')
	hl.exec_cmd('hypridle')
	hl.exec_cmd('systemctl --user start hyprpolkitagent')
	hl.exec_cmd('hyprctl setcursor "Catppuccin Macchiato Dark" 24')

	hl.exec_cmd('xrandr --output DP-1 --primary')

	hl.exec_cmd('swaync')
	hl.exec_cmd('swayosd-server')

	hl.exec_cmd('spotify_player -d')

	hl.exec_cmd('wl-paste --type text --watch cliphist store')
	hl.exec_cmd('wl-paste --type image --watch cliphist store')
end)
