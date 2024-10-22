" https://github.com/junegunn/vim-plug
" install: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()

Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'  " colorscheme
Plug 'ctrlpvim/ctrlp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'cyrnicolase/auto-pairs'
Plug 'chr4/nginx.vim'
Plug 'cespare/vim-toml', {'branch': 'main'}

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
let g:NERDTreeIgnore = ['node_modules', "\.pyc$"]
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
let g:go_fmt_autosave = 1
let g:go_fmt_command = 'goimports'
let g:go_auto_type_info = 1     " Status line types/signatures


""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-lsp
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_code_completion_enabled = 1
