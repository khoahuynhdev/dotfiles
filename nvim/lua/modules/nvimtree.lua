require("nvim-tree").setup({
filters = {
    dotfiles = false,
  },
git = {
  enable = true,
  ignore = false,
  timeout = 500,
  },
})
