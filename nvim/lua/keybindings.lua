local default_opts = { noremap = true, silent = true }
vim.g.mapleader = ','
-- Quickly goback
vim.keymap.set("n", "<BS>", "<C-o>")


-- nvim-tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- telescope
-- find file with telescope
-- vim.keymap.set("n", "<C-p>", ":lua require('telescope.builtin').find_files()<CR>")
-- fuzzy search git file, respect .gitignore
vim.keymap.set("n", "<Leader>fg",":lua require('telescope.builtin').git_files()<CR>", default_opts)
vim.keymap.set("n", "<Leader>bf", ":lua require('telescope.builtin').buffers()<CR>", default_opts)

-- Quick list move
vim.keymap.set("n", "<leader>p", ":cprevious<CR>")
vim.keymap.set("n", "<leader>n", ":cnext<CR>")

vim.keymap.set("n", "<C-s>", ":w<CR>")

-- Navigate pane
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l") -- override default nvim mapping to <C-l>

vim.keymap.set("n", "q", "<Nop>")
