vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use) 
	use 'wbthomason/packer.nvim'
	use 'junegunn/fzf.vim'
	use 'junegunn/fzf'

	use 'morhetz/gruvbox'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- LSP
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'onsails/lspkind.nvim'
end)

require('config.mason')
require('config.lualine')
require('config.fzf')
