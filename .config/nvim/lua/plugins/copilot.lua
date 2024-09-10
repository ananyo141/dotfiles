return {
	"zbirenbaum/copilot.lua",
	opts = {
		suggestion = {
			enabled = true,
			auto_trigger = true,
			debounce = 75,
			keymap = {
				accept = "<Tab>",
				accept_word = false,
				accept_line = false,
				next = "<C-n>",
				prev = "<C-p>",
				dismiss = "<C-E>",
			},
		},
	},
	event = "BufEnter",
}
