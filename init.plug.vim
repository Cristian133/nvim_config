""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintains:
"           Cristian Andrione
"           cristian.andrione@gmail.com
"
" Version:
"           1.2 - 30/07/2020
"
" Sections:
"           -> Load Plugins and configs
"           -> Plugins Configurations
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load Plugins and configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins Folder
call plug#begin('~/.config/nvim/plugged')

" File browser
Plug 'preservim/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'

" Search results counter
Plug 'vim-scripts/IndexedSearch'

" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'

"indentLine
Plug 'Yggdroot/indentLine'

" Buffer browser
Plug 'jlanzarotta/bufexplorer'

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Highlighted yank Region
Plug 'machakann/vim-highlightedyank'

" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'

" Ack code search (requires ack installed in the system)
Plug 'mileszs/ack.vim'
" TODO is there a way to prevent the progress which hides the editor?

" marks
Plug 'kshenoy/vim-signature'

"rust
Plug 'rust-lang/rust.vim'

"" Async autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sebastianmarkow/deoplete-rust'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"NERDTree""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NerdTree shows hidden files
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree automatically when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" I don't want NERDTree to open when i opening a saved session,
" for example vim -S session_file.vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Autorefresh NERDTree
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

let g:NERDTreeLimitedSyntax = 1

" vim-highlightedyank""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight duration
let g:highlightedyank_highlight_duration = 500

" redefine the HighlightedyankRegion
highlight HighlightedyankRegion cterm=reverse gui=reverse

" deoplete"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use deoplete.
call deoplete#enable()
call deoplete#custom#option('ignore_case')
call deoplete#custom#option('smart_case')

" complete with words from any opened file
"let g:context_filetype#same_filetypes = {}
"let g:context_filetype#same_filetypes._ = '_'

" deoplete-rust""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#sources#rust#racer_binary='/home/cristian/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/cristian/.cargo/rust/src/'
