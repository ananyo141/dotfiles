local utils = require("utils")

return {
	"folke/snacks.nvim",
	event = "VeryLazy",
	---@type snacks.Config
	opts = {
		dashboard = {
			preset = {
				header = table.concat(utils.merge_tables(utils.get_header(), utils.get_fortune()), "\n"),
			},
		},
		indent = {
			enable = true,
		},
		terminal = {
			win = {
				style = "float",
				border = "rounded",
			},
		},
	},
	keys = {
		{
			"<C-\\>",
			mode = { "n", "t" },
			function()
				Snacks.terminal.toggle()
			end,
		},
	},
}
