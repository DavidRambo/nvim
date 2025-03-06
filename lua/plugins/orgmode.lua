return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/notes/tasks.org",
        org_default_notes_file = "~/notes/20250302105905-capture.org",
        org_todo_keywords = { "TODO(t)", "NEXT(n)", "ACTIVE(a)", "|", "DONE(d)" },
        org_startup_folded = "content",
      })
    end,
  },
  {
    "akinsho/org-bullets.nvim",
    config = function()
      require("org-bullets").setup({})
    end,
  },
}
