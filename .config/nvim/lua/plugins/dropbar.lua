return {
	"Bekaboo/dropbar.nvim",
	event = "BufReadPre",
	-- optional, but required for fuzzy finder support
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
	},
}
