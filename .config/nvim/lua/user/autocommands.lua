vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.txt",
  callback = function()
    vim.bo.filetype = "human"
  end
})

vim.api.nvim_create_autocmd({ "FileType mail,human" }, {
  callback = function()
    vim.opt.formatoptions:append("t")
    vim.bo.textwidth = 72
  end
})

vim.api.nvim_create_autocmd({"FileType c"}, {
  callback = function ()
    vim.opt.formatoptions:append("ro")
    vim.opt.makeprg = "gcc %"
  end
})

vim.api.nvim_create_autocmd({"FileType cpp"}, {
  callback = function ()
    vim.opt.makeprg = "g++ %"
    vim.opt.path:append("/usr/include/c++/**")
  end
})

vim.api.nvim_create_autocmd({"FileType html,css"}, {
  callback = function ()
    vim.opt.expandtab = false
    vim.opt.tabstop = 2
  end
})

vim.api.nvim_create_autocmd({"FileType make"}, {
  callback = function ()
    vim.opt.expandtab = false
    vim.opt.shiftwidth = 8
  end
})

vim.api.nvim_create_autocmd({"FileType sh"}, {
  callback = function ()
    vim.opt.expandtab = false
  end
})
