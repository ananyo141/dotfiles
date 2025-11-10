return {
	"stevearc/aerial.nvim",
	opts = {},
	keys = {
		{
			"<leader>ba",
			function()
				require("aerial").snacks_picker({
					layout = {
						layout = {
							backdrop = false,
							width = 40,
							height = 0,
							position = "right",
							border = "none",
							box = "vertical",
							{
								win = "list",
								border = "none",
								wo = {
									winhl = "NormalFloat:Normal,FloatBorder:VertSplit",
									list = false,
								},
							},
							-- {
							-- 	win = "preview",
							-- 	height = 0.4,
							-- 	border = "top",
							-- 	wo = {
							-- 		winhl = "NormalFloat:Normal,FloatBorder:VertSplit",
							-- 	},
							-- },
							{
								win = "input",
								height = 1,
								border = "none",
								wo = {
									winhl = "NormalFloat:Normal,FloatBorder:VertSplit",
								},
							},
						},
					},
				})
			end,
			desc = "Toggle Aerial",
		},
		{
			"[a",
			function()
				require("aerial").goto_previous()
			end,
			desc = "Go to previous symbol",
		},
		{
			"]a",
			function()
				require("aerial").goto_next()
			end,
			desc = "Go to next symbol",
		},
	},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.nvim", -- Required for icons
	},
}
