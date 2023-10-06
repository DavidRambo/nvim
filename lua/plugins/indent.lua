return {
  {
    "lukas-reineke/indent-blankline.nvim",
    -- See `:help ibl.config`
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = { char = "┊" },
      -- space_char_blankline = " ",
      scope = {
        enabled = false,
      },
      -- whitespace = { remove_blankline_trail = false },
      exclude = { filetypes = { "dashboard", "help", "NvimTree", "lazy", "mason" } },
    },
  },

  --[[ {
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
  }, ]]
}
