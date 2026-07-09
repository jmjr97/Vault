-- ======================================================================
-- File: lua/config/luasnip/python.lua
-- Link: https://github.com/L3MON4D3/LuaSnip
-- ======================================================================

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("python", {
	s("bang", {
		t("#!/usr/bin/env python3")
	})
})

ls.add_snippets('python', {
	s('ps6', fmt(
		[[
from PySide6.QtWidgets import QApplication, QMainWindow
from PySide6.QtCore import Qt

class MainWindow(QMainWindow):
	def __init__(self):
		super().__init__()
		self.setWindowTitle('{}')

app = QApplication()
window = MainWindow()
window.show()

app.exec()  # pyright:
		]], {
			i(1),
		}))
})

ls.add_snippets('python', {
	s('ifname', fmt(
		[[
if __name__ == '__main__':
	main()
		]], {
		}))
})
