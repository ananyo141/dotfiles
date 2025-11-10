return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
	},
	config = function(_, opts) -- This is the function that runs, AFTER loading
		local wk = require("which-key")
		wk.setup(opts)
		wk.add({
			{ "<leader>a", group = "[A]I" },
			{ "<leader>b", group = "[B]uffer" },
			{ "<leader>b_", hidden = true },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>d_", hidden = true },
			{ "<leader>g", group = "[G]it Hunk" },
			{ "<leader>g_", hidden = true },
			{ "<leader>l", group = "[L]SP" },
			{ "<leader>l_", hidden = true },
			{ "<leader>r", group = "[R]ecents" },
			{ "<leader>r_", hidden = true },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>s_", hidden = true },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>t_", hidden = true },
			{ "<leader>w", group = "[W]orkspace" },
			{ "<leader>w_", hidden = true },
			{ "<leader>g", desc = "[G]it Hunk", mode = "v" },
		})
	end,
}
