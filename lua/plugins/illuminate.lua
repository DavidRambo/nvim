return {
  "RRethy/vim-illuminate",
  config = function(opts)
    require("illuminate").configure({
      filetypes_denylist = {
        "dirvish",
        "fugitive",
        "md",
        "org",
        "norg",
        "NvimTree",
      },
      min_count_to_highlight = 2,
      modes_denylist = { "i" },
    })

    vim.keymap.set(
      "n",
      "<leader>ti",
      -- "<cmd>IlluminateToggle<CR>",
      require("illuminate").toggle_visibility_buf,
      { desc = "[T]oggle [I]lluminate" }
    )
    vim.keymap.set(
      "n",
      "<leader>tf",
      require("illuminate").toggle_freeze_buf,
      { desc = "[F]reeze Illuminate" }
    )

    -- Autocommand to turn off highlighting by default.
    local augroup = "vim-illuminate-autocmds"
    vim.api.nvim_create_augroup(augroup, { clear = true })
    vim.api.nvim_create_autocmd("BufRead", {
      group = augroup,
      callback = function()
        require("illuminate").invisible_buf()
      end,
    })
  end,
}
