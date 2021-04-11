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
"           -> Moving around windows, buffers and marks
"           -> Move and copy lines or selected blocks
"           -> Cut, copy and paste, seva, select all, indent all
"           -> Terminal
"           -> Tags
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
nmap <leader>w :w!<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

"historial de búsquedas
nmap <leader>b q/
"historial de Ex-commands
nmap <leader>x q:
"listado de registros
nmap <leader>r :registers<CR>
"listado de marcas
nmap <leader>m :marks<CR>
" historial de saltos
nmap <Leader>j :call GotoJump()<CR>
" muestra caracteres invisibles
nmap <leader>ñ :set list!<CR>

" gi moves to last insert mode (default)
" gI moves to last modification
nnoremap gI `.

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search).
nmap <space> /
nmap <C-space> ?

" Disable highlight when <leader><CR> is pressed
nmap <leader><CR> :noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around windows, buffers and marks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"marks
nmap <leader>k ['
nmap <leader>j ]'

nmap <leader><Up> ['
nmap <leader><Down> ]'

" buffers
nmap <leader>h :bnext<CR>
nmap <leader>l  :bprevious<CR>

nmap <leader><Right> :bnext<CR>
nmap <leader><Left>  :bprevious<CR>


" windows
nmap <C-Up> <C-W>k
nmap <C-Down> <C-W>j
nmap <C-Left> <C-W>h
nmap <C-Right> <C-W>l

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
" => Cut, copy and paste, seva, select all, indent all
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Cut
"inoremap <C-x> <Esc>dd
"nnoremap <C-x> dd
"vnoremap <C-x> dd

" Copy
"inoremap <C-c> <Esc>yy
"nnoremap <C-c> yy
"vnoremap <C-c> yy

" Paste
"inoremap <C-v> <Esc>p
"nnoremap <C-v> p

" Save
"inoremap <C-s> <Esc>:w<cr>
"nnoremap <C-s> :w<cr>

" shift+arrow selection
"nnoremap <S-Up> v<Up>
"nnoremap <S-Down> v<Down>
"nnoremap <S-Left> v<Left>
"nnoremap <S-Right> v<Right>

"vnoremap <S-Up> <Up>
"vnoremap <S-Down> <Down>
"vnoremap <S-Left> <Left>
"vnoremap <S-Right> <Right>

"inoremap <S-Up> <Esc>v<Up>
"inoremap <S-Down> <Esc>v<Down>
"inoremap <S-Left> <Esc>v<Left>
"inoremap <S-Right> <Esc>v<Right>

" Select all.
"inoremap <C-a> <Esc>ggVG
"nnoremap <C-a> ggVG

" Indent all.
"inoremap <C-i> <Esc>gg=G
"nnoremap <C-i> gg=G

"replaces the word under cursor; after you can keep pressing '.'
"nnoremap <Leader>x *``cgn
"nnoremap <Leader>X #``cgN

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tnoremap only terminal mode
" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

noremap <leader>t :call Term_toggle(8)<CR>
tnoremap <leader>t <C-\><C-n>:call Term_toggle(8)<CR>
" Toggle terminal on/off (neovim)
nnoremap <A-t> :call Term_toggle(10)<CR>
inoremap <A-t> <Esc>:call Term_toggle(10)<CR>
tnoremap <A-t> <C-\><C-n>:call Term_toggle(10)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"T para ir a tag
map T <C-]>

"<C-t> para volver del tag

