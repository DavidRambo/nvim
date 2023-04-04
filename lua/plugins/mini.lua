return {
	{
		"echasnovski/mini.bracketed",
		config = function()
			require("mini.bracketed").setup()
		end,
	},

	{
		"echasnovski/mini.move",
		config = function()
			require("mini.move").setup({
				mappings = {
					left = "<M-h>",
					right = "<M-l>",
					down = "<M-j>",
					up = "<M-k>",
				},
			})
		end,
	},

	{
		"echasnovski/mini.splitjoin",
		version = false,
		event = "VeryLazy",
		config = function()
			require("mini.splitjoin").setup()
		end,
	},
}
