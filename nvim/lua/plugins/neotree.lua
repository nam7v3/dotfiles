return {
	'nvim-neo-tree/neo-tree.nvim',
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	lazy = true,
	cmd = {'Neotree'},
	config = function()
		require('neo-tree').setup()
	end,
}
