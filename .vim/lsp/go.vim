""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-lsp-go
""""""""""""""""""""""""""""""""""""""""""""""""""""
" gopls 由本文件手动注册，禁用 vim-lsp-settings 的同名注册避免相互覆盖
" filetype 默认服务器锁定为 gopls，防止插件注册其他 go 服务器
" vim-go 自带内部 LSP 客户端（默认也会拉起 gopls -remote=auto 及共享守护进程），
" 与 vim-lsp 的 gopls 并行会双服务器、重复诊断，统一关闭，gopls 只由 vim-lsp 管理
let g:go_gopls_enabled = 0
let g:lsp_settings_filetype_go = 'gopls'
let g:lsp_settings = get(g:, 'lsp_settings', {})
let g:lsp_settings['gopls'] = get(g:lsp_settings, 'gopls', {})
let g:lsp_settings['gopls']['disabled'] = v:true

if executable('gopls')
    function! s:RegisterGopls() abort
        " 防止 User lsp_setup 多次触发时重复注册覆盖运行中服务器（同 python.vim）
        if index(lsp#get_server_names(), 'gopls') >= 0
            return
        endif
        call lsp#register_server({
            \ 'name': 'gopls',
            \ 'cmd': {server_info->['gopls']},
            \ 'allowlist': ['go', 'gomod', 'gohtmltmpl', 'gotexttmpl'],
            \ 'initialization_options': {
            \     'completeUnimported': v:true,
            \     'matcher': 'fuzzy',
            \     'codelenses': {
            \         'generate': v:true,
            \         'test': v:true,
            \     },
            \ },
            \ })
    endfunction

    augroup LspGoGopls
        au!
        au User lsp_setup call s:RegisterGopls()
        " 保存时自动整理 imports 并格式化（先整理后格式化，保证最终格式一致）
        autocmd BufWritePre *.go
            \ call execute(['LspCodeActionSync source.organizeImports', 'LspDocumentFormatSync'])
    augroup END
endif
