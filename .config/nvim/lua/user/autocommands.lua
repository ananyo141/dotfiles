-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

-- Detect anything at all with a .txt extension as being human-language text [this clobbers the
-- `help' filetype, but that doesn't seem to prevent help from working
-- properly]:
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.txt",
  callback = function()
    vim.bo.filetype = "human"
  end
})

-- in human-language files, automatically format everything at 72 chars:
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "mail", "human" },
  callback = function()
    vim.opt.formatoptions:append("t")
    vim.bo.textwidth = 72
  end
})

-- create make compiler settings for c, cpp
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.opt.formatoptions:append("ro")
    vim.opt.makeprg = "gcc %"
  end
})

-- set compiler for cpp
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.opt.makeprg = "g++ %"
    vim.opt.path:append("/usr/include/c++/**")
  end
})

-- disable expanding tab for html and css to save a few bytes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css" },
  callback = function()
    vim.opt.expandtab = false
    vim.opt.tabstop = 2
  end
})

-- disable expandtab, set shiftwidth 8 for makefiles
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt.expandtab = false
    vim.opt.shiftwidth = 8
  end
})

-- disable expandtab for shell scripts as it can create problems for
-- <<- syntax
vim.api.nvim_create_autocmd("FileType", {
  pattern = "sh",
  callback = function()
    vim.opt.expandtab = false
  end
})

-- automatically read changing contents of output file when recompiled
-- useful for competitive programming
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    pcall(function() vim.cmd("checktime output.out") end)
  end
})
