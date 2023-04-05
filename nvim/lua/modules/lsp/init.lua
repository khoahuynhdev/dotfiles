local lspconfig = require 'lspconfig'
local utils = require 'modules.lsp.utils'
local attach = require 'modules.lsp.on_attach'
local installer = require 'installer'
require 'modules.lsp.handlers'

-- Set snippet support and status line compatibilities
lspconfig.util.default_config = utils.make_default()

local nofmt_cap = {
    documentFormattingProvider = false,
    document_formatting = false
}

lspconfig.gopls.setup {
    cmd = {installer.bin("gopls")},
    on_attach = attach.make_on_attach(nofmt_cap),
    settings = {
        gopls = {
            usePlaceholders = false,
            codelenses = {test = true},
            staticcheck = true,
            buildFlags = {"-tags=linux,darwin"}
        }
    }
}

lspconfig.rust_analyzer.setup {
    cmd = {installer.bin("rust_analyzer")},
    on_attach = attach.make_on_attach(nofmt_cap)
}

-- lspconfig.dartls.setup {on_attach = attach.make_on_attach(nofmt_cap)}

lspconfig.tsserver.setup {
    cmd = {installer.bin("tsserver"), "--stdio"},
    on_attach = attach.make_on_attach(nofmt_cap)
}

lspconfig.pyright.setup {
    cmd = {installer.bin("pyright"), "--stdio"},
    on_attach = attach.make_on_attach(nofmt_cap),
    settings = {
        python = {
            pythonPath = vim.fn.exepath("python"),
            analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'workspace'
            }
        }
    }
}

lspconfig.terraformls.setup {
    cmd = {installer.bin("terraform-ls"), "serve"},
    on_attach = attach.make_on_attach(nofmt_cap)
}

lspconfig.yamlls.setup {
    cmd = {installer.bin("yamlls"), "--stdio"},
    on_attach = attach.make_on_attach(nofmt_cap),
    settings = {yaml = {schemas = {}}}
}

lspconfig.eslint.setup {
    -- cmd = { installer.bin("eslint") },
    on_attach = attach.make_on_attach(nofmt_cap)
}

lspconfig.sumneko_lua.setup {
    cmd = {installer.bin("lua-language-server")},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    },
    on_attach = attach.make_on_attach(nofmt_cap)
}
-- lspconfig.jsonls.setup{
--   cmd = { installer.bin("jsonls"), "--stdio" },
--   on_attach = attach.make_on_attach(nofmt_cap),
--   settings = {
--     json = {
--       schemas = require('schemastore').json.schemas(),
--       validate = { enable = true },
--     }
--   }
-- }
