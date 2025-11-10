-- lazy.nvim
return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapters = {
			http = {
				gemini = function()
					return require("codecompanion.adapters").extend("gemini", {
						defaults = {
							auth_method = "gemini-api-key",
						},
						env = {
							api_key = "cmd: gpg --batch --quiet --decrypt ~/.gemini/api_key.gpg",
						},
					})
				end,
			},
		},
		-- NOTE: The log_level is in `opts.opts`
		opts = {
			log_level = "DEBUG", -- or "TRACE"
		},
	},
	keys = {
		{
			"<leader>av",
			mode = "v",
			function()
				require("codecompanion").add({})
			end,
			desc = "Code Companion Add",
		},
		{
			"<leader>aa",
			function()
				require("codecompanion").actions({ window_opts = { layout = "float", width = 0.8, height = 0.8 } })
			end,
			desc = "Code Companion Actions",
		},
		{
			"<leader>ac",
			function()
				require("codecompanion").toggle({ window_opts = { layout = "float", width = 0.8, height = 0.8 } })
			end,
			desc = "Toggle Code Companion",
		},
		{
			"<leader>aC",
			function()
				require("codecompanion").chat({ window_opts = { layout = "float", width = 0.8, height = 0.8 } })
			end,
			desc = "New Chat with Code Companion",
		},
	},
}
