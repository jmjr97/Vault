return {
	'anthonyleung-dev/gtkcss-syntax.nvim',
	ft = 'gtkcss',
	config = function()
		require('gtkcss').setup({
			extensions = { 'gtk.css', 'gtk.scss', 'gtk.less', 'css' },
			patterns = { 'gtk-css' },
			headers = { 'gtk-css' },
		})
	end,
}
