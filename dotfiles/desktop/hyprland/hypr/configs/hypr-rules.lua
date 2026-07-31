-- ======================================================================
-- Config: hyprland
-- File: ~/.config/hypr/configs/hypr-rules.lua
-- Platform: desktop
-- Link: https://github.com/hyprwm/Hyprland
-- ======================================================================
local extra_small_size = { '(monitor_w*0.4)', '(monitor_h*0.4)' }
local smaller_size = { '(monitor_w*0.6)', '(monitor_h*0.6)' }
local default_size = { '(monitor_w*0.7)', '(monitor_h*0.7)' }
local larger_size = { '(monitor_w*0.8)', '(monitor_h*0.8)' }

---float tags---
----------------
hl.window_rule({ match = { tag = 'float' }, float = true, center = true })
hl.window_rule({ match = { tag = 'float_xs' }, size = extra_small_size, float = true, center = true })
hl.window_rule({ match = { tag = 'float_s' }, size = smaller_size, float = true, center = true })
hl.window_rule({ match = { tag = 'float_d' }, size = default_size, float = true, center = true })
hl.window_rule({ match = { tag = 'float_l' }, size = larger_size, float = true, center = true })
hl.window_rule({ match = { tag = 'spawn_right' }, monitor = 'HDMI-A-1' })

---start maximized---
---------------------
hl.window_rule({ match = { class = 'firefox' }, scrolling_width = 1.0 })
hl.window_rule({ match = { class = 'Aseprite' }, scrolling_width = 1.0 })

---workspace rules---
---------------------
hl.window_rule({ match = { workspace = '6' }, scrolling_width = 1.0 })
hl.window_rule({ match = { workspace = '7' }, scrolling_width = 1.0 })
hl.window_rule({ match = { workspace = '8' }, scrolling_width = 1.0 })
hl.window_rule({ match = { workspace = '9' }, scrolling_width = 1.0 })
hl.window_rule({ match = { workspace = '10' }, scrolling_width = 1.0 })

---my apps---
-------------
hl.window_rule({ match = { class = 'wild-magic' }, float = true, center = true })
hl.window_rule({ match = { class = 'dice-roller' }, float = true, center = true })
hl.window_rule({ match = { class = 'pac-updates' }, monitor = 'DP-1', float = true, move = { 1600, 50 } })
hl.window_rule({ match = { title = 'arch-updates' }, monitor = 'DP-1', float = true, move = { 1600, 50 } })
hl.window_rule({ match = { title = 'Test App' }, float = true, center = true })

---tui applications---
----------------------
hl.window_rule({ match = { initial_class = 'com.me.float' }, float = true, center = true, size = default_size })
hl.window_rule({ match = { initial_class = 'com.me.btop' }, float = true, center = true, size = larger_size })
hl.window_rule({ match = { class = 'com.gabm.satty' }, float = true })

---spawn per monitor---
-----------------------
hl.window_rule({ match = { class = 'vesktop' }, monitor = 'HDMI-A-1' })
hl.window_rule({ match = { class = 'spotify' }, scrolling_width = 1.0, monitor = 'HDMI-A-1' })
hl.window_rule({ match = { class = 'retroarch' }, monitor = 'DP-1' })

---guitar---
------------
hl.window_rule({
	match = { class = 'guitarix' },
	scrolling_width = 0.5,
})

hl.window_rule({
	match = { class = 'org.rncbc.qpwgraph' },
	scrolling_width = 0.5,
})

-- gimp --
----------
hl.window_rule({
	match = { initial_class = 'gimp', initial_title = 'GNU Image Manipulation Program' },
	scrolling_width = 1.0,
})

hl.window_rule({
	match = { initial_class = 'gimp', initial_title = 'Preferences' },
	float = true,
	center = true,
	size = larger_size,
})

hl.window_rule({
	match = { initial_class = 'gimp', initial_title = 'Configure Keyboard Shortcuts' },
	float = true,
	center = true,
	size = larger_size,
})

hl.window_rule({
	match = { initial_class = 'gimp', initial_title = 'Open Image' },
	float = true,
	center = true,
	size = default_size,
})

---godot---
-----------
hl.window_rule({
	match = { initial_class = 'Godot' },
	scrolling_width = 1.0,
})

-- hl.window_rule({
-- 	match = { initial_class = 'Godot', initial_title = '.*(DEBUG).*' },
-- 	float = true,
-- 	center = true,
-- 	monitor = 'HDMI-A-1',
-- })

hl.window_rule({
	match = { initial_class = 'Godot', initial_title = 'Project Settings.*' },
	float = true,
	center = true,
	size = larger_size,
})

hl.window_rule({
	match = { initial_class = 'Godot', initial_title = 'Editor Settings' },
	float = true,
	center = true,
	size = larger_size,
})

---steam---
-----------
hl.window_rule({ match = { class = 'steam' }, scrolling_width = 1.0 })

hl.window_rule({
	match = { initial_class = 'steam_app_.*' },
	monitor = 'DP-1',
})

hl.window_rule({
	match = { initial_class = 'steam', initial_title = 'Launching...' },
	monitor = 'DP-1',
})

hl.window_rule({
	match = { initial_class = 'steam', initial_title = 'Friends List' },
	float = true,
	center = true,
	size = { '(monitor_w*0.18)', '(monitor_h*0.7)' },
})

hl.window_rule({
	match = { initial_class = 'steam', initial_title = 'Steam Settings' },
	float = true,
	center = true,
	size = default_size,
})

hl.window_rule({ -- progress window that shows on startup
	match = { initial_title = 'Steam' },
	center = true,
})

---virt-manager---
------------------
hl.window_rule({
	match = {
		class = 'virt-manager',
		title = '.* on QEMU/KVM',
	},
	scrolling_width = 1.0,
})

hl.window_rule({
	match = {
		class = 'virt-manager',
		title = 'New VM',
	},
	center = true,
})

---system rules---
------------------
hl.window_rule({
	match = { class = 'xdg-desktop-portal-gtk' },
	center = true,
	size = default_size,
})

---layer rules---
-----------------
hl.layer_rule({ match = { namespace = 'rofi' }, blur = true, ignore_alpha = 0.3 })
hl.layer_rule({ match = { namespace = 'swaync-notification-window' }, blur = true, ignore_alpha = 0.3 })
hl.layer_rule({ match = { namespace = 'swaync-control-center' }, blur = true, ignore_alpha = 0.3 })
hl.layer_rule({ match = { namespace = 'logout_dialog' }, animation = 'fade', blur = true })
