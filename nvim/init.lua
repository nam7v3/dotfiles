require('ui')
require('opt')
require('hook')
require('keymap')
require('function')

vim.g.mapleader = ' '
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup('plugins')

vim.cmd[[colorscheme gruvbox]]
vim.cmd[[highlight Normal guibg=None]]
