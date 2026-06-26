local utils = require("utils")
local map = function(key, command, mode)
	utils.map_key(key, command, nil, mode)
end

local function copy_github_permalink(use_visual_range)
	local file = vim.api.nvim_buf_get_name(0)
	if file == "" then
		vim.notify("No file in current buffer", vim.log.levels.ERROR)
		return
	end

	local function git(args)
		local output = vim.fn.systemlist(vim.list_extend({ "git", "-C", vim.fn.fnamemodify(file, ":h") }, args))
		if vim.v.shell_error ~= 0 then
			return nil
		end

		return output[1]
	end

	local function remote_url()
		local upstream = git({ "rev-parse", "--abbrev-ref", "--symbolic-full-name", "@{u}" })
		if upstream then
			local remote_name = upstream:match("^([^/]+)/")
			local url = remote_name and git({ "config", "--get", "remote." .. remote_name .. ".url" })
			if url then
				return url
			end
		end

		return git({ "config", "--get", "remote.origin.url" }) or git({ "config", "--get", "remote.upstream.url" })
	end

	local function encode_url_path(path)
		return path:gsub("([^A-Za-z0-9%-%._~/])", function(char)
			return string.format("%%%02X", string.byte(char))
		end)
	end

	local repo_root = git({ "rev-parse", "--show-toplevel" })
	local remote = remote_url()
	local commit = git({ "rev-parse", "HEAD" })
	local relative_file = git({ "-c", "core.quotePath=false", "ls-files", "--full-name", "--", file })

	if not repo_root or not remote or not commit then
		vim.notify("Not inside a git repo with a GitHub remote", vim.log.levels.ERROR)
		return
	end

	if not relative_file or relative_file == "" then
		vim.notify("Current file is not tracked by git", vim.log.levels.ERROR)
		return
	end

	if not remote:match("github%.com") then
		vim.notify("Remote is not GitHub: " .. remote, vim.log.levels.ERROR)
		return
	end

	remote = remote:gsub("git@github.com:", "https://github.com/"):gsub("ssh://git@github.com/", "https://github.com/"):gsub("%.git$", "")

	local start_line = use_visual_range and vim.fn.line("v") or vim.fn.line(".")
	local end_line = vim.fn.line(".")

	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end

	local line_suffix = "#L" .. start_line
	if start_line ~= end_line then
		line_suffix = line_suffix .. "-L" .. end_line
	end

	local url = remote .. "/blob/" .. commit .. "/" .. encode_url_path(relative_file) .. line_suffix

	vim.fn.setreg("+", url)
	vim.notify("Copied GitHub permalink")
end

map("<leader>;", ":e $MYVIMRC<CR>")
map("<Enter>", ":w<CR>")
map("<C-N>", ":bnext<CR>")
map("<C-P>", ":bprev<CR>")
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

vim.keymap.set("n", "<leader>gy", function()
	copy_github_permalink(false)
end, {
	desc = "Git copy GitHub permalink",
})

vim.keymap.set("x", "<leader>gy", function()
	copy_github_permalink(true)
end, {
	desc = "Git copy GitHub permalink",
})
