return {
	"mistricky/codesnap.nvim",
	build = "make",
	lazy = true,
	cmd = "CodeSnapSave",
	opts = {
		watermark = "",
		has_breadcrumbs = true,
		show_workspace = true,
		bg_padding = 30,
	},
}
