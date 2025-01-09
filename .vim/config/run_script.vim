
nnoremap <S-R> :call RunScript()<CR>
func RunScript()
    execute "w"
    if "python" == &filetype 
        execute "!python %"
    endif
endfunc
