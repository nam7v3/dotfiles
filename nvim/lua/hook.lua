vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.highlight.on_yank() end,
	desc = 'Briefly highlight yanked text',
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.nim',
  callback = function() vim.cmd[[retab]] end,
	desc = 'Convert tab to spaces',
})

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
