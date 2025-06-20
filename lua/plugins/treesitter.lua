return {
  -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
  },
  opts = {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = {
      "asm",
      "bash",
      "cpp",
      "css",
      "fish",
      "graphql",
      "html",
      "http",
      "go",
      "java",
      "javascript",
      "json",
      "just",
      "lua",
      -- "markdown",
      "mermaid",
      "nix",
      "python",
      "rust",
      "scheme",
      "sql",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true, disable = { "python" } },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>ss",
        node_incremental = "<leader>si",
        scope_incremental = "<leader>sc",
        node_decremental = "<leader>sd",
      },
    },
    autotag = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
  },
  config = function(_, opts)
    -- pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    require("nvim-treesitter.configs").setup(opts)
  end,
}
