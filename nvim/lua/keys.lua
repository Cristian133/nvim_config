--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- Toggle plugins
map('n', '<leader>n', [[:NvimTreeToggle<cr>]], {})
map('n', '<leader>l', [[:IndentLinesToggle<cr>]], {})
map('n', '<leader>t', [[:TagbarToggle<cr>]], {})
map('n', '<leader>f', [[:Telescope find_files<cr>]], {})

-- Yank and put system pasteboard with <Leader>y/p
map('n', '<leader>p', "\"+p", {})
map('n', '<leader>y', "\"+yy", {})

-- Buffers
map('n', '<leader><Right>', ":bnext<cr>", {})
map('n', '<leader><Left>', ":bprevious<cr>", {})

-- windows
map ('n', '<A-w>', '<C-w>', {})

-- Marks
map ('n', '<leader><Up>', 'm[', {})
map ('n', '<leader><Down>', 'm]', {})
