return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    "nvim-telescope/telescope.nvim",
    -- version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
              ["<esc>"] = require("telescope.actions").close,
            },
          },
          file_ignore_patterns = {
            ".git/.*",
            "venv",
            ".venv",
            "__pycache__",
          },
        },
        pickers = {
          buffers = {
            theme = "ivy",
          },
          find_files = {
            theme = "ivy",
            --     find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
          },
        },
        preview = {
          filesize_limit = 0.1, -- MB
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          file_browser = {
            theme = "ivy", -- cursor, dropdown
            hijack_netrw = false,
            mappings = {
              ["i"] = {
                ["<C-a>"] = require("telescope").extensions.file_browser.actions.create,
                ["<C-d>"] = require("telescope").extensions.file_browser.actions.remove,
                ["<C-r>"] = require("telescope").extensions.file_browser.actions.rename,
              },
            },
          },
        },
      })

      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("harpoon")

      -- Enable telescope fzf native, if installed
      pcall(require("telescope").load_extension, "fzf")
    end,
  },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
}
