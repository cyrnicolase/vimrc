""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-lsp-php
""""""""""""""""""""""""""""""""""""""""""""""""""""
" intelephense 由本文件手动注册，禁用 vim-lsp-settings 的同名注册避免相互覆盖
" filetype 默认服务器锁定为 intelephense，防止插件注册其他 php 服务器
let g:lsp_settings_filetype_php = 'intelephense'
let g:lsp_settings = get(g:, 'lsp_settings', {})
let g:lsp_settings['intelephense'] = get(g:lsp_settings, 'intelephense', {})
let g:lsp_settings['intelephense']['disabled'] = v:true

if executable('intelephense')
    function! s:RegisterIntelephense() abort
        " 防止 User lsp_setup 多次触发时重复注册覆盖运行中服务器（同 python.vim）
        if index(lsp#get_server_names(), 'intelephense') >= 0
            return
        endif
        call lsp#register_server({
            \ 'name': 'intelephense',
            \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
            \ 'allowlist': ['php'],
            \ 'initialization_options': {
            \     'storagePath': expand('~/.cache/intelephense'),
            \ },
            \ 'workspace_config': {
            \   'intelephense': {
            \     'files': {
            \       'maxSize': 1000000,
            \       'associations': ['*.php', '*.phtml'],
            \       'exclude': [],
            \     },
            \     'completion': {
            \       'insertUseDeclaration': v:true,
            \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
            \       'triggerParameterHints': v:true,
            \       'maxItems': 100,
            \     },
            \     'format': {
            \       'enable': v:true
            \     },
            \   },
            \ }
            \ })
    endfunction

    augroup LspPHPIntelephense
        au!
        au User lsp_setup call s:RegisterIntelephense()
        " 保存时自动格式化；服务器未就绪时命令内部会优雅跳过
        autocmd BufWritePre *.php call execute('LspDocumentFormatSync')
    augroup END
endif
