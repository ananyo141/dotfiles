return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  dependencies = { 
    'nvim-tree/nvim-web-devicons', 
    'MaximilianLloyd/ascii.nvim',
  },
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    -- Set header
    dashboard.section.header.val = require('ascii').get_random_global()

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("s", "Restore session", [[<cmd>lua require("persistence").load({ last = true })<cr>]]),
      dashboard.button("c", "Config", ":e $MYVIMRC<CR>"),
      dashboard.button("q", "Quit", ":qa<CR>"),
    }

    -- Set footer
    dashboard.section.footer.val = "Welcome to Neovim!"

    -- Apply theme
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
    ]])
  end
}
