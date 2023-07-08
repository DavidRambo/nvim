-- /lua/plugins/colorscheme.lua
return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        background = {
          -- :h background
          light = "latte",
          dark = "macchiato",
        },
        transparent_background = false,
        show_end_of_buffer = false, -- show the '~' after the end of buffers
        -- dim_inactive = {
        -- 	enabled = true,
        -- 	shade = "dark",
        -- 	percentage = 0.25,
        -- },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        -- custom_highlights = {},
        -- Below inspired by github.com/nekowinston's config
        highlight_overrides = {
          all = function(colors)
            return {
              FloatBorder = { fg = colors.mauve },
              TelescopeBorder = { link = "FloatBorder" },
              TelescopeTitle = { fg = colors.text },
              TelescopeSelection = { fg = colors.teal },
              NvimTreeWinSeparator = { link = "FloatBorder" },
              WhickKeyBorder = { link = "FloatBorder" },
              FidgetTitle = { fg = colors.teal },
              FidgetTask = { fg = colors.teal },
            }
          end,
        },
        integrations = {
          cmp = true,
          fidget = true,
          gitsigns = true,
          illuminate = true,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
          },
          leap = true,
          markdown = true,
          mason = true,
          mini = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
          neogit = true,
          noice = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          which_key = true,
        },
      })
    end,
  },
}
