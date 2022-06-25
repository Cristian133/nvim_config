""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintains:
"           Cristian Andrione
"           cristian.andrione@gmail.com
"
" Version:
"           19/06/2022
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

"This plugin provides a start screen for Vim and Neovim.
Plug 'mhinz/vim-startify'

" Better file browser
Plug 'scrooloose/nerdtree'

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git integration
Plug 'Xuyuanp/nerdtree-git-plugin'

" Buffer browser
Plug 'jlanzarotta/bufexplorer'

" indentLine | tab
Plug 'Yggdroot/indentLine'

" Highlighted yank Region
Plug 'machakann/vim-highlightedyank'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Nice icons in the file explorer and file type status line.
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tmuxline#enabled = 1

let g:airline_powerline_fonts = 1
let g:webdevicons_gui_glyph_fix = 1

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
let s:spec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['js'] = s:yellow " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['ts'] = s:blue " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['conf'] = s:git_orange " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['md'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitconfig'] = s:git_orange " sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.bashrc'] = s:git_orange " sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.zshrc'] = s:git_orange " sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['Makefile'] = s:lightGreen " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['*\.spec\.ts$'] = s:spec_red " sets the color for files ending with .spec.ts

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule
