return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	cmd = {
		'Mason',
		'MasonInstall',
		'MasonUninstall',
		'LspInstall',
		'LspUninstall'
	},
	config = function()
		require("mason").setup()
	end,
}
