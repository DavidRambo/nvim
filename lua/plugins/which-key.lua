return {
  "folke/which-key.nvim",
  event = "VimEnter",
  -- opts = {},
  config = function()
    local wk = require("which-key")
    wk.add({
      mode = { "n", "v" },
      { "<leader>.", group = "Find File" },
      { "<leader>,", group = "Find Buffer" },

      { "<leader>b", group = "buffer" },

      { "<leader>c", group = "comment/code" },
      { "<leader>ca", desc = "Append comment" },
      { "<leader>cw", desc = "[C]ode [W]rap" },

      { "<leader>f", group = "file/find" },

      { "<leader>g", group = "goto" },

      { "gS", desc = "Splitjoin" },

      { "m", group = "Harpoon", desc = "+Harpoon" },
      { "ma", ":lua require('harpoon.mark').add_file()<CR>", desc = "Mark file" },
      { "mn", require("harpoon.ui").nav_next, desc = "Next mark" },
      { "mp", require("harpoon.ui").nav_prev, desc = "Previous mark" },
      { "mv", ":Telescope harpoon marks<CR>", desc = "View marks" },

      { "<leader>s", group = "search" },
      { "<leader>sd", desc = "[S]earch LSP [D]efinition" },
      { "<leader>sp", desc = "[S]earch [P]roject" },
      { "<leader>sh", desc = "[S]earch [H]elp tags" },
      { "<leader>so", ":Telescope oldfiles<CR>", desc = "[S]earch [R]ecent Files" },
      { "<leader>sr", desc = "[R]esume [S]earch" },

      { "<leader>t", group = "Toggle" },
      { "<leader>tc", ":TSContextToggle<CR>", desc = "Treesitter Context" },

      { "<leader>w", group = "Windows" },
      { "<leader>wv", desc = "Vertical Split" },
      { "<leader>ws", desc = "Horizontal Split" },
      { "<leader>wn", desc = "Focus Left" },
      { "<leader>wi", desc = "Focus Right" },
      { "<leader>wu", desc = "Focus Up" },
      { "<leader>we", desc = "Focus Down" },
      { "<leader>wb", desc = "Balance" },
      { "<leader>wo", desc = "Close Other Windows" },
      { "<leader>wc", desc = "Close Window" },

      { "<leader>x", group = "Commands" },
      { "<leader>xk", ":lua require('kulala').run()<CR>", desc = "Kulala run" },
    })
  end,
}
