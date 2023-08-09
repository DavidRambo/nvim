return {
  "folke/which-key.nvim",
  opts = {},
  config = function()
    local wk = require("which-key")
    local keymaps = {
      mode = { "n", "v" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>c"] = { name = "+comment" },
      ["<leader>f"] = { name = "+file/find" },
      ["g"] = { name = "+goto" },
      ["gS"] = { "Splitjoin" },
      -- ["<leader>gg"] = {
      -- 	name = "Neogit",
      -- 	g = { "Open Neo[g]it" },
      -- },
      ["<leader>r"] = {
        name = "re-",
      },
      ["<leader>s"] = {
        name = "search",
        d = { "[S]earch LSP [D]efinition" },
        p = { "[S]earch [P]roject" },
        h = { "[S]earch [H]elp tags" },
        o = { ":Telescope oldfiles<CR>", "[S]earch Recent Files" },
        r = { "[R]esume [S]earch" },
        -- s = { ":SymbolsOutline<CR>", "[S]how [S]ymbols Outline" },
        -- t = { "[S]earch [T]reesitter symbols" },
      },
      ["<leader>."] = { "Find File" },
      ["<leader>,"] = { "Find Buffer" },
      ["<leader>t"] = {
        name = "[T]oggle",
        -- n = { "Create Tab" },
        -- h = { "Previous Tab" },
        -- o = { "Next Tab" },
        c = { "Neorg Concealer" },
      },
      ["<leader>w"] = {
        name = "Windows",
        v = { "Vertical Split" },
        s = { "Horizontal Split" },
        n = { "Focus Left" },
        i = { "Focus Right" },
        u = { "Focus Up" },
        e = { "Focus Down" },
        b = { "[B]alance Windows" },
        o = { "Close [O]ther Windows" },
        c = { "[C]lose Window" },
      },
      ["m"] = {
        name = "Match",
        m = { "%", "Match enclosing symbol" },
      },
    }
    wk.register(keymaps)
  end,
}
