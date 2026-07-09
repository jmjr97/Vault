-- ======================================================================
-- File: lua/config/luasnip/init.lua
-- Link: https://github.com/L3MON4D3/LuaSnip
-- ======================================================================

-- require('snippets.desktop')
-- require('snippets.python')

-- keybinds to jump between insert nodes
vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-h>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })


