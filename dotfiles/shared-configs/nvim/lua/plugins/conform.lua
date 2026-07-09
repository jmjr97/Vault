-- ======================================================================
-- File: lua/plugins/conform.lua
-- Link: https://github.com/stevearc/conform.nvim
-- ======================================================================

return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			lua = { 'stylua' },
			python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
			javascript = { 'prettier' },
			json = { 'prettier' },
			go = { 'gofmt' },
		},
		formatters = {
			stylua = {
				prepend_args = { '--quote-style', 'AutoPreferSingle' },
			},
			ruff_format = {
				prepend_args = { '--config', vim.fn.expand('~/.config/nvim/lua/formatters/ruff.toml') },
			},
			prettier = {
				-- prepend_args = { '--single-quote', '--bracket-spacing' },
				prepend_args = { '--config', vim.fn.expand('~/.config/nvim/lua/formatters/prettier.json') },
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = 'fallback',
		},
	},
}

-- prepend_args = { 'format', '--config', "format.quote-style='single'", '-', '--indent-width', '2' },
