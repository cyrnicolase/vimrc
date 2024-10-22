syntax on
filetype off
filetype plugin indent on

let mapleader = ","
let g:mapleader = ","

map <leader>t :tabnew<CR>
map <leader>x :bdelete<CR>
map <F4> :buffers<CR>
map <F7> :term<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <S-Tab> :bprev<CR>
nmap <Tab> :bnext<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
set visualbell
set t_vb=
set so=5
set shiftwidth=4
set tabstop=4
set softtabstop=4
set backspace=2
set laststatus=2

set fileformats=unix
set autoindent
set expandtab
set smarttab
set smartindent
set hlsearch
set ignorecase
set cursorline
set nobackup
set nocompatible

set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

