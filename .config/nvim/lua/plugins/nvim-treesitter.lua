return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "main",
	version = false,
	lazy = false, -- new nvim-treesitter does not support lazy-loading
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects", -- for mini.ai
	},
	config = function()
		local langs = {
			"bash",
			"c",
			"cpp",
			"css",
			"diff",
			"html",
			"javascript",
			"json",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		}

		-- Install parsers (no-op if already installed)
		require("nvim-treesitter").install(langs)

		-- Map languages → their filetypes so the autocmd only fires for
		-- filetypes that actually have a parser (avoids "skipping unsupported
		-- language" warnings for UI pseudo-filetypes like notify, noice, etc.)
		local filetypes = vim
			.iter(langs)
			:map(function(lang)
				return vim.treesitter.language.get_filetypes(lang)
			end)
			:flatten()
			:totable()

		vim.api.nvim_create_autocmd("FileType", {
			desc = "Enable treesitter for supported languages",
			pattern = filetypes,
			group = vim.api.nvim_create_augroup("ts_setup", { clear = true }),
			callback = function(ev)
				-- Highlight (built into Neovim)
				-- Ruby keeps vim regex highlighting for indent rules
				pcall(vim.treesitter.start, ev.buf)
				if vim.bo[ev.buf].filetype == "ruby" then
					vim.cmd("syntax on")
				end

				-- Folds
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

				-- Indentation
				vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
