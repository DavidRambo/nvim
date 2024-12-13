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
      c = {},
      css = { "prettierd" },
      fish = { "fish_indent" },
      go = {},
      html = { "prettierd" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      json = { "prettierd" },
      lua = { "stylua" },
      markdown = { "prettierd" },
      nix = { "alejandra" }, --fallback to rnix_lsp
      python = { "ruff_format" },
      sql = { "sql_formatter" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      yaml = { "prettierd" },
      zsh = { "beautysh" },
    },
    formatters = {
      ["clang-format"] = {
        prepend_args = {
          "--style",
          "{IndentCaseLabels: true, IndentWidth: 4, AllowShortFunctionsOnASingleLine: None}",
        },
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
