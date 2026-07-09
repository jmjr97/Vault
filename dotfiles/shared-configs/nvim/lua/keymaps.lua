-- ======================================================================
-- File: lua/keymaps.lua
-- ======================================================================

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

vim.api.nvim_buf_create_user_command(0, 'Basher', function()
	vim.cmd('e ~/Vault/scripts/quick-bash.sh')
end, {
	nargs = '?',
	desc = 'Quick bash file',
})

-------------------
-- house keeping --
-------------------
-- setup leader
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- remove dumb stuff
map('n', '<F1>', [[<ESC>]], opts)
map('i', '<F1>', [[<ESC>]], opts)
map('n', 'Q', 'q', opts)
map('n', 'q', '<Nop>', opts)

-- remap redo
map('n', 'U', ':redo<CR>', opts)
map('n', '<C-r>', '<Nop>', opts)

-- misc
map('n', '<leader>m', ':MaximizerToggle<CR>', opts)
map('n', '<leader>t', ':TransparentToggle<CR>', opts)

------------------
---- movement ----
------------------
-- window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- terminal navigation
map('t', '<C-n>', [[<C-\><C-n>]], opts)
map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)

-- buffers
map('n', '<S-l>', ':bnext<CR>', opts)
map('n', '<S-h>', ':bprevious<CR>', opts)
map('n', '<leader>bb', ':bdelete<CR>', opts)
map('n', '<leader>bd', ':bdelete!<CR>', opts)

-- centered 1/2 page
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- centered search
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- split resize
map('n', '<C-Left>', ':vertical resize -3<CR>', opts)
map('n', '<C-Right>', ':vertical resize +3<CR>', opts)
map('n', '<C-Up>', ':horizontal resize -3<CR>', opts)
map('n', '<C-Down>', ':horizontal resize +3<CR>', opts)

---------------------------
---- text manipulation ----
---------------------------
-- visual move
map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- paste no copy
map('x', '<C-p>', '"_dP', opts)

-- indent mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- yank to clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], opts)
-- vim.keymap.set({'n', 'v'}, '<leader>p', [["+p]], opts)

-- visual replace
map('v', '<leader>r', '"hy:%s/<C-r>h//g<left><left>', opts)

-------------------------
---- file management ----
-------------------------
-- oil
-- vim.keymap.set('n', '-', function()
-- 	local oil = require('oil')
-- 	local util = require('oil.util')
-- 	oil.open_float()
-- 	util.run_after_load(0, function()
-- 		oil.open_preview()
-- 	end)
-- end, opts)

---------------------
---- mini notify ----
---------------------
map('n', '<leader>nd', ':lua MiniNotify.clear()<cr>', opts)
map('n', '<leader>ns', ':lua MiniNotify.show_history()<cr>', opts)

-----------------------
---- snacks picker ----
-----------------------
map('n', '<leader>ff', ':lua Snacks.picker.files()<cr>', opts)
map('n', '<leader>fa', ':lua Snacks.picker.files({ cwd = "~/", hidden = true, title = "Files ~/" })<cr>', opts)
map('n', '<leader>fo', ':lua Snacks.picker.files({ cwd = "~/Dropbox/obsidian/", title = "Obsidian Notes" })<cr>', opts)
map('n', '<leader>fp', ':lua Snacks.picker.projects()<cr>', opts)
map('n', '<leader>fb', ':lua Snacks.picker.buffers({ layout = "select", focus = "list" })<cr>', opts)
map('n', '<leader>fc', ':lua Snacks.picker.files({ cwd = "~/.config/nvim/", title = "NeoVim Configs" })<cr>', opts)
map('n', '<leader>fr', ':lua Snacks.picker.recent()<cr> ', opts)
map('n', '<leader>fg', ':lua Snacks.picker.grep()<cr>', opts)
map('n', '<leader>fh', ':lua Snacks.picker.help({ layout = "ivy_split" })<cr>', opts)
