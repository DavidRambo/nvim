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
				nls.builtins.formatting.stylua,
				nls.builtins.formatting.black,
				nls.builtins.formatting.shfmt,
				nls.builtins.formatting.sql_formatter,
			},
		}
	end,
}
