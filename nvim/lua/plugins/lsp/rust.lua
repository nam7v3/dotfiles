return {
	'simrat39/rust-tools.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
	lazy = true,
	ft = 'rust',
	config = function ()
		local rt = require("rust-tools")
		local gloabal_on_attach = require('plugins.lsp.setting').on_attach
		rt.setup{
			server = {
				on_attach = function(_, bufnr)
					local bufopts = { noremap=true, silent=true, buffer=bufnr }
					gloabal_on_attach(client, bufnr)
					-- Rust specific function
					vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, bufopts)
					vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, bufopts)
				end,
			},
		}
	end
}
