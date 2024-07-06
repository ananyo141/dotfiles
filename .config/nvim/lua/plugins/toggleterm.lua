 return {
   'akinsho/toggleterm.nvim', 
   event = "VeryLazy",
   version = "*",
   opts = {
      open_mapping = [[<c-\>]],
      shell = vim.o.shell,
      auto_scroll = true,
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = '2',
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
         border = 'curved',
       }
   }
 }
