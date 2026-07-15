-- ======================================================================
-- Config: hyprland
-- File: modues/hyprbars.lua
-- Platform: laptop
-- Link: https://github.com/hyprwm/hyprland-plugins/tree/main/hyprbars
-- ======================================================================

function Maximize()
	local width = hl.get_active_window().size.x
	if width >= 1800 then
		hl.dispatch(hl.dsp.layout('colresize 0.5'))
	else
		hl.dispatch(hl.dsp.layout('colresize 1.0'))
	end
end

function Float()
	hl.dispatch(hl.dsp.window.float({ action = 'toggle' }))
	hl.dispatch(hl.dsp.window.center())
end

if hl.plugin and hl.plugin.scrolloverview then
	hl.config({
		plugin = {
			hyprbars = {
				enabled = false,
				bar_color = 'rgb(1a1b26)',
				bar_height = 25,
				bar_buttons_alignment = 'left',
				bar_precedence_over_border = true,
				on_double_click = 'hyprctl eval "hl.config({ plugin = { hyprbars = { enabled = false}}})"',
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
		action = 'hyprctl eval "Maximize()"',
	})

	hl.plugin.hyprbars.add_button({
		bg_color = 'rgb(7aa2f7)',
		fg_color = 'rgb(a9b1d6)',
		size = 14,
		icon = '',
		action = 'hyprctl eval "Float()"',
		-- action = 'hyprctl eval "hl.dispatch(hl.dsp.exec_cmd( "/home/john/.config/hypr/scripts/toggle_size.sh" ))"',
	})
end
