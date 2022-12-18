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
vim.api.nvim_create_autocmd({ "FileType mail,human" }, {
  callback = function()
    vim.opt.formatoptions:append("t")
    vim.bo.textwidth = 72
  end
})

-- create make compiler settings for c, cpp
vim.api.nvim_create_autocmd({"FileType c"}, {
  callback = function ()
    vim.opt.formatoptions:append("ro")
    vim.opt.makeprg = "gcc %"
  end
})

-- set compiler for cpp
vim.api.nvim_create_autocmd({"FileType cpp"}, {
  callback = function ()
    vim.opt.makeprg = "g++ %"
    vim.opt.path:append("/usr/include/c++/**")
  end
})

-- disable expanding tab for html and css to save a few bytes
vim.api.nvim_create_autocmd({"FileType html,css"}, {
  callback = function ()
    vim.opt.expandtab = false
    vim.opt.tabstop = 2
  end
})

-- disable expandtab, set shiftwidth 8 for makefiles
vim.api.nvim_create_autocmd({"FileType make"}, {
  callback = function ()
    vim.opt.expandtab = false
    vim.opt.shiftwidth = 8
  end
})

-- disable expandtab for shell scripts as it can create problems for
-- <<- syntax
vim.api.nvim_create_autocmd({"FileType sh"}, {
  callback = function ()
    vim.opt.expandtab = false
  end
})
