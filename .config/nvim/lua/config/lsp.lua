vim.diagnostic.config {
  virtual_text = false,
  -- virtual_text = {
  --   prefix = ' ',
  -- },
  underline = true,
  signs = true,
  update_in_insert = false,
  float = {
    source = 'if_many',
    border = 'rounded',
    show_header = true
  },
}

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
