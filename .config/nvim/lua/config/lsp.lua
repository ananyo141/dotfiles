local virtual_text_enabled = true
local prefix = "●"

local function toggle_virtual_text()
	virtual_text_enabled = not virtual_text_enabled
	vim.diagnostic.config({
		virtual_text = virtual_text_enabled and {
			prefix = prefix,
		} or false,
	})
	print("Virtual text " .. (virtual_text_enabled and "enabled" or "disabled"))
end

vim.diagnostic.config({
	virtual_text = virtual_text_enabled and {
		prefix = prefix,
	} or false,
	virtual_lines = { current_line = true },
	underline = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
		},
	},
	update_in_insert = false,
	float = {
		source = "if_many",
		border = "rounded",
		show_header = true,
	},
})

-- Set border for all floating windows, including LSP hover and signature help.
vim.o.winborder = "rounded"

-- Map key for toggling virtual text
vim.keymap.set("n", "<leader>th", toggle_virtual_text, {
	noremap = true,
	silent = true,
	desc = "[T]oggle virtual [h]ints",
})

vim.keymap.set("n", "<leader>lk", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, {
	noremap = true,
	silent = true,
	desc = "Go to previous diagnostic message",
})

vim.keymap.set("n", "<leader>lj", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, {
	noremap = true,
	silent = true,
	desc = "Go to next diagnostic message",
})
