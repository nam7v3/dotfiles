
set nocompatible
filetype plugin on
filetype indent on
syntax on

set confirm

" Indent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent

" Display
colorscheme gruvbox8

" Dashboard
let g:dashboard_default_executive ='FZF'


let g:formatterpath = ['/usr/bin']

highlight CocErrorVirtualText ctermbg=235 ctermfg=203 gui=bold guifg=#fb4934 guibg=#282828
highlight CocWarningVirtualText ctermfg=208 ctermbg=237 gui=bold guifg=#fe8019 guibg=#282828
highlight CocInfoVirtualText  ctermfg=214 ctermbg=237 gui=bold guifg=#fabd2f guibg=#282828
highlight CocHintVirtualText ctermfg=109 ctermbg=237 gui=bold guifg=#83a598 guibg=#282828
highlight Normal guibg=none

set termguicolors

set showcmd
set nowrap
set number
set relativenumber
set ignorecase
set scrolloff=30
set sidescrolloff=16
set updatetime=300

" Window
set hidden

" Message
set showcmd
set ruler
set undofile
set undodir=~/.vim/undo/
set magic

" LSP
lua << EOF
  require('nvim-lsp-installer').setup{}

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  local lspconfig = require('lspconfig')
  local servers = {'asm_lsp','bashls','pyright','rust_analyzer','vimls','clangd','cmake','sumneko_lua'}

  local opts = { noremap=true, silent=true }
  vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

  local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      }
    }
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
    },
  }
  require'nvim-treesitter.configs'.setup {
      ensure_installed = { "c", "lua", "rust" },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
EOF

" Leader
let mapleader = " "

" Vimwiki
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}

let g:vimwiki_list = [wiki]

" Dashboard
let g:dashboard_custom_header = [
      \'███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
      \'████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
      \'██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
      \'██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
      \'██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
      \'╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
      \]

let g:dashboard_custom_footer = [
      \'"Have will then should"',
      \'                Sun Tzu',
  \
highlight dashboardHeader gui=bold guifg=#fe8019
highlight dashboardFooter gui=bold,italic guifg=#fabd2f
highlight dashboardShortCut gui=bold guifg=#cc241d
highlight dashboardCenter gui=bold guifg=#8ec07c

" FZF
nmap <silent> <leader>ss :<C-u>SessionSave<CR>
nmap <silent> <leader>sl :<C-u>SessionLoad<CR>
nmap <silent> <leader>cn :<C-u>DashboardNewFile<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>tc :Colors<CR>
nnoremap <silent> <leader>fa :Rg<CR>
nnoremap <silent> <leader>fb :Marks<CR>



" Normal
nnoremap H 0
nnoremap L $
nnoremap Q <Nop>

nnoremap <silent> <C-Q> :let @/ = ""<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" move line up down
nnoremap _ kddpk

" init.nvim
nnoremap - ddp
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

nnoremap <leader>i" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>i' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>"" 0i"<esc>$a"<esc>
nnoremap <leader>'' 0i'<esc>$a'<esc>

nnoremap <silent> <leader>n :bn<CR>
nnoremap <silent> <leader>p :bp<CR>
nnoremap <silent> <leader>x :bdelete<CR>

" Visual
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>

" Insert
inoremap <c-u> <c-o>g~iw
inoremap <c-d> <c-o>d
inoremap jk <esc>
inoremap Jk <esc>
inoremap jK <esc>
inoremap JK <esc>

" Format code
nnoremap <leader>af :Autoformat<CR>

" NERDTree
nnoremap <leader>v :NERDTreeToggle<Cr>

" Terminal
nnoremap <leader>t :ToggleTerm<Cr>
tnoremap <esc> <C-\><C-N>

" Coc.nvim
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead,BufNewFile *.nasm,*.asm set filetype=nasm
" autocmd BufWritePre *.c,*.cpp,*.rs,*.py,*sh normal gg=G<C-o>

autocmd BufWritePre *.c :Autoformat

