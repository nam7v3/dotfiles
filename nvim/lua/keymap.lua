local keymap = vim.keymap
local api = vim.api
local func = require('function')

-- Window navigation
keymap.set('n', '<C-J>', '<C-W>j')
keymap.set('n', '<C-K>', '<C-W>k')
keymap.set('n', '<C-L>', '<C-W>l')
keymap.set('n', '<C-H>', '<C-W>h')

-- Insert mode navigation
keymap.set('i', 'jk', '<ESC>')
keymap.set('i', '<C-h>', '<C-O>h')
keymap.set('i', '<C-j>', '<C-O>j')
keymap.set('i', '<C-k>', '<C-O>k')
keymap.set('i', '<C-l>', '<C-O>l')
keymap.set('i', '<C-d>', '<C-O>x')

-- Navigation 
keymap.set('n', 'L', '$')
keymap.set('n', 'H', '^')
keymap.set('o', 'L', '$')
keymap.set('o', 'H', '^')

-- Searching 
keymap.set('n', '<C-q>', function () vim.cmd[[let @/=""]] end)

-- VIMRC
keymap.set('n', '<Leader>rc', func.open_vimrc)

keymap.set('n', '<Leader>so', function () 
	vim.cmd[[source $MYVIMRC]]
end)

-- FZF
keymap.set('n', '<Leader>ff', function()
	vim.cmd[[Files]]
end)

keymap.set('n', '<Leader>fb', function()
	vim.cmd[[Buffers]]
end)

keymap.set('n', '<Leader>fw', function()
	vim.cmd[[Rg]]
end)

keymap.set('n', '<Leader>fm', function()
	vim.cmd[[Maps]]
end)
