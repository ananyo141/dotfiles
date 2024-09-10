return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "BufWinEnter",
	keys = {
		{
			"<leader>bh",
			function()
				require("bufferline").close_in_direction("left")
			end,
			desc = "Close buffer to the left",
		},
		{
			"<leader>bl",
			function()
				require("bufferline").close_in_direction("right")
			end,
			desc = "Close buffer to the right",
		},
		{
			"<leader>bj",
			function()
				require("bufferline").pick()
			end,
			desc = "Pick buffer",
		},
		{
			"<leader>bp",
			":BufferLineTogglePin<CR>",
			desc = "Pin buffer",
		},
	},
	opts = {
		options = {
			separator_style = "slant",
			hover = {
				enabled = true,
				delay = 100,
				reveal = { "close" },
			},
		},
	},
}
