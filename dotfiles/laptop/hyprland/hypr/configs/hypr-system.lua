-- ======================================================================
-- Config: hyprland
-- File: configs/hypr-system.lua
-- Platform: laptop
-- Link: https://github.com/hyprwm/Hyprland
-- ======================================================================

-- environment variables
------------------------
hl.env('XCURSOR_SIZE', 24)
hl.env('HYPRCURSOR_SIZE', 24)

-- hl.env('XDG_MENU_PREFIX', 'arch-')
hl.env('XDG_CURRENT_DESKTOP', 'Hyprland')
hl.env('XDG_SESSION_TYPE', 'wayland')
hl.env('XDG_SESSION_DESKTOP', 'Hyprland')

hl.env('QT_QPA_PLATFORM', 'wayland;xcb')
hl.env('QT_QPA_PLATFORMTHEME', 'qt6ct')

hl.env('HYPRSHOT_DIR', '/home/john/Pictures/screenshots')

-- monitor
-----------
hl.monitor({
	output = 'eDP-1',
	mode = '1920x1080@60',
	position = '0x0',
	scale = 1,
})

hl.monitor({
	output = 'HDMI-A-1',
	mode = '1920x1080@75',
	position = '0x-1080',
	scale = 1,
})

-- input
--------
hl.config({
	input = {
		kb_layout = 'us',
		follow_mouse = 2,
		float_switch_override_focus = 0,
		sensitivity = 0,
	},
	cursor = {
		no_hardware_cursors = true,
		no_warps = true,
	},
})

hl.device({
	name = 'logi-m240-mouse',
	sensitivity = -0.2,
})

hl.device({
	name = 'asup1411:00-093a:200b-touchpad',
	sensitivity = 0.2,
})

hl.gesture({
	fingers = 3,
	direction = 'horizontal',
	action = 'scroll_move',
})
