return {
  "smjonas/inc-rename.nvim",
  cmd = "IncRename",
  config = true,
  keys = {
    {
      "<leader>lr",
      function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end,
      desc = "Incremental Rename",
      mode = "n",
      noremap = true,
      expr = true,
    }
  }
}
