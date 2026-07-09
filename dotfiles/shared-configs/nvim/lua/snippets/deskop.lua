-- ======================================================================
-- File: lua/config/luasnip/desktop.lua
-- Link: https://github.com/L3MON4D3/LuaSnip
-- ======================================================================

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("desktop", {
	s("desktop", fmt(
		[[
[Desktop Entry]

Type=Application
Name={}
Comment={}
Exec={}
Icon={}
Terminal=false
Categories={};
		]], {
			i(1), i(2), i(3), i(4), i(5),
		}))
})

ls.add_snippets('all', {
	s('ifname', fmt(
		[[
======================================================================
File: file
Link: link
======================================================================

		]], {
		}))
})
