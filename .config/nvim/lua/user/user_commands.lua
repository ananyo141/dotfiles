-- Custom Ex Commands

-- change local directory to buffer directory
vim.api.nvim_create_user_command('Lcd', ':lcd %:p:h', {})
-- open vimrc in a new tab
vim.api.nvim_create_user_command('Vrc', ':tabedit $MYVIMRC', {})
-- yank the whole buffer
vim.api.nvim_create_user_command('Cpy', ':%y', {})

