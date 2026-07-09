-- ======================================================================
-- File: lua/plugins/ts-autotag.lua
-- Link: https://github.com/windwp/nvim-ts-autotag
-- ======================================================================

return {
	'windwp/nvim-ts-autotag',
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = false,
	},
	per_filetype = {
		['html'] = {
			enable_close = true,
			enable_rename = true,
		},
	},
	config = function()
		require('nvim-ts-autotag').setup()
	end,
}
