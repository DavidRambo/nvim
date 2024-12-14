local M = {}

-- local themes = require("telescope.themes")
local telescope = require("telescope.builtin")

-- Edit neovim config
M.edit_nvim_conf = function()
  telescope.git_files({
    shorten_path = true,
    cwd = "~/.config/nvim/",
    prompt = "~ neovim config ~",
    height = 10,
    layout_strategy = "bottom_pane",
    layout_options = {
      preview_width = 0.75,
    },
  })
end

-- Open file in qmk directory
M.find_qmk = function()
  telescope.find_files({
    shorten_path = true,
    cwd = "~/repos/qmk_firmware/keyboards/",
    prompt = "~ QMK Keyboards ~",
    layout_strategy = "bottom_pane",
    layout_options = {
      preview_width = 0.75,
    },
    file_ignore_patterns = {
      ".git/.*",
    },
  })
end

-- Fall back to find_files if no .git directory.
-- Source: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes
M.file_finder = function()
  local opts = {
    shorten_path = true,
    layout_strategy = "bottom_pane",
    layout_options = {
      preview_width = 0.75,
    },
  }
  vim.fn.system("git rev-parse --is-inside-work-tree")
  if vim.v.shell_error == 0 then
    telescope.git_files(opts)
  else
    telescope.find_files(opts)
  end
end

return M
