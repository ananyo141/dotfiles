-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Set quick-scope plugin option
vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
vim.opt.mousemoveevent = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.syntax = "on"           -- enable syntax
vim.opt.termguicolors = true    -- enable terminal colors
vim.opt.history = 50        -- save command history upto 50 entries
vim.opt.wildmode = "full"   -- command completion mode
vim.opt.showcmd = true      -- show latest command
-- vim.opt.modeline = false    -- don't try to override this rc
vim.opt.modelines = 5       -- read 5 lines for modelines
vim.opt.wrap = false        -- no wrapping
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true    -- replace tabs with space
vim.opt.tabstop = 4
vim.opt.autochdir = true    -- automatically change directory to buffer
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.foldmethod = "indent"   -- fold according to indentation
vim.opt.foldlevel = 99          -- when opening, disable any folds
vim.opt.autoread = true -- automatically read buffer if changed
vim.opt.hidden = true   -- hide buffer on change
vim.opt.completeopt = { "menuone", "longest" }
vim.opt.shortmess:append("r")   -- enable short message
vim.opt.relativenumber = true

-- Stop at underscores in words
-- vim.opt.iskeyword:remove('_')

-- normally don't automatically format `text' as it is typed, IE only do this
-- with comments, at 79 characters:
vim.opt.formatoptions:remove { "t", "o" }
vim.opt.textwidth = 79

vim.opt.compatible = false  -- disable compaitibility with vi
vim.opt.incsearch = true

-- have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
-- by default), and ~ covert case over line breaks; also have the cursor keys
-- wrap in insert mode:
vim.opt.whichwrap = "h,l,~,[,]"

-- have % bounce between angled brackets, as well as t'other kinds:
vim.opt.matchpairs:append("<:>")

-- Save undo history on temporary file
-- that deletes every boot
local undodir = '/tmp/.nvim-undo'
-- create if does not exists
if not vim.fn.isdirectory(undodir) then
  vim.fn.mkdir(undodir, "", 0700)
end
vim.opt.undodir = undodir
vim.opt.undofile = true

-- vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.visualbell = false  -- disable flashing or ringing on backspacing
vim.opt.errorbells = false

-- Set minimum width and height of windows to minimum
-- for maximum expansion
vim.opt.winminwidth = 0
vim.opt.winminheight = 0
