"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintains:
"           Cristian Andrione
"           cristian.andrione@gmail.com
"
" Version:
"           1.0 - 03/04/2020
"
" Sections:
"           -> Load Plugins and configs
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins Folder
call plug#begin('~/.config/nvim/plugged')

" File browser
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

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

" Async autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Completion from other opened files
Plug 'Shougo/context_filetype.vim'

" Python autocompletion
"Plug 'sheerun/vim-polyglot'

" Highlight matching html tags
"Plug 'valloric/MatchTagAlways'

" Paint css colors with the real color
"Plug 'lilydjwg/colorizer'
" TODO is there a better option for neovim?

"Nice icons
"Plug 'ryanoasis/vim-devicons'
"Plug 'ryanoasis/vim-webdevicons'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"NERDTree""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NerdTree shows hidden files
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p


"vim-highlightedyank"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"highlight duration
let g:highlightedyank_highlight_duration = 500

"redefine the HighlightedyankRegion
highlight HighlightedyankRegion cterm=reverse gui=reverse

