-- ======================================================================
-- Config: Hyprland
-- File: ~/.config/hypr/configs/hypr-keybinds.lua
-- Platform: virtual machine
-- Link: https://github.com/hyprwm/Hyprland
-- ======================================================================

hl.monitor({
	output = '',
	mode = '1920x1080',
	position = 'auto',
	scale = 1,
})

-- hl.on('hyprland.start', function()
-- 	hl.exec_cmd('hyprpm reload')
-- 	hl.exec_cmd('waybar')
-- 	hl.exec_cmd('hyprpaper')
-- 	hl.exec_cmd('hypridle')
-- 	hl.exec_cmd('systemctl --user start hyprpolkitagent')
-- 	hl.exec_cmd('hyprctl setcursor "Catppuccin Macchiato Dark" 24')
--
-- 	hl.exec_cmd('xrandr --output DP-1 --primary')
--
-- 	hl.exec_cmd('swaync')
-- 	hl.exec_cmd('swayosd-server')
--
-- 	hl.exec_cmd('spotify_player -d')
--
-- 	hl.exec_cmd('wl-paste --type text --watch cliphist store')
-- 	hl.exec_cmd('wl-paste --type image --watch cliphist store')
-- end)

local mod = 'SUPER'
local ctrl = '+ CONTROL'
local shft = '+ SHIFT'

-- system --
------------
hl.bind(mod .. ctrl .. ' + Q', hl.dsp.window.close())
hl.bind(mod .. ctrl .. ' + Backspace', hl.dsp.exec_cmd('$HOME/vm-share/scripts/reset-ui.sh'))
hl.bind(
	mod .. ctrl .. ' + M',
	hl.dsp.exec_cmd('command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch "hl.dsp.exit()"')
)

-- applications --
------------------
hl.bind(mod .. ' + Return', hl.dsp.exec_cmd('ghostty'))
hl.bind(mod .. ctrl .. ' + Return', hl.dsp.exec_cmd('ghostty', { tag = 'float_d' }))
hl.bind(mod .. ' + Space', hl.dsp.exec_cmd('rofi -m -1 -show drun'))
hl.bind(mod .. ' + E', hl.dsp.exec_cmd('dolphin'))
hl.bind(mod .. ctrl .. ' + E', hl.dsp.exec_cmd('ghostty -e yazi', { tag = 'float_d' }))
hl.bind(mod .. ' + W', hl.dsp.exec_cmd('firefox'))
hl.bind(mod .. ctrl .. ' + W', hl.dsp.exec_cmd('firefox --private-window'))
hl.bind(mod .. ' + I', hl.dsp.exec_cmd('ghostty -e btop', { tag = 'float_l' }))
hl.bind(mod .. ' + N', hl.dsp.exec_cmd('$HOME/Vault/scripts/launchers/main-launcher.sh notes', { tag = 'float_d' }))

hl.bind('print', hl.dsp.exec_cmd('hyprshot -m region --raw | satty --filename -'))
hl.bind(mod .. ' + print', hl.dsp.exec_cmd('hyprshot -m output -m active'))
hl.bind(mod .. ' + P', hl.dsp.exec_cmd('cliphist list | rofi -dmenu -p "Cliphist" | cliphist decode | wl-copy'))

-- window control --
--------------------
-- maximize current window/column --
hl.bind(mod .. ' + A', function()
	local width = hl.get_active_window().size.x
	if width >= 1800 then
		hl.dispatch(hl.dsp.layout('colresize 0.5'))
	else
		hl.dispatch(hl.dsp.layout('colresize 1.0'))
	end
end)

-- maximize all --
hl.bind(mod .. ctrl .. ' + A', function()
	local width = hl.get_active_window().size.x
	if width >= 1800 then
		hl.dispatch(hl.dsp.layout('colresize all 0.5'))
	else
		hl.dispatch(hl.dsp.layout('colresize all 1.0'))
	end
end)

hl.bind(mod .. ' + F', hl.dsp.window.fullscreen({ 'toggle' }))
hl.bind(mod .. ' + D', hl.dsp.window.cycle_next({}))
hl.bind(mod .. ' + S', function()
	hl.dispatch(hl.dsp.window.float({ action = 'toggle' }))
	if hl.get_active_window().floating == true and hl.get_active_window().tags then
		hl.dispatch(hl.dsp.window.resize({ x = 1344, y = 756 }))
	end
	hl.dispatch(hl.dsp.window.center())
end)

local workspaces = { '1', '2', '3', '4', '5', 'z', 'x', 'c', 'v', 'b' }

for i, ws in ipairs(workspaces) do
	hl.bind(mod .. ' + ' .. ws, hl.dsp.focus({ workspace = i, follow = true }))
	hl.bind(mod .. ctrl .. ' + ' .. ws, hl.dsp.window.move({ workspace = i, follow = true, group_aware = false }))
end

hl.bind(mod .. ' + Apostrophe', hl.dsp.workspace.toggle_special('scratchpad'))

-- move focus --
hl.bind(mod .. ' + H', hl.dsp.layout('focus l'))
hl.bind(mod .. ' + L', hl.dsp.layout('focus r'))
hl.bind(mod .. ' + J', hl.dsp.focus({ direction = 'down' }))
hl.bind(mod .. ' + K', hl.dsp.focus({ direction = 'up' }))

-- move window --
hl.bind(mod .. ctrl .. ' + H', hl.dsp.layout('swapcol l'))
hl.bind(mod .. ctrl .. ' + L', hl.dsp.layout('swapcol r'))
hl.bind(mod .. ctrl .. ' + J', hl.dsp.window.move({ direction = 'down' }))
hl.bind(mod .. ctrl .. ' + K', hl.dsp.window.move({ direction = 'up' }))

-- scrolling: create or split columns
hl.bind(mod .. ' + Comma', hl.dsp.layout('consume_or_expel prev'))
hl.bind(mod .. ' + Period', hl.dsp.layout('consume_or_expel next'))

-- master: resize windows
hl.bind(mod .. shft .. ' + H', hl.dsp.layout('colresize -conf'))
hl.bind(mod .. shft .. ' + L', hl.dsp.layout('colresize +conf'))

hl.bind(mod .. ' + Semicolon', function()
	if hl.get_active_workspace().is_empty == true then
		hl.dispatch(hl.dsp.focus({ monitor = '+1' }))
	else
		hl.dispatch(hl.dsp.window.move({ monitor = '+1' }))
	end
end)

-- mouse --
-----------
hl.bind(mod .. ' + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. ' + mouse:273', hl.dsp.window.resize(), { mouse = true })

hl.bind(mod .. ' + mouse_down', hl.dsp.layout('focus l'))
hl.bind(mod .. ' + mouse_up', hl.dsp.layout('focus r'))

-- swayosd --
-------------
hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd('swayosd-client --monitor DP-1 --output-volume 5'))
hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd('swayosd-client --monitor DP-1 --output-volume -5'))
hl.bind('XF86AudioMute', hl.dsp.exec_cmd('swayosd-client --monitor DP-1 --output-volume mute-toggle'))
hl.bind('Caps_lock', hl.dsp.exec_cmd('swayosd-client --monitor DP-1 --caps-lock'))

-- submaps --
-------------
-- resize floating window --
hl.bind(mod .. ' + R', function()
	if hl.get_active_window().floating == true then
		hl.dispatch(hl.dsp.submap('move-resize'))
	end
end)

hl.define_submap('move-resize', function()
	hl.on('keybinds.submap', function()
		if hl.get_current_submap() == 'move-resize' then
			hl.dispatch(hl.dsp.exec_cmd('notify-send -t 2000 -h int:transient:1 "Window Submap Activated"'))
		end
	end)
	-- move
	hl.bind('H', hl.dsp.window.move({ x = -30, y = 0, relative = true }))
	hl.bind('L', hl.dsp.window.move({ x = 30, y = 0, relative = true }))
	hl.bind('K', hl.dsp.window.move({ x = 0, y = -30, relative = true }))
	hl.bind('J', hl.dsp.window.move({ x = 0, y = 30, relative = true }))

	-- reszie
	hl.bind(ctrl .. ' + H', hl.dsp.window.resize({ x = -30, y = 0, relative = true }, { repeating = true }))
	hl.bind(ctrl .. ' + L', hl.dsp.window.resize({ x = 30, y = 0, relative = true }, { repeating = true }))
	hl.bind(ctrl .. ' + K', hl.dsp.window.resize({ x = 0, y = 30, relative = true }, { repeating = true }))
	hl.bind(ctrl .. ' + J', hl.dsp.window.resize({ x = 0, y = -30, relative = true }, { repeating = true }))
	hl.bind('C', hl.dsp.window.center())
	hl.bind('F', hl.dsp.window.resize({ x = 1344, y = 756 }))

	hl.bind('escape', hl.dsp.submap('reset'))
end)

-- settings --
hl.config({
	general = {
		gaps_in = 6,
		gaps_out = 8,
		border_size = 1,
		col = {
			active_border = 'rgb(7aa2f7)',
		},
		resize_on_border = false,
		allow_tearing = false,

		layout = 'scrolling',
	},
	decoration = {
		rounding = 6,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 10,
			render_power = 3,
			color = 0xee1a1a1a,
		},
		blur = {
			enabled = true,
			xray = false,
			size = 3,
			passes = 3,
			vibrancy = 0.1696,
		},
	},
	master = {
		new_status = 'slave',
		mfact = 0.5,
	},
	scrolling = {
		fullscreen_on_one_column = true,
		focus_fit_method = 1,
		follow_focus = true,
		column_width = 0.5,
		follow_min_visible = 1.0,
		wrap_focus = false,
		wrap_swapcol = false,
		explicit_column_widths = '0.333, 0.5, 0.667, 1.0',
	},
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		mouse_move_focuses_monitor = false,
		font_family = 'noto-fonts',
		initial_workspace_tracking = 0,
	},
})
