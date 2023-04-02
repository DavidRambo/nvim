return {
	require("mini.bracketed").setup(),

	require("mini.move").setup({
		mappings = {
			left = "<M-h>",
			right = "<M-l>",
			down = "<M-j>",
			up = "<M-k>",
		},
	})
}

