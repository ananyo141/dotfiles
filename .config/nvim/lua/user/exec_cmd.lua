vim.cmd [[ filetype plugin indent on ]]
vim.cmd [[ runtime macros/matchit.vim ]]

-- Restore last editing position
vim.cmd [[ au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif ]]
