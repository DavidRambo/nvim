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
    vim.keymap.set(
      "n",
      "<leader>nf",
      "<cmd>lua require('neogen').generate()<CR>",
      { desc = "[N]eogen [F]unction" }
    )
    vim.keymap.set(
      "n",
      "<leader>nc",
      "<cmd>lua require('neogen').generate({ type = 'class' })<CR>",
      { desc = "[N]eogen [C]lass" }
    )
  end,
}
