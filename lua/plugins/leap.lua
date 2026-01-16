return {
  "https://codeberg.org/andyg/leap.nvim",
  -- event = "VeryLazy",
  config = function()
    vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
    vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
    vim.keymap.set("n", "gs", "<Plug>(leap-from-window)")
  end,
}
