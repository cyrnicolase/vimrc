" 必须最先设置：vim -u 方式启动时 Vim 不会自动进入 nocompatible，
" 兼容模式下 cpoptions 含 C 标志，会导致 gruvbox 等脚本的续行(\)解析失败
set nocompatible

syntax on
filetype plugin indent on

let mapleader = ","

nnoremap <leader>t :tabnew<CR>
nnoremap <leader>x :bdelete<CR>
nnoremap <F4> :buffers<CR>
nnoremap <F7> :term<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <S-Tab> :bprev<CR>
nmap <Tab> :bnext<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" location list / quickfix 窗口内按 Esc 直接关闭
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:CloseListWindow() abort
    " 根据窗口类型区分 location list 与 quickfix
    if get(getwininfo(win_getid()), 0, {'loclist': 0}).loclist
        lclose
    else
        cclose
    endif
endfunction

augroup QfEscapeClose
    au!
    autocmd FileType qf nnoremap <buffer> <silent> <Esc> :call <SID>CloseListWindow()<CR>
augroup END

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
set hlsearch
set ignorecase
set cursorline
set nobackup
set noswapfile

set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

