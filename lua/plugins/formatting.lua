return {
  "stevearc/conform.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        -- lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        lsp_fallback = true,
      }
    end,
    formatters_by_ft = {
      bash = { "beautysh" },
      c = { "clang-format" },
      fish = { "fish_indent" },
      html = { "prettierd" },
      json = { "prettierd" },
      lua = { "stylua" },
      markdown = { "prettierd" },
      python = { "ruff_format" },
      sql = { "sql_formatter" },
      zsh = { "beautysh" },
    },
    formatters = {
      clang_format = { -- This doesn't work : (
        extra_args = { "-style=", "'{IndentCaseLabels: true}'" },
      },
    },
  },

  vim.keymap.set({ "n", "v" }, "<leader>bf", function()
    require("conform").format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    })
  end, { desc = "Format file or visual-mode range." }),
}
