""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File: init.map.vim
"
" Maintains:
"           Cristian Andrione
"           cristian.andrione@gmail.com
"
" Version:
"           05/06/2021
"
" Sections:
"           -> Leader key
"           -> Visual
"           -> Function keys
"           -> Editing mappings
"           -> Moving around windows, buffers and marks
"           -> Move and copy lines or selected blocks
"           -> Cut, copy and paste, seva, select all, indent all
"           -> Terminal
"           -> Coc
"           -> Fzf
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change leader from backslash to comma
" That means all \x commands turn into ,x
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Function keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" toggle highlight character from line 80
nmap <F2> :call ToggleCol80()<CR>

" toggle show file in hex
nmap <F3> :call ToggleHex()<CR>

"plugin  bufexplorer
map <F4> <leader>bt

" plugin  NERDTree
nmap <F5> :NERDTreeToggle<CR>

" Close the current buffer
nmap <F6> :Bclose<CR>

" change the way numbers look
nmap <F7> :call ToggleNumber()<CR>

" toggle if you want to make Vim wrap long lines to fit in the window
nmap <F8> :call ToggleWrap()<CR>

" buffer tex to pdf file
nmap <F9> :w!<CR>:call Build()<CR>
imap <F9> <ESC>:w!<CR>:call Build()<CR>

" Strip trailing whitespace
nmap <F10> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" coc-definition
nmap <silent> <F12> <Plug>(coc-definition)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" open .vimrc
map <leader>e :n ~/.config/nvim/init.vim ~/.config/nvim/init.map.vim ~/.config/nvim/init.plug.vim ~/.bash_aliases ~/.tmux.conf ~/.gitconfig ~/.zshrc ~/.zsh-spaceship-theme-config ~/.alias<CR>

" muestra caracteres invisibles
nmap <leader>ñ :set list!<CR>

" gi moves to last insert mode (default)
" gI moves to last modification
nnoremap gI `.

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search).
nmap <space> /
nmap <C-space> ?

" Switch CWD to the directory of the open buffer
nmap <leader>cd :cd %:p:h<CR>:pwd<CR>

"go to NerdTree on the file you’re editing
nnoremap <leader>f :NERDTreeFind<CR>

" Disable highlight when <leader><CR> is pressed
nmap <leader><CR> :noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around windows, buffers and marks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" marks
nmap <leader><Up> ['
nmap <leader><Down> ]'

" buffers
nmap <leader><Right> :bnext<CR>
nmap <leader>l :bnext<CR>
nmap <leader><Left>  :bprevious<CR>
nmap <leader>h :bprevious<CR>

" windows
map <A-w> <C-w>

" Yank and put system pasteboard with <Leader>y/p
nnoremap <leader>y "+yy
nnoremap <leader>p "+p

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
" => Terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tnoremap only terminal mode
" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

" Toggle terminal on/off (neovim)
nnoremap <A-t> :call Term_toggle(7)<CR>
inoremap <A-t> <Esc>:call Term_toggle(7)<CR>
tnoremap <A-t> <C-\><C-n>:call Term_toggle(7)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" =>  Fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file finder mapping
nmap <leader>z :Files<CR>
" tags (symbols) in current file finder mapping
"nmap <leader>g :BTag<CR>
" the same, but with the word under the cursor pre filled
"nmap <leader>wg :execute ":BTag " . expand('<cword>')<CR>
" tags (symbols) in all files finder mapping
"nmap <leader>G :Tags<CR>
" the same, but with the word under the cursor pre filled
"nmap <leader>wG :execute ":Tags " . expand('<cword>')<CR>
" general code finder in current file mapping
"nmap <leader>bf :BLines<CR>
" the same, but with the word under the cursor pre filled
"nmap <leader>wf :execute ":BLines " . expand('<cword>')<CR>
" general code finder in all files mapping
nmap <leader>Z :Lines<CR>
" the same, but with the word under the cursor pre filled
"nmap <leader>wF :execute ":Lines " . expand('<cword>')<CR>
" commands finder mapping
"nmap <leader>c :Commands<CR>
