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

" Open a sidebar that shows you every mark that you can access from your current
" buffer, as well as the contexts in which those marks appear.
Plug 'Yilin-Yang/vim-markbar'

" Highlighted yank Region
Plug 'machakann/vim-highlightedyank'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'

"let g:coc_global_extensions = [ 'coc-tsserver' ]
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
" Plug 'iamcco/coc-angular'

" Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ibhagwan/fzf-lua'
Plug 'vijaymarupudi/nvim-fzf'

" File finder
Plug 'vifm/vifm.vim'

" Theme
Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Plugins Configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree shows hidden files
let NERDTreeShowHidden=1

autocmd VimEnter * NERDTree | wincmd p

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Autorefresh NERDTree
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeWinSize=30

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" =>  vim-highlightedyank
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight duration
let g:highlightedyank_highlight_duration = 500

" redefine the HighlightedyankRegion
highlight HighlightedyankRegion cterm=reverse gui=reverse

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" =>  Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Optional theme for airline/lightline
let g:airline_theme = 'bubblegum'

let g:airline_powerline_fonts = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tmuxline#enabled = 1

" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" =>  NERDCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
