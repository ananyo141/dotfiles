-- Clear previous autocommands 
-- in case of config reload
vim.api.nvim_clear_autocmds {}

-- Settings
vim.g.mapleader = " " -- make space leader key

require("user.options")         -- editor options
require("user.exec_cmd")        -- execute vim commands
require("user.keybindings")     -- custom keymaps
require("user.user_commands")   -- custom ex commands
require("user.autocommands")    -- user autocommands
require("user.abbreviations")   -- abbreviations

