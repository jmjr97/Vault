-- ======================================================================
-- File: lua/plugins/catppuccin.lua
-- Link: https://github.com/catppuccin/nvim
-- ======================================================================

return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require('catppuccin').setup{
			flavour = 'macchiato',
			term_colors = true,
			default_integrations = true,
			integrations = {
				treesitter = true,
				mason = true,
				mini = true,
			},
		}
	end
}
