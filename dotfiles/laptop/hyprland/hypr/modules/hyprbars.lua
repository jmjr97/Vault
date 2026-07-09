-- ======================================================================
-- Config: Hyprland
-- File: modues/hyprbars.lua
-- Platform: main-rig
-- Link: https://github.com/hyprwm/hyprland-plugins/tree/main/hyprbars
-- ======================================================================

if hl.plugin and hl.plugin.scrolloverview then
	hl.config({
		plugin = {
			hyprbars = {
				enabled = false,
				bar_color = 'rgb(1a1b26)',
				bar_height = 25,
				bar_buttons_alignment = 'left',
				bar_precedence_over_border = true,
			},
		},
	})

	---close window---
	hl.plugin.hyprbars.add_button({
		bg_color = 'rgb(f7768e)',
		fg_color = 'rgb(a9b1d6)',
		size = 14,
		icon = '',
		action = 'hyprctl dispatch "hl.dsp.window.close()"',
	})

	---toggle float---
	hl.plugin.hyprbars.add_button({
		bg_color = 'rgb(9ece6a)',
		fg_color = 'rgb(a9b1d6)',
		size = 14,
		icon = '',
		action = 'hyprctl dispatch "hl.dsp.window.float({ action = \'toggle\' })" && hyprctl dispatch "hl.dsp.window.center()"',
	})

	hl.plugin.hyprbars.add_button({
		bg_color = 'rgb(7aa2f7)',
		fg_color = 'rgb(a9b1d6)',
		size = 14,
		icon = '',
		action = 'hyprctl eval "hl.dispatch(hl.dsp.exec_cmd( \'/home/john/.config/hypr/scripts/toggle_size.sh\' ))"',
		-- action = 'hyprctl eval "hl.dispatch(hl.dsp.exec_cmd( "/home/john/.config/hypr/scripts/toggle_size.sh" ))"',
	})
end
