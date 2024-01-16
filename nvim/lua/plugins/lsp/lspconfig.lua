return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/nvim-cmp',
  },
  lazy = true,
  cmd = "LspStart",
  init = function()
  end,
  config = function()
    local on_attach = require('plugins.lsp.setting').on_attach
    local lspconfig = require("lspconfig")
    require("mason-lspconfig").setup_handlers {
      function(server_name) -- default handler (optional)
        if lspconfig[server_name] then
          lspconfig[server_name].setup {
            on_attach = on_attach,
          }
        end
      end,
    }
    -- Server that is not supported by mason
    local servers_name = { }

    for _, name in ipairs(servers_name) do
      lspconfig[name].setup {
        on_attach = on_attach,
      }
    end
  end,
}
