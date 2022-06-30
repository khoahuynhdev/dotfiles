require("globals")
require("plugins")
-- convert from nvimscript to lua expression
vim.api.nvim_exec([[
 set runtimepath^=~/.vim runtimepath+=~/.vim/after
 let &packpath = &runtimepath
 source ~/.vimrc
]], true)

