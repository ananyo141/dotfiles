-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return  {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  requires = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- Configuration options for nvim-tree
    sync_root_with_cwd = true,
    disable_netrw = true,
    hijack_netrw = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    update_focused_file = {
      enable = true,
      -- update_cwd = true,
    },
    view = {
      width = 30,
      side = 'left',
    },
  },
  keys = {
    { '<leader>e', ':NvimTreeToggle<CR>', { desc = 'NvimTree Toggle' }, silent = true },
  },
}
