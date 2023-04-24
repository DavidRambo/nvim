return {
  "RRethy/vim-illuminate",
  -- cmd = "IlluminateToggle",
  -- keys = {
  --   -- { "<leader>ti", require("illuminate").toggle(), "[T]oggle [I]lluminate" }
  --   { "<leader>ti", "<cmd>IlluminateToggle<CR>", "[T]oggle [I]lluminate" },
  -- },
  opts = {
    filetypes_denylist = {
      "dirvish",
      "fugitive",
      "md",
      "org",
      "norg",
    },
  },
  config = function(opts)
    require("illuminate").configure(opts)

    vim.keymap.set("n", "<leader>ti", "<cmd>IlluminateToggle<CR>", { desc = "[T]oggle [I]lluminate"} )
    vim.keymap.set("n", "<leader>tf", require("illuminate").toggle_freeze_buf, { desc = "[F]reeze Illuminate" })
  end,
}
