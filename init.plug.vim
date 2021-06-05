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

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Better file browser
Plug 'scrooloose/nerdtree'

" Git integration
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'

" Buffer browser
Plug 'jlanzarotta/bufexplorer'

" indentLine | tab
Plug 'Yggdroot/indentLine'

" colorized brackets

" Open a sidebar that shows you every mark that you can access from your current
" buffer, as well as the contexts in which those marks appear.
Plug 'Yilin-Yang/vim-markbar'

" Highlighted yank Region
Plug 'machakann/vim-highlightedyank'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Nice icons in the file explorer and file type status line.
Plug 'ryanoasis/vim-devicons'

" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'

"let g:coc_global_extensions = [ 'coc-tsserver' ]
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Airline"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Optional themes for airline/lightline
"let g:airline_theme='hybridline'
let g:airline_theme = 'bubblegum'

let g:airline_powerline_fonts = 0
"let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tmuxline#enabled = 1

" vim-nerdtree-syntax-highlight"""""""""""""""""""""""""""""""""""""""""""""""

let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

"let g:NERDTreeDisableFileExtensionHighlight = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1

"let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['html'] = s:purple " sets the color of css files to blue

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['ts'] = s:blue " sets the color of css files to blue

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

" Ack.vim ------------------------------

" mappings
nmap ,r :Ack
nmap ,wr :execute ":Ack " . expand('<cword>')<CR>
