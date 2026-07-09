-- ======================================================================
-- File: lua/config/luasnip/bash.lua
-- Link: https://github.com/L3MON4D3/LuaSnip
-- ======================================================================

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("sh", {
	s("bang", {
		t("#!/usr/bin/env bash")
	})
})
