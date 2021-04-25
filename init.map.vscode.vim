""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File: init.map.vim
"
" Maintains:
"           Cristian Andrione
"           cristian.andrione@gmail.com
"
" Version:
"           05/02/2021
"
" Sections:
"           -> Leader key
"           -> Visual
"           -> Function keys
"           -> Editing mappings
"           -> Yank and put system pasteboard with <Leader>y/p
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
" =>  Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search).
nmap <space> /
nmap <C-space> ?

" Disable highlight when <leader><CR> is pressed
nmap <leader><CR> :noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Yank and put system pasteboard with <Leader>y/p
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>y "+yy
nnoremap <leader>p "+p

echom "init.map.vscode.vim"
