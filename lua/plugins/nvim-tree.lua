return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "NvimTree" },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      renderer = {
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "﬌",
              arrow_open = "",
            },
          },
        },
      },
      filters = {
        dotfiles = true,
      },
      view = {
        side = "right",
      },
    })
  end,
}
