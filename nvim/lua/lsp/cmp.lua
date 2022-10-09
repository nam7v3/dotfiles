local cmp = require('cmp')

cmp.setup{
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end, 
	},

	window = {
		completion = {
			border = 'single',
		},
		documentation = {
			border = 'single',
		},
	},

	formatting = {
    format = require('lspkind').cmp_format{
      mode = 'text_symbol', 
      maxwidth = 50, 
      ellipsis_char = '...', 
    },
  },

	mapping = cmp.mapping.preset.insert{
		['<C-d>'] = cmp.mapping.scroll_docs(-10),
		['<C-f>'] = cmp.mapping.scroll_docs(10),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm{
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else 
				fallback()
			end
		end, {i, s}),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else 
				fallback()
			end
		end, {i, s}),
	},
	sources = {
		{name = 'luasnip'},
		{name = 'nvim_lsp'},
	},
}