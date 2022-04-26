local null = require('null-ls')
local b = null.builtins

local on_attach = require('art.modules.lsp.on_attach').on_attach
local capabilities = require('art.modules.lsp.capabilities').capabilities

local sources = {
    b.code_actions.gitrebase,
    b.code_actions.gitsigns,
    b.code_actions.refactoring,
    --b.diagnostics.selene.with({ extra_args = { '--config', vim.fn.stdpath('config') .. '/selene.toml' } }),
    --b.diagnostics.luacheck.with({ extra_args = { '--config', vim.fn.stdpath('config') .. '/.luacheckrc' } }),
    b.formatting.prettierd,
    b.formatting.stylua.with({ extra_args = { '--config-path', vim.fn.stdpath('config') .. '/stylua.toml' } }),
}

null.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    debounce = 100,
    debug = true,
    sources = sources,
})
