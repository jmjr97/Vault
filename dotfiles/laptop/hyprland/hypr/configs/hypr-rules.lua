-- ======================================================================
-- Config: hyprland
-- File: configs/hypr-rules.lua
-- Platform: laptop
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

-- start maximized --
hl.window_rule({ match = { class = 'firefox' }, scrolling_width = 1.0 })

-- my apps --
-------------
hl.window_rule({ match = { class = 'wild-magic' }, float = true, center = true })
hl.window_rule({ match = { class = 'dice-roller' }, float = true, center = true })
hl.window_rule({ match = { class = 'pac-updates' }, float = true, move = { 1520, 50 } })

-- tui applications --
----------------------
hl.window_rule({ match = { initial_class = 'com.me.float' }, float = true, center = true, size = default_size })
hl.window_rule({ match = { initial_class = 'com.me.btop' }, float = true, center = true, size = larger_size })
hl.window_rule({ match = { class = 'com.gabm.satty' }, float = true })

-- gimp --
----------
hl.window_rule({
	match = { initial_class = 'gimp', initial_title = 'Preferences' },
	float = true,
	center = true,
	size = larger_size,
})

-- layer rules --
-----------------
hl.layer_rule({ match = { namespace = 'rofi' }, blur = true, ignore_alpha = 0.3 })
hl.layer_rule({ match = { namespace = 'swaync-notification-window' }, blur = true, ignore_alpha = 0.3 })
hl.layer_rule({ match = { namespace = 'swaync-control-center' }, blur = true, ignore_alpha = 0.3 })
hl.layer_rule({ match = { namespace = 'logout_dialog' }, blur = true })
