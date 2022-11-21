-- Custom Ex Commands
vim.api.nvim_create_user_command('Lcd', ':lcd %:p:h', {})
vim.api.nvim_create_user_command('Vrc', ':tabedit $MYVIMRC', {})
vim.api.nvim_create_user_command('Cpy', ':%y', {})

