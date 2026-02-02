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
" WINDOW / NAVIGATION
" ==================================================

" Close file (buffer)
nnoremap <C-w> :bd<CR>

" Toggle focus NERDTree <-> Editor
function! ToggleNERDTreeFocus()
  if exists("t:NERDTreeBufName")
    if bufname('%') == t:NERDTreeBufName
      wincmd p
    else
      NERDTreeFocus
    endif
  else
    NERDTree
  endif
endfunction
nnoremap <C-e> :call ToggleNERDTreeFocus()<CR>

" Toggle NERDTree open/close
nnoremap <C-b> :NERDTreeToggle<CR>

" Move between splits
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" ==================================================
" PLUGINS
" ==================================================
call plug#begin('~/.vim/plugged')

" CORE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wakatime/vim-wakatime'

" UI
Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'airblade/vim-gitgutter'

" SEARCH
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" SYNTAX
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'

" HTML / CSS
Plug 'mattn/emmet-vim'

" UTIL
Plug 'tpope/vim-commentary'
Plug 'sbdchd/neoformat'

call plug#end()

" ==================================================
" THEME (VS CODE)
" ==================================================
colorscheme codedark
set background=dark

" Transparent background
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE

" ==================================================
" STATUSLINE
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
let g:NERDTreeMinimalUI = 1

" ==================================================
" SEARCH
" ==================================================
nnoremap <C-p> :Files<CR>
nnoremap <C-S-f> :Rg<CR>

" ==================================================
" COMMENT
" ==================================================
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

" ==================================================
" FORMAT (NEOFORMAT + PRETTIER)
" ==================================================
nnoremap <S-A-f> :Neoformat<CR>

let g:neoformat_try_node_exe = 1
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_javascriptreact = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_typescriptreact = ['prettier']
let g:neoformat_enabled_html = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_json = ['prettier']
let g:neoformat_enabled_markdown = ['prettier']

" ==================================================
" MOVE LINE (ALT ↑ ↓)
" ==================================================
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" ==================================================
" EMMET (VS CODE BEHAVIOR)
" ==================================================
let g:user_emmet_install_global = 1
let g:user_emmet_leader_key = ','
let g:user_emmet_expandabbr_key = '<Tab>'

" ==================================================
" COC + EMMET (TAB PRIORITY)
" ==================================================
inoremap <silent><expr> <Tab>
      \ emmet#isExpandable() ? emmet#expandAbbrIntelligent("\<Tab>") :
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

" ==================================================
" INDENT GUIDE
" ==================================================
let g:indent_blankline_char = '│'

" ==================================================
" SHORTCUT HELP (Ctrl + H)
" ==================================================
function! ShowShortcuts()
  new
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal noswapfile
  setlocal nobuflisted
  setlocal nowrap
  setlocal filetype=help

  call setline(1, [
        \ '================ VIM SHORTCUTS =================',
        \ '',
        \ 'FILE',
        \ '  Ctrl + S        : Save file',
        \ '  Ctrl + W        : Close file',
        \ '  Ctrl + A        : Select all',
        \ '',
        \ 'NAVIGATION',
        \ '  Ctrl + B        : Toggle Explorer (NERDTree)',
        \ '  Ctrl + E        : Focus Explorer / Editor',
        \ '  Ctrl + P        : Quick open (Files)',
        \ '  Ctrl + Shift+F  : Global search',
        \ '',
        \ 'WINDOW',
        \ '  Ctrl + L        : Move to right split',
        \ '  Ctrl + J        : Move to bottom split',
        \ '  Ctrl + K        : Move to top split',
        \ '',
        \ 'EDITING',
        \ '  Ctrl + C        : Copy',
        \ '  Ctrl + V        : Paste',
        \ '  Ctrl + /        : Comment line / block',
        \ '',
        \ 'FORMAT',
        \ '  Shift + Alt + F : Format file',
        \ '',
        \ '================================================',
        \ '',
        \ 'Press q to close'
        \ ])

  nnoremap <buffer> q :q<CR>
endfunction

nnoremap <C-h> :call ShowShortcuts()<CR>
