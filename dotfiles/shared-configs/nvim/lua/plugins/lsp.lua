-- ======================================================================
-- File: lua/plugins/lsp.lua
-- Link: https://github.com/neovim/nvim-lspconfig
-- ======================================================================

return {
	'neovim/nvim-lspconfig',
	config = function()
		vim.lsp.enable('bashls')
		vim.lsp.enable('cssls')
		vim.lsp.enable('gopls')
		vim.lsp.enable('html')
		vim.lsp.enable('lua_ls')
		vim.lsp.enable('basedpyright')
		vim.lsp.enable('ts_ls')
		vim.lsp.enable('qmlls')
		vim.lsp.enable('nil')

		vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover)
		vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition)
		vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
		vim.keymap.set('n', '<leader>lt', function()
			if vim.diagnostic.is_enabled() then
				vim.diagnostic.enable(false)
				print('LSP Off')
			else
				vim.diagnostic.enable(true)
				print('LSP On')
			end
		end)
	end,
}
