local utils = require("utils")

return {
	-- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	version = false,
	event = "VeryLazy",
	config = function()
		-- Icon Provider
		require("mini.icons").setup()
		MiniIcons.mock_nvim_web_devicons()

		-- Auto pairs
		require("mini.pairs").setup()

		-- Move
		require("mini.move").setup({
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = "H",
				right = "L",
				down = "J",
				up = "K",
			},
		})

		-- Better Around/Inside textobjects
		local ai = require("mini.ai")
		ai.setup({
			n_lines = 500,
			custom_textobjects = {
				o = ai.gen_spec.treesitter({ -- code block
					a = { "@block.outer", "@conditional.outer", "@loop.outer" },
					i = { "@block.inner", "@conditional.inner", "@loop.inner" },
				}),
				f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
				c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
				t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
				d = { "%f[%d]%d+" }, -- digits
				e = { -- Word with case
					{ "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
					"^().*()$",
				},
				u = ai.gen_spec.function_call(), -- u for "Usage"
				U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
			},
		})

		-- Animation
		-- Disable mouse wheel animation
		local animate = require("mini.animate")
		local mouse_scrolled = false
		for _, scroll in ipairs({ "Up", "Down" }) do
			local key = "<ScrollWheel" .. scroll .. ">"
			vim.keymap.set("", key, function()
				mouse_scrolled = true
				return key
			end, { noremap = true, expr = true })
		end

		animate.setup({
			cursor = {
				enable = false,
			},
			scroll = {
				timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
				subscroll = animate.gen_subscroll.equal({
					predicate = function(total_scroll)
						if mouse_scrolled then
							mouse_scrolled = false
							return false
						end
						return total_scroll > 1
					end,
				}),
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
		utils.map_key("<Leader>rf", MiniVisits.select_path, "Select recent file")
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
		end, "Select branch label")

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		require("mini.surround").setup({
			n_lines = 500,
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

		-- Cursorword
		require("mini.cursorword").setup()

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
			pattern = "MiniFilesActionRename",
			callback = function(event)
				Snacks.rename.on_rename_file(event.data.from, event.data.to)
			end,
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "snacks_picker_preview", "mason", "lazy" },
			callback = function()
				local win = vim.fn.win_getid()
				MiniFiles.close()
				vim.fn.win_gotoid(win)
			end,
		})
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
		utils.map_key("<Leader>E", minifiles_toggle, "Open file explorer")
	end,
}
