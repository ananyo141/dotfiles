require("config.options")
require("config.keymaps")
require("config.user_commands")
require("config.abbreviations")
require("config.autocommands")
require("config.lsp")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
			local lazyrepo = "https://github.com/folke/lazy.nvim.git"
			vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = "plugins",
	change_detection = { notify = false },
})
