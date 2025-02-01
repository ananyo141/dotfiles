local utils = require("utils")

return {
	"folke/snacks.nvim",
	event = "VeryLazy",
	---@type snacks.Config
	opts = {
		dashboard = {
			preset = {
				header = table.concat(utils.merge_tables(utils.get_header(), utils.get_fortune()), "\n"),
				-- stylua: ignore
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "e", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "S", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
					{ icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{ icon = "󰒲 ", key = "l", desc = "lazy.nvim", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
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
