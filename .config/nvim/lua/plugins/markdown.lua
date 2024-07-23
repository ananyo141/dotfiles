return {
    'MeanderingProgrammer/markdown.nvim',
    main = "render-markdown",
    ft = 'markdown',
    opts = {},
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim', 'nvim-tree/nvim-web-devicons' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter',  }, -- if you prefer nvim-web-devicons
}
