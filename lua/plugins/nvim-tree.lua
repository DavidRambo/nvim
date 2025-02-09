return {
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
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
            show = {
              folder = true,
            },
            -- glyphs = {
            --   folder = {
            --     arrow_closed = "﬌",
            --     arrow_open = "",
            --   },
            -- },
          },
          indent_markers = {
            enable = false,
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
  },
}
