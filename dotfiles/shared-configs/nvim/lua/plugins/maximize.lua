-- ======================================================================
-- File: lua/plugins/maximize.lua
-- Link: https://github.com/declancm/maximize.nvim
-- ======================================================================

return {
  'declancm/maximize.nvim',
  config = function()
    require('maximize').setup()
    -- Set keymap (e.g., <leader>z to toggle)
    vim.keymap.set('n', '<Leader>m', "<Cmd>lua require('maximize').toggle()<CR>", { desc = "Toggle window maximization" })
  end
}

