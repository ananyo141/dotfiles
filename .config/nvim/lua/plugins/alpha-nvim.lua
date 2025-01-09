return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"MaximilianLloyd/ascii.nvim",
	},
	config = function()
		local utils = require("utils")
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val =
			utils.merge_tables(require("ascii").get_random_global(), require("alpha.fortune")())

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󱁴  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "󱋡  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button(
				"s",
				"  Restore session",
				[[<cmd>lua require("persistence").load()<cr>]]
			),
			dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
			dashboard.button("q", "󰈆  Quit", ":qa<CR>"),
		}

		-- Set footer
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val =
					string.format("     ⚡ Neovim loaded %d/%d plugins in %.2fms", stats.loaded, stats.count, ms)
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		-- Apply theme
		alpha.setup(dashboard.opts)

		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.opts.layout[1].val = 99

		-- Disable folding on alpha buffer
		vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
    ]])
	end,
}
