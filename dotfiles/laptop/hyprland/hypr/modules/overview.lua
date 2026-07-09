-- ======================================================================
-- Config: Hyprland
-- File: modues/overview.lua
-- Platform: main-rig
-- Link: https://github.com/yayuuu/hyprland-scroll-overview
-- ======================================================================

if hl.plugin and hl.plugin.scrolloverview then
	hl.plugin.scrolloverview.configure({
		gesture_distance = 300, -- how far is the "max" for the gesture
		scale = 0.5, -- preferred overview scale
		workspace_gap = 10,
		wallpaper = 0, -- 0: global only, 1: per-workspace only, 2: both
		blur = true, -- blur only the main overview wallpaper

		shadow = {
			enabled = false,
			range = 50,
			render_power = 3,
			color = 0xee1a1a1a,
		},
	})
end
