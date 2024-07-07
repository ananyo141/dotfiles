return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    {
      '<leader>hn', 
      function() require('harpoon'):list():next() end,
      desc = 'Next in harpoon list'
    },
    {
      '<leader>hp', 
      function() require('harpoon'):list():prev() end,
      desc = 'Prev in harpoon list'
    },
    {
      '<leader>ha', 
      function() require('harpoon'):list():add() end,
      desc = 'Add to harpoon list'
    },
    {
      '<leader>ht', 
      function() 
        local harpoon = require('harpoon')
        harpoon.ui:toggle_quick_menu(harpoon:list()) 
      end,
      desc = 'Toggle harpoon list'
    },
  }
}
