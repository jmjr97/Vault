-- ======================================================================
-- File: lua/config/snacks-dashboard.lua
-- Link: https://github.com/folke/snacks.nvim
-- ======================================================================

function getDashboardConfig()
	local config = {
		enabled = true,
		width = 60,
		row = nil, -- dashboard position. nil for center
		col = nil, -- dashboard position. nil for center
		pane_gap = 4, -- empty columns between vertical panes
		autokeys = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', -- autokey sequence
		-- These settings are used by some built-in sections
		preset = {
			-- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
			---@type fun(cmd:string, opts:table)|nil
			pick = nil,
			-- Used by the `keys` section to show keymaps.
			-- Set your custom keymaps here.
			-- When using a function, the `items` argument are the default keymaps.
			---@type snacks.dashboard.Item[]
			keys = {
				{ icon = ' ', key = 'e', desc = 'New File', action = ':ene | startinsert' },
				{ icon = ' ', key = 'b', desc = 'Quick Bash', action = ':Basher' },
				{ icon = ' ', key = 'f', desc = 'Find File', action = ':lua Snacks.dashboard.pick( "files" )' },
				{
					icon = ' ',
					key = 'a',
					desc = 'Find File from Home',
					action = ':lua Snacks.dashboard.pick( "files", { cwd = "~/", title = "Files ~/" })',
				},
				{
					icon = ' ',
					key = 'r',
					desc = 'Recent Files',
					action = ':lua Snacks.dashboard.pick( "oldfiles" )',
				},
				{
					icon = ' ',
					key = 'o',
					desc = 'Notes',
					action = ':lua Snacks.dashboard.pick( "files", { cwd = "~/Dropbox/obsidian/", title = "Notes" })',
				},
				{
					icon = ' ',
					key = 'g',
					desc = 'Find Text',
					action = ':lua Snacks.dashboard.pick( "live_grep", { layout = "ivy_split" })',
				},
				{
					icon = ' ',
					key = 'c',
					desc = 'NeoVim Configs',
					action = ':lua Snacks.dashboard.pick( "files", { layout = "sidebar", cwd = "~/.config/nvim/", title = "Configs" })',
				},
				{ icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
				{ icon = '󰟾 ', key = 'm', desc = 'Mason', action = ':Mason' },
				{ icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
			},
			-- Used by the `header` section
			header = [[
     __                _           
  /\ \ \___  ___/\   /(_)_ __ ___  
 /  \/ / _ \/ _ \ \ / / | '_ ` _ \ 
/ /\  /  __/ (_) \ V /| | | | | | |
\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
		},
		-- item field formatters
		formats = {
			icon = function(item)
				if item.file and item.icon == 'file' or item.icon == 'directory' then
					return M.icon(item.file, item.icon)
				end
				return { item.icon, width = 2, hl = 'icon' }
			end,
			footer = { '%s', align = 'center' },
			header = { '%s', align = 'center' },
			file = function(item, ctx)
				local fname = vim.fn.fnamemodify(item.file, ':~')
				fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
				if #fname > ctx.width then
					local dir = vim.fn.fnamemodify(fname, ':h')
					local file = vim.fn.fnamemodify(fname, ':t')
					if dir and file then
						file = file:sub(-(ctx.width - #dir - 2))
						fname = dir .. '/…' .. file
					end
				end
				local dir, file = fname:match('^(.*)/(.+)$')
				return dir and { { dir .. '/', hl = 'dir' }, { file, hl = 'file' } } or { { fname, hl = 'file' } }
			end,
		},
		sections = {
			{ section = 'header' },
			{ section = 'keys', gap = 1, padding = 1 },
			{ section = 'startup' },
		},
	}
	return config
end
