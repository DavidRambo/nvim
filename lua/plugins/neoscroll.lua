return {
  "karb94/neoscroll.nvim",
  config = function()
    local neoscroll = require("neoscroll")
    neoscroll.setup({
      -- Set any options as needed
    })

    local keymap = {

      -- Syntax: t[keys] = {function, {function arguments}}
      ["<C-u>"] = function()
        neoscroll.ctrl_u({ duration = 200, easing = "sine" })
      end,
      ["<C-d>"] = function()
        neoscroll.ctrl_d({ duration = 200, easing = "sine" })
      end,
      ["<C-y>"] = function()
        neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
      end,
      ["<C-e>"] = function()
        neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
      end,
    }
    local modes = { "n", "v", "x" }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}
