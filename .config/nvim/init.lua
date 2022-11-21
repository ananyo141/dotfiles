-- Clear previous autocommands 
-- in case of config reload
vim.api.nvim_clear_autocmds {}

-- Settings
vim.g.mapleader = " " -- make space leader key

require("user.options")
require("user.exec_cmd")
require("user.keybindings")
require("user.user_commands")
require("user.autocommands")
require("user.abbreviations")

