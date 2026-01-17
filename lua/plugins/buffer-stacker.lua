return {
  {
    "davidrambo/buffer-stacker.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      vim.keymap.set("n", "<leader>bn", "<cmd>BufstackerNext<cr>", { desc = "Next stacked buffer" })
      vim.keymap.set("n", "<leader>bp", "<cmd>BufstackerPrev<cr>", { desc = "Previous stacked buffer" })
      vim.keymap.set("n", "<leader>bl", "<cmd>BufstackerLs<cr>", { desc = "List stacked buffers" })
      vim.keymap.set("n", "<leader>,", function()
        require("buffer-stacker.telescope").bufpicker({
          theme = "ivy",
          ignore_current_buffer = false,
          sort_by_path = false,
        })
      end, { desc = "Pick stacked buffer" })
    end,
  },
}
