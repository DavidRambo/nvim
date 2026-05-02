return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local ensure_installed = {
      "c",
      "cpp",
      "lua",
      "markdown",
      "python",
      "rust",
      "scheme",
    }
    require("nvim-treesitter").install(ensure_installed)
  end,
}
