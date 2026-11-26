""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-lsp-python
""""""""""""""""""""""""""""""""""""""""""""""""""""
" pylsp 由本文件手动注册，禁用 vim-lsp-settings 的同名注册避免相互覆盖
" （否则 black/isort 的 workspace_config 会被插件默认配置覆盖丢失）
" filetype 默认服务器锁定为 pylsp，防止插件注册其他 python 服务器（如 pyls-all）
let g:lsp_settings_filetype_python = 'pylsp'
let g:lsp_settings = get(g:, 'lsp_settings', {})
let g:lsp_settings['pylsp'] = get(g:lsp_settings, 'pylsp', {})
let g:lsp_settings['pylsp']['disabled'] = v:true

if executable('pylsp')
    " isort 插件依赖 pylsp-isort 包（PyPI 暂无 Python 3.14 兼容版本），
    " 待上游支持后执行 pip install pylsp-isort 即可启用 import 排序
    function! s:RegisterPylsp() abort
        " User lsp_setup 会被 lsp#enable()、vim-lsp-settings 懒加载等多次触发；
        " register_server 对同名服务器是整体覆盖（lsp_id 归零、丢弃运行状态），
        " 重复注册会导致再次 spawn 新进程、旧进程泄漏，已注册时跳过
        if index(lsp#get_server_names(), 'pylsp') >= 0
            return
        endif
        " pylsp 默认以 stdio 模式运行，不接受 --stdio 参数（传了会启动失败）
        call lsp#register_server({
            \ 'name': 'pylsp',
            \ 'cmd': {server_info->['pylsp']},
            \ 'allowlist': ['python'],
            \ 'workspace_config': {
            \   'pylsp': {
            \     'plugins': {
            \       'pycodestyle': {'enabled': v:false},
            \       'pyflakes': {'enabled': v:true},
            \       'black': {'enabled': v:true},
            \       'isort': {'enabled': v:true},
            \     },
            \   },
            \ },
            \ })
    endfunction

    augroup LspPythonPylsp
        au!
        au User lsp_setup call s:RegisterPylsp()
        " 保存时自动格式化（black）；服务器未就绪时命令内部会优雅跳过
        autocmd BufWritePre *.py call execute('LspDocumentFormatSync')
    augroup END
endif
