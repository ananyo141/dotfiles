local keymap = vim.keymap
local nkeymap = {
  set = function(mode, trigger, command)
    vim.keymap.set(mode, trigger, command, { noremap = true })
  end
}
-- Custom bindings
nkeymap.set("n", "<Enter>", ":w<CR>")
nkeymap.set("n", "<F7>", ":source $MYVIMRC<CR>")

nkeymap.set("n", "<leader>i", 'o#include ""<Esc>$i')
nkeymap.set("n", "<leader>I", "o#include <><Esc>$i")

nkeymap.set("n", "<leader>o", "o<Esc>k")
nkeymap.set("n", "<leader>O", "O<Esc>j")

local IncludeGuard = function()
  local basename = string.gsub(vim.fn.bufname(), '[.]', '_')
  local guard = string.upper(basename) .. "_H_"
  vim.fn.append(0, "#ifndef " .. guard)
  vim.fn.append(1, "#define " .. guard)
  vim.fn.append(vim.fn.line("$"), "#endif // for #ifndef " .. guard)
end

nkeymap.set("n", "\\i", IncludeGuard)

-- nkeymap.set("n", "<Space>", "<PageDown>")
nkeymap.set("n", "<BS>", "<PageUp>")

-- scroll the window (but leaving the cursor in the same place) by a couple of
-- lines up/down with <Ins>/<Del> (like in `Lynx'):
nkeymap.set("n", "<Ins>", "2<C-Y>")
nkeymap.set("n", "<Del>", "2<C-E>")

-- use <F6> to cycle through split windows
-- (and <Shift>+<F6> to cycle backwards, where possible):
nkeymap.set("n", "<F6>", "<C-W>w")
nkeymap.set("n", "<S-F6>", "<C-W>W")

-- use <Ctrl>+N/<Ctrl>+P to cycle through files:
nkeymap.set("n", "<C-N>", ":bnext<CR>")
nkeymap.set("n", "<C-P>", ":bprev<CR>")

-- Use bash like terminal mappings in commandline
nkeymap.set("c", "<C-A>", "<HOME>")
nkeymap.set("c", "<C-E>", "<End>")
nkeymap.set("c", "<C-K>", "<C-U>")
nkeymap.set("c", "<C-P>", "<Up>")
nkeymap.set("c", "<C-N>", "<Down>")

nkeymap.set("n", "<F1>", ":help<Space>")

nkeymap.set("n", "Q", "gqap")
nkeymap.set("v", "Q", "gq")


nkeymap.set("v", "<", "<gv")
nkeymap.set("v", ">", ">gv")

nkeymap.set("v", "<C-T>", ">")
nkeymap.set("v", "<C-D>", "<LT>")
keymap.set("v", "<Tab>", "<C-T>")
keymap.set("v", "<S-Tab>", "<C-D>")

-- have Y behave analogously to D and C rather than to dd and cc (which is
-- already done by yy):
nkeymap.set("n", "Y", "y$")

-- have \tp ("toggle paste") toggle paste on/off and report the change, and
nkeymap.set("n", "\tp", ":set invpaste paste?<CR>")
keymap.set("n", "<F4>", "\tp")
keymap.set("i", "<F4>", "<C-O>\tp")
vim.opt.pastetoggle = "<F4>"

-- have \tl ("toggle list") toggle list on/off and report the change:
nkeymap.set("n", "\tl", ":set invlist list?<CR>")
keymap.set("n", "<F2>", "\tl")

-- toggle search pattern highlighting using Ctrl+/
vim.keymap.set("n", "<c-_>", ":set invhls hls?<CR>", { noremap = true, silent = true })

nkeymap.set("i", "jj", "<esc>")

keymap.set("n", "-", ":res<CR>:vertical res<CR>", { silent = true })

-- make changing windows easier
-- for normal mode
nkeymap.set("n", "<F3>", "<C-W>")
nkeymap.set("n", "<C-J>", "<C-W><C-J>")
nkeymap.set("n", "<C-K>", "<C-W><C-K>")
nkeymap.set("n", "<C-H>", "<C-W><C-H>")
nkeymap.set("n", "<C-L>", "<C-W><C-L>")
-- for terminal
nkeymap.set("t", "<C-J>", "<C-\\><C-N><C-W><C-J>")
nkeymap.set("t", "<C-K>", "<C-\\><C-N><C-W><C-K>")
nkeymap.set("t", "<C-H>", "<C-\\><C-N><C-W><C-H>")
nkeymap.set("t", "<C-L>", "<C-\\><C-N><C-W><C-L>")

-- save session
nkeymap.set("n", "<leader>ss", ":mksession!<CR>")
