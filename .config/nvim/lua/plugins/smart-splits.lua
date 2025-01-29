return {
	"mrjones2014/smart-splits.nvim",
	opts = {
		resize_mode = {
			silent = true,
			hooks = {
				on_enter = function()
					vim.notify("Entering resize mode")
				end,
				on_leave = function()
					vim.notify("Exiting resize mode")
				end,
			},
		},
	},
	-- stylua: ignore
	keys = {
		{"<Left>", function() require("smart-splits").resize_left() end, desc = "Resize Left"},
		{"<Down>", function() require("smart-splits").resize_down() end, desc = "Resize Right"},
		{"<Up>", function() require("smart-splits").resize_up() end, desc = "Resize Up"},
		{"<Right>", function() require("smart-splits").resize_right() end, desc = "Resize Right"},
	},
}
