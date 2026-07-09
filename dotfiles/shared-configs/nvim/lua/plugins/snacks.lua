-- ======================================================================
-- File: lua/plugins/snacks.lua
-- Link: https://github.com/folke/snacks.nvim
-- ======================================================================

require('config.snacks-dashboard')

return {
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = getDashboardConfig(),
		picker = {
			enabled = true,
			ui_select = true,
			hidden = true,
			exclude = {
				'.git',
				'.local',
				'.cache',
				'.dropbox',
				'.dropbox-dist',
				'.gnupg',
				'.npm',
				'.nv',
				'.pki',
				'.ssh',
				'.steam',
				'.themes',
				'/home/john/go',
				'.mozilla',
			},
			projects = {
				patterns = {},
				projects = {
					'~/.config/hypr'
				}
			}
		}
	}
}
