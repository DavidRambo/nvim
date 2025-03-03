return {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ignore = "^$",
    -- toggler = {
    --   line = "<leader>cc",
    --   block = "<leader>cb",
    -- },
    -- opleader = {
    --   line = "<leader>c", -- default is 'gc'
    --   block = "<leader>b", -- default is 'gb'
    -- },
    extra = {
      -- Add comment on the line above
      above = "<leader>cO",
      -- Add comment on the line below
      below = "<leader>co",
      -- Add comment at the end of line
      eol = "<leader>ca",
    },
    -- Enable keybindings
    -- Note: If given `false` then the plugin won't create any mappings
    mappings = {
      -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
      basic = true,
      -- Extra mapping; `gco`, `gcO`, `gcA`
      extra = true,
    },
  },
}
