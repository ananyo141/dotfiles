local utils = require("utils")
local map = utils.map_key

map("<leader>;", ":e $MYVIMRC<CR>")
map("<Enter>", ":w<CR>")
map("<C-N>", ":bnext<CR>")
map("<C-P>", ":bprev<CR>")
map("<leader>c", ":bdelete<CR>")
map("<leader>q", ":close<CR>")
map("\\o", "o<Esc>k") -- insert newline one line down
map("\\O", "O<Esc>j") -- insert newline one line up

map("<BS>", "<PageUp>")
map("Q", "gqap")
map("Q", "gq", "v")

-- stay in visual mode after indenting
map("<", "<gv", "v")
map(">", ">gv", "v")

-- have the usual indentation keystrokes still work in visual mode:
map("<C-T>", ">", "v")
map("<C-D>", "<LT>", "v")
map("<Tab>", "<C-T>", "v")
map("<S-Tab>", "<C-D>", "v")

-- have Y behave analogously to D and C rather than to dd and cc (which is
-- already done by yy):
map("Y", "y$")

-- make changing windows easier
-- for normal mode
map("<F3>", "<C-W>")
map("<C-J>", "<C-W><C-J>")
map("<C-K>", "<C-W><C-K>")
map("<C-H>", "<C-W><C-H>")
map("<C-L>", "<C-W><C-L>")

-- for terminal
map("<C-J>", "<C-\\><C-N><C-W><C-J>", "t")
map("<C-K>", "<C-\\><C-N><C-W><C-K>", "t")
map("<C-H>", "<C-\\><C-N><C-W><C-H>", "t")
map("<C-L>", "<C-\\><C-N><C-W><C-L>", "t")

-- scoot visually selected lines
map("J", ":m '>+1<CR>gv=gv", "v")
map("K", ":m '<-2<CR>gv=gv", "v")

-- keep cursor in place while joining lines
map("J", "mzJ`z")
