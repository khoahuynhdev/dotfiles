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
vim.keymap.set("n", "<Leader>fg", ":lua require('telescope.builtin').git_files()<CR>", default_opts)
-- find which in buffer
vim.keymap.set("n", "<Leader>bf", ":lua require('telescope.builtin').buffers()<CR>", default_opts)
