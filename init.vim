"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"           1.1 - 10/05/2020
"
" Sections:
"           -> Load Plugins and configs
"           -> Plugins Configurations
"           -> Files, backups and undo
"           -> General
"           -> VIM user interface
"           -> Colors and Fonts
"           -> Visual
"           -> Parenthesis/bracket
"           -> Text, tab and indent related
"           -> Helpers funtions
"           -> Editing mappings
"           -> Open specials files
"           -> Moving around windows and buffers
"           -> Move and copy lines or selected blocks
"           -> Blank space treatments
"           -> Spell checking
"           -> Status line
"           -> File types
"           -> Vimdiff
"           -> Tags
"           -> StatusLineTerm and TermCursor
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set swapfile
set directory=~/.config/nvim/swaps

set backup
set writebackup
set backupdir=~/.config/nvim/backups

set undofile
set undodir=~/.config/nvim/undo


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
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

" Change leader from backslash to comma
" That means all \x commands turn into ,x
let mapleader = ","
let g:mapleader = ","

" Sets how many lines of history VIM has to remember
set history=1000

" Tell us about changes.
set report=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set lines to the cursor - when moving vertically using j/k or Up/Down
set so=7

" Show line numbers or current line number
" in combination with relativenumber
set number

" Command bar height
set cmdheight=1

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
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on color syntax highlight
syntax enable

try
	colorscheme hybrid
catch
endtry

set background=dark

" Set encoding
set encoding=utf8

" Try to detect file formats.
" Unix for new files and autodetect for the rest.
set fileformats=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


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
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Expand tabs to spaces.
set expandtab

" Be smart when using tabs.
set smarttab

" Linebreak on 79 characters
set linebreak
set textwidth=79

set autoindent "Auto indent
set smartindent "Smart indent
set wrap "Wrap lines

" Number of spaces to use for each step of indent.
set shiftwidth=4
set tabstop=4

" None word dividers
set isk+=_,$,@,%,#,-

" Invisible characters
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:»,precedes:«,space:.

" Highlight conflict markers.
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helpers functions
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

" current buffer size
function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    endif
    if bytes < 1024
        return bytes
    else
        return (bytes / 1024) . "K"
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

"Get git branch and status of edited file
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" returns a string <branch/XX> where XX corresponds to the git status
" (for example "<master/ M>")
function CurrentGitStatus()
  let gitoutput = split(system('git status --porcelain -b '.shellescape(expand('%')).' 2>/dev/null'),'\n')
  if len(gitoutput) > 0
    let b:gitstatus = strpart(get(gitoutput,0,''),3) . '/' . strpart(get(gitoutput,1,'  '),0,2)
  else
    let b:gitstatus = ''
  endif
endfunc
autocmd BufEnter,BufWritePost * call CurrentGitStatus()

function Highlight_Statusline()
  hi User1 ctermfg=Yellow cterm=bold
endfunction

autocmd ColorScheme * call Highlight_Statusline()
autocmd BufEnter * call Highlight_Statusline()

function! WindowNumber()
  return tabpagewinnr(tabpagenr())
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" =>  Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tnoremap only terminal mode
" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

" Toggle terminal on/off (neovim)
nnoremap <A-t> :call Term_Toggle(10)<CR>
inoremap <A-t> <Esc>:call Term_Toggle(10)<CR>
tnoremap <A-t> <C-\><C-n>:call Term_Toggle(10)<CR>

nnoremap <leader>t :call Term_toggle(10)<cr>
tnoremap <leader>t <C-\><C-n>:call Term_toggle(10)<cr>

" leader keys
map <leader>1 :call ToggleHex()<CR>
map <leader>2 :call ToggleCol80()<CR>
map <leader>3 :call ToggleNumber()<CR>
map <leader>4 :call ToggleWrap()<CR>

" Yank to end of line
map Y y$

"plugin  bufexplorer
map <F4> <leader>bt

"plugin  NERDTree
map <F5> :NERDTreeToggle<CR>
"go to  NerdTree on the file you’re editing
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

map <F6> :Bclose<CR>

" syntax-check
map <F7> :make <CR>

" tags work directory
map <F8> :!ctags -R<CR>

" buffer tex to pdf file
map <F9> :w!<CR>:call Build()<CR>
imap <F9> <Esc>:w!<CR>:call Build()<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Fast saving
map <leader>w :w!<cr>
map <leader>q :q<cr>

nmap <leader>l :set list!<CR>

" Select all.
map <Leader>a ggVG

" Indent all.
map <Leader>i gg=G

" gi moves to last insert mode (default)
" gI moves to last modification
nnoremap gI `.

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search).
map <space> /
map <C-space> ?

" Show current file as HTML. (to paste into Keynote)
nmap <Leader>h :TOhtml<CR>:w<cr>:!open %<CR>:q<CR>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Disable highlight when <leader><CR> is pressed
map <silent> <leader><CR> :noh<CR>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open specials files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" open .vimrc
map <leader>e :e ~/.config/nvim/init.vim<CR>

" open help
map <leader>h :e ~/.config/nvim/help/help<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" buffers
map <leader><right> :bnext<cr>
map <leader><left>  :bprevious<cr>

" windows
map <C-up>    <C-W>k
map <C-down>  <C-W>j
map <C-left>  <C-W>h
map <C-right> <C-W>l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Move and copy lines or selected blocks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Move a line or select block of text using ALT+[Up-Down]
nnoremap <M-Down> :m .+1<CR>==
nnoremap <M-Up> :m .-2<CR>==
inoremap <M-Down> <Esc>:m .+1<CR>==gi
inoremap <M-Up> <Esc>:m .-2<CR>==gi
vnoremap <M-Down> :m '>+1<CR>gv=gv
vnoremap <M-Up> :m '<-2<CR>gv=gv

" Copy a line or select block of text using SHIFT+ALT+[Up-Down]
nnoremap <M-S-Down> :t .+0<CR>==
nnoremap <M-S-Up> :t .-1<CR>==
inoremap <M-S-Down> <Esc>:t .+0<CR>==gi
inoremap <M-S-Up> <Esc>:t .-1<CR>==gi
vnoremap <M-S-Down> :t '>+0<CR>gv=gv
vnoremap <M-S-Up> :t '<-1<CR>gv=gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cut, copy and paste, seva, select all, indent all
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cut
inoremap <C-x> <Esc>dd
nnoremap <C-x> dd
vnoremap <C-x> dd

" Copy
inoremap <C-c> <Esc>yy
nnoremap <C-c> yy
vnoremap <C-c> yy

" Paste
inoremap <C-v> <Esc>p
nnoremap <C-v> p

" Save
inoremap <C-s> <Esc>:w
nnoremap <C-s> :w

" shift+arrow selection
nnoremap <S-Up> v<Up>
nnoremap <S-Down> v<Down>
nnoremap <S-Left> v<Left>
nnoremap <S-Right> v<Right>

vnoremap <S-Up> <Up>
vnoremap <S-Down> <Down>
vnoremap <S-Left> <Left>
vnoremap <S-Right> <Right>

inoremap <S-Up> <Esc>v<Up>
inoremap <S-Down> <Esc>v<Down>
inoremap <S-Left> <Esc>v<Left>
inoremap <S-Right> <Esc>v<Right>

" Select all.
inoremap <C-a> <Esc>ggVG
nnoremap <C-a> ggVG

" Indent all.
inoremap <C-i> <Esc>gg=G
nnoremap <C-i> gg=G


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => System pasteboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Yank and put system pasteboard with <Leader>y/p
nnoremap <silent> <leader>y "+yy
nnoremap <silent> <leader>Y "+y$
nnoremap <silent> <leader>p "+p

" Yank and put system pasteboard with ALT+[c/v]
nnoremap <silent> <M-c> "+yy
nnoremap <silent> <M-v> "+p


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Blank space treatments
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Highlight spaces at the end of the line
if has('autocmd')
    highlight ExtraWhitespace ctermbg=1 guibg=red
    match ExtraWhitespace /\s\+$/
endif

" Strip trailing whitespace
map <F10> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
imap <F10> <Esc>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spelling checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle <,ss> spell checking
"setlocal spell spelllang=es
map <leader>ss :setlocal spell spelllang=es<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"define custom highlight groups
hi User1 ctermbg=99 ctermfg=16
hi User2 ctermbg=blue ctermfg=16
hi User3 ctermbg=8 ctermfg=16

" Always show the status line
 set laststatus=2

set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%2*%{(mode()=='t')?'\ \ TERMINAL\ ':''}%*
set statusline+=%3*%{(mode()=='x')?'\ \ EX\ ':''}%*
set statusline+=%#Cursor#               " colour
set statusline+=\ %n\                   " buffer number
set statusline+=%#Visual#               " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#             " colour
set statusline+=%R                      " readonly flag
set statusline+=%M                      " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#           " colour
set statusline+=\ %t\                   " short file name
set statusline+=%1*%{StatuslineGit()}%*
set statusline+=%=                      " right align
set statusline+=%#CursorLine#           " colour
set statusline+=\ %{strlen(&filetype)?&filetype:'none'}\     "filetype
set statusline+=\ %3*%3l:%-2c\         " line + column
set statusline+=\ %3p%%\                " percentage

" old statusline
"set statusline=\|\ 
"set statusline+=%t
"set statusline+=\ \|\ 
"set statusline+=%1*%{StatuslineGit()}%*
"set statusline+=%=
"set statusline+=%{&fileformat}
"set statusline+=\ \|\ 
"set statusline+=%{strlen(&fenc)?&fenc:'none'} "file encoding
"set statusline+=\ \|%2*\ 
"set statusline+=%{strlen(&filetype)?&filetype:'none'}     "filetype
"set statusline+=\ %*\|\ 
"set statusline+=\%3l
"set statusline+=:
"set statusline+=\%2c
"set statusline+=\ \|\ 
"set statusline+=\%P 
"set statusline+=\ 

 function! StatuslineGit()
     let l:branchname = GitBranch()
     return strlen(l:branchname) > 0?' '.l:branchname.' ':''
 endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" automatic commands
if has("autocmd")
  " file type detection

  au Filetype gitcommit                setlocal tw=68 spell fo+=t nosi
  au BufNewFile,BufRead COMMIT_EDITMSG setlocal tw=68 spell fo+=t nosi

endif

" statusline color
function! ColourStatusLineFileType()
    filetype detect

    if &filetype == 'make'
        setlocal noexpandtab shiftwidth=4 tabstop=4
        hi StatusLine ctermbg=grey ctermfg=235
    else
        setlocal expandtab shiftwidth=4 tabstop=4
        hi StatusLine ctermbg=blue ctermfg=235
        hi StatusLineNC ctermbg=grey ctermfg=235
    endif

endfunction

au BufEnter * call ColourStatusLineFileType()

function! Build()
    filetype detect
    echo "filetype:" &filetype
    let name = expand("%:r")
    if &filetype == 'tex'
        execute :w!<CR>
        execute :!pdflatex %<CR>
    elseif &filetype == 'c'
        execute "! gcc % -o" name
        let res =
        execute "! ./".name
    elseif &filetype == 'rust'
        "execute "! cargo build"
        execute "! cargo run"
    elseif &filetype == 'sh'
        execute "! chmod +x %"
        execute "! ./%"
    else
        echo "No sabemos como procesar este tipo de archivo"
    endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimdiff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore whitespace in vimdiff.
if &diff
  set diffopt+=iwhite
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"T para ir a tag
map T <C-]>

"<C-t> para volver del tag


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" StatusLineTerm and TermCursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Manually set the status line color.
" active windows
"hi StatusLineTerm ctermbg=grey ctermfg=blue
" inactive windows
"hi StatusLineTermNC ctermbg=grey ctermfg=yellow

"if has('nvim')
  " active windows
  "highlight! StatusLineTerm ctermbg=grey ctermfg=blue
  " inactive windows
  "highlight! StatusLineTermNC ctermbg=grey ctermfg=yellow
  "highlight! link TermCursor Cursor
  "highlight! TermCursorNC ctermbg=white ctermfg=blue
"endif

