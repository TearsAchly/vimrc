" ==================================================
" BASIC
" ==================================================
set nocompatible
filetype plugin indent on
syntax on

set number
set norelativenumber
set cursorline
set mouse=a
set clipboard=unnamedplus
set termguicolors
set signcolumn=yes
set updatetime=300

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

set ignorecase
set smartcase

set splitbelow
set splitright

let mapleader=" "

" ==================================================
" KEYMAP (VS CODE STYLE)
" ==================================================
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

inoremap jk <ESC>

vnoremap <C-c> "+y
nnoremap <C-c> :%y+<CR>
nnoremap <C-v> "+p
inoremap <C-v> <C-r>+

nnoremap <C-a> ggVG

" ==================================================
" PLUGINS
" ==================================================
call plug#begin('~/.vim/plugged')

" === CORE ===
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " AUTOCOMPLETE / LSP
Plug 'wakatime/vim-wakatime'

" === UI ===
Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'airblade/vim-gitgutter'

" === SEARCH ===
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" === SYNTAX (REGEX, STABLE) ===
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'

" === HTML / CSS SPEED ===
Plug 'mattn/emmet-vim'

" === UTIL ===
Plug 'tpope/vim-commentary'
Plug 'sbdchd/neoformat'

call plug#end()

" ==================================================
" THEME
" ==================================================
colorscheme codedark
set background=dark

" ==================================================
" STATUS LINE (VS CODE FEEL)
" ==================================================
let g:lightline = {
  \ 'colorscheme': 'codedark',
  \ 'active': {
  \   'left': [ ['mode'], ['filename'] ],
  \   'right': [ ['lineinfo'], ['percent'], ['filetype'] ]
  \ }
\}

" ==================================================
" FILE EXPLORER
" ==================================================
nnoremap <C-b> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeAutoRefresh = 1

" ==================================================
" SEARCH (VS CODE STYLE)
" ==================================================
nnoremap <C-p> :Files<CR>
nnoremap <C-S-f> :Rg<CR>

" ==================================================
" COMMENT
" ==================================================
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

" ==================================================
" FORMAT (SHIFT + ALT + F)
" ==================================================
nnoremap <S-A-f> :Neoformat<CR>
let g:neoformat_try_node_exe = 1

" ==================================================
" MOVE LINE (ALT UP / DOWN)
" ==================================================
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" ==================================================
" EMMET
" ==================================================
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascriptreact,typescriptreact EmmetInstall

" contoh:
" div.card>h1+p*2 lalu tekan ,,

" ==================================================
" INDENT GUIDE
" ==================================================
let g:indent_blankline_char = '│'

" ==================================================
" COC (AUTOCOMPLETE CONFIG)
" ==================================================
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-Tab>
      \ coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR>
      \ coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
