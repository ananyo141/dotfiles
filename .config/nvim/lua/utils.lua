local M = {}

function M.merge_tables(table1, table2)
	for _, v in ipairs(table2) do
		table.insert(table1, v)
	end
	return table1
end

function M.map_key(keypress, command, mode, opts)
	vim.keymap.set(mode or "n", keypress, command, opts or { noremap = true, silent = true })
end

function M.get_git_branch()
	local git_branch = vim.fn.system("git branch --show-current")
	if vim.v.shell_error ~= 0 then
		return nil
	end
	return vim.trim(git_branch)
end

return M
