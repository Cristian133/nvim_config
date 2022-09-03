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

" Better file browser
Plug 'scrooloose/nerdtree'

" Code commenter
Plug 'scrooloose/nerdcommenter'

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

Plug 'octol/vim-cpp-enhanced-highlight'

" lsp {
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
"}

" nvim-cmp {
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"}

" snippet engine
Plug 'SirVer/ultisnips'

" default snippets
Plug 'honza/vim-snippets', {'rtp': '.'}
Plug 'quangnguyen30192/cmp-nvim-ultisnips', {'rtp': '.'}

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
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['ts'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

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

let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

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

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => vim-cpp-enhanced-highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => lsp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

lua <<EOF

-- apt install clang-tools clangd
require'lspconfig'.clangd.setup{}

require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)

  local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
      vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=false }
  local opts2 = { focusable = false,
           close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
           border = 'rounded',
           source = 'always',  -- show source in diagnostic popup window
           prefix = ' '}

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>tab split | lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>t', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float(0, {{opts2}, scope="line", border="rounded"})<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "rounded" }})<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next({ float = { border = "rounded" }})<CR>', opts)
  buf_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist({open = true})<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
      buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
      buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
end

-- NOTE: Don't use more than 1 servers otherwise nvim is unstable
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use pylsp
nvim_lsp.pylsp.setup({
    on_attach = on_attach,
    settings = {
      pylsp = {
        plugins = {
          pylint = { enabled = true, executable = "pylint" },
          pyflakes = { enabled = true },
          pycodestyle = { enabled = false },
          jedi_completion = { fuzzy = true },
          pyls_isort = { enabled = true },
          pylsp_mypy = { enabled = true },
        },
    }, },
    flags = {
      debounce_text_changes = 200,
    },
    capabilities = capabilities,
})

-- Use pyright or jedi_language_server
--local servers = {'jedi_language_server'}
--local servers = {'pyright'}
--for _, lsp in ipairs(servers) do
--nvim_lsp[lsp].setup({
--  on_attach = on_attach,
--  capabilities = capabilities
--})
--end

-- Change diagnostic signs.
vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- global config for diagnostic
vim.diagnostic.config({
  underline = false,
  virtual_text = true,
  signs = true,
  severity_sort = true,
})

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
local cmp = require('cmp')
local ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },

    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.select_next_item()
          else
              ultisnips_mappings.expand_or_jump_forwards(fallback)
          end
        end),

      ["<S-Tab>"] = function(fallback)
          if cmp.visible() then
              cmp.select_prev_item()
          else
              ultisnips_mappings.expand_or_jump_backwards(fallback)
          end
        end,

      ["<C-j>"] = cmp.mapping(function(fallback)
          ultisnips_mappings.expand_or_jump_forwards(fallback)
        end),

      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-g>'] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, -- For ultisnips users.
      }, {
      { name = 'path' },
      { name = 'buffer', keyword_length = 2,
        option = {
            -- include all buffers
            get_bufnrs = function()
             return vim.api.nvim_list_bufs()
            end

            -- include all buffers, avoid indexing big files
            -- get_bufnrs = function()
              -- local buf = vim.api.nvim_get_current_buf()
              -- local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
              -- if byte_size > 1024 * 1024 then -- 1 Megabyte max
                -- return {}
              -- end
              -- return { buf }
            -- end
      }},  -- end of buffer
    }),

    completion = {
        keyword_length = 2,
        completeopt = "menu,noselect"
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' },
    }),
})
EOF
