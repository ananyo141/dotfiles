local utils = require("utils")

return {
	-- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	version = "false",
	config = function()
		-- Icon Provider
		require("mini.icons").setup()
		MiniIcons.mock_nvim_web_devicons()

		-- Auto pairs
		require("mini.pairs").setup()

		-- Better Around/Inside textobjects
		require("mini.ai").setup({ n_lines = 500 })

		-- Animation
		require("mini.animate").setup({
			cursor = {
				enable = false,
			},
		})

		-- Highlight patterns
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				hex_color = hipatterns.gen_highlighter.hex_color(),
				fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
				hack = { pattern = "HACK", group = "MiniHipatternsHack" },
				todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
				note = { pattern = "NOTE", group = "MiniHipatternsNote" },
			},
		})

		-- Frecency
		require("mini.visits").setup()
		utils.map_key("<Leader>rf", MiniVisits.select_path, "n", { desc = "Select recent file" })
		local get_label_name = function()
			-- Get the project name and the current git branch
			return vim.fn.fnamemodify(
				require("mini.misc").find_root(nil, { ".git", ".gitignore", "package.json" }) or "unnamed",
				":t"
			) .. "-" .. (utils.get_git_branch() or "local")
		end
		local map_branch = function(keys, action, desc)
			local rhs = function()
				require("mini.visits")[action](get_label_name())
			end
			vim.keymap.set("n", "<Leader>" .. keys, rhs, { desc = desc })
		end

		map_branch("ra", "add_label", "Add branch label")
		map_branch("rd", "remove_label", "Remove branch label")
		utils.map_key("<leader>rs", function()
			local label = get_label_name()
			MiniVisits.select_path("", { filter = label })
		end, "n", { desc = "Select branch label" })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		require("mini.surround").setup({
			mappings = {
				add = "ys", -- Add surrounding in Normal and Visual modes
				delete = "ds", -- Delete surrounding
				find = "yf", -- Find surrounding (to the right)
				find_left = "yF", -- Find surrounding (to the left)
				highlight = "yh", -- Highlight surrounding
				replace = "cs", -- Replace surrounding
				update_n_lines = "yn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		})

		-- Split Join
		require("mini.splitjoin").setup()

		-- Simple and easy statusline.
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- Comment lines
		require("mini.comment").setup()

		-- File Explorer
		local map_split = function(buf_id, lhs, direction)
			local rhs = function()
				-- Make new window and set it as target
				local cur_target = MiniFiles.get_explorer_state().target_window
				local new_target = vim.api.nvim_win_call(cur_target, function()
					vim.cmd(direction .. " split")
					return vim.api.nvim_get_current_win()
				end)

				MiniFiles.set_target_window(new_target)
				MiniFiles.go_in({ close_on_file = true })
			end

			-- Adding `desc` will result into `show_help` entries
			local desc = "Split " .. direction
			vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				-- Tweak keys to your liking
				map_split(buf_id, "<C-x>", "belowright horizontal")
				map_split(buf_id, "<C-v>", "belowright vertical")
			end,
		})
		require("mini.files").setup({
			mappings = {
				close = "<Esc>",
				go_in_plus = "<CR>",
			},
			windows = {
				preview = true,
				width_preview = 35,
			},
		})
		local minifiles_toggle = function()
			if not MiniFiles.close() then
				MiniFiles.open(vim.api.nvim_buf_get_name(0))
				MiniFiles.reveal_cwd()
			end
		end
		utils.map_key("<Leader>e", minifiles_toggle, "n", { desc = "Open file explorer" })
	end,
}
