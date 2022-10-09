local M = {}
local api = vim.api

function M.open_vimrc() 
	local vimrc_buffer = api.nvim_create_buf(false, false)
	local vimrc_window = api.nvim_open_win(vimrc_buffer, true, {
		relative = 'editor',
		border = 'solid',
		width = math.ceil(vim.o.columns / 2),
		height = vim.o.lines,
		row = 0,
		col = math.ceil(vim.o.columns / 4),
		focusable = true,
	})
	api.nvim_win_call(vimrc_window, function()
		vim.cmd[[edit $MYVIMRC]]
	end)
end

return M
