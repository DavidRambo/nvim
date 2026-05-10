return {
  -- Remove buffers without impacting window layout.
  {
    "nvim-mini/mini.bufremove",
		-- stylua: ignore
		keys = {
			{ "<leader>bk", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
			{ "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
		},
  },

  -- Bracket-based navigation keymaps.
  {
    "nvim-mini/mini.bracketed",
    config = function()
      require("mini.bracketed").setup()
    end,
  },

  {
    "nvim-mini/mini.icons",
    version = false,
  },

  -- Move line (in normal) or selection (in visual).
  {
    "nvim-mini/mini.move",
    config = function()
      require("mini.move").setup({
        mappings = {
          left = "<M-h>",
          right = "<M-l>",
          down = "<M-j>",
          up = "<M-k>",
        },
      })
    end,
  },

  -- gS to break arguments into multiple lines or to join into one line.
  {
    "nvim-mini/mini.splitjoin",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.splitjoin").setup()
    end,
  },
}
