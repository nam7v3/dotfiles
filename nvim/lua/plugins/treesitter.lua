return {
	'nvim-treesitter/nvim-treesitter',
  lazy = false,
	build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
	end,
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensured_installed = { 'c', 'rust', 'python', 'lua', 'help'}
    }
  end
}
