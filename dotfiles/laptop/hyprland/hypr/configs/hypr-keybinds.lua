-- ======================================================================
-- Config: hyprland
-- File: configs/hypr-keybinds.lua
-- Platform: laptop
-- Link: https://github.com/hyprwm/Hyprland
-- ======================================================================

local mod = 'SUPER'
local ctrl = '+ CONTROL'
local shft = '+ SHIFT'

-- system --
------------
hl.bind(mod .. ctrl .. ' + Q', hl.dsp.window.close())
hl.bind(mod .. ctrl .. ' + Backspace', hl.dsp.exec_cmd('$HOME/Vault/scripts/nixos/reset-ui.sh'))

-- plugins --
-------------
hl.bind('SUPER + Q', function()
	if hl.plugin and hl.plugin.scrolloverview then
		hl.plugin.scrolloverview.overview('toggle')
	end
end)

local function get_bars()
	return hl.get_config('plugin.hyprbars.enabled')
end

hl.bind(mod .. ' + T', function()
	if get_bars() == true then
		hl.config({ plugin = { hyprbars = { enabled = false } } })
	else
		hl.config({ plugin = { hyprbars = { enabled = true } } })
	end
end)

-- applications --
------------------
hl.bind(mod .. ' + Return', hl.dsp.exec_cmd('ghostty'))
hl.bind(mod .. ctrl .. ' + Return', hl.dsp.exec_cmd('ghostty', { tag = 'float_d' }))
hl.bind(mod .. ' + Space', hl.dsp.exec_cmd('rofi -m -1 -show drun'))
hl.bind(mod .. ' + E', hl.dsp.exec_cmd('thunar'))
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
hl.bind(mod .. ' + A', function()
	local width = hl.get_active_window().size.x
	if width >= 1800 then
		hl.dispatch(hl.dsp.layout('colresize 0.5'))
	else
		hl.dispatch(hl.dsp.layout('colresize 1.0'))
	end
end)

hl.bind(mod .. ctrl .. ' + A', function()
	local width = hl.get_active_window().size.x
	if width >= 1800 then
		hl.dispatch(hl.dsp.layout('colresize all 0.5'))
	else
		hl.dispatch(hl.dsp.layout('colresize all 1.0'))
	end
end)

hl.bind(mod .. ' + F', hl.dsp.window.fullscreen({ 'toggle' }))
hl.bind(mod .. ctrl .. ' + D', hl.dsp.window.cycle_next({}))
hl.bind(mod .. ' + S', function()
	hl.dispatch(hl.dsp.window.float({ action = 'toggle' }))
	if hl.get_active_window().floating == true and hl.get_active_window().tags == '' then
		hl.dispatch(hl.dsp.window.resize({ x = 1344, y = 756 }))
	end
	hl.dispatch(hl.dsp.window.center())
end)

local workspaces = { '1', '2', '3', '4', '5' }

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

-- mouse --
-----------
hl.bind(mod .. ' + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. ' + mouse:273', hl.dsp.window.resize(), { mouse = true })

hl.bind(mod .. ' + mouse_down', hl.dsp.focus({ workspace = 'e+1' }))
hl.bind(mod .. ' + mouse_up', hl.dsp.focus({ workspace = 'e-1' }))

-- swayosd --
-------------
hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd('swayosd-client --monitor eDP-1 --output-volume 5'))
hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd('swayosd-client --monitor eDP-1 --output-volume -5'))
hl.bind('XF86AudioMute', hl.dsp.exec_cmd('swayosd-client --monitor eDP-1 --output-volume mute-toggle'))
hl.bind('Caps_lock', hl.dsp.exec_cmd('swayosd-client --monitor eDP-1 --caps-lock'))

-- spotify --
-------------
hl.bind('XF86AudioNext', hl.dsp.exec_cmd('playerctl --player=spotify next'))
hl.bind('XF86AudioPlay', hl.dsp.exec_cmd('playerctl --player=spotify play-pause'))
hl.bind('XF86AudioPrev', hl.dsp.exec_cmd('playerctl --player=spotify previous'))
hl.bind('XF86Explorer', hl.dsp.exec_cmd('flatpak run com.spotify.Client'))

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
			hl.dispatch(hl.dsp.exec_cmd('notify-send -t 1000 -h int:transient:1 "Window Submap Activated"'))
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
	hl.bind(ctrl .. ' + K', hl.dsp.window.resize({ x = 0, y = -30, relative = true }, { repeating = true }))
	hl.bind(ctrl .. ' + J', hl.dsp.window.resize({ x = 0, y = 30, relative = true }, { repeating = true }))
	hl.bind('C', hl.dsp.window.center())

	hl.bind('escape', hl.dsp.submap('reset'))
end)
