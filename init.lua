-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup({

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- require("kickstart.plugins.autoformat"),
  -- require("kickstart.plugins.debug"),
  { import = "plugins" },
}, {})

vim.cmd.colorscheme("catppuccin")

-- [[ Setting options ]]
require("config.options")

-- [[ Keymaps ]]
require("config.keymaps")

-- vim.diagnostic.config({
--   -- virtual_text = {
--   --   source = "always", -- Or "if_many"
--   -- },
--   float = {
--     source = "always", -- Or "if_many"
--   },
-- })
