-- ======================================================================
-- File: init.lua
-- ======================================================================

require('options')
require('keymaps')
require('autocmds')
require('config.lazy')
require('config.term')
require('config.luasnip')

vim.opt.showmode = false
vim.cmd('colorscheme tokyonight')
-- vim.cmd('colorscheme catppuccin-mocha')
