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
  -- Editor related plugins
  {
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

      vim.keymap.set(
        "n",
        "<leader>ft",
        "<cmd>TodoTelescope<CR>",
        { desc = "[F]ind [T]odo comments" }
      )
    end,
  },

  {
    "ggandor/leap.nvim",
    -- event = "VeryLazy",
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ignore = "^$",
      toggler = {
        line = "<leader>cc",
        block = "<leader>cb",
      },
      opleader = {
        line = "<leader>c",
        block = "<leader>b",
      },
      extra = {
        -- Add comment on the line above
        above = "<leader>cO",
        -- Add comment on the line below
        below = "<leader>co",
        -- Add comment at the end of line
        eol = "<leader>ca",
      },
      -- Enable keybindings
      -- Note: If given `false` then the plugin won't create any mappings
      mappings = {
        -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        -- Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },
    },
  },

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- Git related plugins
  -- {
  --   "TimUntersberger/neogit",
  --   dependencies = "nvim-lua/plenary.nvim",
  -- },

  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  -- require("kickstart.plugins.autoformat"),
  -- require("kickstart.plugins.debug"),
  { import = "plugins" },
}, {})

vim.cmd.colorscheme("catppuccin-macchiato")

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
