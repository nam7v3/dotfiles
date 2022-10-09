local lspconfig = require('lspconfig')
local au = require('util.au')
local api = vim.api
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities  = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = {
	'clangd',
	'gopls',
	'rust_analyzer',
	'sumneko_lua',
}

require('lsp.cmp')


local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<Leader>fr', function() vim.lsp.buf.format { async = true } end, bufopts)
  vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, bufopts)
	vim.keymap.set('n', '<Leader>ca', function ()
		vim.lsp.buf.code_action()
	end)
end


for _, server in ipairs(servers) do
	lspconfig[server].setup{
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

vim.cmd[[sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticSignError ]]
vim.cmd[[sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticSignWarn ]]
vim.cmd[[sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticSignInfo ]]
vim.cmd[[sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticSignHint ]]

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = true,
	severity_sort = true,

	float = {
		scope = 'buffer',
		focus = false,
		focusable = false,
		border = 'single',
		header = "",
		prefix = function(diagnostic, i, total)
			if diagnostic.severity == vim.diagnostic.severity.ERROR then
				return "Error: ", "DiagnosticSignError"
			elseif diagnostic.severity == vim.diagnostic.severity.WARN then
				return "Warning: ", "DiagnosticSignWarn"
			elseif diagnostic.severity == vim.diagnostic.severity.INFO then
				return "Info: ", "DiagnosticSignInfo"
			else
				return "Hint: ", "DiagnosticSignHint"
			end
		end,
		zindex = 50,
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
 vim.lsp.handlers.hover, {
	 	border = "single",
		focus = false,
		focusable = false,
	 	zindex = 90,
 }
)

au.augroup('LSPHooks',
{
	{
		event = {'CursorHold', 'CursorHoldI'},
		callback = function ()
			if not require('cmp').visible() then
				vim.diagnostic.open_float({
					scope = 'cursor',
				})
			end
		end
	}
})

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup({
on_attach = on_attach,
settings = {
    Lua = {
    runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path,
    },
    diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
    },
    workspace = {
        -- Make the server aware of Neovim runtime files
        library = api.nvim_get_runtime_file("", true),
    },
    -- Do not send telemetry data containing a randomized but unique identifier
    telemetry = {
        enable = false,
    },
    },
},
})
