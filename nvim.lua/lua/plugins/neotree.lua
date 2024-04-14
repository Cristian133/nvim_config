return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local neo_tree = require("neo-tree")

    neo_tree.setup({
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
    })

    vim.keymap.set("n", "<leader>g", ":Neotree float git_status toggle<CR>")
    vim.keymap.set("n", "<leader>b", ":Neotree float buffers toggle<CR>")
    vim.keymap.set("n", "<leader>f", ":Neotree left filesystem toggle<CR>")

  end,
}
