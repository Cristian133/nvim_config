""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintains:
"           Cristian Andrione
"           cristian.andrione@gmail.com
"
" Version:
"           1.2 - 30/07/2020
"
" Sections:
"           -> Move and copy lines or selected blocks
"           -> Cut, copy and paste, seva, select all, indent all
"           -> Terminal
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Toggle terminal on/off (neovim)
"nnoremap <A-t> :call Term_toggle(10)<CR>
"inoremap <A-t> <Esc>:call Term_toggle(10)<CR>
"tnoremap <A-t> <C-\><C-n>:call Term_toggle(10)<CR>
