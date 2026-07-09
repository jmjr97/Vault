-- ======================================================================
-- File: lua/plugins/mason.lua
-- Link: https://github.com/mason-org/mason.nvim
-- Link: https://github.com/mason-org/mason-lspconfig.nvim
-- Link: https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
-- ======================================================================

return {
	{
		'mason-org/mason.nvim',
		opts = {
			ui = {
				icons = {
					package_installed = '✓',
					package_pending = '➜',
					package_uninstalled = '✗',
				},
			},
		},
		config = function()
			require('mason').setup()
		end,
	},
	{
		'mason-org/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = {
					-- lsp
					'basedpyright',
					'bashls',
					'cssls',
					'gopls',
					'html',
					'lua_ls',
					'qmlls',
					'ts_ls',
				},
			})
		end,
	},
	{
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		config = function()
			require('mason-tool-installer').setup({
				ensure_installed = {
					'gofumpt',
					'prettier',
					'ruff',
					'stylua',
				},
			})
		end,
	},
}
