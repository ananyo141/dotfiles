-- Options
vim.opt.syntax = "on"           -- enable syntax
vim.opt.termguicolors = true    -- enable terminal colors
vim.opt.history = 50        -- save command history upto 50 entries
vim.opt.wildmode = "full"   -- command completion mode
vim.opt.showmode = true     -- show which mode is active
vim.opt.showcmd = true      -- show latest command
vim.opt.modeline = false    -- don't try to override this rc
vim.opt.wrap = false        -- no wrapping
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true    -- replace tabs with space
vim.opt.tabstop = 4
vim.opt.autochdir = true    -- automatically change directory to buffer
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.splitright = true   -- split windows to right
vim.opt.splitbelow = true   -- and below
vim.opt.foldmethod = "indent"   -- fold according to indentation
vim.opt.foldlevel = 99          -- when opening, disable any folds
vim.opt.autoread = true -- automatically read buffer if changed
vim.opt.hidden = true   -- hide buffer on change
vim.opt.completeopt = { "menuone", "longest" }
vim.opt.clipboard = "unnamedplus"   -- use system clipboard
vim.opt.hlsearch = false
vim.opt.mouse = 'a'             -- enable mouse all the time
vim.opt.shortmess:append("r")   -- enable short message
vim.opt.number = true
vim.opt.relativenumber = true

-- normally don't automatically format `text' as it is typed, IE only do this
-- with comments, at 79 characters:
vim.opt.formatoptions:remove { "t", "o" }
vim.opt.textwidth = 79

vim.opt.compatible = false  -- disable compaitibility with vi
vim.opt.smartcase = true
vim.opt.incsearch = true

-- have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
-- by default), and ~ covert case over line breaks; also have the cursor keys
-- wrap in insert mode:
vim.opt.whichwrap = "h,l,~,[,]"

-- have % bounce between angled brackets, as well as t'other kinds:
vim.opt.matchpairs:append("<:>")

vim.opt.scrolloff = 0
vim.opt.list = true

-- Save undo history on temporary file
-- that deletes every boot
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
vim.opt.visualbell = false  -- disable flashing or ringing on backspacing
vim.opt.errorbells = false
vim.opt.timeoutlen = 500    -- increase map timeout to 500ms

-- Set minimum width and height of windows to minimum
-- for maximum expansion
vim.opt.winminwidth = 0
vim.opt.winminheight = 0

