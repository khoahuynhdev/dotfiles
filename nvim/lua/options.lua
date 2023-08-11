local options = {
  backup = false,
  writebackup = false,
  swapfile = false,
  title = true,
  titlestring = "%<%F%=%l/%L - nvim",
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 2, -- set number column width to 2 {default 4}
  fileencoding = "utf-8", -- the encoding written to a file
  incsearch = true,
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- Ignore case in search patterns. Also used when searching in the tags file.
  smartindent = true, -- make indenting smarter again
  smartcase = true, -- Override the 'ignorecase' option if the search pattern contains upper case characters.
  termguicolors = true, -- set term gui colors (most terminals support this)
  visualbell = true,
  laststatus = 3,
  showmatch = true, -- When a bracket is inserted, briefly jump to the matching one
  autowrite = true, -- help 'autowrite'
  fixendofline = false,
  background = "dark",
  -- autowriteall = true,
  cursorline = true, -- highlight the current line
  wildignore = { "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store", "log/**", "*.gem" },
  completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
  mouse = "a",
  updatetime = 500, -- https://github.com/antoinemadec/FixCursorHold.nvim
  linespace = 8,
  mousemoveevent = true,
  syntax = "off",
  foldlevelstart = 99,
  foldlevel = 99,
  foldenable = true,
  foldcolumn = "1",
  fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
  },
  -- session
  sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
}

-- load options

for k, v in pairs(options) do
  vim.opt[k] = v
end
