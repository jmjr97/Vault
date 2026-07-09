-- ======================================================================
-- File: lua/plugins/treesitter.lua
-- Link: https://github.com/nvim-treesitter/nvim-treesitter
-- ======================================================================

return {
  'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	event = { 'BufReadPost', 'BufNewFile' },
  lazy = false,
	config = function()
		require('nvim-treesitter').setup({
			ensure_installed = {
				'lua',
				'python',
				'bash',
				'javascript',
				'html',
				'css',
				'json',
				'yaml',
				'go',
				'markdown',
				'markdown_inline',
			},
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			incremental_selection = {
				enabled = true,
				keymaps = {
					init_selection = '<CR>',
					node_incremental = '<CR>',
					scope_incremental = '<TAB>',
					node_decremental = '<S-TAB>',
				},
			},
		})
	end,
}
