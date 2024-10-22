""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-lsp-go
""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-remote=auto']},
        \ 'allowlist': ['go', 'gomod'],
        \ })
    autocmd BufWritePre *.go 
        \ call execute('LspDocumentFormatSync') | call execute('LspCodeActionSync source.organizeImports')
endif
