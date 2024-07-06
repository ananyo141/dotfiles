-- https://github.com/neovim/neovim/issues/19198
-- Syntactic sugar
local function abbrev(l, r)
  vim.cmd{ cmd = 'abbrev', args = { l, r } }
end

-- Spelling
-- Use abbreviations to correct silly typings
abbrev('funciton', 'function')
abbrev('fo', 'of')
abbrev('nrom', 'norm')
abbrev('lsit', 'list')
abbrev('htis', 'this')
abbrev('paht', 'path')
abbrev('fiel', 'file')
abbrev('fro', 'for')

-- Abbreviations for python
abbrev('ifname', "if __name__ == '__main__':")
abbrev('defini', "def __init__(self):")
abbrev('definis', "def __init__(self,")
abbrev('inis', "__init__(self,")
