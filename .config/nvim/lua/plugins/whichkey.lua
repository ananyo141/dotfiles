return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		local wk = require("which-key")
		wk.add({
			{ "<leader>b", group = "[B]uffer" },
			{ "<leader>b_", hidden = true },
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>c_", hidden = true },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>d_", hidden = true },
			{ "<leader>g", group = "[G]it Hunk" },
			{ "<leader>g_", hidden = true },
			{ "<leader>h", group = "[H]arpoon" },
			{ "<leader>h_", hidden = true },
			{ "<leader>l", group = "[L]SP" },
			{ "<leader>l_", hidden = true },
			{ "<leader>r", group = "[R]ename" },
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
