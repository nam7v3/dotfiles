local keymap = vim.keymap

local opts = {silent = true}

keymap.set('n', "<leader>d", ":Ex<CR>",{desc = "Open netrw"})

keymap.set('n', '<M-j>', ':bnext<CR>', {desc = "Next buffer"})
keymap.set('n', '<M-k>', ':bprevious<CR>', {desc = "Prev buffer"})

keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')


-- Window down
keymap.set('n', '<C-J>', '<C-W>j')
keymap.set('n', '<C-K>', '<C-W>k')
keymap.set('n', '<C-L>', '<C-W>l')
keymap.set('n', '<C-H>', '<C-W>h')

-- Visual mode
keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", {desc = "Shift region up"})
keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", {desc = "Shift region down"})

keymap.set('v', 'g(', '<Esc>`<i(<Esc>`>a)<Esc>')
keymap.set('v', 'g[', '<Esc>`<i[<Esc>`>a]<Esc>')
keymap.set('v', 'g{', '<Esc>`<i{<Esc>`>a}<Esc>')
keymap.set('v', 'g<', '<Esc>`<i<<Esc>`>a><Esc>')
keymap.set('v', 'g"', '<Esc>`<i"<Esc>`>a"<Esc>')
keymap.set('v', "g'", "<Esc>`<i'<Esc>`>a'<Esc>")
keymap.set('v', "g'", "<Esc>`<i'<Esc>`>a'<Esc>")

-- Navigation
keymap.set({'n', 'o', 'v'}, 'L', '$')
keymap.set({'n', 'o', 'v'}, 'H', '^')

-- Editting
keymap.set("n", "J", "mzJ`z")

-- Command line editting
keymap.set('c', '<C-a>', '<Home>')
keymap.set('c', '<C-e>', '<End>')
keymap.set('c', '<C-d>', '<Del>')
keymap.set('c', '<C-n>', '<Down>')
keymap.set('c', '<C-p>', '<Up>')
keymap.set('c', '<C-f>', '<Right>')
keymap.set('c', '<C-b>', '<Left>')
keymap.set('c', '<M-b>', '<S-Left>')
keymap.set('c', '<M-f>', '<S-Right>')

-- Searching
keymap.set('n', '<C-q>', function() vim.cmd [[nohlsearch]] end)

-- Diagnostic
keymap.set('n', '<leader>e', function() vim.diagnostic.open_float() end, opts)
keymap.set('n', '[e', vim.diagnostic.goto_prev, opts)
keymap.set('n', ']e', vim.diagnostic.goto_next, opts)
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Fast clipboard
keymap.set({'n', 'v'}, "<leader>y", [["+y]])
keymap.set({'n', 'v'}, "<leader>Y", [["+Y]])
keymap.set({'n', 'v'}, "<leader>p", [["+p]])
keymap.set({'n', 'v'}, "<leader>P", [["+P]])
