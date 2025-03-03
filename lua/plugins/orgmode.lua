return {
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

    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
  end,
}
