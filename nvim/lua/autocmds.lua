-- Auto remove trailing space
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

--  NOTE: refactor to neovim config
vim.cmd([[
  autocmd BufReadPost *  if line("'\"") > 0 && line("'\"") <= line("$") |  exe "normal! g`\"" | endif
]])

vim.cmd([[
autocmd! InsertEnter * set colorcolumn=80 | set norelativenumber | set conceallevel=0
autocmd! InsertLeave * set colorcolumn=0 | set relativenumber | set conceallevel=2
]])

vim.cmd([[
augroup FileType_Local_tabwidth
  autocmd!
  autocmd FileType nginx setlocal tabstop=4 shiftwidth=4 expandtab
  autocmd FileType php setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
  autocmd FileType prisma setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType typescriptreact setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType scheme setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType typescript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType json setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType yml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType vim setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType sh setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType zsh setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType pegjs setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType javascript.jsx setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType pug setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType vue setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType eruby setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType scss setlocal tabstop=2 shiftwidth=2 expandtab iskeyword+=@-@
  autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType cs setlocal tabstop=4 shiftwidth=4 expandtab
  autocmd FileType html.erb setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType html.handlebars setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType apache setlocal commentstring=#\ %s
  autocmd FileType gitconfig setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd FileType make set noexpandtab
augroup END
]])
