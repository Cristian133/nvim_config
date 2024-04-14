local set = vim.keymap.set
local global = vim.g

-- leader key
global.mapleader = ","

set("i", "ññ", "<ESC>", { noremap = true })

-- show invisible characters
set("n", "<leader>ñ", ":set list!<CR>", { noremap = true })

-- windows movements
set("n", "<A-w>", "<C-w>", { noremap = true })

-- gi moves to last insert mode (default)
-- gI moves to last modification
set("n", "gI", "`.")

-- Disable highlight when <leader><CR> is pressed
set("n", "<leader><CR>", ":noh<CR>")

-- Visual mode pressing * or # searches for the current selection
set("v", "*", ":<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>")
set("v", "#", ":<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>")

------------------------------------------------------------------------------
-- Moving around windows, buffers and marks
------------------------------------------------------------------------------
-- buffers
set("n", "<leader><Right>", ":bnext<CR>", { noremap = true })
set("n", "<leader><Left>", ":bprev<CR>", { noremap = true })

--list  of registers and macros
set("", "<leader>gr", ":registers<CR>")

-- jump history
set("", "<Leader>gj", ":call GotoJump()<CR>")

------------------------------------------------------------------------------
-- Function keys
------------------------------------------------------------------------------
-- toggle highlight character from line 80
set("n", "<leader>2", ":call ToggleCol80()<CR>")
-- Close the current buffer
set("n", "<leader>q", ":Bclose<CR>")
-- change the way numbers look
set("n", "<leader>7", ":call ToggleNumber()<CR>")
-- toggle if you want to make Vim wrap long lines to fit in the window
set("n", "<leader>8", ":call ToggleWrap()<CR>")
-- buffer tex to pdf file
set("n", "<leader>9", ":w!<CR>:call Build()<CR>")
set("n", "<F9>", ":w!<CR>:call Build()<CR>")
set("i", "<F9>", "<ESC>:w!<CR>:call Build()<CR>")

------------------------------------------------------------------------------
-- plugins
------------------------------------------------------------------------------
-- fugitive
set("n", "<leader>dh", ":Ghdiffsplit<CR>", {})
set("n", "<leader>dv", ":Gvdiffsplit<CR>", {})
