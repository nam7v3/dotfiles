return require("packer").startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'glepnir/dashboard-nvim'
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
  use 'ryanoasis/vim-devicons'
  use 'ap/vim-css-color'
  use 'lifepillar/vim-gruvbox8'
  use { 'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end }
  use { 'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {
        disable_filetype = {"scheme", "lisp"},
        disable_in_macro = true,
        disable_in_visualblock = true,
        map_cr = true
      }
    end
  }
  use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  config = function()
    require("nvim-tree").setup()
  end}
  use 'tpope/vim-fugitive'
  use 'p00f/nvim-ts-rainbow'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSupdate'}
  use 'junegunn/fzf.vim'
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = { theme = 'gruvbox_dark' }
      }
    end
  }
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'tversteeg/registers.nvim'
  use { 'phaazon/hop.nvim',
    branch = 'v1',
    config = function()
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
end)
