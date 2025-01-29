return {
	"okuuva/auto-save.nvim",
	version = "*",
	event = "BufWritePre", -- optional for lazy loading on trigger events
	opts = {
		execution_message = {
			message = function() -- message to print on save
				-- return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
				return "Autosaved"
			end,
			dim = 0.18, -- dim the color of `message`
			cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
		},
		trigger_events = { -- See :h events
			immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" }, -- vim events that trigger an immediate save
			defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
			cancel_deferred_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
		},
		debounce_delay = 500, -- saves the file at most every `debounce_delay` milliseconds
		write_all_buffers = false, -- write all buffers when the current one meets `condition`
		-- function that determines whether to save the current buffer or not
		-- return true: if buffer is ok to be saved
		-- return false: if it's not ok to be saved

		condition = function(buf)
			-- don't save for special-buffers
			if vim.fn.getbufvar(buf, "&buftype") ~= "" then
				return false
			end
			return true
		end,
	},
}
