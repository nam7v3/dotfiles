return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		require('telescope').setup()

		vim.api.nvim_create_autocmd( 'LspAttach', {
			callback = function(args)
				local bufopts = {silent=true, buffer = args.buf}
				vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', bufopts)
				vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', bufopts)
				vim.keymap.set('n', '<space>D',  '<cmd>Telescope lsp_type_definitions<cr>', bufopts)
				vim.keymap.set('n', 'gr',   '<cmd>Telescope lsp_references<cr>', bufopts)
				vim.keymap.set('n', '<leader>ws',   '<cmd>Telescope lsp_workspace_symbols<cr>', bufopts)
			end,
		})
	end,
	cmd = {'Telescope'},
	keys = {
		{'<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find file'},
		{'<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Grep'},
		{'<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find buffer'},
		{'<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Find help'},
		{'<leader>fr', '<cmd>Telescope registers<cr>', desc = 'Find register'},
		{'<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Find keymap'},
		{'<leader>gc', '<cmd>Telescope git_commits<cr>', desc = 'Git commits'},
		{'<leader>gb', '<cmd>Telescope git_branches<cr>', desc = 'Git branches'},
		{'<leader>gs', '<cmd>Telescope git_status<cr>', desc = 'Git status'},
	}
}
