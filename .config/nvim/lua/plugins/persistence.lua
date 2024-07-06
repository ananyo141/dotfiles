return {
  "folke/persistence.nvim",
  event = "VeryLazy", -- this will only start session saving when an actual file was opened
  opts = {
    dir = vim.fn.stdpath("state") .. "/sessions/", -- directory where session files are saved
    options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
    save_empty = false, -- don't save if there are no open file buffers
  },
  -- config = function()
  --   require("persistence").setup({
  --       dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
  --       options = { "buffers", "curdir", "tabpages", "winsize" },
  --     })

      -- vim.api.nvim_set_keymap("n", "<leader>ps", [[<cmd>lua require("persistence").load()<cr>]], { noremap = true, silent = true, desc = "Restore current directory session" })
      -- vim.api.nvim_set_keymap("n", "<leader>pl", [[<cmd>lua require("persistence").load({ last = true })<cr>]], { noremap = true, silent = true, desc = "Restore last session" })
      -- vim.api.nvim_set_keymap("n", "<leader>pd", [[<cmd>lua require("persistence").stop()<cr>]], { noremap = true, silent = true, desc = "Stop session saving" })
  -- end
}
