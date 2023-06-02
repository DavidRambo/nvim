return {
  -- Formatters
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      -- next line is from LazyVim. Saving it as a comment in case it is useful for later.
      -- root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = {
        -- Sources are "ensure_installed" with mason in lua/plugins/lsp.lua
        nls.builtins.formatting.clang_format,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.black,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.sql_formatter,
        nls.builtins.formatting.prettierd,
        -- nls.builtins.formatting.djlint,
        -- Diagnostics
        -- nls.builtins.diagnostics.mypy,
      },
      -- configure format on save
      on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
          -- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            -- group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                filter = function(client)
                  --  only use null-ls for formatting instead of lsp server
                  return client.name == "null-ls"
                end,
                bufnr = bufnr,
              })
            end,
          })
        end
      end,
    }
  end,
}
