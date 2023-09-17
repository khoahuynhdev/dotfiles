require("utils").disable_builtins({
  "matchit",
  "spellfile_plugin",
  "fzf",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "vimball",
  "vimballPlugin",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "shada_plugin",
  "2html_plugin",
  "tutor_mode_plugin",
})

local localplug = function(plug)
  return LOCAL_PLUGS_PATH .. "/" .. plug
end

local packer = require("packer_init")

packer.startup({

  function(use)
    -- Packer can manage itself
    use({ "wbthomason/packer.nvim", opt = true })

    -- Lib

    -- Installer
    use("nvim-lua/plenary.nvim")
    use({
      localplug("installer"),
      requires = { "nvim-lua/plenary.nvim" },
      config = [[require'installer'.setup()]],
    })

    -- Themes
    use({
      "nvim-tree/nvim-web-devicons",
      config = [[require'nvim-web-devicons'.setup()]],
    })
    use({
      "dracula/vim",
      config = function()
        vim.cmd("colorscheme dracula")
        vim.cmd("highlight ColorColumn guibg=#A676EF")
      end,
    })

    use({
      "glepnir/dashboard-nvim",
      event = "VimEnter",
      config = [[require'modules.dashboard']],
      requires = { "nvim-tree/nvim-web-devicons" },
    })

    use({ "junegunn/limelight.vim" })
    -- Enhancement
    use({
      "nvim-tree/nvim-tree.lua",
      requires = { "nvim-tree/nvim-web-devicons" },
      config = [[require'modules.nvimtree']],
    })
    -- use { localplug("broot"),
    --   setup = [[require'modules.broot'.setup()]],
    --   config = [[require'modules.broot'.config()]],
    --   cmd = { "Broot" },
    -- }
    use({ "tpope/vim-commentary", event = "BufRead" })
    use({ "tpope/vim-surround", event = "BufRead" })
    use({ "tpope/vim-fugitive" })
    use({ "tpope/vim-repeat", event = "BufRead" })
    use({
      "windwp/nvim-autopairs",
      config = [[require'modules.autopairs']],
      event = "InsertEnter",
    })
    use({
      "lewis6991/gitsigns.nvim",
      opt = true,
      requires = { "nvim-lua/plenary.nvim" },
      config = [[require'modules.gitsigns']],
      setup = function()
        require("utils").packer_lazy_load("gitsigns.nvim")
      end,
    })
    use({
      "folke/trouble.nvim",
      setup = [[require'modules.trouble'.setup()]],
      config = [[require'modules.trouble'.config()]],
      cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
    })
    use({
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup({})
      end,
    })
    use({
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup({})
      end,
    })
    use({ "norcalli/nvim-colorizer.lua", event = "BufRead" })

    use({
      "lukas-reineke/indent-blankline.nvim",
      config = [[require'modules.indent_blankline']],
      event = "BufRead",
    })
    use({
      "delphinus/auto-cursorline.nvim",
      config = function()
        require("auto-cursorline").setup({})
      end,
    })
    use({ "kevinhwang91/nvim-bqf", config = [[require'modules.bqf']] })
    use({
      "simrat39/symbols-outline.nvim",
      config = [[require'modules.outline']],
    })

    -- use({ "nathom/filetype.nvim", config = [[require'modules.filetype']] })
    use({ "rhysd/git-messenger.vim" })

    -- Syntax highlight
    use("chr4/nginx.vim")

    -- Telescope
    use({
      "nvim-telescope/telescope.nvim",
      tag = "0.1.0",
      requires = { { "nvim-lua/plenary.nvim" } },
      setup = [[require'modules.telescope'.setup()]],
      config = [[require'modules.telescope'.config()]],
      cmd = { "Telescope" },
      module = "telescope",
    })
    use({
      "nvim-telescope/telescope-dap.nvim",
      after = "telescope.nvim",
      config = function()
        require("telescope").load_extension("dap")
      end,
    })
    use({
      "nvim-telescope/telescope-fzf-native.nvim",
      after = "telescope.nvim",
      run = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    })
    use({
      "nvim-telescope/telescope-ui-select.nvim",
      after = "telescope.nvim",
      config = function()
        require("telescope").load_extension("ui-select")
      end,
    })

    -- FZF
    use({
      "ibhagwan/fzf-lua",
      setup = [[require'modules.fzf'.setup()]],
      config = [[require'modules.fzf'.config()]],
      cmd = { "FzfLua" },
      module = "fzf-lua",
    })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdateSync",
      config = [[require'modules.treesitter']],
    })
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
    use({ "RRethy/nvim-treesitter-textsubjects", after = "nvim-treesitter" })
    use({
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
      requires = "nvim-treesitter/nvim-treesitter",
    })
    use({ "nvim-treesitter/playground", after = "nvim-treesitter" })
    use({
      "SmiteshP/nvim-gps",
      after = "nvim-treesitter",
      config = [[require("nvim-gps").setup()]],
    })

    -- Org mode
    use({
      "nvim-neorg/neorg",
      disable = true,
      config = [[require'modules.neorg']],
      requires = "nvim-lua/plenary.nvim",
    })

    -- Status
    use({ "nvim-lualine/lualine.nvim", config = [[require'modules.lualine']] })
    use({
      "akinsho/bufferline.nvim",
      tag = "*",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        require("bufferline").setup({})
      end,
    })

    -- Debugging
    use({
      "mfussenegger/nvim-dap",
      setup = [[require'modules.debugging.dap'.setup()]],
      config = [[require'modules.debugging.dap'.config()]],
    })
    use({
      "rcarriga/nvim-dap-ui",
      config = [[require'modules.debugging.dapui']],
      after = { "nvim-dap" },
    })

    -- Snippets
    use({
      "L3MON4D3/LuaSnip",
      config = [[require'modules.luasnip']],
      opt = true,
    })

    -- LSP
    use({
      "neovim/nvim-lspconfig",
      opt = true,
      config = [[require'modules.lsp']],
      setup = function()
        require("utils").packer_lazy_load("nvim-lspconfig")
        vim.defer_fn(function()
          vim.cmd('if &ft == "packer" | echo "" | else | silent! e %')
        end, 0)
      end,
    })
    -- use{ 'scalameta/nvim-metals',
    --   requires = { "nvim-lua/plenary.nvim" },
    --   config = [[require'modules.metals']],
    -- }

    use({
      "nvim-lua/lsp-status.nvim",
      config = [[require'modules.lspstatus']],
      after = "nvim-lspconfig",
    })
    use({
      "ray-x/lsp_signature.nvim",
      after = { "nvim-lspconfig" },
      config = [[require'modules.lspsignature']],
    })
    use({
      "jose-elias-alvarez/null-ls.nvim",
      config = [[require'modules.nullls']],
    })

    use({
      "kosayoda/nvim-lightbulb",
      config = [[require'modules.lightbulb']],
      module = "nvim-lightbulb",
      requires = "antoinemadec/FixCursorHold.nvim",
    })

    use({
      "hrsh7th/nvim-cmp",
      wants = { "LuaSnip" },
      config = [[require'modules.cmp']],
      event = "InsertEnter",
      module = "cmp",
    })

    -- Cmp sources
    use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
    use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })

    -- Utility
    use({ "wakatime/vim-wakatime" })
    -- use { 'github/copilot.vim'}
    -- markdown preview
    use({
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    })
    use({ "itchyny/calendar.vim", config = [[require'modules.calendar']] })
    use({
      "danymat/neogen",
      config = [[require'modules.neogen']],
      requires = "nvim-treesitter/nvim-treesitter",
    })
    use({ "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" })
    use({
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end,
    })
  end,
})

-- Legacy from vim-plug
-- TODO: update later
-- 'neoclide/coc.nvim', {'branch': 'release'}
-- 'editorconfig/editorconfig-vim'
-- 'joshdick/onedark.vim', { 'branch': 'main' }
-- 'alunny/pegjs-vim'
-- 'cakebaker/scss-syntax.vim'
-- 'jidn/vim-dbml'
-- 'easymotion/vim-easymotion'
-- 'neoclide/vim-jsx-improve'
-- 'MaxMEllon/vim-jsx-pretty'
-- 'mustache/vim-mustache-handlebars'
-- 'moll/vim-node'
-- 'vim-ruby/vim-ruby'
-- 'posva/vim-vue'
-- 'sainnhe/edge'
-- 'wlangstroth/vim-racket'
-- 'rakr/vim-one'
-- 'junegunn/limelight.vim'
-- 'leafgarland/typescript-vim'
-- 'puremourning/vimspector'
-- 'jparise/vim-graphql'
-- 'pantharshit00/vim-prisma'
-- 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
-- 'neomake/neomake'
-- 'fxn/vim-monochrome', { 'branch': 'main' }
-- 'https://git.goral.net.pl/mgoral/vim-bw'