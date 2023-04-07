return {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
		"MunifTanjim/nui.nvim",
	},
	event = "VeryLazy",
	cmd = "Navbuddy",
	keys = { { "<leader>sn", "<CMD>Navbuddy<CR>", desc = "Navbuddy" } },
	config = function()
		require("nvim-navbuddy").setup({
			use_default_mappings = true,
			lsp = {
				preference = { "jedi_language_server" },
			},
		})
	end,
}
