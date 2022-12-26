set nocompatible
filetype off

" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" call vundle#end()


" ################################################################################
" # ----------------------------      PLUGINS      ----------------------------- #
" ################################################################################


call plug#begin('~/.vim/plugged')

" (optional) for completion:
Plug 'hrsh7th/nvim-cmp'

" (optional) for :ObsidianSearch command unless you use telescope:
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" (optional) for :ObsidianSearch command if you prefer this over fzf.vim:
Plug 'nvim-telescope/telescope.nvim'

Plug 'epwalsh/obsidian.nvim'
Plug 'preservim/vim-markdown'

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'


" === LSP Plugins ===
Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-cmp'
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
Plug 'norcalli/nvim-colorizer.lua'
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
" Plug 'ayu-theme/ayu-vim'
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


" ################################################################################
" # --------------------------      COLORSCHEMES      -------------------------- #
" ################################################################################


" filetype plugin indent on
syntax on


" let ayucolor="mirage"
" colorscheme gruvbox
" colorscheme neon
" colorscheme sonokai
" colorscheme ayu
" colorscheme one 
" vim.cmd[[colorscheme neon]]

" let g:lightline = { 'colorscheme': 'darcula' }
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


lua require'colorizer'.setup()
