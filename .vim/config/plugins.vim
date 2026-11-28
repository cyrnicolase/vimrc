" https://github.com/junegunn/vim-plug
" install: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()

Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'  " colorscheme
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'cyrnicolase/auto-pairs'
Plug 'chr4/nginx.vim'
Plug 'cespare/vim-toml', {'branch': 'main'}
Plug 'godlygeek/tabular'
Plug 'github/copilot.vim'
Plug 'voldikss/vim-floaterm' " 悬浮终端
Plug 'junegunn/fzf'  " fzf binary already installed via Homebrew
Plug 'junegunn/fzf.vim'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = "+"
let g:NERDTreeDirArrowCollapsible = "~"
let g:NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeAutoCenterThreshold = 1
let g:NERDTreeShowHidden = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['node_modules', "\.pyc$", ".git"]
map <F2> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark


""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
" 跳转/悬停等语义功能由 vim-lsp（gopls）接管（vim-go 内部 gopls 已关闭，见 lsp/go.vim）
let g:go_def_mapping_enabled = 0    " vim-go 不再映射 gd/gD，gd 走 LspDefinition
let g:go_auto_type_info = 0         " 悬停类型信息改用 LspHover（K）
" 保存时格式化/整理 imports 由 vim-lsp 统一处理（lsp/go.vim 的 BufWritePre），
" goimports 仅保留给手动 :GoFmt 使用
let g:go_fmt_autosave = 0
let g:go_fmt_command = 'goimports'


""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-lsp
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_code_completion_enabled = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-floaterm
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:floaterm_keymap_toggle = '<F12>'


""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""
" preview.sh uses bat for syntax highlighting when available;
" match the editor's gruvbox colorscheme
let $BAT_THEME = 'gruvbox-dark'
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>

