local lspconfig = require('lspconfig')
local lsp_installer = require('nvim-lsp-installer')
local capabilities = vim.lsp.protocol.make_client_capabilities()
local keymap = vim.keymap
local api = vim.api
local buf = vim.lsp.buf

capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
lsp_installer.setup {}

--- Configurations ---

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config {
  underline = false,
  update_in_insert = true,
  virtual_text = {
    prefix = '●',
  },
  float = {
    source = "always",
  },
}

-- LSP servers defaul_config
function on_attach(client, bufnr)
  local opts = { buffer = bufnr, silent = true }
  api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  keymap.set('n', 'gD', function() buf.declaration() end, opts)
  keymap.set('n', 'gd', function() buf.definition() end, opts)
  keymap.set('n', 'K', function() buf.hover() end, opts)
  keymap.set('n', 'gi', function() buf.implementation() end, opts)
  keymap.set('n', '<C-k>', function() buf.signature_help() end, opts)
  keymap.set('n', '<Space>wa', function() buf.add_workspace_folder() end, opts)
  keymap.set('n', '<Space>wr', function() buf.remove_workspace_folder() end, opts)
  keymap.set('n', '<Space>wl', function() print(vim.inspect(buf.list_workspace_folders())) end, opts)
  keymap.set('n', '<Space>D', function() buf.type_definition() end, opts)
  keymap.set('n', '<Space>rn', function() buf.rename() end, opts)
  keymap.set('n', '<Space>ca', function() buf.code_action() end, opts)
  keymap.set('n', 'gr', function() buf.references() end, opts)
  keymap.set('n', '<Space>fm', function() buf.formatting() end, opts)

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })
end

lspconfig.util.default_config = vim.tbl_extend(
  "force",
  lspconfig.util.default_config,
  {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }
)

-- Servers specific configurations

require("rust-analyzer")

for _, lsp in ipairs(lsp_installer.get_installed_servers()) do
  lspconfig[lsp.name].setup {}
end


local luasnip = require 'luasnip'
local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'orgmode' },
  },
}

require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
        rainbow = {
          enable = true,
          extended_mode = true,
        }
  },
}
