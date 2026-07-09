-- ======================================================================
-- File: lua/options.lua
-- ======================================================================

local options = {
	relativenumber = true,
	number = true,
	wrap = false,
	cursorline = true,
	mouse = 'a',
	-- clipboard = 'unnamedplus',
	termguicolors = true,

	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	expandtab = false,
	autoindent = true,


	smartindent = true,

	undofile = true,

	hlsearch = false,
	incsearch = true,

	scrolloff = 8,
	sidescrolloff = 8,
	signcolumn = "yes",
	ignorecase = true,
	smartcase = true
}

vim.treesitter.language.register('markdown', 'vimwiki')
vim.g.python_recommended_style = 0
vim.opt.shortmess:append "c"
vim.diagnostic.config({ virtual_text = true })

for k, v in pairs(options) do
	vim.opt[k] = v
end
