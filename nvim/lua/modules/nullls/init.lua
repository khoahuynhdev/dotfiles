local nullls = require("null-ls")
local formatting = nullls.builtins.formatting
local code_actions = nullls.builtins.code_actions
local diagnostics = nullls.builtins.diagnostics
local installer = require('installer')
local goext = require('modules.nullls.go')

vim.api.nvim_create_user_command("NullLsToggle", function(params)
    nullls.toggle(params.args)
end, {
    nargs = 1,
    complete = function()
        local ft = vim.o.filetype
        local sources = require("null-ls.sources").get_available(ft)
        local ret = {}
        for _, src in ipairs(sources) do table.insert(ret, src.name) end
        return ret
    end,
    bang = true
})
local sources = {
    code_actions.eslint,
    -- formatting.gofumpt.with({command = installer.bin("gofumpt")}),
    -- formatting.rustfmt,
    formatting.black, formatting.prettier, formatting.terraform_fmt,
    formatting.trim_newlines, formatting.trim_whitespace, formatting.lua_format,
    goext.code_actions.gostructhelper, goext.code_actions.gomodifytags,
    diagnostics.eslint, diagnostics.hadolint, diagnostics.luacheck.with({
        extra_args = {'--config', '~/.config/luacheck/.luacheckrc'}
    })
}
nullls.setup({
    default_timeout = 1000,
    on_attach = require'modules.lsp.on_attach'.make_on_attach(),
    sources = sources
})
