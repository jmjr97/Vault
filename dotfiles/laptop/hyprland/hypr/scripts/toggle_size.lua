-- ======================================================================
-- Config: Hyprland
-- File: scripts/toggle_size.lua
-- Disc: toggle window size for hyprbars button
-- ======================================================================

hl.dispatch(hl.dsp.window.float({ action = 'toggle' }))
if hl.get_active_window().floating == true and hl.get_active_window().tags then
	hl.dispatch(hl.dsp.window.resize({ x = 1344, y = 756 }))
end
hl.dispatch(hl.dsp.window.center())
