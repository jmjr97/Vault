-- ======================================================================
-- File: lua/plugins/whichkey.lua
-- Link: https://github.com/folke/which-key.nvim
-- ======================================================================

return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	opts = {
		sort = { 'alphanum' },
	},
  config = function()
		require('which-key').setup({
			preset = 'helix',
		})
    local wk = require('which-key')
    wk.add({
			-- Find
			{ '<leader>f', group = 'Find' },
			{ '<leader>ff', desc = 'Files' },
			{ '<leader>fa', desc = 'All Files' },
			{ '<leader>fo', desc = 'Obsidian Notes' },
			{ '<leader>fp', desc = 'Projects' },
			{ '<leader>fb', desc = 'Buffers' },
			{ '<leader>fc', desc = 'Nvim Configs' },
			{ '<leader>fr', desc = 'Recent' },
			{ '<leader>fg', desc = 'Grep' },
			{ '<leader>fh', desc = 'Help' },
			{ '<leader>fp', desc = 'Clipboard' },
       -- Buffer
      { '<leader>b', group = 'Buffers' },
      { '<leader>bb', desc = 'Close Buffer' },
      { '<leader>bd', desc = 'Close Buffer w/o Saving' },
      -- Clipboard
      { '<leader>y', desc = 'Yank to Clipboard' },
      -- { '<leader>p', desc = 'Paste from Clipboard' },
      -- LSP Handler
      { '<leader>l', group = 'LSP Handler' },
			{ '<leader>lk', desc = 'Hover Documentation' },
			{ '<leader>ld', desc = 'Tele Definition' },
			{ '<leader>la', desc = 'Code Actions' },
			{ '<leader>lt', desc = 'Toggle LSP' },
			-- -- My Custom Functions
      { '<leader>r', group = 'Run' },
			{ '<leader>rr', desc = 'Run Code' },
			{ '<leader>rl', desc = 'Lazygit' },
			{ '<leader>ry', desc = 'Yazi' },
			-- Notifications
      { '<leader>n', group = 'Notifications' },
			{ '<leader>nd', desc = 'Dismiss' },
			{ '<leader>ns', desc = 'Show History' },
      -- Misc
      { '<leader>m', desc = 'Toggle Max Split' },
      { '<leader>t', desc = 'Toggle Transparency' },
    })
  end,

}
