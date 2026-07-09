-- ======================================================================
-- File: lua/plugins/markdown.lua
-- Link: https://github.com/MeanderingProgrammer/render-markdown.nvim
-- ======================================================================

return {
	'MeanderingProgrammer/render-markdown.nvim',
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim', 'nvim-tree/nvim-web-devicons' }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	config = function()
		require('render-markdown').setup({
			anti_conceal = { enabled = false },
			heading = {
				left_margin = 0,
				position = 'inline',
			},
			bullet = {
				left_pad = 0,
			},
			code = {
				enabled = true,
				sign = true,
				style = 'full',
				position = 'left',
				language_pad = 0,
				language_name = true,
				disable_background = { 'diff' },
				width = 'block',
				left_pad = 0,
				right_pad = 0,
				min_width = 0,
				border = 'thin',
				above = '▄',
				below = '▀',
				highlight = 'RenderMarkdownCode',
				highlight_inline = 'RenderMarkdownCodeInline',
				highlight_language = nil,
			},
			paragraph = {
				left_margin = 0,
			},
			win_options = {
				conceallevel = {
					default = vim.api.nvim_get_option_value('conceallevel', {}),
					rendered = 2,
				},
			},
			file_types = {
				'markdown',
				'vimwiki',
			},
		})
	end,
}
