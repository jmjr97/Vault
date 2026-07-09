-- ======================================================================
-- File: lua/config/term.lua
-- Link: https://github.com/akinsho/toggleterm.nvim
-- ======================================================================

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })
local yazi = Terminal:new({ cmd = 'yazi', hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

function _YAZI()
	yazi:toggle()
end

function _RUN_CODE()
	local choice = vim.bo.filetype
	local actions = {
		['lua'] = 'TermExec cmd="lua %"<cr>',
		['python'] = 'TermExec cmd="python %"<cr>',
		['go'] = 'TermExec cmd="go run ."<cr>',
		['sh'] = 'TermExec cmd="./%"<cr>',
	}
	vim.cmd(actions[choice])
end

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
map('n', '<leader>rl', ':lua _LAZYGIT_TOGGLE()<cr>', opts)
map('n', '<leader>ry', ':lua _YAZI()<cr>', opts)
map('n', '<leader>rr', ':lua _RUN_CODE()<cr>', opts)
