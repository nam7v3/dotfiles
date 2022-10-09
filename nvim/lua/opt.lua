local opt = vim.opt

vim.g.mapleader = " "

-- Appearance
vim.g.gruvbox_contrast_dark = "hard"
vim.cmd[[colorscheme gruvbox]]
opt.number = true
opt.relativenumber = true
opt.statusline = ""
opt.cursorline = true
opt.cursorlineopt = "number"

-- Indentation
opt.shiftwidth = 2
opt.tabstop = 2
opt.formatoptions = "tq2c"

opt.updatetime = 750
opt.autochdir = true
