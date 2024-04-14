return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")

			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
	    lspconfig.pyright.setup ({
				capabilities = capabilities,
      })
      lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.fortls.setup({
        settings = {},
        filetypes = {"fortran"},
				cmd = {
					"fortls",
					"--hover_signature",
					"--hover_language=fortran",
					"--use_signature_help",
				},
        capabilities = capabilities,
        root_dir = util.root_pattern(".fortls")
			})
			lspconfig.eslint.setup({
				-- Copied from nvim-lspconfig/lua/lspconfig/server_conigurations/eslint.js
				root_dir = util.root_pattern(
					".eslintrc",
					".eslintrc.js",
					".eslintrc.cjs",
					".eslintrc.yaml",
					".eslintrc.yml",
					".eslintrc.json"
					-- Disabled to prevent "No ESLint configuration found" exceptions
					-- 'package.json',
				),
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			-- Show diagnostics in a floating window
			vim.keymap.set("n", "<leader>gl", vim.diagnostic.open_float, {})
			-- Move to the previous diagnostic
			vim.keymap.set("n", "<leader>gk", vim.diagnostic.goto_prev, {})
			-- Move to the next diagnostic
			vim.keymap.set("n", "<leader>gj", vim.diagnostic.goto_next, {})
		end,
	},
}
