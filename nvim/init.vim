"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File: init.vim
"
" Maintains:
"           Cristian Andrione
"           cristian.andrione@gmail.com
"
" Codebase:
"           Amir Salihefendic
"           http://amix.dk - amix@amix.dk
"
"           Lars Moelleken
"           http://moelleken.org - lars@moelleken.org
"
" Version:
"           05/06/2021
"
" Sections:
"           -> Load Plugins
"           -> Load extra user-config
"           -> Load Configurations coc.nvim plugin
"           -> Files, backups and undo
"           -> General
"           -> VIM user interface
"           -> Colors and Fonts
"           -> Parenthesis/bracket
"           -> Text, tab and indent related
"           -> Blank space treatments
"           -> Status line
"           -> File types
"           -> Vimdiff
"           -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Load Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To use fancy symbols wherever possible, change this setting from 0 to 1
" and use a font from https://github.com/ryanoasis/nerd-fonts in your terminal
" (if you aren't using one of those fonts, you will see funny characters here.
" Turst me, they look nice when using one of those fonts).
let fancy_symbols_enabled = 1

if filereadable($HOME . "/.config/nvim/init.plug.vim")
    source ~/.config/nvim/init.plug.vim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Load extra user-config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable($HOME . "/.config/nvim/init.map.vim")
    source ~/.config/nvim/init.map.vim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set swapfile
set directory=$HOME/.config/nvim/swaps

set backup
set writebackup
set backupdir=$HOME/.config/nvim/backups

set undofile
set undodir=$HOME/.config/nvim/undo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This changes the values of a LOT of options, enabling features
" which are not Vi compatible but really nice.
set nocompatible

" Set the default shell
set shell=bash

" Disable unsafe commands
set secure

" Disable modelines as a security precaution
set modelines=0
set nomodeline

" Enable filetype detection.
filetype on

" Enable filetype-specific plugins
filetype plugin on

" Enable filetype-specific indenting
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Sets how many lines of history VIM has to remember
set history=1000

" Tell us about changes.
set report=0

set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set lines to the cursor - when moving vertically using j/k or Up/Down
set so=0

" Show line numbers or current line number
" in combination with relativenumber
set number

" Command bar height
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Automatically wrap left and righ.
set whichwrap=b,s,h,l,<,>,[,]

" Turn off the bell
set noerrorbells
set novisualbell

" Add extra margin to the left
set foldcolumn=0

" Ignore case when searching
set ignorecase

" Use intelligent case while searching.
" (If search string contains an upper case letter, disable ignorecase.)
set smartcase

" Also switch on highlighting the last used search pattern
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Highlight current line
set cursorline

" Split vertically to the right.
set splitright

" Split horizontally below.
set splitbelow

" Do not reset cursor to start of line when moving around.
set nostartofline

" needed so deoplete can auto select the first suggestion
set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
set completeopt-=preview

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on color syntax highlight
syntax enable

try
    colorscheme hybrid
catch
endtry

set background=dark
set conceallevel=3

" Set encoding
set encoding=utf8

" Try to detect file formats.
" Unix for new files and autodetect for the rest.
set fileformats=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Parenthesis/bracket
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show matching brackets when text indicator is over them.
set showmatch

" Include angle brackets in matching.
set matchpairs+=<:>

" How many tenths of a second to blink when matching brackets.
set mat=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Expand tabs to spaces.
set expandtab
" Be smart when using tabs.
set smarttab

" Number of spaces to use for each step of indent.
set shiftwidth=4
set tabstop=4

set autoindent "Auto indent
set smartindent "Smart indent
set wrap "Wrap lines

" Linebreak on 79 characters
set linebreak
set textwidth=79
" None word dividers
"set isk+=_,$,@,%,#,-

" Invisible characters
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:»,precedes:«,space:.

" Highlight conflict markers.
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Open pdf files in a pdf reader
au BufRead *.pdf sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Blank space treatments
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Highlight spaces at the end of the line
if has('autocmd')
    highlight ExtraWhitespace ctermbg=1 guibg=red
    match ExtraWhitespace /\s\+$/
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Vimdiff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore whitespace in vimdiff.
if &diff
    set diffopt+=iwhite
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" terminal
let g:term_buf = 0
let g:term_win = 0

function! Term_toggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

"Do not close window when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" highlight text from column 80
let s:activatedh = 0
function! ToggleCol80()
    if s:activatedh == 0
        let s:activatedh = 1
        match Search '\%80v.\+'
    else
        let s:activatedh = 0
        match none
    endif
endfunction

" number or relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" hexadecimal
let s:activatehex = 0
function! ToggleHex()
    if s:activatehex == 0
        let s:activatehex = 1
        :%!xxd
    else
        let s:activatedhex = 0
        :%!xxd -r
    endif
endfunction

"Toggle wrap - nowrap (líneas reales - líneas visibles)
let s:activatewrap = 0
function! ToggleWrap()
    if s:activatewrap == 0
        let s:activatewrap = 1
        set nowrap
    else
        let s:activatewrap = 0
        set wrap
    endif
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
