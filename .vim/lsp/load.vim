""""""""""""""""""""""""""""""""""""""""""""""""""""
" lsp loader
" 动态加载 lsp 目录下所有 .vim 配置文件（排除 load.vim 自身）
" 新增语言 LSP 配置时，只需在此目录添加对应文件
"
" 服务器在 User lsp_setup 事件中注册：vim-lsp 在 VimEnter 时
" lsp#enable() 会补发该事件，并遍历已打开的 buffer 触发 did_open，
" 因此 vim 直接打开文件启动时 LSP 也能正常拉起，无需额外补偿
""""""""""""""""""""""""""""""""""""""""""""""""""""
for s:file in split(glob('~/.vim/lsp/*.vim'), '\n')
    if fnamemodify(s:file, ':t') !=# 'load.vim'
        execute 'source' fnameescape(s:file)
    endif
endfor
