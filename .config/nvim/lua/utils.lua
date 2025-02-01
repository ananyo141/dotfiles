local fortunes = require("fortune")
local headers = require("headers")

local M = {}

function M.merge_tables(table1, table2)
	for _, v in ipairs(table2) do
		table.insert(table1, v)
	end
	return table1
end

function M.map_key(keypress, command, desc, mode, opts)
	vim.keymap.set(mode or "n", keypress, command, opts or {
		noremap = true,
		silent = true,
		desc = desc or "",
	})
end

function M.get_git_branch()
	local git_branch = vim.fn.system("git branch --show-current")
	if vim.v.shell_error ~= 0 then
		return nil
	end
	return vim.trim(git_branch)
end

M.get_random = function(arr)
	math.randomseed(os.time())
	return arr[math.random(#arr)]
end

M.get_fortune = fortunes

M.get_header = function()
	return M.get_random(headers)
end

return M
