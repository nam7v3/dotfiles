local au = require("util.au")
local keymap = vim.keymap
local opt = vim.opt
local highlight = vim.highlight

au.augroup("BufInitSettings" ,{
{
	event = "BufEnter",
	group = "BufInitSettings",
	pattern = "*",
	callback = function() 
		opt.formatoptions:remove("o")
		opt.formatoptions:remove("c")
		opt.formatoptions:remove("r")
	end
},
{
	event = "TextYankPost",
	pattern = "*",
	callback = function()
		highlight.on_yank {higroup="IncSearch", timeout=150}
	end
}})

