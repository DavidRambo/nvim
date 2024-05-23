return {
  -- "kkoomen/vim-doge",
  "danymat/neogen",
  config = function()
    require("neogen").setup({
      enabled = true,
      snippet_engine = "luasnip",
      languages = {
        python = {
          template = {
            annotation_convention = "google_docstrings",
          },
        },
      },
    })
    vim.keymap.set("n", "<leader>nf", "<cmd>Neogen func<CR>", { desc = "[N]eogen [F]unction" })
    vim.keymap.set("n", "<leader>nc", "<cmd>Neogen class<CR>", { desc = "[N]eogen [C]lass" })
  end,
}
