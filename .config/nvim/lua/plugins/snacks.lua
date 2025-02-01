local utils = require("utils")

return {
	"folke/snacks.nvim",
	event = "VeryLazy",
	---@type snacks.Config
	opts = {
		picker = {
			layout = {
				-- Vertical Telescope layout
				layout = {
					box = "vertical",
					backdrop = false,
					width = 0.8,
					height = 0.9,
					border = "none",
					{
						win = "preview",
						title = "{preview:Preview}",
						width = 0,
						border = "rounded",
						title_pos = "center",
					},
					{
						box = "vertical",
						{ win = "list", title = " Results ", title_pos = "center", border = "rounded" },
						{
							win = "input",
							height = 1,
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
						},
					},
				},
			},
			matcher = {
				frecency = true,
			},
		},
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
	-- stylua: ignore
	---@diagnostic disable:undefined-global
	keys = {
		{ "<C-\\>", mode = { "n", "t" }, function() Snacks.terminal.toggle() end },
		{ "<leader>lL", "<cmd>Lazy<CR>", desc = "Open lazy.nvim" },

		-- Snacks Picker
		{ "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
		-- find
		{ "<leader>s;", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
		{ "<leader>f", function()
			if Snacks.git.get_root() then
				Snacks.picker.git_files()
			else
				Snacks.picker.files()
			end
		end, nowait = true, desc = "Find Files" },
		{ "<leader>sR", function() Snacks.picker.recent() end, desc = "Recent" },
		-- git
		{ "<leader>gc", function() Snacks.picker.git_log() end, desc = "Git Checkout" },
		{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
		-- Grep
		{ "<leader>/", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
		{ "<leader>sb", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
		{ "<leader>ss", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
		-- search
		{ '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
		{ "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
		{ "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
		{ "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
		{ "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
		{ "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
		{ "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
		{ "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
		{ "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
		{ "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
		{ "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
		{ "<leader>sr", function() Snacks.picker.resume() end, desc = "Resume" },
		{ "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
		{ "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
		{ "<leader>sp", function() Snacks.picker.projects() end, desc = "Projects" },
		-- LSP
		{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
		{ "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
		{ "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
		{ "<leader>sx", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
		{ "<leader>sy", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
	},
}
