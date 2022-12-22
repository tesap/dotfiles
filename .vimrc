set nocompatible
filetype off

" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" call vundle#end()


" ################################################################################
" # ----------------------------      PLUGINS      ----------------------------- #
" ################################################################################


call plug#begin('~/.vim/plugged')

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'


" === LSP Plugins ===
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
" === +++ ===

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer' }

Plug 'neovimhaskell/haskell-vim'

" Plug 'preservim/nerdtree'
" Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
" Plug 'Yggdroot/indentLine'

Plug 'godlygeek/tabular'

Plug 'itchyny/lightline.vim'
" Plug 'ap/vim-css-color'
" Plug 'skammer/vim-css-color'

" Plug 'PotatoesMaster/i3-vim-syntax'
" Plug 'kovetskiy/sxhkd-vim'

" --- LATEX ---
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex'

" --- MARKDOWN ---
" Plug 'vimwiki/vimwiki' " Useless funcs


Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dkarter/bullets.vim'
" Plug 'plasticboy/vim-markdown' " Folding + Styles

" Plug 'masukomi/vim-markdown-folding' " Folding
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" --- THEMES ---
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'liuchengxu/space-vim-dark'
Plug 'sainnhe/sonokai' 
Plug 'nanotech/jellybeans.vim' , {'as': 'jellybeans'}
Plug 'morhetz/gruvbox'

Plug 'matze/vim-move'
Plug 'ifsmirnov/vim-searchindex'
" Plug 'RRethy/vim-illuminate'
Plug 'rafamadriz/neon'

call plug#end()



nnoremap ,<space> :nohlsearch<CR>
" nnoremap H :bn<CR>
" nnoremap H :gw<CR>
nnoremap H :bd<CR>


" ################################################################################
" # ------------------------------      LSP      ------------------------------- #
" ################################################################################


lua << EOF
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  completion = {
    -- autocomplete = true
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    -- ['<CR>'] = cmp.mapping.confirm {
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
EOF




lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer' }
local servers = { 'pyright', 'ccls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF


" ################################################################################
" # --------------------------      COLORSCHEMES      -------------------------- #
" ################################################################################


" filetype plugin indent on
syntax on


let ayucolor="mirage"
" colorscheme gruvbox
" colorscheme neon
colorscheme sonokai
" colorscheme ayu
" colorscheme one 
" vim.cmd[[colorscheme neon]]

let g:lightline = { 'colorscheme': 'darcula' }
set laststatus=2

" ################################################################################
" # -----------------------------      LATEX      ------------------------------ #
" ################################################################################

" let g:livepreview_previewer = 'xreader'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" ################################################################################
" # ----------------------------      MARKDOWN      ---------------------------- #
" ################################################################################

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:mkdp_markdown_css='/home/st/.vim/github-markdown.css'

nmap <silent> <F8> <Plug>MarkdownPreview
imap <silent> <F8> <Plug>MarkdownPreview
nmap <silent> <F9> <Plug>StopMarkdownPreview
imap <silent> <F9> <Plug>StopMarkdownPreview
nmap <silent> <F10> <Plug>TableFormat
imap <silent> <F10> <Plug>TableFormat

"Markdown block code
au FileType markdown :vmap \q di~~~<ENTER>~~~<ESC>P
au FileType markdown nmap <leader>q ddi~~~<ENTER>~~~<ENTER><ESC>kP

"Markdown italiq
au FileType markdown :vmap \i di**<ESC>hp
au FileType markdown nmap <leader>i diwi**<ESC>hp

"Markdown bold
au FileType markdown :vmap \b di****<ESC>hhp
au FileType markdown nmap <leader>b diwi****<ESC>hhp

set conceallevel=2

" ################################################################################
" # --------------------------      KEYBINDINGS      --------------------------- #
" ################################################################################

inoremap jk <Esc>
"" vnoremap jk <Esc> 

map <C-_> :Commentary<CR>
"" map <C-n> :NERDTreeToggle<CR>

map <C-t> :tabnew<CR>
nnoremap td  :tabclose<CR>
"" nnoremap H gT
nnoremap L gt

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

autocmd StdinReadPre * let s:std_in=1
"" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:move_key_modifier = 'C'
" let g:ycm_add_preview_to_completeopt = 0 

set nu " rnu
" set nowrap
set mouse=a
set cursorline
set clipboard=unnamed
set scrolloff=3 sidescroll=1 sidescrolloff=10
set completeopt-=preview noshowmode

set confirm equalalways
" set fdm=syntax

if has("nvim") 
  set inccommand=split
endif

" ################################################################################
" # --------------------------      INDENTATION      --------------------------- #
" ################################################################################

nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" inoremap <S-Tab> <C-D>

set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent
set backspace=indent,eol,start whichwrap+=<,>,[,]


" ################################################################################
" # -----------------------------      OTHER      ------------------------------ #
" ################################################################################

set ignorecase
set smartcase
" set noincsearch
set autoread
set wildmenu

set nobackup
set noswapfile
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf8,cp1251

if has('termguicolors')
  set termguicolors
endif
