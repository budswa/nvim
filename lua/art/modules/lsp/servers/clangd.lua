local on_attach = require('art.modules.lsp.on_attach')

local clangd_defaults = require('lspconfig.server_configurations.clangd')
local clangd_config = vim.tbl_deep_extend('force', clangd_defaults['default_config'], {
    on_attach = on_attach,
    cmd = {
        'clangd',
        '-j=8',
        '--background-index',
        '--clang-tidy',
        '--fallback-style=llvm',
        '--all-scopes-completion',
        '--completion-style=detailed',
        '--header-insertion=iwyu',
        '--header-insertion-decorators',
        '--pch-storage=memory',
    },
})

require('clangd_extensions').setup({ server = clangd_config })
