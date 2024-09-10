return {
	-- Autoformat
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
		{
			"<leader>lk",
			vim.diagnostic.goto_prev,
			mode = "n",
			desc = "Go to previous diagnostic message",
		},
		{
			"<leader>lj",
			vim.diagnostic.goto_next,
			mode = "n",
			desc = "Go to next diagnostic message",
		},
	},
	opts = {
		notify_on_error = false,
		-- format_on_save = function(bufnr)
		--   -- Disable "format_on_save lsp_fallback" for languages that don't
		--   -- have a well standardized coding style. You can add additional
		--   -- languages here or re-enable it for the disabled ones.
		--   local disable_filetypes = { c = true, cpp = true }
		--   return {
		--     timeout_ms = 500,
		--     lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		--   }
		-- end,
		format_on_save = false,
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform can also run multiple formatters sequentially
			python = { "isort", "black" },
			--
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
	},
}
