return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  config = function()
    require("todo-comments").setup()

    vim.keymap.set("n", "]t", function()
      require("todo-comments").jump_next()
    end, { desc = "Next todo comment" })

    vim.keymap.set("n", "[t", function()
      require("todo-comments").jump_prev()
    end, { desc = "Previous todo comment" })

    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "[F]ind [T]odo comments" })
  end,
}
