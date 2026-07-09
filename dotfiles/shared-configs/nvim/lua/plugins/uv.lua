-- ======================================================================
-- File: lua/plugins/uv.lua
-- Link: https://github.com/benomahony/uv.nvim
-- ======================================================================

return {
	'benomahony/uv.nvim',
	-- ft = { python },
	config = function()
		require('uv').setup({
			-- Auto-activate virtual environments when found
			auto_activate_venv = true,
			notify_activate_venv = true,
			-- Auto commands for directory changes
			auto_commands = true,
			-- Integration with snacks picker
			picker_integration = true,
			-- Keymaps to register (set to false to disable)
			keymaps = {
				prefix = '<leader>u',  -- Main prefix for uv commands
				commands = true,       -- Show uv commands menu (<leader>x)
				run_file = true,       -- Run current file (<leader>xr)
				run_selection = true,  -- Run selected code (<leader>xs)
				run_function = true,   -- Run function (<leader>xf)
					venv = true,           -- Environment management (<leader>xe)
					init = true,           -- Initialize uv project (<leader>xi)
					add = true,            -- Add a package (<leader>xa)
					remove = true,         -- Remove a package (<leader>xd)
					sync = true,           -- Sync packages (<leader>xc)
					sync_all = true,       -- Sync all packages, extras and groups (<leader>xC)
				},
				execution = {
					run_command = 'uv run python',
					notify_output = true,
					notification_timeout = 10000,
					terminal = 'split'
				}
			})
		end
	}
