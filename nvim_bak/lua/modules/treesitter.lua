local parser_config = require"nvim-treesitter.parsers".get_parser_configs()
parser_config.cue = {
    install_info = {
        url = "https://github.com/eonpatapon/tree-sitter-cue",
        files = {"src/parser.c", "src/scanner.c"},
        branch = "main"
    },
    filetype = "cue"
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash", "css", "go", "gomod", "html", "javascript", "markdown", "json",
        "lua", "python", "fish", "comment", "query", "nix", "rust", "toml",
        "tsx", "typescript", "vue", "yaml", "hcl", "java", "scala", "cue",
        "graphql", "proto"
    },

    highlight = {enable = true},

    indent = {enable = true, disable = {"python"}},

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-s>'
        }
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner'
            }
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer'
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer'
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer'
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer'
            }
        },
        swap = {
            enable = true,
            swap_next = {['<leader>a'] = '@parameter.inner'},
            swap_previous = {['<leader>A'] = '@parameter.inner'}
        }
    },
    playground = {enable = true},

    autotag = {enable = true},

    textsubjects = {
        enable = true,
        keymaps = {['.'] = 'textsubjects-smart', ['<CR>'] = 'textsubjects-big'}
    }
}

vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
