return {
	-- buffer remove
	{
		"echasnovski/mini.bufremove",
		-- stylua: ignore
		keys = {
			{ "<leader>bk", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
			{ "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
		},
	},
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
