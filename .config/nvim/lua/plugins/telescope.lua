return { -- Fuzzy Finder (files, lsp, etc)
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	config = function()
		-- Telescope is a fuzzy finder that comes with a lot of different things that
		-- it can fuzzy find! It's more than just a "file finder", it can search
		-- many different aspects of Neovim, your workspace, LSP, and more!
		--
		-- The easiest way to use Telescope, is to start by doing something like:
		--  :Telescope help_tags
		--
		-- After running this command, a window will open up and you're able to
		-- type in the prompt window. You'll see a list of `help_tags` options and
		-- a corresponding preview of the help.
		--
		-- Two important keymaps to use while in Telescope are:
		--  - Insert mode: <c-/>
		--  - Normal mode: ?
		--
		-- This opens a window that shows you all of the keymaps for the current
		-- Telescope picker. This is really useful to discover what Telescope can
		-- do as well as how to actually do it!

		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		require("telescope").setup({
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						preview_height = 0.6,
					},
				},
			},
			-- You can put your default mappings / updates / etc. in here
			--  All the info you're looking for is in `:help telescope.setup()`
			--
			-- defaults = {
			--   mappings = {
			--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
			--   },
			-- },
			pickers = {
				live_grep = {
					additional_args = {
						"--hidden",
						"--glob", -- exclude certain files
						"!{**/.git/*}",
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
	end,
	-- stylua: ignore
	keys = {
		{ "<leader>sh", function() require("telescope.builtin").help_tags() end, desc = "[S]earch [H]elp" },
		{ "<leader>sk", function() require("telescope.builtin").keymaps() end, desc = "[S]earch [K]eymaps" },
		{ "<leader>f", function()
			local builtin = require("telescope.builtin")
			local opts = {}
			local ok = pcall(builtin.git_files, opts)
			if not ok then
			builtin.find_files(opts)
			end
		end, desc = "[S]earch [F]iles" },
		{ "<leader>sn", function() require("telescope.builtin").builtin() end, desc = "[S]earch [S]elect Telescope" },
		{ "<leader>sw", function() require("telescope.builtin").grep_string() end, desc = "[S]earch current [W]ord" },
		{ "<leader>ss", function() require("telescope.builtin").live_grep() end, desc = "[S]earch by [G]rep" },
		{ "<leader>sd", function() require("telescope.builtin").diagnostics() end, desc = "[S]earch [D]iagnostics" },
		{ "<leader>sr", function() require("telescope.builtin").resume() end, desc = "[S]earch [R]esume" },
		{ "<leader>s.", function() require("telescope.builtin").oldfiles() end, desc = '[S]earch Recent Files ("." for repeat)' },
		{ "<leader>sb", function() require("telescope.builtin").buffers() end, desc = "[S]earch existing buffers" },
		{ "<leader>sx", function() require("telescope.builtin").lsp_references() end, desc = "[S]earch references" },
		{ "<leader>sy", function() require("telescope.builtin").lsp_document_symbols() end, desc = "[S]earch S[y]mbols" },
		{ "<leader>/", function()
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
			winblend = 10,
			previewer = false,
			}))
		end, desc = "[/] Fuzzily search in current buffer" },
		{ "<leader>s/", function()
			require("telescope.builtin").live_grep({
			grep_open_files = true,
			prompt_title = "Live Grep in Open Files",
			})
		end, desc = "[S]earch [/] in Open Files" },
		{ "<leader>sn", function()
			require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
		end, desc = "[S]earch [N]eovim files" },
	},
}
