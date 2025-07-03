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
	signs = true,
	update_in_insert = false,
	float = {
		source = "if_many",
		border = "rounded",
		show_header = true,
	},
})

-- Define custom icons for diagnostics
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Optionally, configure floating diagnostics window
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

-- Map key for toggling virtual text
vim.keymap.set("n", "<leader>th", toggle_virtual_text, {
	noremap = true,
	silent = true,
	desc = "[T]oggle virtual [h]ints",
})

vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev, {
	noremap = true,
	silent = true,
	desc = "Go to previous diagnostic message",
})

vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next, {
	noremap = true,
	silent = true,
	desc = "Go to next diagnostic message",
})
