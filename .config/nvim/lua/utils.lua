local M = {}

function M.merge_tables(table1, table2)
	for _, v in ipairs(table2) do
		table.insert(table1, v)
	end
	return table1
end

return M
