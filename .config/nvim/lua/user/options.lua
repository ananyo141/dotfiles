-- Options
vim.opt.syntax = "on" -- enable syntax
vim.opt.termguicolors = true -- enable terminal colors
vim.opt.history = 50 -- save command history upto 50 entries
vim.opt.wildmode = "full" -- command completion mode
vim.opt.showmode = true -- show which mode is active
vim.opt.showcmd = true -- show latest command
vim.opt.modeline = false -- don't try to override this rc
vim.opt.wrap = false -- no wrapping
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.autochdir = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.completeopt = { "menuone", "longest" }
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = false
vim.opt.mouse = 'a' -- enable mouse all the time
vim.opt.shortmess:append("r") -- enable short message
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.formatoptions:remove { "t", "o" }
vim.opt.textwidth = 79
vim.opt.compatible = false
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.whichwrap = "h,l,~,[,]"
vim.opt.matchpairs:append("<:>")
vim.opt.scrolloff = 0

local undodir = '/tmp/.nvim-undo'
-- create if does not exists
if not vim.fn.isdirectory(undodir) then
  vim.fn.mkdir(undodir, "", 0700)
end
vim.opt.undodir = undodir
vim.opt.undofile = true

vim.opt.signcolumn = "auto"
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.visualbell = false
vim.opt.errorbells = false
vim.opt.timeoutlen = 500
vim.opt.winminwidth = 0
vim.opt.winminheight = 0
