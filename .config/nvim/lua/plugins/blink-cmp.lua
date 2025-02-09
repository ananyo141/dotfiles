return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets", "onsails/lspkind.nvim" },

	-- use a release tag to download pre-built binaries
	version = "*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = { preset = "enter" },
		completion = {
			list = {
				selection = {
					preselect = function(ctx)
						return ctx.mode ~= "cmdline"
					end,
					auto_insert = function(ctx)
						return ctx.mode ~= "cmdline"
					end,
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
				},
			},
			menu = {
				border = "rounded",
				draw = {
					gap = 2,
					treesitter = { "lsp" },
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind", gap = 1 },
					},
					components = {
						label = {
							ellipsis = true,
							width = { max = 26 },
						},
						kind_icon = {
							ellipsis = true,
							text = function(ctx)
								local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
								local icon = require("lspkind").symbolic(ctx.kind, {
									mode = "symbol",
								})
								if icon then
									kind_icon = icon
								end
								return kind_icon
							end,
							-- Optionally, you may also use the highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
					},
				},
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
			},

			accept = {
				-- experimental auto-brackets support
				auto_brackets = {
					enabled = false,
				},
			},
		},
		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				buffer = {
					opts = {
						-- Buffer completion from all open buffers
						-- (recommended) filter to only "normal" buffers
						get_bufnrs = function()
							return vim.tbl_filter(function(bufnr)
								return vim.bo[bufnr].buftype == ""
							end, vim.api.nvim_list_bufs())
						end,
					},
				},
			},
		},
		signature = {
			enabled = false,
			window = {
				border = "rounded",
			},
		},
	},
	opts_extend = {
		"sources.completion.enabled_providers",
		"sources.compat",
		"sources.default",
	},
}
