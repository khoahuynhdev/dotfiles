local default_opts = { noremap = true, silent = true }
vim.g.mapleader = ","
-- Quickly goback
vim.keymap.set("n", "<BS>", "<C-o>")
vim.keymap.set("n", "<Leader>w", ":w!<cr>")
vim.keymap.set("n", "<Leader>qq", ":bd<cr>")
vim.keymap.set("n", "<ESC><ESC>", ":nohlsearch<cr>") -- Add simple hightlight removal
vim.keymap.set({ "n", "v" }, "<space>", ":")

-- remember to add description
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set({ "n", "v" }, "<S-H>", "^")
vim.keymap.set("n", "<S-L>", "$")
vim.keymap.set("v", "<S-L>", "$h")

-- make Y consistent with C and D.
vim.keymap.set("n", "Y", "y$")

-- escape with jk
vim.keymap.set("i", "jk", "<esc>")

-- nvim-tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- telescope
-- find file with telescope
-- vim.keymap.set("n", "<C-p>", ":lua require('telescope.builtin').find_files()<CR>")
-- fuzzy search git file, respect .gitignore
vim.keymap.set("n", "<Leader>fg", ":lua require('telescope.builtin').git_files()<CR>", default_opts)
vim.keymap.set("n", "<Leader>bf", ":lua require('telescope.builtin').buffers()<CR>", default_opts)

-- Quick list move
vim.keymap.set("n", "<leader>p", ":cprevious<CR>")
vim.keymap.set("n", "<leader>n", ":cnext<CR>")

-- vim.keymap.set("n", "<C-s>", ":w<CR>")

-- Navigate pane
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l") -- override default nvim mapping to <C-l>

vim.keymap.set("n", "q", "<Nop>")

-- move a line up/down
-- move line mappings
-- ∆ is <A-j> on macOS
-- ˚ is <A-k> on macOS
vim.keymap.set("n", "∆", ":m .+1<cr>==")
vim.keymap.set("n", "˚", ":m .-2<cr>==")

-- inoremap ∆ <Esc>:m .+1<cr>==gi
-- inoremap ˚ <Esc>:m .-2<cr>==gi
-- vnoremap ∆ :m '>+1<cr>gv=gv
-- vnoremap ˚ :m '<-2<cr>gv=gv
