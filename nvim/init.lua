--- Init.lua ---
local api = vim.api
local keymap = vim.keymap
local key = vim.key
local opt = vim.opt
local home = os.getenv('HOME')
local fn = vim.fn


require("plugins")
-- require('code-action')
-- require("lsp")
-- require("neovide")

---- OPTIONS ----

-- Indent
opt.confirm = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true

-- Configs
opt.mouse = 'a'
opt.autoread = true
opt.autochdir = true
opt.number = true
opt.relativenumber = true
opt.showcmd = true
opt.wrap = false
opt.ignorecase = true
opt.scrolloff = 30
opt.sidescrolloff = 16
opt.updatetime = 300
opt.undofile= true
opt.undodir= home .. '/.vim/undo/'
opt.hidden = true
opt.termguicolors = true
opt.ruler = true
opt.magic = true
opt.guifont = 'Fira_Code,Hack,Noto_Color_Emoji:h10:b'

opt.updatetime = 300
opt.signcolumn = "yes"



-- Appearance
api.nvim_command [[colorscheme gruvbox8]]
api.nvim_command [[highlight CocErrorVirtualText ctermbg=235 ctermfg=203 gui=bold guifg=#fb4934 guibg=#282828]]
api.nvim_command [[highlight CocWarningVirtualText ctermfg=208 ctermbg=237 gui=bold guifg=#fe8019 guibg=#282828]]
api.nvim_command [[highlight CocInfoVirtualText  ctermfg=214 ctermbg=237 gui=bold guifg=#fabd2f guibg=#282828]]
api.nvim_command [[highlight CocHintVirtualText ctermfg=109 ctermbg=237 gui=bold guifg=#83a598 guibg=#282828]]
api.nvim_command [[highlight dashboardHeader gui=bold guifg=#fe8019]]
api.nvim_command [[highlight dashboardFooter gui=bold,italic guifg=#fabd2f]]
api.nvim_command [[highlight dashboardShortCut gui=bold guifg=#cc241d]]
api.nvim_command [[highlight dashboardCenter gui=bold guifg=#8ec07c]]
api.nvim_command [[highlight Normal guibg=#1a1817]]

-- Variables
vim.g.dashboard_default_executive ='fzf'
vim.g.dashboard_custom_header = {
  '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
  '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
  '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
  '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
  '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
  '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
}

vim.g.dashboard_custom_footer = {
  '"Have will then should"',
  '                Sun Tzu',
}
vim.g.mapleader = " "

vim.g.registers_paste_in_normal_mode = 1

---- KEYMAPS ----


-- Movements
keymap.set('n', 'H', '^')
keymap.set('n', 'L', '$')
keymap.set('v', 'H', '^')
keymap.set('v', 'L', '$')
keymap.set('o', 'H', '^')
keymap.set('o', 'L', '$')
keymap.set('i', 'jk', '<esc>')
keymap.set('i', 'JK', '<esc>')
keymap.set('i', 'jK', '<esc>')
keymap.set('i', 'Jk', '<esc>')

-- Terminal mode
keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Window
keymap.set('n', '<C-J>', '<C-W><C-J>')
keymap.set('n', '<C-K>', '<C-W><C-K>')
keymap.set('n', '<C-L>', '<C-W><C-L>')
keymap.set('n', '<C-H>', '<C-W><C-H>')

-- Buffer
keymap.set('n', '<leader>n', function () api.nvim_command[[bnext]] end)
keymap.set('n', '<leader>p', function () api.nvim_command[[bprevious]] end)
keymap.set('n', '<leader>x', function () api.nvim_command[[bdelete]] end)

-- Selection
keymap.set('n', '<C-q>', function () api.nvim_command[[let @/ = ""]] end, {silent = true})

-- Utils
keymap.set('n', '-', 'ddp')
keymap.set('n', '_', 'kddpk')
keymap.set('n', '<leader>o', 'o<esc>')
keymap.set('n', '<leader>O', 'O<esc>')


-- Vimrc
keymap.set('n', '<leader>ev', function () api.nvim_command[[vsplit $MYVIMRC]] end)
keymap.set('n', '<leader>so', function () api.nvim_command[[source $MYVIMRC]] end)

-- LSP
keymap.set('n', '<space>er', function() vim.diagnostic.open_float() end ,{silent = true})
keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end ,{silent = true})
keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end ,{silent = true})
keymap.set('n', '<space>q', function() vim.diagnostic.setloclist() end ,{silent = true})

--- Plugins

-- Nerdtree
keymap.set('n', '<leader>tt', function () api.nvim_command[[NvimTreeToggle]] end)
keymap.set('n', '<leader>tr', function () api.nvim_command[[NvimTreeRefresh]] end)


-- FZF
keymap.set('n', '<leader>ss', function () api.nvim_command[[SessionSave]]end, {silent = true})
keymap.set('n', '<leader>sl', function () api.nvim_command[[SessionLoad]]end, {silent = true})
keymap.set('n', '<leader>cn', function () api.nvim_command[[DashboardNewFile]]end, {silent = true})
keymap.set('n', '<leader>fh', function () api.nvim_command[[History]]end, {silent = true})
keymap.set('n', '<leader>ff', function () api.nvim_command[[Files]]end, {silent = true})
keymap.set('n', '<leader>tc', function () api.nvim_command[[Colors]]end, {silent = true})
keymap.set('n', '<leader>fw', function () api.nvim_command[[Rg]]end, {silent = true})
keymap.set('n', '<leader>fb', function () api.nvim_command[[Marks]]end, {silent = true})

-- Hop
local hop = require('hop')
local hop_hint = require('hop.hint')
keymap.set('n', 'f', function() hop.hint_char1({ direction = hop_hint.HintDirection.AFTER_CURSOR, current_line_only = true }) end, {})
keymap.set('n', 'F', function() hop.hint_char1({ direction = hop_hint.HintDirection.BEFORE_CURSOR, current_line_only = true }) end, {})
keymap.set('o', 'f', function() hop.hint_char1({ direction = hop_hint.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true }) end, {})
keymap.set('o', 'F', function() hop.hint_char1({ direction = hop_hint.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true }) end, {})
keymap.set('' , 'T', function() hop.hint_char1({ direction = hop_hint.HintDirection.BEFORE_CURSOR, current_line_only = true }) end, {})
keymap.set('' , 't', function() hop.hint_char1({ direction = hop_hint.HintDirection.AFTER_CURSOR, current_line_only = true }) end, {})
keymap.set('n', '<leader>fl', function() hop.hint_lines() end, {})

-- Coc
--
vim.cmd[[
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <leader>cl  <Plug>(coc-codelens-action)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocActionAsync('format')

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
]]

---- HOOKS ----
api.nvim_create_autocmd('BufWritePre', {pattern = '*', command = [[:%s/\s\+$//e]]})
api.nvim_create_autocmd('FileType', {pattern = 'm', command = [[:set colorcolumn=80]]})
-- api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {callback = function() code_action.code_action_listener()  end})
