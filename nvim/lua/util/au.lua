local M = {}
local api = vim.api;

function M.augroup(group, autocmds)
	api.nvim_create_augroup(group, {})
	for k, v in pairs(autocmds) do
		local event = v.event
		v.event = nil
		v.group = group
		api.nvim_create_autocmd(event, v)
	end
end

function M.autocmd(autocmd)
	local event = autocmd.event
	autocmd.event = nil
	api.nvim_create_autocmd(event, autocmd)
end

return M
