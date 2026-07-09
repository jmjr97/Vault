-- ======================================================================
-- Config: Hyprland
-- File: modues/hyprtasking.lua
-- Platform: main-rig
-- Link: https://github.com/raybbian/hyprtasking
-- ======================================================================

if hl.plugin and hl.plugin.hyprtasking then
	hl.config({
		plugin = {
			hyprtasking = {
				layout = 'linear',

				gap_size = 10,
				bg_color = 0xff26233a,
				border_size = 2,
				exit_on_hovered = false,
				warp_on_move_window = 1,
				close_overview_on_reload = false,

				-- for other mouse buttons see <linux/input-event-codes.h>
				drag_button = 0x110, -- left mouse button
				select_button = 0x111, -- right mouse button

				gestures = {
					enabled = true,
					move_fingers = 3,
					move_distance = 300,
					open_fingers = 4,
					open_distance = 300,
					open_positive = true,
				},

				grid = {
					rows = 3,
					cols = 3,
					loop = false,
					layers = 2,
					loop_layers = true,
					gaps_use_aspect_ratio = true,
				},

				linear = {
					top = false,
					height = 400,
					scroll_speed = 1.0,
					blur = false,
				},
			},
		},
	})
end
