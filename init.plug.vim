""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintains:
"           Cristian Andrione
"           cristian.andrione@gmail.com
"
" Version:
"           05/06/2021
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

" theme
Plug 'mhartington/oceanic-next'

" syntax
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" status bar
Plug 'itchyny/lightline.vim'

" tree
Plug 'scrooloose/nerdtree'

" typing
Plug 'jiangmiao/auto-pairs'

" code commenter
Plug 'scrooloose/nerdcommenter'

" buffer browser
Plug 'jlanzarotta/bufexplorer'

" indentLine | tab
Plug 'Yggdroot/indentLine'

" Open a sidebar that shows you every mark that you can access from your current
" buffer, as well as the contexts in which those marks appear.
Plug 'Yilin-Yang/vim-markbar'

" highlighted yank Region
Plug 'machakann/vim-highlightedyank'

" file browser
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

"NERDTree""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NerdTree shows hidden files
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

autocmd VimEnter * NERDTree

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Autorefresh NERDTree
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeWinSize=30

" vim-highlightedyank"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight duration
let g:highlightedyank_highlight_duration = 500

" redefine the HighlightedyankRegion
highlight HighlightedyankRegion cterm=reverse gui=reverse

" vim-nerdtree-syntax-highlight"""""""""""""""""""""""""""""""""""""""""""""""

let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

"let g:NERDTreeDisableFileExtensionHighlight = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1

"let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

