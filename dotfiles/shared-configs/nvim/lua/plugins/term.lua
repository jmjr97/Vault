-- ======================================================================
-- File: lua/plugins/term.lua
-- Link: https://github.com/akinsho/toggleterm.nvim
-- ======================================================================

-- local Terminal = require('toggleterm.terminal').Terminal
-- local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })
-- local yazi = Terminal:new({ cmd = 'yazi', hidden = true })
--
-- function _LAZYGIT_TOGGLE()
-- 	lazygit:toggle()
-- end
--
-- function _YAZI()
-- 	yazi:toggle()
-- end
--
-- local opts = { noremap = true, silent = true }
-- local map = vim.api.nvim_set_keymap
-- map('n', '<leader>rl', ':lua _LAZYGIT_TOGGLE()<cr>', opts )
-- map('n', '<leader>ry', ':lua _YAZI()<cr>', opts )

return {
	'akinsho/toggleterm.nvim',
	version = '*',
	config = function()
		require('toggleterm').setup({
			size = 20,
			open_mapping = [[<c-/>]],
			hide_numbers = false,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = 'float',
			close_on_exit = true,
			float_opts = {
				border = 'curved',
				winblend = 0,
				highlights = {
					border = 'normal',
					background = 'normal',
				},
			},
		})
	end,
}
