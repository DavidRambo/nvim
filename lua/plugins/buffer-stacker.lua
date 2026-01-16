return {
  {
    "davidrambo/buffer-stacker.nvim",
    config = function()
      vim.keymap.set("n", "<leader>bn", "<cmd>BufstackerNext<cr>", { desc = "Next stacked buffer" })
      vim.keymap.set(
        "n",
        "<leader>bp",
        "<cmd>BufstackerPrev<cr>",
        { desc = "Previous stacked buffer" }
      )
      vim.keymap.set("n", "<leader>bl", "<cmd>BufstackerLs<cr>", { desc = "List stacked buffers" })
    end,
  },
}
