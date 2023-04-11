return {
  {
    "lukas-reineke/indent-blankline.nvim",
    -- See `:help indent_blankline.txt`
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "┊",
      space_char_blankline = " ",
      show_current_context = false,
      show_trailing_blankline_indent = false,
      filetype_exclude = { "dashboard", "help", "NvimTree", "lazy", "mason" },
    },
  },

  {
    "echasnovski/mini.indentscope",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "dashboard", "NvimTree", "lazy", "mason" },
        callback = function()
          vim.b.miniidentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },
}
