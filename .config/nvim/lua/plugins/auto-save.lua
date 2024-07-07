return {
	"Pocco81/auto-save.nvim",
	opts = {
		execution_message = {
			message = function() -- message to print on save
				-- return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
				return ("Autosaved")
			end,
			dim = 0.18, -- dim the color of `message`
			cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
		},
		trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events
		debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
		write_all_buffers = false, -- write all buffers when the current one meets `condition`
		-- function that determines whether to save the current buffer or not
		-- return true: if buffer is ok to be saved
		-- return false: if it's not ok to be saved
		condition = function(buf)
			local fn = vim.fn
			local utils = require("auto-save.utils.data")
      -- don't save non-normal buffers
      if vim.bo[buf].buftype ~= "" then
        return false
      end
			if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
				return true -- met condition(s), can save
			end
			return false -- can't save
		end,
	},
}
