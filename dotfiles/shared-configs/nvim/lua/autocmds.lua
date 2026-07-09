-- ======================================================================
-- File: lua/autocmds.lua
-- ======================================================================

local highlight_yank_group = vim.api.nvim_create_augroup('HighlightYank', {})
vim.api.nvim_create_autocmd('TextYankPost', {
	group = highlight_yank_group,
	pattern = '*',
	callback = function()
		vim.hl.on_yank({
			hlgroup = 'IncSearch',
			timeout = 200,
		})
	end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
	pattern = '*.tcss',
	command = 'set filetype=tcss',
})

-- vim.api.nvim_create_autocmd('FileType', {
-- 	pattern = { 'terminal', 'toggleterm', 'fish', 'fish;#toggleterm#1', 'help', 'dashboard' },
-- 	callback = function()
-- 		vim.b.miniindentscope_config = { enabled = false }
-- 	end,
-- })
