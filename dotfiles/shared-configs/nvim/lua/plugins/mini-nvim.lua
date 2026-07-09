-- ======================================================================
-- File: lua/plugins/mini-nvim.lua
-- Link: https://github.com/echasnovski/mini.nvim
-- ======================================================================

return {
	{ 'nvim-mini/mini.ai', version = '*', opts = {} },
	{ 'nvim-mini/mini.comment', version = '*', opts = {} },
	{ 'nvim-mini/mini.cursorword', version = '*', opts = {} },
	{ 'nvim-mini/mini.pairs', version = '*', opts = {} },
	{
		'nvim-mini/mini.indentscope',
		version = '*',
		opts = {},
		-- config = function()
		-- 	require('mini.indentscope').setup({
		-- 		draw = {
		-- 			scope = false,
		-- 		},
		-- 	})
		-- end,
	},
	{
		'nvim-mini/mini.notify',
		version = '*',
		opts = {},
		config = function()
			require('mini.notify').setup({
				lsp_progress = {
					enable = false,
				},
			})
		end,
	},
	{
		'nvim-mini/mini.surround',
		version = '*',
		opts = {
			mappings = {
				add = 'gs',
				delete = 'gsd',
				replace = 'gsr',
				find = 'gsf',
				find_left = 'gsF',
				highlight = 'gsh',
				update_n_lines = 'gsn',
			},
			options = {
				n_lines = 10000,
			},
		},
	},
}
